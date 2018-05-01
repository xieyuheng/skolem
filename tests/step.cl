(step
  (car (cons 'ham '(cheese))))

(step
  (car (cons 'ham '(cheese)))
  (() (car/cons 'ham '(cheese))))

;; thm and fun both can be used to do rewrite
;;   in the following
;;   (atom/cons a b) is a thm
;;   (equal 'flapjack 'nil) is a fun
(step
  (equal 'flapjack (atom (cons a b)))
  ((2) (atom/cons a b))
  (() (equal 'flapjack 'nil)))

(step
  (atom (cdr (cons (car (cons p q)) '())))
  ((1 1 1) (car/cons p q))
  ((1) (cdr/cons p '()))
  (() (atom '())))

(step
  (if a c c))

(step
  (if a c c)
  (() (if-same a c)))

(step
  (if a c c)
  (() (if-same a c))
  (() (if-same
       (if (equal a 't)
         (if (equal 'nil 'nil) a b)
         (equal 'or
                (cons 'black '(coffee))))
       c)))

(step
  (if a c c)
  (() (if-same a c))
  (() (if-same
       (if (equal a 't)
         (if (equal 'nil 'nil)
           a
           b)
         (equal 'or
                (cons 'black '(coffee))))
       c))
  ((Q E 2) (cons 'black '(coffee))))

(step
  (if a c c)
  (() (if-same a c))
  (() (if-same
       (if (equal a 't)
         (if (equal 'nil 'nil)
           a
           b)
         (equal 'or
                (cons 'black '(coffee))))
       c))
  ((Q E 2) (cons 'black '(coffee)))
  ((Q A Q) (equal-same 'nil)))

(step
  (if a c c)
  (() (if-same a c))
  (() (if-same
       (if (equal a 't)
         (if (equal 'nil 'nil)
           a
           b)
         (equal 'or
                (cons 'black '(coffee))))
       c))
  ((Q E 2) (cons 'black '(coffee)))
  ((Q A Q) (equal-same 'nil)))
