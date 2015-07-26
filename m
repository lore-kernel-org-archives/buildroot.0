From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:45 +0200
Subject: [Buildroot] [RFC 35/37] package/libeet: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-36-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libeet is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy         |  7 +++++++
 package/Config.in        |  1 -
 package/libeet/Config.in | 16 ----------------
 package/libeet/libeet.mk | 27 ---------------------------
 4 files changed, 7 insertions(+), 44 deletions(-)
 delete mode 100644 package/libeet/Config.in
 delete mode 100644 package/libeet/libeet.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d73adff..ee70260 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBEET
+	bool "libeet package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libeet package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 55f6121..167f710 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -242,7 +242,6 @@ endif
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
-	source "package/libeet/Config.in"
 	source "package/libeina/Config.in"
 	source "package/libelementary/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
diff --git a/package/libeet/Config.in b/package/libeet/Config.in
deleted file mode 100644
index 3f36295..0000000
--- a/package/libeet/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_LIBEET
-	bool "libeet"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBEINA
-	depends on BR2_USE_MMU
-	depends on BR2_USE_WCHAR # efl
-	help
-	  Eet is a tiny library designed to write an arbitary set of
-	  chunks of data to a file and optionally compress each chunk
-	  (very much like a zip file).
-
-	  http://trac.enlightenment.org/e/wiki/Eet
-
-comment "libeet needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/libeet/libeet.mk b/package/libeet/libeet.mk
deleted file mode 100644
index fc3d7f9..0000000
--- a/package/libeet/libeet.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# libeet
-#
-################################################################################
-
-LIBEET_VERSION = 1.7.10
-LIBEET_SOURCE = eet-$(LIBEET_VERSION).tar.bz2
-LIBEET_SITE = http://download.enlightenment.org/releases
-LIBEET_LICENSE = BSD-2c
-LIBEET_LICENSE_FILES = COPYING
-
-LIBEET_INSTALL_STAGING = YES
-
-LIBEET_DEPENDENCIES = host-pkgconf zlib jpeg libeina
-HOST_LIBEET_DEPENDENCIES = host-pkgconf host-zlib host-libjpeg host-libeina
-
-ifeq ($(BR2_PACKAGE_GNUTLS)$(BR2_PACKAGE_LIBGCRYPT),yy)
-LIBEET_DEPENDENCIES += gnutls libgcrypt
-LIBEET_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
-LIBEET_CONF_OPTS += --enable-gnutls
-else
-LIBEET_CONF_OPTS += --disable-gnutls
-endif
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.4.3
