From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 21:56:06 +0100
Subject: [Buildroot] [git commit] package/libnice: add optional dependency
 to openssl
Message-ID: <20191216205209.8AD8F88D40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d49cec2a2d69229b2f50c61a80db46a4672f48b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for OpenSSL was added in version 0.1.15:
https://lists.freedesktop.org/archives/nice/2018-December/001443.html

With the option of using OpenSSL as a crypto provider, we can't keep
GnuTLS as the default, because using:

       select BR2_PACKAGE_GNUTLS if !BR2_PACKAGE_OPENSSL

causes a Kconfig circular dependency:

package/openssl/Config.in:4:error: recursive dependency detected!
package/openssl/Config.in:4:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_GNUTLS
package/gnutls/Config.in:1:	symbol BR2_PACKAGE_GNUTLS is selected by BR2_PACKAGE_OPENSSL

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: pass --with-crypto-library argument]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnice/Config.in  |  2 +-
 package/libnice/libnice.mk | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

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
index b2fea4d66c..b5168f83ed 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -8,9 +8,19 @@ LIBNICE_VERSION = 0.1.16
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
-LIBNICE_DEPENDENCIES = gnutls libglib2 host-pkgconf
+LIBNICE_DEPENDENCIES = libglib2 host-pkgconf
 LIBNICE_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBNICE_CONF_OPTS += --with-crypto-library=gnutls
+LIBNICE_DEPENDENCIES += gnutls
+else
+LIBNICE_CONF_OPTS += \
+	--with-crypto-library=openssl \
+	--with-openssl=$(STAGING_DIR)/usr
+LIBNICE_DEPENDENCIES += openssl
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
 LIBNICE_CONF_OPTS += --with-gstreamer-0.10
 LIBNICE_DEPENDENCIES += gst-plugins-base
