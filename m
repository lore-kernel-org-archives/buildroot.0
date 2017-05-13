From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 13 May 2017 13:37:30 +0200
Subject: [Buildroot] [for-next 1/3] package/uclibc: add upstream patch to
	fix build issue with gcc7
Message-ID: <20170513113732.8154-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported on the mailing list [1], there is a build issue with gcc 7
and uClibc-ng.

Thanks to Waldemar for the fix :)

[1] http://lists.busybox.net/pipermail/buildroot/2017-May/191140.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
---
 ...es.h-with-GNU-C-library-fixes-gcc-7.1-too.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch

diff --git a/package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch b/package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch
new file mode 100644
index 0000000..eb1459b
--- /dev/null
+++ b/package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch
@@ -0,0 +1,64 @@
+From 5b0f49037e8ea8500b05c8f31ee88529ccac4cee Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sun, 7 May 2017 16:28:14 +0200
+Subject: [PATCH] sync features.h with GNU C library, fixes gcc 7.1 toolchain
+ creation
+
+[Romain: backport to uClibc-ng 1.0.24]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/features.h | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/include/features.h b/include/features.h
+index e76bbba..f982079 100644
+--- a/include/features.h
++++ b/include/features.h
+@@ -55,6 +55,7 @@
+    These are defined by this file and are used by the
+    header files to decide what to declare or define:
+ 
++   __USE_ISOC11		Define ISO C11 things.
+    __USE_ISOC99		Define ISO C99 things.
+    __USE_ISOC95		Define ISO C90 AMD1 (C95) things.
+    __USE_POSIX		Define IEEE Std 1003.1 things.
+@@ -91,6 +92,7 @@
+ 
+ 
+ /* Undefine everything, so we get a clean slate.  */
++#undef	__USE_ISOC11
+ #undef	__USE_ISOC99
+ #undef	__USE_ISOC95
+ #undef	__USE_POSIX
+@@ -151,6 +153,8 @@
+ #ifdef _GNU_SOURCE
+ # undef  _ISOC99_SOURCE
+ # define _ISOC99_SOURCE	1
++# undef  _ISOC11_SOURCE
++# define _ISOC11_SOURCE	1
+ # undef  _POSIX_SOURCE
+ # define _POSIX_SOURCE	1
+ # undef  _POSIX_C_SOURCE
+@@ -223,11 +227,14 @@
+ # define _SVID_SOURCE	1
+ #endif
+ 
+-/* This is to enable the ISO C99 extension.  Also recognize the old macro
+-   which was used prior to the standard acceptance.  This macro will
+-   eventually go away and the features enabled by default once the ISO C99
+-   standard is widely adopted.  */
+-#if (defined _ISOC99_SOURCE || defined _ISOC9X_SOURCE \
++/* This is to enable the ISO C11 extension.  */
++#if (defined _ISOC11_SOURCE \
++     || (defined __STDC_VERSION__ && __STDC_VERSION__ >= 201112L))
++# define __USE_ISOC11	1
++#endif
++
++/* This is to enable the ISO C99 extension.  */
++#if (defined _ISOC99_SOURCE || defined _ISOC11_SOURCE \
+      || (defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L))
+ # define __USE_ISOC99	1
+ #endif
+-- 
+2.9.3
+
-- 
2.9.3
