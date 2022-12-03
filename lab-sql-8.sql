use sakila;

select title, length, dense_rank() over (order by length desc) as 'Rank'
from film
where length is not null;

select title, length, rating, dense_rank() over (partition by rating order by length desc) as 'Rank'
from film
where length is not null;

select name, count(film_id) as 'film_count' from category c
join film_category fc on fc.category_id = c.category_id
group by name;

select a.actor_id, first_name, last_name, count(film_id) as 'appearance' from actor a
join film_actor fa on fa.actor_id = a.actor_id
group by a.actor_id
order by count(film_id) desc
limit 1;

select c.customer_id, first_name, last_name, count(rental_id) as 'rental_count' from customer c
join rental r on c.customer_id = r.customer_id
group by c.customer_id
order by count(rental_id) desc
limit 1;

select i.film_id, title, count(rental_id) as 'rental_count' from inventory i
join rental r on i.inventory_id = r.inventory_id
join film f on i.film_id = f.film_id
group by i.film_id
order by count(rental_id) desc
limit 1;