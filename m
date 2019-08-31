From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Aug 2019 15:04:17 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/libnice: add optional
 dependency to openssl
In-Reply-To: <20190831130417.7725-1-bernd.kuhls@t-online.de>
References: <20190831130417.7725-1-bernd.kuhls@t-online.de>
Message-ID: <20190831130417.7725-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for OpenSSL was added in version 0.1.15:
https://lists.freedesktop.org/archives/nice/2018-December/001443.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libnice/Config.in  |  2 +-
 package/libnice/libnice.mk | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/libnice/Config.in b/package/libnice/Config.in
index af8e814618..1f62c0b5c8 100644
--- a/package/libnice/Config.in
+++ b/package/libnice/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBNICE
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Libnice is an implementation of the IETF's Interactive
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index b2fea4d66c..4921deab33 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -8,9 +8,17 @@ LIBNICE_VERSION = 0.1.16
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
-LIBNICE_DEPENDENCIES = gnutls libglib2 host-pkgconf
+LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBNICE_CONF_OPTS += --without-openssl
+LIBNICE_DEPENDENCIES += gnutls
+else
+LIBNICE_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
+LIBNICE_DEPENDENCIES += openssl
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
 LIBNICE_CONF_OPTS += --with-gstreamer-0.10
 LIBNICE_DEPENDENCIES += gst-plugins-base
-- 
2.20.1
