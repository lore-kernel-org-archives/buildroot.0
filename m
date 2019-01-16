From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Jan 2019 19:59:02 +0100
Subject: [Buildroot] [PATCH 3/3] gnutls: bump to version 3.6.5
In-Reply-To: <20190116185902.5076-1-fontaine.fabrice@gmail.com>
References: <20190116185902.5076-1-fontaine.fabrice@gmail.com>
Message-ID: <20190116185902.5076-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- libidn1 support removed since version 3.6.0 and
  https://github.com/gnutls/gnutls/commit/abe6a12b9766219163f99d7807a0b07fbe5f590c
- libz support has been removed since version 3.6.0 and
  https://github.com/gnutls/gnutls/commit/1b3ece44acaa25c149659a6878d2be807a282f02

This bump also fix build issues of gnutls tests and applications such
as ffmpeg or cups due to the fact that _idn2_punycode_* functions are
not exposed anymore since libidn2 bump to version 2.1.0 and:
https://github.com/libidn/libidn2/commit/1d1f2e5babe6032eb0fe4d451afee2e277b8419f

Fixes:
 - http://autobuild.buildroot.org/results/f8c38ea6ebbb78269d620d19d760a0566f742640
 - http://autobuild.buildroot.org/results/8dc5b4212b1d8d0bf5bd5e8a27eb02753dc678e4
 - http://autobuild.buildroot.org/results/53f5bcd9010c841838f51d65427d9a97ef35e08c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnutls/gnutls.hash |  4 ++--
 package/gnutls/gnutls.mk   | 25 +++++--------------------
 2 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index bbcd5bd4de..89e8b14597 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.5/gnutls-3.5.19.tar.xz.sig
-sha256	1936eb64f03aaefd6eb16cef0567457777618573826b94d03376bb6a4afadc44	gnutls-3.5.19.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.5.tar.xz.sig
+sha256	073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35	gnutls-3.6.5.tar.xz
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	doc/COPYING
 sha256	6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3	doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 2d670d32d7..e6ddc3dbec 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GNUTLS_VERSION_MAJOR = 3.5
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).19
+GNUTLS_VERSION_MAJOR = 3.6
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).5
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library), GPL-3.0+ (gnutls-openssl library)
@@ -28,9 +28,8 @@ GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	gl_cv_func_gettimeofday_clobber=no
 GNUTLS_INSTALL_STAGING = YES
 
-# libpthread and libz autodetection poison the linkpath
+# libpthread autodetection poison the linkpath
 GNUTLS_CONF_OPTS += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
-GNUTLS_CONF_OPTS += $(if $(BR2_PACKAGE_ZLIB),--with-libz-prefix=$(STAGING_DIR)/usr)
 
 # gnutls needs libregex, but pcre can be used too
 # The check isn't cross-compile friendly
@@ -59,18 +58,11 @@ GNUTLS_CONF_OPTS += --enable-cryptodev
 GNUTLS_DEPENDENCIES += cryptodev-linux
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN),y)
-GNUTLS_CONF_OPTS += --with-idn
-GNUTLS_DEPENDENCIES += libidn
-else
-GNUTLS_CONF_OPTS += --without-idn
-endif
-
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
-GNUTLS_CONF_OPTS += --with-libidn2
+GNUTLS_CONF_OPTS += --with-idn
 GNUTLS_DEPENDENCIES += libidn2
 else
-GNUTLS_CONF_OPTS += --without-libidn2
+GNUTLS_CONF_OPTS += --without-idn
 endif
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
@@ -87,13 +79,6 @@ else
 GNUTLS_CONF_OPTS += --with-included-unistring
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-GNUTLS_CONF_OPTS += --with-zlib
-GNUTLS_DEPENDENCIES += zlib
-else
-GNUTLS_CONF_OPTS += --without-zlib
-endif
-
 # Provide a default CA cert location
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
 GNUTLS_CONF_OPTS += --with-default-trust-store-pkcs11=pkcs11:model=p11-kit-trust
-- 
2.14.1
