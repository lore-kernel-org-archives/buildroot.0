From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:37 +0200
Subject: [Buildroot] [RFC 27/37] package/libethumb: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-28-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libethumb is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy               |  7 +++++++
 package/Config.in              |  1 -
 package/libethumb/Config.in    | 17 -----------------
 package/libethumb/libethumb.mk | 27 ---------------------------
 4 files changed, 7 insertions(+), 45 deletions(-)
 delete mode 100644 package/libethumb/Config.in
 delete mode 100644 package/libethumb/libethumb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 4afeb83..5ecd190 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBETHUMB
+	bool "libethumb package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libethumb package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_PERF
 	bool "perf option has been renamed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0acce45..8855697 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -251,7 +251,6 @@ endif
 	source "package/libedbus/Config.in"
 	source "package/libelementary/Config.in"
 	source "package/libembryo/Config.in"
-	source "package/libethumb/Config.in"
 	source "package/libevas/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
diff --git a/package/libethumb/Config.in b/package/libethumb/Config.in
deleted file mode 100644
index af641f0..0000000
--- a/package/libethumb/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-comment "libethumb needs a toolchain w/ threads, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-
-config BR2_PACKAGE_LIBETHUMB
-	bool "libethumb"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBECORE_EVAS
-	select BR2_PACKAGE_LIBEDJE
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	help
-	  Ethumb is a library for generating thumbnail images of documents.
-
-	  http://trac.enlightenment.org/e/wiki/Ethumb
diff --git a/package/libethumb/libethumb.mk b/package/libethumb/libethumb.mk
deleted file mode 100644
index 314ddf9..0000000
--- a/package/libethumb/libethumb.mk
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
