From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 12 Mar 2009 20:29:25 +0000 (UTC)
Subject: [Buildroot] svn commit: [25636] trunk/buildroot/toolchain/uClibc
Message-ID: <20090312202925.6B57C76268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-12 20:29:24 +0000 (Thu, 12 Mar 2009)
New Revision: 25636

Log:
uClibc: additional 0.9.30.1 patches

From Bernhard's tree.

Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-dl-sysdep-inline.patch

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-c99-ldbl-math.patch


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-c99-ldbl-math.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-c99-ldbl-math.patch	2009-03-12 19:06:18 UTC (rev 25635)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-c99-ldbl-math.patch	2009-03-12 20:29:24 UTC (rev 25636)
@@ -1,20 +1,195 @@
+Index: uClibc-0.9.30.1/libm/ldouble_wrappers.c
+===================================================================
+--- uClibc-0.9.30.1/libm/ldouble_wrappers.c	(revision 25552)
++++ uClibc-0.9.30.1/libm/ldouble_wrappers.c	(working copy)
+@@ -13,6 +13,16 @@
+ #include "math.h"
+ #include <complex.h>
+ 
++#if defined __NO_LONG_DOUBLE_MATH
++# define int_WRAPPER_C99(func) /* not needed */
++# else
++# define int_WRAPPER_C99(func) \
++int func##l(long double x) \
++{ \
++    return func((double) x); \
++} \
++libm_hidden_def(func##l)
++#endif
+ 
+ /* Implement the following, as defined by SuSv3 */
+ #if 0
+@@ -543,46 +553,28 @@ long double truncl (long double x)
+ #endif
+ 
+ 
+-#ifdef __DO_C99_MATH__
++#if defined __DO_C99_MATH__
+ 
+ #ifdef L_fpclassifyl
+-int __fpclassifyl (long double x)
+-{
+-	return __fpclassify ( (double) x );
+-}
+-libm_hidden_def(__fpclassifyl)
++int_WRAPPER_C99(__fpclassify)
+ #endif
+ 
+ #ifdef L_finitel
+-int __finitel (long double x)
+-{
+-	return __finite ( (double)x );
+-}
+-libm_hidden_def(__finitel)
++int_WRAPPER_C99(__finite)
+ #endif
+ 
+ #ifdef L_signbitl
+-int __signbitl (long double x)
+-{
+-	return __signbitl ( (double)x );
+-}
+-libm_hidden_def(__signbitl)
++int_WRAPPER_C99(__signbit)
+ #endif
+ 
+ #ifdef L_isnanl
+-int __isnanl (long double x)
+-{
+-	return __isnan ( (double)x );
+-}
+-libm_hidden_def(__isnanl)
++int_WRAPPER_C99(__isnan)
+ #endif
+ 
+ #ifdef L_isinfl
+-int __isinfl (long double x)
+-{
+-	return __isinf ( (double)x );
+-}
+-libm_hidden_def(__isinfl)
++int_WRAPPER_C99(__isinf)
+ #endif
+ 
+-#endif
++#endif /* DO_C99_MATH */
++
++#undef int_WRAPPER_C99
+Index: uClibc-0.9.30.1/libm/nan.c
+===================================================================
+--- uClibc-0.9.30.1/libm/nan.c	(revision 25552)
++++ uClibc-0.9.30.1/libm/nan.c	(working copy)
+@@ -45,7 +45,7 @@ float nanf (const char *tagp)
+ }
+ libm_hidden_def(nanf)
+ 
+-#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && !defined __NO_LONG_DOUBLE_MATH
+ libm_hidden_proto(nanl)
+ long double nanl (const char *tagp)
+ {
+Index: uClibc-0.9.30.1/include/math.h
+===================================================================
+--- uClibc-0.9.30.1/include/math.h	(revision 25552)
++++ uClibc-0.9.30.1/include/math.h	(working copy)
+@@ -118,7 +118,7 @@ __BEGIN_DECLS
+ # undef	__MATH_PRECNAME
+ 
+ # if (__STDC__ - 0 || __GNUC__ - 0) \
+-     && (defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ || defined __LDBL_COMPAT)
++     && (!defined __NO_LONG_DOUBLE_MATH || defined __LDBL_COMPAT)
+ #  ifdef __LDBL_COMPAT
+ 
+ #   ifdef __USE_ISOC99
+@@ -230,7 +230,7 @@ enum
+   };
+ 
+ /* Return number of classification appropriate for X.  */
+-# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# ifdef __NO_LONG_DOUBLE_MATH
+ #  define fpclassify(x) \
+      (sizeof (x) == sizeof (float) ? __fpclassifyf (x) : __fpclassify (x))
+ # else
+@@ -242,7 +242,7 @@ enum
+ # endif
+ 
+ /* Return nonzero value if sign of X is negative.  */
+-# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# ifdef __NO_LONG_DOUBLE_MATH
+ #  define signbit(x) \
+      (sizeof (x) == sizeof (float) ? __signbitf (x) : __signbit (x))
+ # else
+@@ -254,7 +254,7 @@ enum
+ # endif
+ 
+ /* Return nonzero value if X is not +-Inf or NaN.  */
+-# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# ifdef __NO_LONG_DOUBLE_MATH
+ #  define isfinite(x) \
+      (sizeof (x) == sizeof (float) ? __finitef (x) : __finite (x))
+ # else
+@@ -270,7 +270,7 @@ enum
+ 
+ /* Return nonzero value if X is a NaN.  We could use `fpclassify' but
+    we already have this functions `__isnan' and it is faster.  */
+-# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# ifdef __NO_LONG_DOUBLE_MATH
+ #  define isnan(x) \
+      (sizeof (x) == sizeof (float) ? __isnanf (x) : __isnan (x))
+ # else
+@@ -282,7 +282,7 @@ enum
+ # endif
+ 
+ /* Return nonzero value is X is positive or negative infinity.  */
+-# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# ifdef __NO_LONG_DOUBLE_MATH
+ #  define isinf(x) \
+      (sizeof (x) == sizeof (float) ? __isinff (x) : __isinf (x))
+ # else
+Index: uClibc-0.9.30.1/include/tgmath.h
+===================================================================
+--- uClibc-0.9.30.1/include/tgmath.h	(revision 25552)
++++ uClibc-0.9.30.1/include/tgmath.h	(working copy)
+@@ -36,7 +36,7 @@
+ 
+ #if __GNUC_PREREQ (2, 7)
+ 
+-# ifndef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# ifdef __NO_LONG_DOUBLE_MATH
+ #  define __tgml(fct) fct
+ # else
+ #  define __tgml(fct) fct ## l
 Index: uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h
 ===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h	(revision 25503)
+--- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h	(revision 25552)
 +++ uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h	(working copy)
-@@ -14,6 +14,6 @@
+@@ -7,13 +7,13 @@
+ # define __WORDSIZE	32
+ #endif
+ 
+-#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && !defined __LONG_DOUBLE_MATH_OPTIONAL
++#if !defined __NO_LONG_DOUBLE_MATH && !defined __LONG_DOUBLE_MATH_OPTIONAL
+ 
+ /* Signal the glibc ABI didn't used to have a `long double'.
+    The changes all the `long double' function variants to be redirects
     to the double functions.  */
  # define __LONG_DOUBLE_MATH_OPTIONAL   1
  # ifndef __LONG_DOUBLE_128__
 -#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
-+#  define __NO_LONG_DOUBLE_MATH	1
++#  define __NO_LONG_DOUBLE_MATH        1
  # endif
  #endif
 Index: uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h
 ===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h	(revision 25503)
+--- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h	(revision 25552)
 +++ uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h	(working copy)
-@@ -70,6 +70,8 @@ typedef double double_t;
+@@ -65,11 +65,13 @@ typedef double double_t;
+ 
+ #endif	/* ISO C99 */
+ 
+-#ifdef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#ifndef __NO_LONG_DOUBLE_MATH
+ #include <bits/wordsize.h>
  /* Signal that we do not really have a `long double'.  The disables the
     declaration of all the `long double' function variants.  */
  # if __WORDSIZE == 32
@@ -23,23 +198,277 @@
 +# elif !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
 +#  define __NO_LONG_DOUBLE_MATH	1
  # endif  /* __WORDSIZE == 32 */
- #endif  /* __UCLIBC_HAS_LONG_DOUBLE_MATH__ */
-Index: uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathinline.h
+-#endif  /* __UCLIBC_HAS_LONG_DOUBLE_MATH__ */
++#endif  /* __NO_LONG_DOUBLE_MATH */
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/arm/bits/mathdef.h
 ===================================================================
---- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathinline.h	(revision 25503)
-+++ uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathinline.h	(working copy)
-@@ -107,6 +107,14 @@ __NTH (lrintf (float __x))
- }
+--- uClibc-0.9.30.1/libc/sysdeps/linux/arm/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/arm/bits/mathdef.h	(working copy)
+@@ -34,3 +34,11 @@ typedef double double_t;	/* `double' exp
+ # define FP_ILOGBNAN	(2147483647)
+ 
+ #endif	/* ISO C99 */
++
++#ifndef __NO_LONG_DOUBLE_MATH
++/* Signal that we do not really have a `long double'.  This disables the
++   declaration of all the `long double' function variants.  */
++/* XXX The FPA does support this but the patterns in GCC are currently
++   turned off.  */
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/m68k/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/m68k/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/m68k/bits/mathdef.h	(working copy)
+@@ -36,3 +36,7 @@ typedef long double double_t;	/* `double
+ # define FP_ILOGBNAN	(2147483647)
+ 
+ #endif	/* ISO C99 */
++
++#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/wordsize.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/wordsize.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/wordsize.h	(working copy)
+@@ -18,13 +18,13 @@
+ 
+ #define __WORDSIZE	64
+ 
+-#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && !defined __LONG_DOUBLE_MATH_OPTIONAL
++#if !defined __NO_LONG_DOUBLE_MATH && !defined __LONG_DOUBLE_MATH_OPTIONAL
+ 
+ /* Signal that we didn't used to have a `long double'. The changes all
+    the `long double' function variants to be redirects to the double
+    functions.  */
+ # define __LONG_DOUBLE_MATH_OPTIONAL	1
+ # ifndef __LONG_DOUBLE_128__
+-#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#  define __NO_LONG_DOUBLE_MATH		1
  # endif
+ #endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/alpha/bits/mathdef.h	(working copy)
+@@ -78,3 +78,7 @@ typedef double double_t;
  
-+/* __MATH_INLINE int
-+__NTH (__finite (double __x))
-+{
-+  return (__extension__
-+    (((union { double __d; int __i[2]; }) { __d: __x}.__i[1]
-+      & 0x7fffffff) - 0x7ff00000) >> 31);
-+}
-+*/
- __MATH_INLINE double fdim (double __x, double __y) __THROW;
- __MATH_INLINE double
- __NTH (fdim (double __x, double __y))
+ # endif /* GNUC before 3.4 */
+ #endif /* COMPLEX_H */
++
++#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/common/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/common/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/common/bits/mathdef.h	(working copy)
+@@ -35,3 +35,9 @@ typedef double double_t;	/* `double' exp
+ # define FP_ILOGBNAN	2147483647
+ 
+ #endif	/* ISO C99 */
++
++#ifndef __NO_LONG_DOUBLE_MATH
++/* Signal that we do not really have a `long double'.  The disables the
++   declaration of all the `long double' function variants.  */
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/i386/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/i386/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/i386/bits/mathdef.h	(working copy)
+@@ -44,3 +44,7 @@ typedef long double double_t;	/* `double
+ # define FP_ILOGBNAN	(-2147483647 - 1)
+ 
+ #endif	/* ISO C99 */
++
++#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/nios2/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/nios2/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/nios2/bits/mathdef.h	(working copy)
+@@ -34,3 +34,11 @@ typedef double double_t;	/* `double' exp
+ # define FP_ILOGBNAN	(2147483647)
+ 
+ #endif	/* ISO C99 */
++
++#ifndef __NO_LONG_DOUBLE_MATH
++/* Signal that we do not really have a `long double'.  This disables the
++   declaration of all the `long double' function variants.  */
++/* XXX The FPA does support this but the patterns in GCC are currently
++   turned off.  */
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/x86_64/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/x86_64/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/x86_64/bits/mathdef.h	(working copy)
+@@ -46,3 +46,7 @@ typedef long double double_t;	/* `double
+ # define FP_ILOGBNAN	(-2147483647 - 1)
+ 
+ #endif	/* ISO C99 */
++
++#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/xtensa/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/xtensa/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/xtensa/bits/mathdef.h	(working copy)
+@@ -36,8 +36,8 @@ typedef double double_t;	/* `double' exp
+ 
+ #endif	/* ISO C99 */
+ 
+-#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#ifndef __NO_LONG_DOUBLE_MATH
+ /* Signal that we do not really have a `long double'.  The disables the
+    declaration of all the `long double' function variants.  */
+-# undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# define __NO_LONG_DOUBLE_MATH	1
+ #endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/ia64/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/ia64/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/ia64/bits/mathdef.h	(working copy)
+@@ -35,3 +35,7 @@ typedef double double_t;	/* `double' exp
+ # define FP_ILOGBNAN	2147483647
+ 
+ #endif	/* ISO C99 */
++
++#if !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/mips/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/mips/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/mips/bits/mathdef.h	(working copy)
+@@ -39,8 +39,10 @@ typedef double double_t;	/* `double' exp
+ 
+ #endif	/* ISO C99 */
+ 
+-#if defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && _MIPS_SIM == _ABIO32
++#if ! defined __NO_LONG_DOUBLE_MATH && _MIPS_SIM == _ABIO32
+ /* Signal that we do not really have a `long double'.  This disables the
+    declaration of all the `long double' function variants.  */
+-# error defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ and _MIPS_SIM == _ABIO32
++# define __NO_LONG_DOUBLE_MATH	1
++#elif !defined __NO_LONG_DOUBLE_MATH && !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++# define __NO_LONG_DOUBLE_MATH	1
+ #endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/nios/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/nios/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/nios/bits/mathdef.h	(working copy)
+@@ -34,3 +34,11 @@ typedef double double_t;	/* `double' exp
+ # define FP_ILOGBNAN	(2147483647)
+ 
+ #endif	/* ISO C99 */
++
++#ifndef __NO_LONG_DOUBLE_MATH
++/* Signal that we do not really have a `long double'.  This disables the
++   declaration of all the `long double' function variants.  */
++/* XXX The FPA does support this but the patterns in GCC are currently
++   turned off.  */
++# define __NO_LONG_DOUBLE_MATH	1
++#endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/wordsize.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/wordsize.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/wordsize.h	(working copy)
+@@ -6,7 +6,7 @@
+ # define __WORDSIZE	32
+ #endif
+ 
+-#if 0 /* uClibc: done in mathdefs.h: defined __UCLIBC_HAS_LONG_DOUBLE_MATH__ && !defined __LONG_DOUBLE_MATH_OPTIONAL*/
++#if 0 /* uClibc: done in mathdefs.h: !defined __NO_LONG_DOUBLE_MATH && !defined __LONG_DOUBLE_MATH_OPTIONAL*/
+ 
+ # if __WORDSIZE == 32
+ /* Signal that in 32bit ABI we didn't used to have a `long double'.
+@@ -14,7 +14,7 @@
+    to the double functions.  */
+ #  define __LONG_DOUBLE_MATH_OPTIONAL   1
+ #  ifndef __LONG_DOUBLE_128__
+-#   undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#   define __NO_LONG_DOUBLE_MATH        1
+ #  endif
+ # endif
+ #endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathdef.h	(working copy)
+@@ -57,13 +57,15 @@ typedef double double_t;
+ 
+ #endif	/* ISO C99 */
+ 
+-#ifdef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#ifndef __NO_LONG_DOUBLE_MATH
+ 
+ # if __WORDSIZE == 32
+ /* Signal that in 32bit ABI we do not really have a `long double'.
+    The disables the declaration of all the `long double' function
+    variants.  */
+-#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#  define __NO_LONG_DOUBLE_MATH	1
++# elif !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#  define __NO_LONG_DOUBLE_MATH	1
+ # endif
+ 
+ #endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathinline.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathinline.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/sparc/bits/mathinline.h	(working copy)
+@@ -37,7 +37,7 @@
+ 
+ # if __WORDSIZE == 32
+ 
+-#  ifdef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#  ifndef __NO_LONG_DOUBLE_MATH
+ 
+ #   define __unordered_cmp(x, y) \
+   (__extension__							      \
+@@ -157,7 +157,7 @@ __NTH (__signbit (double __x))
+   return __u.__i[0] < 0;
+ }
+ 
+-#    ifdef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#    ifndef __NO_LONG_DOUBLE_MATH
+ __MATH_INLINE int
+ __NTH (__signbitl (long double __x))
+ {
+@@ -219,7 +219,7 @@ __NTH (sqrtl (long double __x))
+   _Qp_sqrt (&__r, &__x);
+   return __r;
+ }
+-#   elif defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#   elif !defined __NO_LONG_DOUBLE_MATH
+ __MATH_INLINE long double
+ sqrtl (long double __x) __THROW
+ {
+@@ -257,7 +257,7 @@ __ieee754_sqrtl (long double __x)
+   _Qp_sqrt(&__r, &__x);
+   return __r;
+ }
+-#   elif defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#   elif !defined __NO_LONG_DOUBLE_MATH
+ __MATH_INLINE long double
+ __ieee754_sqrtl (long double __x)
+ {
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/sh/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/sh/bits/mathdef.h	(revision 25552)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/sh/bits/mathdef.h	(working copy)
+@@ -61,3 +61,9 @@ typedef double double_t;
+ # define FP_ILOGBNAN	0x7fffffff
+ 
+ #endif	/* ISO C99 */
++
++#ifndef __NO_LONG_DOUBLE_MATH
++/* Signal that we do not really have a `long double'.  The disables the
++   declaration of all the `long double' function variants.  */
++# define __NO_LONG_DOUBLE_MATH	1
++#endif

Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-dl-sysdep-inline.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-dl-sysdep-inline.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-dl-sysdep-inline.patch	2009-03-12 20:29:24 UTC (rev 25636)
@@ -0,0 +1,371 @@
+Index: uClibc-0.9.30.1/ldso/ldso/arm/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/arm/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/arm/dl-sysdep.h	(working copy)
+@@ -15,7 +15,7 @@
+   GOT_BASE[1] = (unsigned long) MODULE; \
+ }
+ 
+-static __inline__ unsigned long arm_modulus(unsigned long m, unsigned long p)
++static __always_inline unsigned long arm_modulus(unsigned long m, unsigned long p)
+ {
+ 	unsigned long i,t,inc;
+ 	i=p; t=0;
+@@ -72,7 +72,7 @@ unsigned long _dl_linux_resolver(struct 
+    first element of the GOT.  We used to use the PIC register to do this
+    without a constant pool reference, but GCC 4.2 will use a pseudo-register
+    for the PIC base, so it may not be in r10.  */
+-static __inline__ Elf32_Addr __attribute__ ((unused))
++static __always_inline Elf32_Addr __attribute__ ((unused))
+ elf_machine_dynamic (void)
+ {
+   Elf32_Addr dynamic;
+@@ -104,7 +104,7 @@ elf_machine_dynamic (void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr __attribute__ ((unused))
++static __always_inline Elf32_Addr __attribute__ ((unused))
+ elf_machine_load_address (void)
+ {
+ 	extern void __dl_start __asm__ ("_dl_start");
+@@ -128,7 +128,7 @@ elf_machine_load_address (void)
+ 	return pcrel_addr - got_addr;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/powerpc/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/powerpc/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/powerpc/dl-sysdep.h	(working copy)
+@@ -90,7 +90,7 @@ void _dl_init_got(unsigned long *lpnt,st
+ #define ELF_MACHINE_PLTREL_OVERLAP 1
+ 
+ /* Return the value of the GOT pointer.  */
+-static __inline__ Elf32_Addr * __attribute__ ((const))
++static __always_inline Elf32_Addr * __attribute__ ((const))
+ ppc_got (void)
+ {
+ 	Elf32_Addr *got;
+@@ -109,14 +109,14 @@ ppc_got (void)
+ 
+ /* Return the link-time address of _DYNAMIC, stored as
+    the first value in the GOT. */
+-static __inline__ Elf32_Addr __attribute__ ((const))
++static __always_inline Elf32_Addr __attribute__ ((const))
+ elf_machine_dynamic (void)
+ {
+ 	return *ppc_got();
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr __attribute__ ((const))
++static __always_inline Elf32_Addr __attribute__ ((const))
+ elf_machine_load_address (void)
+ {
+   Elf32_Addr *branchaddr;
+@@ -164,7 +164,7 @@ elf_machine_load_address (void)
+   return runtime_dynamic - elf_machine_dynamic ();
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/sh64/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/sh64/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/sh64/dl-sysdep.h	(working copy)
+@@ -42,7 +42,7 @@ extern unsigned long _dl_linux_resolver(
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr elf_machine_dynamic(void)
++static __always_inline Elf32_Addr elf_machine_dynamic(void)
+ {
+ 	register Elf32_Addr *got;
+ 
+@@ -70,7 +70,7 @@ static __inline__ Elf32_Addr elf_machine
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr elf_machine_load_address(void)
++static __always_inline Elf32_Addr elf_machine_load_address(void)
+ {
+ 	Elf32_Addr addr;
+ 
+@@ -123,7 +123,7 @@ static __inline__ Elf32_Addr elf_machine
+ 	}						\
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative(Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		     Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/m68k/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/m68k/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/m68k/dl-sysdep.h	(working copy)
+@@ -41,7 +41,7 @@ extern unsigned long _dl_linux_resolver 
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_dynamic (void)
+ {
+ 	register Elf32_Addr *got __asm__ ("%a5");
+@@ -50,7 +50,7 @@ elf_machine_dynamic (void)
+ 
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_load_address (void)
+ {
+ 	Elf32_Addr addr;
+@@ -60,7 +60,7 @@ elf_machine_load_address (void)
+ 	return addr;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/i386/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/i386/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/i386/dl-sysdep.h	(working copy)
+@@ -42,8 +42,8 @@ extern unsigned long _dl_linux_resolver(
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr elf_machine_dynamic (void) attribute_unused;
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr elf_machine_dynamic (void) attribute_unused;
++static __always_inline Elf32_Addr
+ elf_machine_dynamic (void)
+ {
+ 	register Elf32_Addr *got __asm__ ("%ebx");
+@@ -52,8 +52,8 @@ elf_machine_dynamic (void)
+ 
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr elf_machine_load_address (void) attribute_unused;
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr elf_machine_load_address (void) attribute_unused;
++static __always_inline Elf32_Addr
+ elf_machine_load_address (void)
+ {
+ 	/* It doesn't matter what variable this is, the reference never makes
+@@ -66,7 +66,7 @@ elf_machine_load_address (void)
+ 	return addr;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/cris/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/cris/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/cris/dl-sysdep.h	(working copy)
+@@ -39,7 +39,7 @@ extern unsigned long _dl_linux_resolver(
+      || ((type) == R_CRIS_GLOB_DAT)) * ELF_RTYPE_CLASS_PLT)	\
+    | (((type) == R_CRIS_COPY) * ELF_RTYPE_CLASS_COPY))
+ 
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_dynamic(void)
+ {
+ 	/* Don't just set this to an asm variable "r0" since that's not logical
+@@ -61,7 +61,7 @@ elf_machine_dynamic(void)
+    there's some other symbol we could use, that we don't *have* to force a
+    GOT entry for.  */
+ 
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_load_address(void)
+ {
+ 	Elf32_Addr gotaddr_diff;
+@@ -95,7 +95,7 @@ elf_machine_load_address(void)
+ 	return gotaddr_diff;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative(Elf32_Addr load_off, const Elf32_Addr rel_addr,
+                      Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/xtensa/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/xtensa/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/xtensa/dl-sysdep.h	(working copy)
+@@ -87,7 +87,7 @@ extern unsigned long _dl_linux_resolver 
+   (((type) == R_XTENSA_JMP_SLOT) * ELF_RTYPE_CLASS_PLT)
+ 
+ /* Return the link-time address of _DYNAMIC.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_dynamic (void)
+ {
+   /* This function is only used while bootstrapping the runtime linker.
+@@ -97,7 +97,7 @@ elf_machine_dynamic (void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_load_address (void)
+ {
+   Elf32_Addr addr, tmp;
+@@ -118,7 +118,7 @@ elf_machine_load_address (void)
+   return addr - 3;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/sparc/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/sparc/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/sparc/dl-sysdep.h	(working copy)
+@@ -49,7 +49,7 @@ unsigned long _dl_linux_resolver(struct 
+ 
+ #ifndef COMPILE_ASM
+ /* Cheap modulo implementation, taken from arm/ld_sysdep.h. */
+-static __inline__ unsigned long
++static __always_inline unsigned long
+ sparc_mod(unsigned long m, unsigned long p)
+ {
+ 	unsigned long i, t, inc;
+@@ -127,7 +127,7 @@ do {    register Elf32_Addr pc __asm__("
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_dynamic (void)
+ {
+ 	register Elf32_Addr *got __asm__ ("%l7");
+@@ -138,7 +138,7 @@ elf_machine_dynamic (void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr
++static __always_inline Elf32_Addr
+ elf_machine_load_address (void)
+ {
+ 	register Elf32_Addr *pc __asm__ ("%o7"), *got __asm__ ("%l7");
+@@ -157,7 +157,7 @@ elf_machine_load_address (void)
+ 	return (Elf32_Addr) got - *got + (pc[2] - pc[3]) * 4 - 4;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/mips/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/mips/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/mips/dl-sysdep.h	(working copy)
+@@ -163,7 +163,7 @@ void _dl_perform_mips_global_got_relocat
+ 
+ #define OFFSET_GP_GOT 0x7ff0
+ 
+-static __inline__ ElfW(Addr) *
++static __always_inline ElfW(Addr) *
+ elf_mips_got_from_gpreg (ElfW(Addr) gpreg)
+ {
+ 	/* FIXME: the offset of gp from GOT may be system-dependent. */
+@@ -173,7 +173,7 @@ elf_mips_got_from_gpreg (ElfW(Addr) gpre
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  We assume its $gp points to the primary GOT.  */
+-static __inline__ ElfW(Addr)
++static __always_inline ElfW(Addr)
+ elf_machine_dynamic (void)
+ {
+ 	register ElfW(Addr) gp __asm__ ("$28");
+@@ -192,7 +192,7 @@ elf_machine_dynamic (void)
+ #endif
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ ElfW(Addr)
++static __always_inline ElfW(Addr)
+ elf_machine_load_address (void)
+ {
+ 	ElfW(Addr) addr;
+@@ -208,7 +208,7 @@ elf_machine_load_address (void)
+ 	return addr;
+ }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (ElfW(Addr) load_off, const ElfW(Addr) rel_addr,
+ 		      ElfW(Word) relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/sh/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/sh/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/sh/dl-sysdep.h	(working copy)
+@@ -25,7 +25,7 @@
+ struct elf_resolve;
+ extern unsigned long _dl_linux_resolver(struct elf_resolve * tpnt, int reloc_entry);
+ 
+-static __inline__ unsigned int
++static __always_inline unsigned int
+ _dl_urem(unsigned int n, unsigned int base)
+ {
+   int res;
+@@ -100,7 +100,7 @@ _dl_urem(unsigned int n, unsigned int ba
+ /* Return the link-time address of _DYNAMIC.  Conveniently, this is the
+    first element of the GOT.  This must be inlined in a function which
+    uses global data.  */
+-static __inline__ Elf32_Addr __attribute__ ((unused))
++static __always_inline Elf32_Addr __attribute__ ((unused))
+ elf_machine_dynamic (void)
+ {
+ 	register Elf32_Addr *got;
+@@ -109,7 +109,7 @@ elf_machine_dynamic (void)
+ }
+ 
+ /* Return the run-time load address of the shared object.  */
+-static __inline__ Elf32_Addr __attribute__ ((unused))
++static __always_inline Elf32_Addr __attribute__ ((unused))
+ elf_machine_load_address (void)
+ {
+ 	Elf32_Addr addr;
+@@ -151,7 +151,7 @@ elf_machine_load_address (void)
+     } \
+   }
+ 
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (Elf32_Addr load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
+Index: uClibc-0.9.30.1/ldso/ldso/bfin/dl-sysdep.h
+===================================================================
+--- uClibc-0.9.30.1/ldso/ldso/bfin/dl-sysdep.h	(revision 25503)
++++ uClibc-0.9.30.1/ldso/ldso/bfin/dl-sysdep.h	(working copy)
+@@ -213,7 +213,7 @@ while (0)
+ #endif
+ 
+ #include <elf.h>
+-static __inline__ void
++static __always_inline void
+ elf_machine_relative (DL_LOADADDR_TYPE load_off, const Elf32_Addr rel_addr,
+ 		      Elf32_Word relative_count)
+ {
