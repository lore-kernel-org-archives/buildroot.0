From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:38 +0200
Subject: [Buildroot] [RFC 28/37] package/libedje: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-29-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libedje is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy           |  7 +++++++
 package/Config.in          |  1 -
 package/libedje/Config.in  | 30 ------------------------------
 package/libedje/libedje.mk | 28 ----------------------------
 4 files changed, 7 insertions(+), 59 deletions(-)
 delete mode 100644 package/libedje/Config.in
 delete mode 100644 package/libedje/libedje.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 5ecd190..0afbc27 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBEDJE
+	bool "libedje package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libedje package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBETHUMB
 	bool "libethumb package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 8855697..7428d6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -244,7 +244,6 @@ endif
 	source "package/imagemagick/Config.in"
 	source "package/libecore/Config.in"
 	source "package/libeet/Config.in"
-	source "package/libedje/Config.in"
 	source "package/libefreet/Config.in"
 	source "package/libeina/Config.in"
 	source "package/libeio/Config.in"
diff --git a/package/libedje/Config.in b/package/libedje/Config.in
deleted file mode 100644
index 299e86b..0000000
--- a/package/libedje/Config.in
+++ /dev/null
@@ -1,30 +0,0 @@
-comment "libedje needs a toolchain w/ threads, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-
-config BR2_PACKAGE_LIBEDJE
-	bool "libedje"
-	select BR2_PACKAGE_LIBEINA
-	select BR2_PACKAGE_LIBEET
-	select BR2_PACKAGE_LIBECORE
-	select BR2_PACKAGE_LIBECORE_EVAS
-	select BR2_PACKAGE_LIBEMBRYO
-	select BR2_PACKAGE_LIBEVAS
-	select BR2_PACKAGE_LUA
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libevas
-	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	help
-	  A graphical layout and animation library for animated
-	  resizable, compressed and scalable themes.
-
-	  http://trac.enlightenment.org/e/wiki/Edje
-
-if BR2_PACKAGE_LIBEDJE
-
-config BR2_PACKAGE_LIBEDJE_CC
-	bool "build edje_cc"
-	help
-	  Build and install the Edje compiler for the target. Normally this
-	  is not required.
-
-endif
diff --git a/package/libedje/libedje.mk b/package/libedje/libedje.mk
deleted file mode 100644
index 59189e4..0000000
--- a/package/libedje/libedje.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# libedje
-#
-################################################################################
-
-LIBEDJE_VERSION = 1.7.10
-LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
-LIBEDJE_SITE = http://download.enlightenment.org/releases
-LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
-LIBEDJE_LICENSE_FILES = COPYING
-
-LIBEDJE_INSTALL_STAGING = YES
-
-LIBEDJE_DEPENDENCIES = \
-	host-pkgconf lua libeina libeet libecore libevas \
-	libembryo
-
-ifeq ($(BR2_PACKAGE_LIBEDJE_CC),y)
-LIBEDJE_CONF_OPTS += --enable-edje-cc
-else
-LIBEDJE_CONF_OPTS += --disable-edje-cc
-endif
-
-HOST_LIBEDJE_CONF_OPTS = --enable-edje-cc
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.4.3
