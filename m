From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 17:35:49 +0100
Subject: [Buildroot] [git commit branch/next] libmicrohttpd: bump to version
 0.9.57
Message-ID: <20171129163023.25BAA81D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48b4ad9451cb9a6c5dabc6028e1e6c01a6411177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop libgcrypt dependency for SSL support; with newer version of gnutls
libgcrypt is not needed.

Drop the LIBS fix for static linking with gnutls that has been
introduced in commit 2d3d6d258bb (libmicrohttpd: fix static linking with
gnutls). gnutls does not support static linking anymore.

Fix a comment typo.

Add license hash.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/Config.in          |  2 --
 package/libmicrohttpd/libmicrohttpd.hash |  3 ++-
 package/libmicrohttpd/libmicrohttpd.mk   | 10 ++++------
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 2a685ca..7f3c9bb 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -11,11 +11,9 @@ if BR2_PACKAGE_LIBMICROHTTPD
 
 config BR2_PACKAGE_LIBMICROHTTPD_SSL
 	bool "https support"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GNUTLS
-	select BR2_PACKAGE_LIBGCRYPT
 	help
 	  Enable HTTPS (SSL) support.
 
diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index a1460fd..e628cb2 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 0c1cab8dc9f2588bd3076a28f77a7f8de9560cbf2d80e53f9a8696ada80ed0f8  libmicrohttpd-0.9.55.tar.gz
+sha256 dec1a76487d7e48ad74b468a888bfda1c05731f185ff950f1e363ca9d39caf4e  libmicrohttpd-0.9.57.tar.gz
+sha256 70e12e2a60151b9ed1a4c94a5ffeb99cd086fa94542b5a92fec581506e8d3121  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index a87c93b..62fb7fc 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.55
+LIBMICROHTTPD_VERSION = 0.9.57
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
@@ -12,7 +12,7 @@ LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 # gcc on arc and bfin doesn't define _REENTRANT when -pthread is
-# passed while it should. Compensate this defiency here otherwise
+# passed while it should. Compensate this deficiency here otherwise
 # libmicrohttpd configure script doesn't find that thread support is
 # enabled.
 ifeq ($(BR2_arc)$(BR2_bfin),y)
@@ -23,10 +23,8 @@ LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
 
 ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
 LIBMICROHTTPD_LICENSE = LGPL-2.1+
-LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls libgcrypt
-LIBMICROHTTPD_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs gnutls`"
-LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls
+LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr
 else
 LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
 LIBMICROHTTPD_CONF_OPTS += --disable-https
