From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 12:11:27 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090305121127.837B27626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 12:11:26 +0000 (Thu, 05 Mar 2009)
New Revision: 25535

Log:
uclibc: 0.9.30.1 fix for ppc32 C99 math

From Bernhard.

Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-c99-ldbl-math.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-c99-ldbl-math.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-c99-ldbl-math.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-c99-ldbl-math.patch	2009-03-05 12:11:26 UTC (rev 25535)
@@ -0,0 +1,45 @@
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h	(revision 25503)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/wordsize.h	(working copy)
+@@ -14,6 +14,6 @@
+    to the double functions.  */
+ # define __LONG_DOUBLE_MATH_OPTIONAL   1
+ # ifndef __LONG_DOUBLE_128__
+-#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#  define __NO_LONG_DOUBLE_MATH	1
+ # endif
+ #endif
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h	(revision 25503)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathdef.h	(working copy)
+@@ -70,6 +70,8 @@ typedef double double_t;
+ /* Signal that we do not really have a `long double'.  The disables the
+    declaration of all the `long double' function variants.  */
+ # if __WORDSIZE == 32
+-#  undef __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#  define __NO_LONG_DOUBLE_MATH	1
++# elif !defined __UCLIBC_HAS_LONG_DOUBLE_MATH__
++#  define __NO_LONG_DOUBLE_MATH	1
+ # endif  /* __WORDSIZE == 32 */
+ #endif  /* __UCLIBC_HAS_LONG_DOUBLE_MATH__ */
+Index: uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathinline.h
+===================================================================
+--- uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathinline.h	(revision 25503)
++++ uClibc-0.9.30.1/libc/sysdeps/linux/powerpc/bits/mathinline.h	(working copy)
+@@ -107,6 +107,14 @@ __NTH (lrintf (float __x))
+ }
+ # endif
+ 
++/* __MATH_INLINE int
++__NTH (__finite (double __x))
++{
++  return (__extension__
++    (((union { double __d; int __i[2]; }) { __d: __x}.__i[1]
++      & 0x7fffffff) - 0x7ff00000) >> 31);
++}
++*/
+ __MATH_INLINE double fdim (double __x, double __y) __THROW;
+ __MATH_INLINE double
+ __NTH (fdim (double __x, double __y))
