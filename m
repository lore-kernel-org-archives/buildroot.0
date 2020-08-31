From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon, 31 Aug 2020 22:15:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/graphicsmagick: new package
Message-ID: <20200831201535.2630-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GraphicsMagick is the swiss army knife of image processing.
It provides a robust and efficient collection of tools
and libraries which support reading, writing,
and manipulating an image in over 89 major formats
including important formats like DPX, GIF, JPEG, JPEG-2000,
PNG, PDF, PNM, TIFF, and WebP.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 DEVELOPERS                                 |   1 +
 package/Config.in                          |   1 +
 package/graphicsmagick/Config.in           |  17 ++++
 package/graphicsmagick/graphicsmagick.hash |   3 +
 package/graphicsmagick/graphicsmagick.mk   | 113 +++++++++++++++++++++
 5 files changed, 135 insertions(+)
 create mode 100644 package/graphicsmagick/Config.in
 create mode 100644 package/graphicsmagick/graphicsmagick.hash
 create mode 100644 package/graphicsmagick/graphicsmagick.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3c3dcda859..8a647d501d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1046,6 +1046,7 @@ N:	Grzegorz Blach <grzegorz@blach.pl>
 F:	fs/f2fs/
 F:	package/bluez5_utils-headers/
 F:	package/f2fs-tools/
+F:	package/graphicsmagick/
 F:	package/pigpio/
 F:	package/python-aioblescan/
 F:	package/python-bluezero/
diff --git a/package/Config.in b/package/Config.in
index d7e79f4795..84d2ab2adf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -309,6 +309,7 @@ comment "Graphic libraries"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
+	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
diff --git a/package/graphicsmagick/Config.in b/package/graphicsmagick/Config.in
new file mode 100644
index 0000000000..1e47d67396
--- /dev/null
+++ b/package/graphicsmagick/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GRAPHICSMAGICK
+	bool "graphicsmagick"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  GraphicsMagick is the swiss army knife of image processing.
+	  It provides a robust and efficient collection of tools
+	  and libraries which support reading, writing,
+	  and manipulating an image in over 89 major formats
+	  including important formats like DPX, GIF, JPEG, JPEG-2000,
+	  PNG, PDF, PNM, TIFF, and WebP.
+
+	  http://www.graphicsmagick.org/
+
+comment "graphicsmagick needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
new file mode 100644
index 0000000000..cb91ff0d03
--- /dev/null
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  188a8d6108fea87a0208723e8d206ec1d4d7299022be8ce5d0a9720509250250  GraphicsMagick-1.3.35.tar.xz
+sha256  1d28851631892098e0bf8653fd4e89f3524184d136391b54c664e89251ca3a9a  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
new file mode 100644
index 0000000000..782dd1431e
--- /dev/null
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -0,0 +1,113 @@
+################################################################################
+#
+# graphicsmagick
+#
+################################################################################
+
+GRAPHICSMAGICK_VERSION = 1.3.35
+GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
+GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
+GRAPHICSMAGICK_LICENSE = MIT
+GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
+
+GRAPHICSMAGICK_INSTALL_STAGING = YES
+GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
+
+ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
+GRAPHICSMAGICK_CONFIG_SCRIPTS += GraphicsMagick++-config
+endif
+
+GRAPHICSMAGICK_CONF_OPTS = \
+	--disable-openmp \
+	--without-dps \
+	--without-fpx \
+	--without-jbig \
+	--without-perl \
+	--without-trio \
+	--without-webp \
+	--without-wmf \
+	--without-x \
+	--with-gs-font-dir=/usr/share/fonts/gs
+
+GRAPHICSMAGICK_DEPENDENCIES = host-pkgconf
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-ttf
+GRAPHICSMAGICK_CONF_ENV += ac_cv_path_freetype_config=$(STAGING_DIR)/usr/bin/freetype-config
+GRAPHICSMAGICK_DEPENDENCIES += freetype
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-ttf
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-jpeg
+GRAPHICSMAGICK_DEPENDENCIES += jpeg
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-jp2
+GRAPHICSMAGICK_DEPENDENCIES += openjpeg
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-jp2
+endif
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-lcms2
+GRAPHICSMAGICK_DEPENDENCIES += lcms2
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-lcms2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-png
+GRAPHICSMAGICK_DEPENDENCIES += libpng
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-xml
+GRAPHICSMAGICK_CONF_ENV += ac_cv_path_xml2_config=$(STAGING_DIR)/usr/bin/xml2-config
+GRAPHICSMAGICK_DEPENDENCIES += libxml2
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-xml
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-tiff
+GRAPHICSMAGICK_DEPENDENCIES += tiff
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-lzma
+GRAPHICSMAGICK_DEPENDENCIES += xz
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-lzma
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-zlib
+GRAPHICSMAGICK_DEPENDENCIES += zlib
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-bzlib
+GRAPHICSMAGICK_DEPENDENCIES += bzip2
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-bzlib
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+GRAPHICSMAGICK_CONF_OPTS += --with-zstd
+GRAPHICSMAGICK_DEPENDENCIES += zstd
+else
+GRAPHICSMAGICK_CONF_OPTS += --without-zstd
+endif
+
+$(eval $(autotools-package))
-- 
2.18.4
