From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Oct 2015 23:01:14 +0200
Subject: [Buildroot] [PATCH v5 34/36] package/efl/libeet: remove package
In-Reply-To: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1445720476-21517-35-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libeet is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v5: remove libeet directory
v4: update Config.in to use libefl
v3: update legacy option for 2015.11
    update help text
---
 Config.in.legacy             |  7 +++++++
 package/efl/Config.in        |  1 -
 package/efl/libeet/Config.in | 11 -----------
 package/efl/libeet/libeet.mk | 27 ---------------------------
 4 files changed, 7 insertions(+), 39 deletions(-)
 delete mode 100644 package/efl/libeet/Config.in
 delete mode 100644 package/efl/libeet/libeet.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index cb49112..14da2f2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_LIBEET
+	bool "libeet package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libeet package has been removed with the efl bump to 1.15.
+
 config BR2_PACKAGE_LIBEVAS
 	bool "libevas package has been removed"
 	select BR2_LEGACY
diff --git a/package/efl/Config.in b/package/efl/Config.in
index b35e666..9e92a6e 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -15,7 +15,6 @@ menuconfig BR2_PACKAGE_EFL
 if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
-source "package/efl/libeet/Config.in"
 source "package/efl/libefl/Config.in"
 source "package/efl/libelementary/Config.in"
 
diff --git a/package/efl/libeet/Config.in b/package/efl/libeet/Config.in
deleted file mode 100644
index 48631a0..0000000
--- a/package/efl/libeet/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBEET
-	bool "libeet"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBEINA
-	help
-	  Eet is a tiny library designed to write an arbitary set of
-	  chunks of data to a file and optionally compress each chunk
-	  (very much like a zip file).
-
-	  http://trac.enlightenment.org/e/wiki/Eet
diff --git a/package/efl/libeet/libeet.mk b/package/efl/libeet/libeet.mk
deleted file mode 100644
index fc3d7f9..0000000
--- a/package/efl/libeet/libeet.mk
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
