From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 27 Mar 2008 12:37:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1
Message-ID: <20080327193734.614AF3C419@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-27 12:37:33 -0700 (Thu, 27 Mar 2008)
New Revision: 21520

Log:
gcc 4.2.1: fix undefined reference to fmsub in C++ programs with soft float

Fix 'undefined reference to fmsub' linking errors with C++ programs
when soft float is enabled. Patch by b5331.

Closes #1588.


Added:
   trunk/buildroot/toolchain/gcc/4.2.1/920-soft-float.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.2.1/920-soft-float.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/920-soft-float.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.2.1/920-soft-float.patch	2008-03-27 19:37:33 UTC (rev 21520)
@@ -0,0 +1,21 @@
+diff -uNpr gcc-4.2.1_orig/gcc/config/rs6000/darwin-ldouble.c gcc-4.2.1/gcc/config/rs6000/darwin-ldouble.c
+--- gcc-4.2.1_orig/gcc/config/rs6000/darwin-ldouble.c	2007-03-05 11:54:00.000000000 -0500
++++ gcc-4.2.1/gcc/config/rs6000/darwin-ldouble.c	2008-01-31 17:51:24.000000000 -0500
+@@ -70,6 +70,8 @@ Software Foundation, 51 Franklin Street,
+    but GCC currently generates poor code when a union is used to turn
+    a long double into a pair of doubles.  */
+ 
++#if defined (_SOFT_FLOAT) && defined (__LONG_DOUBLE_128__)
++
+ long double __gcc_qadd (double, double, double, double);
+ long double __gcc_qsub (double, double, double, double);
+ long double __gcc_qmul (double, double, double, double);
+@@ -219,8 +221,6 @@ __gcc_qdiv (double a, double b, double c
+   return z.ldval;
+ }
+ 
+-#if defined (_SOFT_FLOAT) && defined (__LONG_DOUBLE_128__)
+-
+ long double __gcc_qneg (double, double);
+ int __gcc_qeq (double, double, double, double);
+ int __gcc_qne (double, double, double, double);
