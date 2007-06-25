From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 25 Jun 2007 01:16:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070625081614.0D467A45B2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-25 01:16:14 -0700 (Mon, 25 Jun 2007)
New Revision: 18909

Log:
- add patch for the 0.9.29 release that fixes the visibility of internal_function


Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-internal_function-definition.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-internal_function-definition.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-internal_function-definition.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.29-fix-internal_function-definition.patch	2007-06-25 08:16:14 UTC (rev 18909)
@@ -0,0 +1,51 @@
+Index: uClibc/libc/sysdeps/linux/i386/bits/uClibc_arch_features.h
+===================================================================
+--- uClibc/libc/sysdeps/linux/i386/bits/uClibc_arch_features.h	(revision 18898)
++++ uClibc/libc/sysdeps/linux/i386/bits/uClibc_arch_features.h	(working copy)
+@@ -42,6 +42,8 @@
+ /* define if target supports IEEE signed zero floats */
+ #define __UCLIBC_HAVE_SIGNED_ZERO__
+ 
++#if defined _LIBC
+ #define internal_function __attribute__ ((regparm (3), stdcall))
++#endif
+ 
+ #endif /* _BITS_UCLIBC_ARCH_FEATURES_H */
+Index: uClibc/include/libc-symbols.h
+===================================================================
+--- uClibc/include/libc-symbols.h	(revision 18898)
++++ uClibc/include/libc-symbols.h	(working copy)
+@@ -22,6 +22,16 @@
+ #ifndef _LIBC_SYMBOLS_H
+ #define _LIBC_SYMBOLS_H	1
+ 
++/* This is defined for the compilation of all C library code.  features.h
++   tests this to avoid inclusion of stubs.h while compiling the library,
++   before stubs.h has been generated.  Some library code that is shared
++   with other packages also tests this symbol to see if it is being
++   compiled as part of the C library.  We must define this before including
++   config.h, because it makes some definitions conditional on whether libc
++   itself is being compiled, or just some generator program.  */
++#define _LIBC	1
++
++
+ /* This file's macros are included implicitly in the compilation of every
+    file in the C library by -imacros.
+ 
+@@ -40,16 +50,6 @@
+ 
+ #include <bits/uClibc_arch_features.h>
+ 
+-
+-/* This is defined for the compilation of all C library code.  features.h
+-   tests this to avoid inclusion of stubs.h while compiling the library,
+-   before stubs.h has been generated.  Some library code that is shared
+-   with other packages also tests this symbol to see if it is being
+-   compiled as part of the C library.  We must define this before including
+-   config.h, because it makes some definitions conditional on whether libc
+-   itself is being compiled, or just some generator program.  */
+-#define _LIBC	1
+-
+ /* Enable declarations of GNU extensions, since we are compiling them.  */
+ #define _GNU_SOURCE	1
+ 
