From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 22:40:18 +0200
Subject: [Buildroot] [git commit] poppler: new package
Message-ID: <20130423213311.AAC5A9B7F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5d6eee6d0e319715ae2cbf07e0fc4b116ed32a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Poppler is a PDF rendering library based on the xpdf-3.0 code base.

[Peter: Fix license, comment text and drop explicit library options]
Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/poppler/Config.in  |   13 +++++++++
 package/poppler/poppler.mk |   63 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f1a3cc5..ab514c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -445,6 +445,7 @@ source "package/opencv/Config.in"
 source "package/opengl/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
+source "package/poppler/Config.in"
 source "package/tiff/Config.in"
 source "package/webkit/Config.in"
 source "package/zxing/Config.in"
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
new file mode 100644
index 0000000..6a9e1fd
--- /dev/null
+++ b/package/poppler/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_POPPLER
+	bool "poppler"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	help
+	   Poppler is a PDF rendering library based on the xpdf-3.0 code base.
+
+	   http://poppler.freedesktop.org/
+
+comment "poppler requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
new file mode 100644
index 0000000..1ce7d1e
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
+POPPLER_LICENSE = GPLv2+
+POPPLER_LICENSE_FILES = COPYING
+POPPLER_CONF_OPT = --with-font-configuration=fontconfig
+
+ifeq ($(BR2_PACKAGE_LCMS2),y)
+	POPPLER_CONF_OPT += --enable-cms=lcms2
+	POPPLER_DEPENDENCIES += lcms2
+else
+	POPPLER_CONF_OPT += --enable-cms=none
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+	POPPLER_CONF_OPT += --enable-libtiff
+	POPPLER_DEPENDENCIES += tiff
+else
+	POPPLER_CONF_OPT += --disable-libtiff
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+	POPPLER_CONF_OPT += --enable-libjpeg
+	POPPLER_DEPENDENCIES += jpeg
+else
+	POPPLER_CONF_OPT += --disable-libjpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+	POPPLER_CONF_OPT += --enable-libpng
+	POPPLER_DEPENDENCIES += libpng
+else
+	POPPLER_CONF_OPT += --disable-libpng
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
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
+ifeq ($(BR2_PACKAGE_XORG7),y)
+	POPPLER_CONF_OPT += --with-x
+	POPPLER_DEPENDENCIES += xlib_libX11 xlib_libXext
+else
+	POPPLER_CONF_OPT += --without-x
+endif
+
+$(eval $(autotools-package))
