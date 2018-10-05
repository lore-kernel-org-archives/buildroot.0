From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri,  5 Oct 2018 15:31:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/poppler: bump version to 0.69.0
Message-ID: <20181005133142.1205-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the version bump, the makefile had to be rewritten for CMake, as
the project moved from autotools to CMake.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/poppler/Config.in    |  38 +++++++++---
 package/poppler/poppler.hash |   2 +-
 package/poppler/poppler.mk   | 114 ++++++++++++-----------------------
 3 files changed, 71 insertions(+), 83 deletions(-)

diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 9b03df8d27..bc69e361de 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -2,7 +2,11 @@ config BR2_PACKAGE_POPPLER
 	bool "poppler"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_OPENJPEG
+	select BR2_PACKAGE_LCMS2
+	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	help
@@ -13,14 +17,6 @@ config BR2_PACKAGE_POPPLER
 
 if BR2_PACKAGE_POPPLER
 
-config BR2_PACKAGE_POPPLER_QT
-	bool "Qt support"
-	depends on BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_GUI_MODULE
-	select BR2_PACKAGE_QT_XML
-	help
-	  Build Qt support into the Poppler library
-
 config BR2_PACKAGE_POPPLER_QT5
 	bool "Qt5 support"
 	depends on BR2_PACKAGE_QT5
@@ -30,6 +26,32 @@ config BR2_PACKAGE_POPPLER_QT5
 	help
 	  Build Qt support into the Poppler library
 
+config BR2_PACKAGE_POPPLER_FIXED_POINT
+	bool "use fixed-point" if !BR2_SOFT_FLOAT
+	default y if BR2_SOFT_FLOAT
+	help
+	  Compile without floating point operations (for machines
+	  without a fast enough FPU).
+
+config BR2_PACKAGE_POPPLER_LIBCURL
+	bool "libcurl support"
+	depends on BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_QT5BASE_GUI
+	help
+	  Build poppler with libcurl based HTTP support.
+
+config BR2_PACKAGE_POPPLER_ZLIB
+	bool "zlib support"
+	depends on BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZLIB
+	help
+	  Build poppler with with zlib.
+
+config BR2_PACKAGE_POPPLER_UTILS
+	bool "command line utils"
+	help
+	  Compile poppler command line utils.
+
 endif
 
 comment "poppler needs a toolchain w/ C++, threads"
diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 7aa14c681c..ca00e12217 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a3d626b24cd14efa9864e12584b22c9c32f51c46417d7c10ca17651f297c9641  poppler-0.59.0.tar.xz
+sha256 637ff943f805f304ff1da77ba2e7f1cbd675f474941fd8ae1e0fc01a5b45a3f9  poppler-0.69.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index bad61a6613..0e065274b9 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,109 +4,75 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.59.0
+POPPLER_VERSION = 0.69.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
-POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-POPPLER_LICENSE = GPL-2.0+
-POPPLER_LICENSE_FILES = COPYING
+POPPLER_DEPENDENCIES = fontconfig host-pkgconf openjpeg lcms2 libjpeg
+POPPLER_LICENSE = GPL-2.0+ GPL-3.0+
+POPPLER_LICENSE_FILES = COPYING COPYING3
 POPPLER_INSTALL_STAGING = YES
-POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
-	--enable-xpdf-headers
 
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-POPPLER_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
-endif
-
-ifeq ($(BR2_PACKAGE_CAIRO),y)
-POPPLER_CONF_OPTS += --enable-cairo-output
-POPPLER_DEPENDENCIES += cairo
-else
-POPPLER_CONF_OPTS += --disable-cairo-output
-endif
+POPPLER_CONF_OPTS = \
+	-DENABLE_XPDF_HEADERS=ON \
+	-DBUILD_GTK_TESTS=OFF \
+	-DBUILD_QT5_TESTS=OFF \
+	-DBUILD_CPP_TESTS=OFF \
+	-DENABLE_GOBJECT_INTROSPECTION=OFF \
+	-DENABLE_GTK_DOC=OFF
 
-ifeq ($(BR2_PACKAGE_LCMS2),y)
-POPPLER_CONF_OPTS += --enable-cms=lcms2
-POPPLER_DEPENDENCIES += lcms2
+ifeq ($(BR2_PACKAGE_POPPLER_LIBCURL),y)
+POPPLER_DEPENDENCIES += libcurl
+POPPLER_CONF_OPTS += -DENABLE_LIBCURL=ON
 else
-POPPLER_CONF_OPTS += --enable-cms=none
+POPPLER_CONF_OPTS += -DENABLE_LIBCURL=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO)$(BR2_PACKAGE_LIBGLIB2),yy)
-POPPLER_CONF_OPTS += --enable-poppler-glib
-POPPLER_DEPENDENCIES += libglib2
+ifeq ($(BR2_PACKAGE_POPPLER_QT5),y)
+POPPLER_DEPENDENCIES += qt5base
+POPPLER_CONF_OPTS += -DENABLE_QT5=ON
 else
-POPPLER_CONF_OPTS += --disable-poppler-glib
+POPPLER_CONF_OPTS += -DENABLE_QT5=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_TIFF),y)
-POPPLER_CONF_OPTS += --enable-libtiff
-# Help poppler to find libtiff in static linking scenarios
-POPPLER_CONF_ENV += \
-	LIBTIFF_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
-POPPLER_DEPENDENCIES += tiff
+ifeq ($(BR2_PACKAGE_POPPLER_UTILS),y)
+POPPLER_CONF_OPTS += -DENABLE_UTILS=ON
 else
-POPPLER_CONF_OPTS += --disable-libtiff
+POPPLER_CONF_OPTS += -DENABLE_UTILS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG),y)
-POPPLER_CONF_OPTS += --enable-dctdecoder=libjpeg
-POPPLER_DEPENDENCIES += jpeg
+ifeq ($(BR2_PACKAGE_POPPLER_ZLIB),y)
+POPPLER_DEPENDENCIES += zlib
+POPPLER_CONF_OPTS += -DENABLE_ZLIB=ON
 else
-POPPLER_CONF_OPTS += --enable-dctdecoder=none
+POPPLER_CONF_OPTS += -DENABLE_ZLIB=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
-POPPLER_CONF_OPTS += --enable-libpng
 POPPLER_DEPENDENCIES += libpng
-else
-POPPLER_CONF_OPTS += --disable-libpng
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-POPPLER_CONF_OPTS += --enable-zlib
-POPPLER_DEPENDENCIES += zlib
-else
-POPPLER_CONF_OPTS += --disable-zlib
-endif
-
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-POPPLER_CONF_OPTS += --enable-libcurl
-POPPLER_DEPENDENCIES += libcurl
-else
-POPPLER_CONF_OPTS += --disable-libcurl
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+POPPLER_DEPENDENCIES += cairo
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-POPPLER_CONF_OPTS += --with-x
-POPPLER_DEPENDENCIES += xlib_libX11 xlib_libXext
-else
-POPPLER_CONF_OPTS += --without-x
+ifeq ($(BR2_PACKAGE_TIFF),y)
+POPPLER_DEPENDENCIES += tiff
 endif
 
-ifeq ($(BR2_PACKAGE_POPPLER_QT),y)
-POPPLER_DEPENDENCIES += qt
-POPPLER_CONF_OPTS += --enable-poppler-qt4
-else
-POPPLER_CONF_OPTS += --disable-poppler-qt4
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+POPPLER_DEPENDENCIES += libglib2
 endif
 
-ifeq ($(BR2_PACKAGE_POPPLER_QT5),y)
-POPPLER_DEPENDENCIES += qt5base
-POPPLER_CONF_OPTS += --enable-poppler-qt5
-# since Qt5.7.x c++11 is needed (LTS Qt5.6.x is the last one without this requirement)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
-endif
-else
-POPPLER_CONF_OPTS += --disable-poppler-qt5
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+POPPLER_DEPENDENCIES += libnss
 endif
 
-ifeq ($(BR2_PACKAGE_OPENJPEG),y)
-POPPLER_DEPENDENCIES += openjpeg
-POPPLER_CONF_OPTS += --enable-libopenjpeg=openjpeg2
+ifeq ($(BR2_PACKAGE_POPPLER_FIXED_POINT),y)
+POPPLER_CONF_OPTS += -USE_FIXEDPOINT=ON
+POPPLER_CONF_OPTS += -DUSE_FLOAT=OFF
 else
-POPPLER_CONF_OPTS += --enable-libopenjpeg=none
+POPPLER_CONF_OPTS += -USE_FIXEDPOINT=OFF
+POPPLER_CONF_OPTS += -DUSE_FLOAT=ON
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.17.1
