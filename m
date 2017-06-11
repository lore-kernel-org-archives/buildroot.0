From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 12 Jun 2017 01:08:39 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.25
Message-ID: <20170611230839.GA12826@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mostly bugfixing and cleanups. Both patches integrated.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
@Thomas: toolchain rebuilds would be nice to recognize any
regressions early.

---
 ...es.h-with-GNU-C-library-fixes-gcc-7.1-too.patch | 64 ----------------------
 .../0002-sys-types.h-sync-with-GNU-C-library.patch | 30 ----------
 package/uclibc/uclibc.hash                         |  2 +-
 package/uclibc/uclibc.mk                           |  2 +-
 4 files changed, 2 insertions(+), 96 deletions(-)
 delete mode 100644 package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch
 delete mode 100644 package/uclibc/0002-sys-types.h-sync-with-GNU-C-library.patch

diff --git a/package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch b/package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch
deleted file mode 100644
index eb1459b..0000000
--- a/package/uclibc/0001-sync-features.h-with-GNU-C-library-fixes-gcc-7.1-too.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 5b0f49037e8ea8500b05c8f31ee88529ccac4cee Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Sun, 7 May 2017 16:28:14 +0200
-Subject: [PATCH] sync features.h with GNU C library, fixes gcc 7.1 toolchain
- creation
-
-[Romain: backport to uClibc-ng 1.0.24]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- include/features.h | 17 ++++++++++++-----
- 1 file changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/include/features.h b/include/features.h
-index e76bbba..f982079 100644
---- a/include/features.h
-+++ b/include/features.h
-@@ -55,6 +55,7 @@
-    These are defined by this file and are used by the
-    header files to decide what to declare or define:
- 
-+   __USE_ISOC11		Define ISO C11 things.
-    __USE_ISOC99		Define ISO C99 things.
-    __USE_ISOC95		Define ISO C90 AMD1 (C95) things.
-    __USE_POSIX		Define IEEE Std 1003.1 things.
-@@ -91,6 +92,7 @@
- 
- 
- /* Undefine everything, so we get a clean slate.  */
-+#undef	__USE_ISOC11
- #undef	__USE_ISOC99
- #undef	__USE_ISOC95
- #undef	__USE_POSIX
-@@ -151,6 +153,8 @@
- #ifdef _GNU_SOURCE
- # undef  _ISOC99_SOURCE
- # define _ISOC99_SOURCE	1
-+# undef  _ISOC11_SOURCE
-+# define _ISOC11_SOURCE	1
- # undef  _POSIX_SOURCE
- # define _POSIX_SOURCE	1
- # undef  _POSIX_C_SOURCE
-@@ -223,11 +227,14 @@
- # define _SVID_SOURCE	1
- #endif
- 
--/* This is to enable the ISO C99 extension.  Also recognize the old macro
--   which was used prior to the standard acceptance.  This macro will
--   eventually go away and the features enabled by default once the ISO C99
--   standard is widely adopted.  */
--#if (defined _ISOC99_SOURCE || defined _ISOC9X_SOURCE \
-+/* This is to enable the ISO C11 extension.  */
-+#if (defined _ISOC11_SOURCE \
-+     || (defined __STDC_VERSION__ && __STDC_VERSION__ >= 201112L))
-+# define __USE_ISOC11	1
-+#endif
-+
-+/* This is to enable the ISO C99 extension.  */
-+#if (defined _ISOC99_SOURCE || defined _ISOC11_SOURCE \
-      || (defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L))
- # define __USE_ISOC99	1
- #endif
--- 
-2.9.3
-
diff --git a/package/uclibc/0002-sys-types.h-sync-with-GNU-C-library.patch b/package/uclibc/0002-sys-types.h-sync-with-GNU-C-library.patch
deleted file mode 100644
index ea940f1..0000000
--- a/package/uclibc/0002-sys-types.h-sync-with-GNU-C-library.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5244b9db8f17190413a4c6b10166cec7969178f5 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Tue, 6 Jun 2017 21:41:55 +0200
-Subject: [PATCH] sys/types.h: sync with GNU C library
-
-Fixed in glibc commit f9cfa295ae3f2556bd8808f0ff693cfe44f4ac25.
-Found via Buildroot autobuilder and gdbm package cross-compile.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- include/sys/types.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/sys/types.h b/include/sys/types.h
-index 2b45d03..078a29c 100644
---- a/include/sys/types.h
-+++ b/include/sys/types.h
-@@ -223,7 +223,8 @@ typedef int register_t __attribute__ ((__mode__ (__word__)));
- #endif /* Use BSD.  */
- 
- 
--#if defined __USE_UNIX98 && !defined __blksize_t_defined
-+#if (defined __USE_UNIX98 || defined __USE_XOPEN2K8) \
-+    && !defined __blksize_t_defined
- typedef __blksize_t blksize_t;
- # define __blksize_t_defined
- #endif
--- 
-2.1.4
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 050a8eb..946d44c 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From https://uclibc-ng.org/
-sha256  b5bf5bea5d836b0a0724d94f2211b279df3f5bda18a95e02c728cbf4bd33e939        uClibc-ng-1.0.24.tar.xz
+sha256  a1208bd54fd8cbcc716140d985e228cf2f7e6265aa694c7f516fa6cb598808b2        uClibc-ng-1.0.25.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index fa970df..6049ac8 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.24
+UCLIBC_VERSION = 1.0.25
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
-- 
2.1.4
