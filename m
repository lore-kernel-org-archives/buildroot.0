From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:01:06 +0200
Subject: [Buildroot] [PATCH v5 26/36] package/efl/libethumb: remove package
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-27-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libethumb is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v4: remove libethumb from package/efl/
v3: update legacy option for 2015.11
    update help text
---
 Config.in.legacy                   |  7 +++++++
 package/efl/Config.in              |  1 -
 package/efl/libethumb/Config.in    | 15 ---------------
 package/efl/libethumb/libethumb.mk | 27 ---------------------------
 4 files changed, 7 insertions(+), 43 deletions(-)
 delete mode 100644 package/efl/libethumb/Config.in
 delete mode 100644 package/efl/libethumb/libethumb.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index c5b8223..d35a241 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_LIBETHUMB
+	bool "libethumb package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libethumb package has been removed with the efl bump to 1.15.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL
 	bool "gst1-plugins-bad real plugin has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 2860cd6..0729e02 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -23,7 +23,6 @@ source "package/efl/libeio/Config.in"
 source "package/efl/libevas/Config.in"
 source "package/efl/libembryo/Config.in"
 source "package/efl/libedje/Config.in"
-source "package/efl/libethumb/Config.in"
 source "package/efl/libelementary/Config.in"
 source "package/efl/libedbus/Config.in"
 
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
