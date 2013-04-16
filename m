From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 16 Apr 2013 22:48:04 +0200
Subject: [Buildroot] [PATCH 1/1] poppler: new package
Message-ID: <1366145284-29557-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Poppler is a PDF rendering library based on the xpdf-3.0 code base.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in          |    1 +
 package/poppler/Config.in  |   46 ++++++++++++++++++++++++++++++++
 package/poppler/poppler.mk |   63 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 package/poppler/Config.in
 create mode 100644 package/poppler/poppler.mk

diff --git a/package/Config.in b/package/Config.in
index f28cedd..a52705a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -444,6 +444,7 @@ source "package/opencv/Config.in"
 source "package/opengl/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
+source "package/poppler/Config.in"
 source "package/tiff/Config.in"
 source "package/webkit/Config.in"
 source "package/zxing/Config.in"
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
new file mode 100644
index 0000000..ce31651
--- /dev/null
+++ b/package/poppler/Config.in
@@ -0,0 +1,46 @@
+config BR2_PACKAGE_POPPLER
+	bool "poppler"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	   Poppler is a PDF rendering library based on the xpdf-3.0 code base.
+
+	   http://poppler.freedesktop.org/
+
+comment "qpdf requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+if BR2_PACKAGE_POPPLER
+menu "Poppler Options"
+config BR2_PACKAGE_POPPLER_CMS
+	bool "Color Management System support"
+	select BR2_PACKAGE_LCMS2
+
+config BR2_PACKAGE_POPPLER_JPEG
+	bool "JPEG support"
+	select BR2_PACKAGE_JPEG
+
+config BR2_PACKAGE_POPPLER_LIBCURL
+	bool "libCURL support"
+	select BR2_PACKAGE_LIBCURL
+
+config BR2_PACKAGE_POPPLER_PNG
+	bool "PNG support"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_POPPLER_TIFF
+	bool "TIFF support"
+	select BR2_PACKAGE_TIFF
+
+config BR2_PACKAGE_POPPLER_ZLIB
+	bool "ZLIB support"
+	select BR2_PACKAGE_ZLIB
+
+config BR2_PACKAGE_POPPLER_X
+	bool "X support"
+	default y
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBX11
+endmenu
+endif
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
new file mode 100644
index 0000000..c390d1a
--- /dev/null
+++ b/package/poppler/poppler.mk
@@ -0,0 +1,63 @@
+#############################################################
+#
+# poppler
+#
+#############################################################
+
+POPPLER_VERSION = 0.22.3
+POPPLER_SITE = http://poppler.freedesktop.org
+POPPLER_DEPENDENCIES = fontconfig
+POPPLER_LICENSE = GPLv2
+POPPLER_LICENSE_FILES = COPYING
+POPPLER_CONF_OPT = --with-font-configuration=fontconfig
+
+ifeq ($(BR2_PACKAGE_POPPLER_CMS),y)
+	POPPLER_CONF_OPT += --enable-cms=lcms2
+	POPPLER_DEPENDENCIES += lcms2
+else
+	POPPLER_CONF_OPT += --enable-cms=none
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER_TIFF),y)
+	POPPLER_CONF_OPT += --enable-libtiff
+	POPPLER_DEPENDENCIES += tiff
+else
+	POPPLER_CONF_OPT += --disable-libtiff
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER_JPEG),y)
+	POPPLER_CONF_OPT += --enable-libjpeg
+	POPPLER_DEPENDENCIES += jpeg
+else
+	POPPLER_CONF_OPT += --disable-libjpeg
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER_PNG),y)
+	POPPLER_CONF_OPT += --enable-libpng
+	POPPLER_DEPENDENCIES += libpng
+else
+	POPPLER_CONF_OPT += --disable-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER_ZLIB),y)
+	POPPLER_CONF_OPT += --enable-zlib
+	POPPLER_DEPENDENCIES += zlib
+else
+	POPPLER_CONF_OPT += --disable-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER_LIBCURL),y)
+	POPPLER_CONF_OPT += --enable-libcurl
+	POPPLER_DEPENDENCIES += libcurl
+else
+	POPPLER_CONF_OPT += --disable-libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_POPPLER_X),y)
+	POPPLER_CONF_OPT += --with-x
+	POPPLER_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+	POPPLER_CONF_OPT += --without-x
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
