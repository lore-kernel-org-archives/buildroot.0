From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 26 Dec 2018 18:29:42 -0500
Subject: [Buildroot] [PATCH 1/1] glib-networking: bump version to 2.56.1
Message-ID: <20181226232942.99929-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - glib-networking is now a meson package and has no support for auto-tools.
  - Update configure options to reflect the above change to meson.
  - gnutls is now a dependency of glib-networking.
  - Add License file hash.

Fixes:
 - http://autobuild.buildroot.org/results/848282be656809e26a704ff92842e6bde6875a3e

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/glib-networking/Config.in            |  5 +++--
 package/glib-networking/glib-networking.hash |  5 +++--
 package/glib-networking/glib-networking.mk   | 23 ++++++++++----------
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index ec2962392c..510eb42c13 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -3,10 +3,11 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on !BR2_STATIC_LIBS # gnutls
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Network-related GIO modules for glib.
 
-comment "glib-networking needs a toolchain w/ wchar, threads"
+comment "glib-networking needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index bbcecb7ad2..59e3fa463e 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,2 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.50/glib-networking-2.50.0.sha256sum
-sha256	3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee	glib-networking-2.50.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.56/glib-networking-2.56.1.sha256sum
+sha256	df47b0e0a037d2dcf6b1846cbdf68dd4b3cc055e026bb40c4a55f19f29f635c8	glib-networking-2.56.1.tar.xz
+sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 10a3b706b3..2852f90121 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.50
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
+GLIB_NETWORKING_VERSION_MAJOR = 2.56
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
@@ -13,19 +13,18 @@ GLIB_NETWORKING_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
 	host-intltool \
-	libglib2
+	libglib2 \
+	gnutls
+
 GLIB_NETWORKING_CONF_OPTS = \
-	--with-ca-certificates=/etc/ssl/certs/ca-certificates.crt
+	-Dca_certificates_path=/etc/ssl/certs/ca-certificates.crt \
+	-Dlibproxy_support=false \
+	-Dgnome_proxy_support=false \
+	-Dpkcs11_support=false
+
 GLIB_NETWORKING_LICENSE = LGPL-2.0+
 GLIB_NETWORKING_LICENSE_FILES = COPYING
 GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
 	GIO_MODULE_DIR=/usr/lib/gio/modules install
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-GLIB_NETWORKING_DEPENDENCIES += gnutls
-GLIB_NETWORKING_CONF_OPTS += --with-libgcrypt-prefix=$(STAGING_DIR)/usr
-else
-GLIB_NETWORKING_CONF_OPTS += --without-gnutls
-endif
-
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.19.2
