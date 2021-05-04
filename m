From: Dominik Michael Rauh <dmrauh@posteo.de>
Date: Tue,  4 May 2021 16:57:35 +0000
Subject: [Buildroot] [PATCH v2] package/libgdal: new package
In-Reply-To: <20210502130619.683435-1-dmrauh@posteo.de>
References: <20210502130619.683435-1-dmrauh@posteo.de>
Message-ID: <20210504165735.86089-1-dmrauh@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GDAL is a translator library for raster and vector geospatial data
formats. As a library, it presents a single raster abstract data model
and single vector abstract data model to the calling application for all
supported formats. It also comes with a variety of useful command line
utilities for data translation and processing.

https://gdal.org/

Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
---
Changes v1 -> v2 (after review by Peter Seiderer):
-  Disable NEON and VSX support when using libgdal's libpng
-  Disable compilation for toolchains with binutils bug 21464 or 27597
-  Add the proper "depends" demanded by proj
-  Fix the comment in Config.in
-  Hopefully add the complete LIBGDAL_LICENSE information

 package/Config.in                             |  1 +
 ...1-port-cpl_recode_iconv.cpp-use-cast.patch | 38 +++++++++++++++
 package/libgdal/Config.in                     | 27 +++++++++++
 package/libgdal/libgdal.hash                  |  6 +++
 package/libgdal/libgdal.mk                    | 48 +++++++++++++++++++
 5 files changed, 120 insertions(+)
 create mode 100644 package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
 create mode 100644 package/libgdal/Config.in
 create mode 100644 package/libgdal/libgdal.hash
 create mode 100644 package/libgdal/libgdal.mk

diff --git a/package/Config.in b/package/Config.in
index 7ac10b9d42..0b82b833c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1914,6 +1914,7 @@ menu "Other"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
 	source "package/libffi/Config.in"
+	source "package/libgdal/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libgeos/Config.in"
 	source "package/libglib2/Config.in"
diff --git a/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
new file mode 100644
index 0000000000..9fa958524f
--- /dev/null
+++ b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
@@ -0,0 +1,38 @@
+From 0730ebc7a1e22a169bf3a1d873e130e079a68b3d Mon Sep 17 00:00:00 2001
+From: Dominik Michael Rauh <dmrauh@posteo.de>
+Date: Sat, 1 May 2021 20:11:30 +0200
+Subject: [PATCH] port/cpl_recode_iconv.cpp: use cast
+
+Fixes error: invalid cast from type 'int' to type 'iconv_t' {aka 'long
+int'}
+
+Signed-off-by: Dominik Michael Rauh <dmrauh@posteo.de>
+---
+ port/cpl_recode_iconv.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/port/cpl_recode_iconv.cpp b/port/cpl_recode_iconv.cpp
+index d341bb1..2346012 100644
+--- a/port/cpl_recode_iconv.cpp
++++ b/port/cpl_recode_iconv.cpp
+@@ -87,7 +87,7 @@ char *CPLRecodeIconv( const char *pszSource,
+ 
+     sConv = iconv_open( pszDstEncoding, pszSrcEncoding );
+ 
+-    if( sConv == reinterpret_cast<iconv_t>(-1) )
++    if( sConv == (iconv_t)(-1) )
+     {
+         CPLError( CE_Warning, CPLE_AppDefined,
+                   "Recode from %s to %s failed with the error: \"%s\".",
+@@ -234,7 +234,7 @@ char *CPLRecodeFromWCharIconv( const wchar_t *pwszSource,
+ 
+     sConv = iconv_open( pszDstEncoding, pszSrcEncoding );
+ 
+-    if( sConv == reinterpret_cast<iconv_t>(-1) )
++    if( sConv == (iconv_t)(-1) )
+     {
+         CPLFree( pszIconvSrcBuf );
+         CPLError( CE_Warning, CPLE_AppDefined,
+-- 
+2.31.1
+
diff --git a/package/libgdal/Config.in b/package/libgdal/Config.in
new file mode 100644
index 0000000000..a197d25aff
--- /dev/null
+++ b/package/libgdal/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_LIBGDAL
+	bool "libgdal"
+	depends on BR2_INSTALL_LIBSTDCPP # proj
+	# configure can't find proj, when linking statically
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
+	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	depends on BR2_USE_WCHAR # proj
+	select BR2_PACKAGE_PROJ
+	help
+	  GDAL is a translator library for raster and vector geospatial
+	  data formats. As a library, it presents a single raster
+	  abstract data model and single vector abstract data model to
+	  the calling application for all supported formats. It also
+	  comes with a variety of useful command line utilities for data
+	  translation and processing.
+
+	  https://gdal.org/
+
+comment "libgdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, not binutils bug 21464, 27597, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
+		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/libgdal/libgdal.hash b/package/libgdal/libgdal.hash
new file mode 100644
index 0000000000..48aad360d7
--- /dev/null
+++ b/package/libgdal/libgdal.hash
@@ -0,0 +1,6 @@
+# md5 from: https://download.osgeo.org/gdal/3.2.2/gdal-3.2.2.tar.xz.md5, sha256 locally computed:
+md5  c656be582f7beb528c66486cd1fca7a2  gdal-3.2.2.tar.xz
+sha256  a7e1e414e5c405af48982bf4724a3da64a05770254f2ce8affb5f58a7604ca57  gdal-3.2.2.tar.xz
+
+# Hash for license file:
+sha256 b82e6cca0b13f5db2f22ab667f22254fb1f4b135ea73d5bd6238ef89aff31f6c  LICENSE.TXT
diff --git a/package/libgdal/libgdal.mk b/package/libgdal/libgdal.mk
new file mode 100644
index 0000000000..e3d7b325c1
--- /dev/null
+++ b/package/libgdal/libgdal.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# libgdal
+#
+################################################################################
+
+LIBGDAL_VERSION = 3.2.2
+LIBGDAL_SITE = https://download.osgeo.org/gdal/$(LIBGDAL_VERSION)
+LIBGDAL_SOURCE = gdal-$(LIBGDAL_VERSION).tar.xz
+LIBGDAL_LICENSE = MIT (GDAL/OGR), BSD-3-Clause, BSD-Style, APACHE-2.0
+LIBGDAL_LICENSE_FILES = LICENSE.TXT
+LIBGDAL_INSTALL_STAGING = YES
+LIBGDAL_CONFIG_SCRIPTS = gdal-config
+LIBGDAL_DEPENDENCIES = host-pkgconf proj
+
+# libgdal fails to detect NEON support on aarch64 or ARM platforms
+# resp. VSX support on PowerPC based platforms. While linking an
+# application with libgdal.so, we get an undefined reference to
+# png_init_filter_functions_neon resp. png_init_filter_functions_vsx.
+# Some files are missing in the libpng bundled with libgdal, in
+# particular arm/arm_init.c and powerpc/powerpc_init.c, so disable NEON
+# and VSX support completely when using libgdal's internal libpng.
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBGDAL_DEPENDENCIES += libpng
+LIBGDAL_CONF_OPTS += --with-png=$(STAGING_DIR)/usr
+else
+LIBGDAL_CONF_OPTS += --with-png=internal
+LIBGDAL_CPPFLAGS += -DPNG_ARM_NEON_OPT=0 -DPNG_POWERPC_VSX_OPT=0
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+LIBGDAL_DEPENDENCIES += postgresql
+LIBGDAL_CONF_OPTS += --with-pg=yes
+else
+LIBGDAL_CONF_OPTS += --with-pg=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBGDAL_DEPENDENCIES += libxml2
+LIBGDAL_CONF_OPTS += --with-xml2=yes
+else
+LIBGDAL_CONF_OPTS += --with-xml2=no
+endif
+
+LIBGDAL_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) $(LIBGDAL_CPPFLAGS)"
+
+$(eval $(autotools-package))
-- 
2.31.1
