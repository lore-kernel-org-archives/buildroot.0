From: Pedro Aguilar <paguilar@paguilar.org>
Date: Thu, 26 Feb 2015 23:16:21 +0100
Subject: [Buildroot] [PATCH 1/1] libgc: Remove duplicated package
Message-ID: <1424988981-9787-1-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove libgc that is a copy of bdwgc but it's not used
by any package and gives an error when building make-4.1.
bdwgc is a mandatory dependency for guile.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/Config.in                                  |  1 -
 ...01-Fix-build-on-Linux-x86_64-under-uClibc.patch | 32 ----------------------
 package/libgc/Config.in                            | 11 --------
 package/libgc/libgc.mk                             | 15 ----------
 4 files changed, 59 deletions(-)
 delete mode 100644 package/libgc/0001-Fix-build-on-Linux-x86_64-under-uClibc.patch
 delete mode 100644 package/libgc/Config.in
 delete mode 100644 package/libgc/libgc.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..262a7fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,7 +948,6 @@ menu "Other"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
 	source "package/libffi/Config.in"
-	source "package/libgc/Config.in"
 	source "package/libglib2/Config.in"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
diff --git a/package/libgc/0001-Fix-build-on-Linux-x86_64-under-uClibc.patch b/package/libgc/0001-Fix-build-on-Linux-x86_64-under-uClibc.patch
deleted file mode 100644
index 9190a01..0000000
--- a/package/libgc/0001-Fix-build-on-Linux-x86_64-under-uClibc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9cbd876ebc6ef8cbe647d4a914d03f527f822424 Mon Sep 17 00:00:00 2001
-Message-Id: <9cbd876ebc6ef8cbe647d4a914d03f527f822424.1398253762.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Wed, 23 Apr 2014 14:42:21 +0300
-Subject: [PATCH] Fix build on Linux/x86_64 under uClibc
-
-* include/private/gcconfig.h (GETCONTEXT_FPU_EXCMASK_BUG): don't define for
-uClibc, as it may not have fenv.h
-
-Patch status: sent upstream
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- include/private/gcconfig.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/private/gcconfig.h b/include/private/gcconfig.h
-index de7998be0f54..f866cc4ed8cc 100644
---- a/include/private/gcconfig.h
-+++ b/include/private/gcconfig.h
-@@ -2235,7 +2235,7 @@
-              extern int etext[];
- #            define DATASTART ((ptr_t)((((word) (etext)) + 0xfff) & ~0xfff))
- #       endif
--#       if defined(__GLIBC__)
-+#       if defined(__GLIBC__) && !defined(__UCLIBC__)
-           /* At present, there's a bug in GLibc getcontext() on         */
-           /* Linux/x64 (it clears FPU exception mask).  We define this  */
-           /* macro to workaround it.                                    */
--- 
-1.9.2
-
diff --git a/package/libgc/Config.in b/package/libgc/Config.in
deleted file mode 100644
index 5e23b3d..0000000
--- a/package/libgc/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBGC
-	bool "libgc"
-	select BR2_PACKAGE_LIBATOMIC_OPS
-	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
-	help
-	  The Boehm-Demers-Weiser conservative garbage collector can be used
-	  as a garbage collecting replacement for C malloc or C++ new. It allows
-	  you to allocate memory basically as you normally would, without
-	  explicitly deallocating memory that is no longer useful.
-
-	  http://www.hboehm.info/gc/
diff --git a/package/libgc/libgc.mk b/package/libgc/libgc.mk
deleted file mode 100644
index 536988d..0000000
--- a/package/libgc/libgc.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# libgc
-#
-################################################################################
-
-LIBGC_VERSION = 7.4.0
-LIBGC_SOURCE = gc-$(LIBGC_VERSION).tar.gz
-LIBGC_SITE = http://www.hboehm.info/gc/gc_source
-LIBGC_DEPENDENCIES = libatomic_ops host-pkgconf
-LIBGC_LICENSE = Permissive X11-style
-LIBGC_LICENSE_FILES = README.md
-LIBGC_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
-- 
1.9.1
