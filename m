From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 10 Mar 2009 21:03:05 +0000 (UTC)
Subject: [Buildroot] svn commit: [25598] trunk/buildroot/toolchain/uClibc
Message-ID: <20090310210306.56E0176465@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-10 21:03:04 +0000 (Tue, 10 Mar 2009)
New Revision: 25598

Log:
uClibc: strtouq fix for 64bit

Added:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-64bit-strtouq.patch
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-64bit-strtouq.patch


Changeset:
Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-64bit-strtouq.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-64bit-strtouq.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30-64bit-strtouq.patch	2009-03-10 21:03:04 UTC (rev 25598)
@@ -0,0 +1,48 @@
+[PATCH]: Add strtouq alias (to strtoul) for 64bit
+
+The strtouq alias was only available on 32bit, breaking compilation of stuff
+using strtouq on 64bit machines. At the same time use the correct return
+type (u_quad_t).
+
+Signed-of-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/stdlib.h     |    4 +++-
+ libc/stdlib/stdlib.c |    1 +
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+Index: uClibc-0.9.30.1/libc/stdlib/stdlib.c
+===================================================================
+--- uClibc-0.9.30.1.orig/libc/stdlib/stdlib.c
++++ uClibc-0.9.30.1/libc/stdlib/stdlib.c
+@@ -401,6 +401,9 @@
+ libc_hidden_proto(__XL_NPP(strtoull))
+ strong_alias(__XL_NPP(strtoul),__XL_NPP(strtoull))
+ libc_hidden_def(__XL_NPP(strtoull))
++#if !defined(L_strtoul_l)
++strong_alias(strtoul,strtouq)
++#endif
+ #endif
+ 
+ 
+Index: uClibc-0.9.30.1/include/stdlib.h
+===================================================================
+--- uClibc-0.9.30.1.orig/include/stdlib.h
++++ uClibc-0.9.30.1/include/stdlib.h
+@@ -203,6 +203,8 @@
+ __END_NAMESPACE_STD
+ 
+ #ifdef __USE_BSD
++#include <sys/types.h> /* for u_quad_t */
++
+ /* Convert a string to a quadword integer.  */
+ __extension__
+ extern long long int strtoq (__const char *__restrict __nptr,
+@@ -210,7 +212,7 @@
+      __THROW __nonnull ((1)) __wur;
+ /* Convert a string to an unsigned quadword integer.  */
+ __extension__
+-extern unsigned long long int strtouq (__const char *__restrict __nptr,
++extern u_quad_t strtouq (__const char *__restrict __nptr,
+ 				       char **__restrict __endptr, int __base)
+      __THROW __nonnull ((1)) __wur;
+ #endif /* GCC and use BSD.  */

Added: trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-64bit-strtouq.patch
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-64bit-strtouq.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.30.1-64bit-strtouq.patch	2009-03-10 21:03:04 UTC (rev 25598)
@@ -0,0 +1,48 @@
+[PATCH]: Add strtouq alias (to strtoul) for 64bit
+
+The strtouq alias was only available on 32bit, breaking compilation of stuff
+using strtouq on 64bit machines. At the same time use the correct return
+type (u_quad_t).
+
+Signed-of-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/stdlib.h     |    4 +++-
+ libc/stdlib/stdlib.c |    1 +
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+Index: uClibc-0.9.30.1/libc/stdlib/stdlib.c
+===================================================================
+--- uClibc-0.9.30.1.orig/libc/stdlib/stdlib.c
++++ uClibc-0.9.30.1/libc/stdlib/stdlib.c
+@@ -401,6 +401,9 @@
+ libc_hidden_proto(__XL_NPP(strtoull))
+ strong_alias(__XL_NPP(strtoul),__XL_NPP(strtoull))
+ libc_hidden_def(__XL_NPP(strtoull))
++#if !defined(L_strtoul_l)
++strong_alias(strtoul,strtouq)
++#endif
+ #endif
+ 
+ 
+Index: uClibc-0.9.30.1/include/stdlib.h
+===================================================================
+--- uClibc-0.9.30.1.orig/include/stdlib.h
++++ uClibc-0.9.30.1/include/stdlib.h
+@@ -203,6 +203,8 @@
+ __END_NAMESPACE_STD
+ 
+ #ifdef __USE_BSD
++#include <sys/types.h> /* for u_quad_t */
++
+ /* Convert a string to a quadword integer.  */
+ __extension__
+ extern long long int strtoq (__const char *__restrict __nptr,
+@@ -210,7 +212,7 @@
+      __THROW __nonnull ((1)) __wur;
+ /* Convert a string to an unsigned quadword integer.  */
+ __extension__
+-extern unsigned long long int strtouq (__const char *__restrict __nptr,
++extern u_quad_t strtouq (__const char *__restrict __nptr,
+ 				       char **__restrict __endptr, int __base)
+      __THROW __nonnull ((1)) __wur;
+ #endif /* GCC and use BSD.  */
