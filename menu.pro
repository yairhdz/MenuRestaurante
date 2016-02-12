/*
--
-- Yair Hernandezz Garcia
-- Programa 
--
*/


menu(sopas,[aguada,lentejas,crema,codito]).
menu(entremes,[ensalada,pasta,arroz]).
menu(principal,[pechuga,lomo,bisteck]).
menu(postres,[flan,gelatina,pastel]).
cliente([]).

main:- write('Este programa toma una orden'), nl,
		 repeat,
		 muestraop(X), X==6,
		 write('Gracias por tu preferencia'), nl.
		 
muestraop(X):-  write('Escribe el numero de tu opcion, termina con punto'), nl,
			       write('   1. Entrada sopas'), nl,
			       write('   2. Entremes'), nl,
			       write('   3. Plato principal'), nl,
			       write('   4. Postres'), nl,
			       write('   5. Lista pedido cliente'), nl,
			       write('   6. Salir'), nl,
			       write('Opcion: '),
			       read(X),
			       ejecutaop(X), !.

ejecutaop(1):-  menu(sopas,L_sopas), nl,
					 write('Menu sopas -> '),
			       write(L_sopas), nl,
			       write('Elige el platillo: '), 
			       read(Platillo),
			       guarda_eleccion(Platillo).



ejecutaop(2):-  menu(entremes,L_entremes), nl,
					 write('Menu entremes -> '),
			       write(L_entremes), nl,
			       write('Elige el platillo: '), 
			       read(Platillo),
			       guarda_eleccion(Platillo).


ejecutaop(3):-  menu(principal,L_principal), nl,
					 write('Menu plato principal -> '),
			       write(L_principal), nl,
			       write('Elige el platillo: '), 
			       read(Platillo),
			       guarda_eleccion(Platillo).


ejecutaop(4):-  menu(postres,L_postres), nl,
					 write('Menu postres -> '),
			       write(L_postres), nl,
			       write('Elige el platillo: '), 
			       read(Platillo),
			       guarda_eleccion(Platillo).


ejecutaop(5):-  write('El cliente ordeno: '), nl,
			       cliente(Lista),
			       escribir_lista(Lista), nl.
ejecutaop(6). 
ejecutaop(_):-  write('Opcion incorrecta.'), nl.

guarda_eleccion(X):- cliente(Lista),
						   add(X,Lista,Lista2),
						   retract(cliente(Lista)),
						   assert(cliente(Lista2)).

member(X,[X|L]) :- !.
member(X,[X|L]) :- member(X,L).
add(X,L,L) :- member(X,L), !.
add(X,L,[X|L]).	

escribir_lista([]).
escribir_lista([Head|Tail]):- write('   -> '), write(Head), nl,
									 escribir_lista(Tail).
