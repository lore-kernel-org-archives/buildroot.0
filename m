From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  9 Dec 2015 00:02:26 +0100
Subject: [Buildroot] [PATCH v8 23/33] package/efl/libethumb: remove package
In-Reply-To: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
References: <1449615756-19115-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1449615756-19115-24-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libethumb is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v8: remove the patch added by Peter in a36d751 (Yann E.Morin)
v6: Improve lecacy help text (Yann E.Morin)
v4: remove libethumb from package/efl/
v3: update legacy option for 2015.11
    update help text
---
 Config.in.legacy                                   |  7 ++++++
 package/efl/Config.in                              |  1 -
 .../0001-ethumb-drop-unused-dlfcn.h-include.patch  | 28 ----------------------
 package/efl/libethumb/Config.in                    | 15 ------------
 package/efl/libethumb/libethumb.mk                 | 27 ---------------------
 5 files changed, 7 insertions(+), 71 deletions(-)
 delete mode 100644 package/efl/libethumb/0001-ethumb-drop-unused-dlfcn.h-include.patch
 delete mode 100644 package/efl/libethumb/Config.in
 delete mode 100644 package/efl/libethumb/libethumb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 2bbf2ed..92dc3ac 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.02"
 
+config BR2_PACKAGE_LIBETHUMB
+	bool "libethumb package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  With EFL 1.15, libethumb is now provided by the libefl package.
+
 config BR2_PACKAGE_INFOZIP
 	bool "infozip option has been renamed to zip"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 1c6f9e5..ff8ba83 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -24,7 +24,6 @@ source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
-source "package/efl/libethumb/Config.in"
 source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
 
diff --git a/package/efl/libethumb/0001-ethumb-drop-unused-dlfcn.h-include.patch b/package/efl/libethumb/0001-ethumb-drop-unused-dlfcn.h-include.patch
deleted file mode 100644
index 834b0a8..0000000
--- a/package/efl/libethumb/0001-ethumb-drop-unused-dlfcn.h-include.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f7eeddc88ce67c248ebb1e6b8a3cb74d61de42b4 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Thu, 26 Nov 2015 22:07:24 +0100
-Subject: [PATCH] ethumb: drop unused dlfcn.h include
-
-ethumb includes dlfcn.h even though it isn't used, breaking builds with
-purely static toolchains.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/lib/ethumb.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/lib/ethumb.c b/src/lib/ethumb.c
-index d1453a0..48c6a2d 100644
---- a/src/lib/ethumb.c
-+++ b/src/lib/ethumb.c
-@@ -58,7 +58,6 @@ void *alloca (size_t);
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <dirent.h>
--#include <dlfcn.h>
- #include <ctype.h>
- 
- #ifdef HAVE_XATTR
--- 
-2.1.4
-
diff --git a/package/efl/libethumb/Config.in b/package/efl/libethumb/Config.in
deleted file mode 100644
index 3e9cbde..0000000
--- a/package/efl/libethumb/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-comment "libethumb needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
-config BR2_PACKAGE_LIBETHUMB
-	bool "libethumb"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBECORE_EVAS
-	select BR2_PACKAGE_LIBEDJE
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	help
-	  Ethumb is a library for generating thumbnail images of documents.
-
-	  http://trac.enlightenment.org/e/wiki/Ethumb
diff --git a/package/efl/libethumb/libethumb.mk b/package/efl/libethumb/libethumb.mk
deleted file mode 100644
index 314ddf9..0000000
--- a/package/efl/libethumb/libethumb.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# libethumb
-#
-################################################################################
-
-LIBETHUMB_VERSION = 1.7.10
-LIBETHUMB_SOURCE = ethumb-$(LIBETHUMB_VERSION).tar.bz2
-LIBETHUMB_SITE = http://download.enlightenment.org/releases
-LIBETHUMB_LICENSE = LGPLv2.1+
-LIBETHUMB_LICENSE_FILES = COPYING
-
-LIBETHUMB_INSTALL_STAGING = YES
-
-LIBETHUMB_DEPENDENCIES = libeina libevas libecore libedje host-libedje
-
-LIBETHUMB_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
-
-ifeq ($(BR2_PACKAGE_LIBEXIF),y)
-LIBETHUMB_DEPENDENCIES += libexif
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEDBUS),y)
-LIBETHUMB_DEPENDENCIES += libedbus
-endif
-
-$(eval $(autotools-package))
-- 
2.4.3
