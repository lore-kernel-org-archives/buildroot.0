From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jan 2021 20:55:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: bump to version 2.42.2
Message-ID: <20210127195553.3108287-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch to meson-package
- Drop GDK_PIXBUF_DISABLE_TESTS as it is not needed anymore (meson
  doesn't build tests when cross-commpiling)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash |  4 +-
 package/gdk-pixbuf/gdk-pixbuf.mk   | 69 ++++++++++++++----------------
 2 files changed, 33 insertions(+), 40 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 8fa178b55c..580cf47602 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.12.sha256sum
-sha256  fff85cf48223ab60e3c3c8318e2087131b590fd6f1737e42cb3759a3b427a334  gdk-pixbuf-2.36.12.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.2.sha256sum
+sha256  83c66a1cfd591d7680c144d2922c5955d38b4db336d7cd3ee109f7bcf9afef15  gdk-pixbuf-2.42.2.tar.xz
 # Locally calculated
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 27fc923214..743ce2caa9 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GDK_PIXBUF_VERSION_MAJOR = 2.36
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).12
+GDK_PIXBUF_VERSION_MAJOR = 2.42
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).2
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPL-2.0+
@@ -17,50 +17,49 @@ GDK_PIXBUF_DEPENDENCIES = \
 	libglib2 $(if $(BR2_ENABLE_LOCALE),,libiconv)
 HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
 
-GDK_PIXBUF_CONF_ENV = \
-	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
-	gio_can_sniff=no
+GDK_PIXBUF_CONF_OPTS = \
+	-Dgio_sniffing=false \
+	-Dinstalled_tests=false \
+	-Dman=false
 
-HOST_GDK_PIXBUF_CONF_ENV = \
-	gio_can_sniff=no
-
-GDK_PIXBUF_CONF_OPTS = --disable-glibtest
-HOST_GDK_PIXBUF_CONF_OPTS = --disable-introspection
+HOST_GDK_PIXBUF_CONF_OPTS = \
+	-Dgio_sniffing=false \
+	-Dinstalled_tests=false \
+	-Dintrospection=disabled \
+	-Dman=false
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GDK_PIXBUF_CONF_OPTS += --enable-introspection
+GDK_PIXBUF_CONF_OPTS += -Dintrospection=enabled
 GDK_PIXBUF_DEPENDENCIES += gobject-introspection
 else
-GDK_PIXBUF_CONF_OPTS += --disable-introspection
+GDK_PIXBUF_CONF_OPTS += -Dintrospection=disabled
 endif
 
-ifneq ($(BR2_PACKAGE_LIBPNG),y)
-GDK_PIXBUF_CONF_OPTS += --without-libpng
-else
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+GDK_PIXBUF_CONF_OPTS += -Dpng=true
 GDK_PIXBUF_DEPENDENCIES += libpng
+else
+GDK_PIXBUF_CONF_OPTS += -Dpng=false
 endif
 
-ifneq ($(BR2_PACKAGE_JPEG),y)
-HOST_GDK_PIXBUF_CONF_OPTS += --without-libjpeg
-GDK_PIXBUF_CONF_OPTS += --without-libjpeg
-else
+ifeq ($(BR2_PACKAGE_JPEG),y)
+GDK_PIXBUF_CONF_OPTS += -Djpeg=true
+HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=true
 GDK_PIXBUF_DEPENDENCIES += jpeg
 HOST_GDK_PIXBUF_DEPENDENCIES += host-libjpeg
+else
+GDK_PIXBUF_CONF_OPTS += -Djpeg=false
+HOST_GDK_PIXBUF_CONF_OPTS += -Djpeg=false
 endif
 
-ifneq ($(BR2_PACKAGE_TIFF),y)
-GDK_PIXBUF_CONF_OPTS += --without-libtiff
-HOST_GDK_PIXBUF_CONF_OPTS += --without-libtiff
-else
+ifeq ($(BR2_PACKAGE_TIFF),y)
+GDK_PIXBUF_CONF_OPTS += -Dtiff=true
+HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=true
 GDK_PIXBUF_DEPENDENCIES += tiff
-GDK_PIXBUF_CONF_ENV += \
-	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 HOST_GDK_PIXBUF_DEPENDENCIES += host-tiff
-endif
-
-ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
-GDK_PIXBUF_CONF_OPTS += --with-x11
-GDK_PIXBUF_DEPENDENCIES += xlib_libX11
+else
+GDK_PIXBUF_CONF_OPTS += -Dtiff=false
+HOST_GDK_PIXBUF_CONF_OPTS += -Dtiff=false
 endif
 
 # gdk-pixbuf requires the loaders.cache file populated to work properly
@@ -79,12 +78,6 @@ endef
 GDK_PIXBUF_POST_INSTALL_TARGET_HOOKS += GDK_PIXBUF_UPDATE_CACHE
 endif
 
-# Tests don't build correctly with uClibc
-define GDK_PIXBUF_DISABLE_TESTS
-	$(SED) 's/ tests//' $(@D)/Makefile.in
-endef
-GDK_PIXBUF_POST_PATCH_HOOKS += GDK_PIXBUF_DISABLE_TESTS
-
 # Target gdk-pixbuf needs loaders.cache populated to build for the
 # thumbnailer. Use the host-built since it matches the target options
 # regarding mime types (which is the used information).
@@ -94,5 +87,5 @@ define GDK_PIXBUF_COPY_LOADERS_CACHE
 endef
 GDK_PIXBUF_PRE_BUILD_HOOKS += GDK_PIXBUF_COPY_LOADERS_CACHE
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.29.2
