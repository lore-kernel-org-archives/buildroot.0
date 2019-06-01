From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 22:45:14 +0200
Subject: [Buildroot] [git commit branch/next] package/poppler: bump version
 to 0.77.0
Message-ID: <20190601205445.33A8F83732@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6bef18dab5dfb2c2cb3055746dddcec4c114da8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For the version bump, the makefile had to be rewritten for CMake, as
the project moved from autotools to CMake.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
[Thomas:
 - update again to the lastest poppler version, 0.77.0
 - drop license related changes, since the licensing terms haven't
   changed, and they are not completely clear
 - keep the openjpeg, jpeg and lcms2 dependencies optionals
 - explicitly enable/disable more dependencies
 - bump gcc version dependency to gcc 5.x, and update the Config.in
   comment accordingly
 - don't introduce many sub-options, simply rely on the availability
   of dependencies, or on BR2_SOFT_FLOAT
 - drop libx11/libxext dependencies, no longer used]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...orm.cc-include-ctype.h-to-fix-build-error.patch |  37 -------
 package/poppler/Config.in                          |  13 ++-
 package/poppler/poppler.hash                       |   2 +-
 package/poppler/poppler.mk                         | 110 +++++++++++----------
 4 files changed, 69 insertions(+), 93 deletions(-)

diff --git a/package/poppler/0001-Form.cc-include-ctype.h-to-fix-build-error.patch b/package/poppler/0001-Form.cc-include-ctype.h-to-fix-build-error.patch
deleted file mode 100644
index 8d210dab99..0000000000
--- a/package/poppler/0001-Form.cc-include-ctype.h-to-fix-build-error.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f40143f7acca81b7d39d774ed4c349aec8d9310b Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 23 Sep 2017 11:37:23 +0200
-Subject: [PATCH] Form.cc: include ctype.h to fix build error
-
-Fixes
-Form.cc:546:28: error: 'isdigit' was not declared in this scope
-Form.cc:548:34: error: 'isxdigit' was not declared in this scope
-Form.cc:575:40: error: 'isxdigit' was not declared in this scope
-
-detected by buildroot autobuilders:
-http://autobuild.buildroot.net/results/a6a/a6a336f8b6a0136b204a34091e33dc4598178125/
-when cross-compiling with
-gcc version 4.7.3 (crosstool-NG hg+-c65fcf8a34b7)
-
-Patch sent upstream: https://bugs.freedesktop.org/show_bug.cgi?id=102951
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- poppler/Form.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/poppler/Form.cc b/poppler/Form.cc
-index 83bceb20..e7efae95 100644
---- a/poppler/Form.cc
-+++ b/poppler/Form.cc
-@@ -32,6 +32,7 @@
- #include <stddef.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <ctype.h>
- #include "goo/gmem.h"
- #include "goo/GooString.h"
- #include "Error.h"
--- 
-2.11.0
-
diff --git a/package/poppler/Config.in b/package/poppler/Config.in
index 4a553df721..3fa244fbae 100644
--- a/package/poppler/Config.in
+++ b/package/poppler/Config.in
@@ -2,9 +2,8 @@ config BR2_PACKAGE_POPPLER
 	bool "poppler"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14, constexpr
 	select BR2_PACKAGE_FONTCONFIG
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
 	help
 	  Poppler is a PDF rendering library based on the xpdf-3.0
 	  code base.
@@ -22,7 +21,13 @@ config BR2_PACKAGE_POPPLER_QT5
 	help
 	  Build Qt support into the Poppler library
 
+config BR2_PACKAGE_POPPLER_UTILS
+	bool "command line utils"
+	help
+	  Compile poppler command line utils.
+
 endif
 
-comment "poppler needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "poppler needs a toolchain w/ C++, threads, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 7aa14c681c..2d01754f5c 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a3d626b24cd14efa9864e12584b22c9c32f51c46417d7c10ca17651f297c9641  poppler-0.59.0.tar.xz
+sha256 7267eb4cbccd64a58244b8211603c1c1b6bf32c7f6a4ced2642865346102f36b  poppler-0.77.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index be1c0e4821..a2bb7e3049 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,102 +4,110 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.59.0
+POPPLER_VERSION = 0.77.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
 POPPLER_LICENSE = GPL-2.0+
 POPPLER_LICENSE_FILES = COPYING
 POPPLER_INSTALL_STAGING = YES
-POPPLER_CONF_OPTS = --with-font-configuration=fontconfig \
-	--enable-xpdf-headers --disable-poppler-qt4
+
+POPPLER_CONF_OPTS = \
+	-DENABLE_UNSTABLE_API_ABI_HEADERS=ON
+	-DBUILD_GTK_TESTS=OFF \
+	-DBUILD_QT5_TESTS=OFF \
+	-DBUILD_CPP_TESTS=OFF \
+	-DENABLE_GOBJECT_INTROSPECTION=OFF \
+	-DENABLE_GTK_DOC=OFF
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-POPPLER_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
+POPPLER_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO),y)
-POPPLER_CONF_OPTS += --enable-cairo-output
-POPPLER_DEPENDENCIES += cairo
+ifeq ($(BR2_PACKAGE_JPEG),y)
+POPPLER_DEPENDENCIES += jpeg
+POPPLER_CONF_OPTS += -DENABLE_DCTDECODER=libjpeg -DWITH_JPEG=ON
+else
+POPPLER_CONF_OPTS += -DENABLE_DCTDECODER=none -DWITH_JPEG=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+POPPLER_DEPENDENCIES += libpng
+POPPLER_CONF_OPTS += -DWITH_PNG=ON
 else
-POPPLER_CONF_OPTS += --disable-cairo-output
+POPPLER_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LCMS2),y)
-POPPLER_CONF_OPTS += --enable-cms=lcms2
 POPPLER_DEPENDENCIES += lcms2
+POPPLER_CONF_OPTS += -DENABLE_CMS=lcms2
 else
-POPPLER_CONF_OPTS += --enable-cms=none
+POPPLER_CONF_OPTS += -DENABLE_CMS=none
 endif
 
-ifeq ($(BR2_PACKAGE_CAIRO)$(BR2_PACKAGE_LIBGLIB2),yy)
-POPPLER_CONF_OPTS += --enable-poppler-glib
-POPPLER_DEPENDENCIES += libglib2
+ifeq ($(BR2_PACKAGE_OPENJPEG),y)
+POPPLER_DEPENDENCIES += openjpeg
+POPPLER_CONF_OPTS += -DENABLE_LIBOPENJPEG=openjpeg2
 else
-POPPLER_CONF_OPTS += --disable-poppler-glib
+POPPLER_CONF_OPTS += -DENABLE_LIBOPENJPEG=none
 endif
 
-ifeq ($(BR2_PACKAGE_TIFF),y)
-POPPLER_CONF_OPTS += --enable-libtiff
-# Help poppler to find libtiff in static linking scenarios
-POPPLER_CONF_ENV += \
-	LIBTIFF_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
-POPPLER_DEPENDENCIES += tiff
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+POPPLER_DEPENDENCIES += libcurl
+POPPLER_CONF_OPTS += -DENABLE_LIBCURL=ON
 else
-POPPLER_CONF_OPTS += --disable-libtiff
+POPPLER_CONF_OPTS += -DENABLE_LIBCURL=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_JPEG),y)
-POPPLER_CONF_OPTS += --enable-dctdecoder=libjpeg
-POPPLER_DEPENDENCIES += jpeg
+ifeq ($(BR2_PACKAGE_POPPLER_QT5),y)
+POPPLER_DEPENDENCIES += qt5base
+POPPLER_CONF_OPTS += -DENABLE_QT5=ON
 else
-POPPLER_CONF_OPTS += --enable-dctdecoder=none
+POPPLER_CONF_OPTS += -DENABLE_QT5=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBPNG),y)
-POPPLER_CONF_OPTS += --enable-libpng
-POPPLER_DEPENDENCIES += libpng
+ifeq ($(BR2_PACKAGE_POPPLER_UTILS),y)
+POPPLER_CONF_OPTS += -DENABLE_UTILS=ON
 else
-POPPLER_CONF_OPTS += --disable-libpng
+POPPLER_CONF_OPTS += -DENABLE_UTILS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-POPPLER_CONF_OPTS += --enable-zlib
 POPPLER_DEPENDENCIES += zlib
+POPPLER_CONF_OPTS += -DENABLE_ZLIB=ON
 else
-POPPLER_CONF_OPTS += --disable-zlib
+POPPLER_CONF_OPTS += -DENABLE_ZLIB=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBCURL),y)
-POPPLER_CONF_OPTS += --enable-libcurl
-POPPLER_DEPENDENCIES += libcurl
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+POPPLER_DEPENDENCIES += cairo
+POPPLER_CONF_OPTS += -DWITH_Cairo=ON
 else
-POPPLER_CONF_OPTS += --disable-libcurl
+POPPLER_CONF_OPTS += -DWITH_Cairo=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-POPPLER_CONF_OPTS += --with-x
-POPPLER_DEPENDENCIES += xlib_libX11 xlib_libXext
+ifeq ($(BR2_PACKAGE_TIFF),y)
+POPPLER_DEPENDENCIES += tiff
+POPPLER_CONF_OPTS += -DWITH_TIFF=ON
 else
-POPPLER_CONF_OPTS += --without-x
+POPPLER_CONF_OPTS += -DWITH_TIFF=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_POPPLER_QT5),y)
-POPPLER_DEPENDENCIES += qt5base
-POPPLER_CONF_OPTS += --enable-poppler-qt5
-# since Qt5.7.x c++11 is needed (LTS Qt5.6.x is the last one without this requirement)
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-POPPLER_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+POPPLER_DEPENDENCIES += libglib2
 endif
+
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+POPPLER_DEPENDENCIES += libnss
+POPPLER_CONF_OPTS += -DWITH_NSS3=ON
 else
-POPPLER_CONF_OPTS += --disable-poppler-qt5
+POPPLER_CONF_OPTS += -DWITH_NSS3=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENJPEG),y)
-POPPLER_DEPENDENCIES += openjpeg
-POPPLER_CONF_OPTS += --enable-libopenjpeg=openjpeg2
+ifeq ($(BR2_SOFT_FLOAT),y)
+POPPLER_CONF_OPTS += -USE_FIXEDPOINT=ON -DUSE_FLOAT=OFF
 else
-POPPLER_CONF_OPTS += --enable-libopenjpeg=none
+POPPLER_CONF_OPTS += -USE_FIXEDPOINT=OFF -DUSE_FLOAT=ON
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
