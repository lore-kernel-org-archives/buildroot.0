From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Jul 2019 20:35:40 +0200
Subject: [Buildroot] [PATCH 3/3] package/glib-networking: bump to version
 2.61.1
In-Reply-To: <20190705183540.16524-1-fontaine.fabrice@gmail.com>
References: <20190705183540.16524-1-fontaine.fabrice@gmail.com>
Message-ID: <20190705183540.16524-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- gnutls can be made optional again since
  https://gitlab.gnome.org/GNOME/glib-networking/commit/14a3138a6d242238f61ce83018a806e4358961de
- add openssl optional dependency
- pkcs option has been removed since
  https://gitlab.gnome.org/GNOME/glib-networking/commit/4d6caa033051f55a157d8b7fb9debdc2fa7e561e
- use new options, see
  https://gitlab.gnome.org/GNOME/glib-networking/commit/8629f3d5a58bd12d2b6818b6ca8ff1231375a2fb
- fix build failure with gnutls

Fixes:
 - http://autobuild.buildroot.org/results/e233f9a5693e18bee90669910007e122857c7f77

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glib-networking/Config.in            |  8 +++---
 package/glib-networking/glib-networking.hash |  4 +--
 package/glib-networking/glib-networking.mk   | 26 ++++++++++++++------
 3 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index b84a739460..ec2962392c 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -1,14 +1,12 @@
 config BR2_PACKAGE_GLIB_NETWORKING
 	bool "glib-networking"
-	depends on BR2_USE_WCHAR # glib2, gnutls
+	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
-	depends on !BR2_STATIC_LIBS # gnutls
-	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  Network-related GIO modules for glib.
 
-comment "glib-networking needs a toolchain w/ wchar, threads, dynamic library"
+comment "glib-networking needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index d959175e7c..061b7af695 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,3 +1,3 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.58/glib-networking-2.58.0.sha256sum
-sha256  bdfa0255e031b8ee003cc283002536b77ee76450105f1dc6ab066b9bf4330068 glib-networking-2.58.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.61/glib-networking-2.61.1.sha256sum
+sha256  a3acbe8953ba80e408bdc4a3e8c240fd9447181c7e800a175c3105604c38bad5 glib-networking-2.61.1.tar.xz
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index b11f3a4a67..39133371f5 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,25 +4,37 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.58
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
+GLIB_NETWORKING_VERSION_MAJOR = 2.61
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
 GLIB_NETWORKING_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf \
-	libglib2 \
-	gnutls
+	libglib2
 
 GLIB_NETWORKING_CONF_OPTS = \
-	-Dlibproxy_support=false \
-	-Dgnome_proxy_support=false \
-	-Dpkcs11_support=false
+	-Dlibproxy=disabled \
+	-Dgnome_proxy=disabled
 
 GLIB_NETWORKING_LICENSE = LGPL-2.0+
 GLIB_NETWORKING_LICENSE_FILES = COPYING
 GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
 	GIO_MODULE_DIR=/usr/lib/gio/modules install
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+GLIB_NETWORKING_DEPENDENCIES += gnutls
+GLIB_NETWORKING_CONF_OPTS += -Dgnutls=enabled
+else
+GLIB_NETWORKING_CONF_OPTS += -Dgnutls=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+GLIB_NETWORKING_DEPENDENCIES += openssl
+GLIB_NETWORKING_CONF_OPTS += -Dopenssl=enabled
+else
+GLIB_NETWORKING_CONF_OPTS += -Dopenssl=disabled
+endif
+
 $(eval $(meson-package))
-- 
2.20.1
