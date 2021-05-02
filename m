From: Dominik Michael Rauh <dmrauh@posteo.de>
Date: Sun,  2 May 2021 13:06:19 +0000
Subject: [Buildroot] [PATCH 1/1] package/libgdal: new package
Message-ID: <20210502130619.683435-1-dmrauh@posteo.de>
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
 package/Config.in                             |  1 +
 ...1-port-cpl_recode_iconv.cpp-use-cast.patch | 38 +++++++++++++++++++
 package/libgdal/Config.in                     | 22 +++++++++++
 package/libgdal/libgdal.hash                  |  6 +++
 package/libgdal/libgdal.mk                    | 26 +++++++++++++
 5 files changed, 93 insertions(+)
 create mode 100644 package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
 create mode 100644 package/libgdal/Config.in
 create mode 100644 package/libgdal/libgdal.hash
 create mode 100644 package/libgdal/libgdal.mk

diff --git a/package/Config.in b/package/Config.in
index 6181aaac2c..56c55dffc5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1915,6 +1915,7 @@ menu "Other"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
 	source "package/libffi/Config.in"
+	source "package/libgdal/Config.in"
 	source "package/libgee/Config.in"
 	source "package/libgeos/Config.in"
 	source "package/libglib2/Config.in"
diff --git a/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
new file mode 100644
index 0000000000..fd168c769e
--- /dev/null
+++ b/package/libgdal/0001-port-cpl_recode_iconv.cpp-use-cast.patch
@@ -0,0 +1,38 @@
+From 8f59911ced01da6dba7784098e97eefeef96d3a5 Mon Sep 17 00:00:00 2001
+From: Dominik Michael Rauh <dmrauh@posteo.de>
+Date: Sat, 1 May 2021 20:11:30 +0200
+Subject: [PATCH] port/cpl_recode_iconv.cpp: use cast
+
+Fixes error: invalid cast from type 'int' to type 'iconv_t' {aka 'long
+int'}.
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
index 0000000000..1d64bfb67f
--- /dev/null
+++ b/package/libgdal/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBGDAL
+	bool "libgdal"
+	depends on BR2_INSTALL_LIBSTDCPP
+	# configure can't find proj, when linking statically
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
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
+comment "libgdal needs a toolchain w/ C++, dynamic library, gcc >= 4.7, proj"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_PACKAGE_PROJ
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
index 0000000000..31bf73ec84
--- /dev/null
+++ b/package/libgdal/libgdal.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# libgdal
+#
+################################################################################
+
+LIBGDAL_VERSION = 3.2.2
+LIBGDAL_SITE = https://download.osgeo.org/gdal/$(LIBGDAL_VERSION)
+LIBGDAL_SOURCE = gdal-$(LIBGDAL_VERSION).tar.xz
+LIBGDAL_LICENSE = MIT
+LIBGDAL_LICENSE_FILES = LICENSE.TXT
+LIBGDAL_INSTALL_STAGING = YES
+LIBGDAL_CONFIG_SCRIPTS = gdal-config
+LIBGDAL_DEPENDENCIES = host-pkgconf proj
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+LIBGDAL_DEPENDENCIES += postgresql
+LIBGDAL_CONF_OPTS += --with-pg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBGDAL_DEPENDENCIES += libxml2
+LIBGDAL_CONF_OPTS += --with-xml2
+endif
+
+$(eval $(autotools-package))
-- 
2.31.1
