From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Feb 2015 06:38:07 +0200
Subject: [Buildroot] [PATCH v2] libgc: Remove duplicated package
Message-ID: <9a4b9405c3a2ce2970aa201ad9cc3d4ea9dc9e99.1425011887.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pedro Aguilar <paguilar@paguilar.org>

Remove libgc that is a copy of bdwgc but it's not used
by any package and gives an error when building make-4.1.
bdwgc is a mandatory dependency for guile.

Fixes:
http://autobuild.buildroot.net/results/b80a34a602b1241bc03cd43df1a269389d50e75c/

Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
[baruch: added Reported-by, Config.in.legacy entry, autobuilder reference]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Config.in.legacy                                   |  8 ++++++
 package/Config.in                                  |  1 -
 ...01-Fix-build-on-Linux-x86_64-under-uClibc.patch | 32 ----------------------
 package/libgc/Config.in                            | 11 --------
 package/libgc/libgc.mk                             | 15 ----------
 5 files changed, 8 insertions(+), 59 deletions(-)
 delete mode 100644 package/libgc/0001-Fix-build-on-Linux-x86_64-under-uClibc.patch
 delete mode 100644 package/libgc/Config.in
 delete mode 100644 package/libgc/libgc.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8d99e2400a7c..0b87ddb59a50 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,14 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_LIBGC
+	bool "libgc package removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_BDWGC
+	help
+	  libgc has been removed because we have the same package under a
+	  different name, bdwgc.
+
 config BR2_PACKAGE_WDCTL
 	bool "util-linux' wdctl option has been renamed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index fe3d3d06d96d..262a7fb73687 100644
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
index 9190a0165031..000000000000
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
index 5e23b3da6b40..000000000000
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
index 536988dcdad3..000000000000
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
2.1.4
