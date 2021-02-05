From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Fri,  5 Feb 2021 08:16:40 +0300
Subject: [Buildroot] [PATCH 1/1] package/libmapnik: new package
Message-ID: <20210205051640.9602-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mapnik is an open source toolkit for developing mapping applications.
At the core is a C++ shared library providing algorithms and patterns
for spatial data access and visualization. Mapnik is basically
a collection of geographic objects like maps, layers, datasources,
features, and geometries.
The library doesn't rely on any OS specific "windowing systems" and
it can be deployed to any server environment. It is intended to play fair
in a multi-threaded environment and is aimed primarily, but
not exclusively, at web-based development.
For further information see http://mapnik.org and also our wiki
documentation.

https://github.com/mapnik/mapnik

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/Config.in                             |   1 +
 ...-to-check-dlfcn-when-cross-compiling.patch |  34 ++++++
 ...-libs-detection-when-cross-compiling.patch |  50 +++++++++
 ...-data-detection-when-cross-compiling.patch |  70 ++++++++++++
 package/libmapnik/Config.in                   |  29 +++++
 package/libmapnik/libmapnik.mk                | 100 ++++++++++++++++++
 6 files changed, 284 insertions(+)
 create mode 100644 package/libmapnik/0001-Allow-to-check-dlfcn-when-cross-compiling.patch
 create mode 100644 package/libmapnik/0002-Allow-optional-libs-detection-when-cross-compiling.patch
 create mode 100644 package/libmapnik/0003-Allow-lib-data-detection-when-cross-compiling.patch
 create mode 100644 package/libmapnik/Config.in
 create mode 100644 package/libmapnik/libmapnik.mk

diff --git a/package/Config.in b/package/Config.in
index 06dfc32cc6..7ef9d9d1dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1909,6 +1909,7 @@ menu "Other"
 	source "package/libite/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libloki/Config.in"
+	source "package/libmapnik/Config.in"
 	source "package/libnpth/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
diff --git a/package/libmapnik/0001-Allow-to-check-dlfcn-when-cross-compiling.patch b/package/libmapnik/0001-Allow-to-check-dlfcn-when-cross-compiling.patch
new file mode 100644
index 0000000000..fa25de7346
--- /dev/null
+++ b/package/libmapnik/0001-Allow-to-check-dlfcn-when-cross-compiling.patch
@@ -0,0 +1,34 @@
+From 45441e99809ee6cd75b9691bff35127936e96f28 Mon Sep 17 00:00:00 2001
+From: fidomax <adobegitler@gmail.com>
+Date: Thu, 28 Jan 2021 14:34:34 +0300
+Subject: [PATCH 1/3] Allow to check dlfcn when cross-compiling
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Fetch from: https://github.com/mapnik/mapnik/commit/28ff0be6b91db2891e040b482fce45a532ab0add.patch
+---
+ SConstruct | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 35b68f73c..6e169e34c 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1545,11 +1545,10 @@ if not preconfigured:
+         else:
+             env['MISSING_DEPS'].append('libxml2')
+ 
+-    if not env['HOST']:
+-        if conf.CheckHasDlfcn():
+-            env.Append(CPPDEFINES = '-DMAPNIK_HAS_DLCFN')
+-        else:
+-            env['SKIPPED_DEPS'].append('dlfcn')
++    if conf.CheckHasDlfcn():
++        env.Append(CPPDEFINES = '-DMAPNIK_HAS_DLCFN')
++    else:
++        env['SKIPPED_DEPS'].append('dlfcn')
+ 
+     if env['JPEG']:
+         OPTIONAL_LIBSHEADERS.append(['jpeg', ['stdio.h', 'jpeglib.h'], False,'C','-DHAVE_JPEG'])
+-- 
+2.29.2
+
diff --git a/package/libmapnik/0002-Allow-optional-libs-detection-when-cross-compiling.patch b/package/libmapnik/0002-Allow-optional-libs-detection-when-cross-compiling.patch
new file mode 100644
index 0000000000..1291f6de66
--- /dev/null
+++ b/package/libmapnik/0002-Allow-optional-libs-detection-when-cross-compiling.patch
@@ -0,0 +1,50 @@
+From 3ef9f8296e5308c00b6558e750f7f7fbff45a743 Mon Sep 17 00:00:00 2001
+From: fidomax <adobegitler@gmail.com>
+Date: Thu, 28 Jan 2021 14:48:32 +0300
+Subject: [PATCH 2/3] Allow optional libs detection when cross-compiling
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Fetch from: https://github.com/mapnik/mapnik/commit/cf9bde7bf1033f800e5bc9640c586369d45814c6.patch
+---
+ SConstruct | 17 +++++++----------
+ 1 file changed, 7 insertions(+), 10 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 6e169e34c..9e03db662 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1692,7 +1692,7 @@ if not preconfigured:
+                 elif boost_version < [1, 57]:
+                     env.Append(CXXFLAGS = '-DBOOST_NO_CXX11_SCOPED_ENUMS')
+ 
+-    if not env['HOST'] and env['ICU_LIB_NAME'] not in env['MISSING_DEPS']:
++    if env['ICU_LIB_NAME'] not in env['MISSING_DEPS']:
+         # http://lists.boost.org/Archives/boost/2009/03/150076.php
+         # we need libicui18n if using static boost libraries, so it is
+         # important to try this check with the library linked
+@@ -1703,16 +1703,13 @@ if not preconfigured:
+             env['SKIPPED_DEPS'].append('boost_regex_icu')
+ 
+         for libname, headers, required, lang, define in OPTIONAL_LIBSHEADERS:
+-            if not env['HOST']:
+-                if not conf.CheckLibWithHeader(libname, headers, lang):
+-                    if required:
+-                        color_print(1, 'Could not find required header or shared library for %s' % libname)
+-                        env['MISSING_DEPS'].append(libname)
+-                    else:
+-                        color_print(4, 'Could not find optional header or shared library for %s' % libname)
+-                        env['SKIPPED_DEPS'].append(libname)
++            if not conf.CheckLibWithHeader(libname, headers, lang):
++                if required:
++                    color_print(1, 'Could not find required header or shared library for %s' % libname)
++                    env['MISSING_DEPS'].append(libname)
+                 else:
+-                    env.Append(CPPDEFINES = define)
++                    color_print(4, 'Could not find optional header or shared library for %s' % libname)
++                    env['SKIPPED_DEPS'].append(libname)
+             else:
+                 env.Append(CPPDEFINES = define)
+ 
+-- 
+2.29.2
+
diff --git a/package/libmapnik/0003-Allow-lib-data-detection-when-cross-compiling.patch b/package/libmapnik/0003-Allow-lib-data-detection-when-cross-compiling.patch
new file mode 100644
index 0000000000..5a6d503dc6
--- /dev/null
+++ b/package/libmapnik/0003-Allow-lib-data-detection-when-cross-compiling.patch
@@ -0,0 +1,70 @@
+From 3e48998d7beb2f6277ed955b1698c6ce581fad01 Mon Sep 17 00:00:00 2001
+From: fidomax <adobegitler@gmail.com>
+Date: Thu, 28 Jan 2021 15:15:19 +0300
+Subject: [PATCH 3/3] Allow lib/data detection when cross-compiling
+
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+Fetch from: https://github.com/mapnik/mapnik/commit/4b0d181f6e3dbfe9fdb59fd1fdbd1a6986aaafda.patch
+---
+ SConstruct | 45 ++++++++++++++++++++++-----------------------
+ 1 file changed, 22 insertions(+), 23 deletions(-)
+
+diff --git a/SConstruct b/SConstruct
+index 9e03db662..4989e6607 100644
+--- a/SConstruct
++++ b/SConstruct
+@@ -1719,29 +1719,28 @@ if not preconfigured:
+     if env['HOST']:
+         SQLITE_HAS_RTREE = True
+ 
+-    if not env['HOST']:
+-        env['QUERIED_PROJ_LIB'] = conf.CheckProjData()
+-        if os.environ.get('PROJ_LIB'):
+-            env['QUERIED_PROJ_LIB'] = os.environ['PROJ_LIB']
+-            color_print(4,'Detected PROJ_LIB in environ, using env value instead: %s' % os.environ['PROJ_LIB'] )
+-        env['QUERIED_ICU_DATA'] = conf.CheckIcuData()
+-        if os.environ.get('ICU_DATA'):
+-            env['QUERIED_ICU_DATA'] = os.environ['ICU_DATA']
+-            color_print(4,'Detected ICU_DATA in environ, using env value instead: %s' % os.environ['ICU_DATA'] )
+-        env['QUERIED_GDAL_DATA'] = conf.CheckGdalData()
+-        if os.environ.get('GDAL_DATA'):
+-            env['QUERIED_GDAL_DATA'] = os.environ['GDAL_DATA']
+-            color_print(4,'Detected GDAL_DATA in environ, using env value instead: %s' % os.environ['GDAL_DATA'] )
+-        # now validate the paths actually exist
+-        if env['QUERIED_PROJ_LIB'] and not os.path.exists(env['QUERIED_PROJ_LIB']):
+-            color_print(1,'%s not detected on your system' % env['QUERIED_PROJ_LIB'] )
+-            env['MISSING_DEPS'].append('PROJ_LIB')
+-        if env['QUERIED_GDAL_DATA'] and not os.path.exists(env['QUERIED_GDAL_DATA']):
+-            color_print(1,'%s not detected on your system' % env['QUERIED_GDAL_DATA'] )
+-            env['MISSING_DEPS'].append('GDAL_DATA')
+-        if env['QUERIED_ICU_DATA'] and not os.path.exists(env['QUERIED_ICU_DATA']):
+-            color_print(1,'%s not detected on your system' % env['QUERIED_ICU_DATA'] )
+-            env['MISSING_DEPS'].append('ICU_DATA')
++    env['QUERIED_PROJ_LIB'] = conf.CheckProjData()
++    if os.environ.get('PROJ_LIB'):
++        env['QUERIED_PROJ_LIB'] = os.environ['PROJ_LIB']
++        color_print(4,'Detected PROJ_LIB in environ, using env value instead: %s' % os.environ['PROJ_LIB'] )
++    env['QUERIED_ICU_DATA'] = conf.CheckIcuData()
++    if os.environ.get('ICU_DATA'):
++        env['QUERIED_ICU_DATA'] = os.environ['ICU_DATA']
++        color_print(4,'Detected ICU_DATA in environ, using env value instead: %s' % os.environ['ICU_DATA'] )
++    env['QUERIED_GDAL_DATA'] = conf.CheckGdalData()
++    if os.environ.get('GDAL_DATA'):
++        env['QUERIED_GDAL_DATA'] = os.environ['GDAL_DATA']
++        color_print(4,'Detected GDAL_DATA in environ, using env value instead: %s' % os.environ['GDAL_DATA'] )
++    # now validate the paths actually exist
++    if env['QUERIED_PROJ_LIB'] and not os.path.exists(env['QUERIED_PROJ_LIB']):
++        color_print(1,'%s not detected on your system' % env['QUERIED_PROJ_LIB'] )
++        env['MISSING_DEPS'].append('PROJ_LIB')
++    if env['QUERIED_GDAL_DATA'] and not os.path.exists(env['QUERIED_GDAL_DATA']):
++        color_print(1,'%s not detected on your system' % env['QUERIED_GDAL_DATA'] )
++        env['MISSING_DEPS'].append('GDAL_DATA')
++    if env['QUERIED_ICU_DATA'] and not os.path.exists(env['QUERIED_ICU_DATA']):
++        color_print(1,'%s not detected on your system' % env['QUERIED_ICU_DATA'] )
++        env['MISSING_DEPS'].append('ICU_DATA')
+ 
+     if len(env['REQUESTED_PLUGINS']):
+         if env['HOST']:
+-- 
+2.29.2
+
diff --git a/package/libmapnik/Config.in b/package/libmapnik/Config.in
new file mode 100644
index 0000000000..06428e59a2
--- /dev/null
+++ b/package/libmapnik/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_LIBMAPNIK
+	bool "libmapnik"
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_CAIRO_SVG
+	select BR2_PACKAGE_POSTGRESQL
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_SQLITE
+
+	help
+	  Mapnik is an open source toolkit for developing mapping applications.
+	  At the core is a C++ shared library providing algorithms and patterns
+	  for spatial data access and visualization. Mapnik is basically
+	  a collection of geographic objects like maps, layers, datasources,
+	  features, and geometries.
+	  The library doesn't rely on any OS specific "windowing systems" and 
+	  it can be deployed to any server environment. It is intended to play fair
+	  in a multi-threaded environment and is aimed primarily, but 
+	  not exclusively, at web-based development.
+	  For further information see http://mapnik.org and also our wiki
+	  documentation.
+
+	  https://github.com/mapnik/mapnik
diff --git a/package/libmapnik/libmapnik.mk b/package/libmapnik/libmapnik.mk
new file mode 100644
index 0000000000..2a019375fd
--- /dev/null
+++ b/package/libmapnik/libmapnik.mk
@@ -0,0 +1,100 @@
+################################################################################
+#
+# libmapnik
+#
+################################################################################
+
+LIBMAPNIK_VERSION = 3.1.0
+LIBMAPNIK_SITE = https://github.com/mapnik/mapnik/releases/download/v$(LIBMAPNIK_VERSION)
+LIBMAPNIK_SOURCE = mapnik-v$(LIBMAPNIK_VERSION).tar.bz2
+LIBMAPNIK_LICENSE = LGPL
+LIBMAPNIK_LICENSE_FILES = $(LIBMAPNIK_SUBDIR)/COPYING
+LIBMAPNIK_DEPENDENCIES += host-python3 host-scons icu harfbuzz freetype postgresql boost cairo libxml2 sqlite
+LIBMAPNIK_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
+LIBMAPNIK_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBMAPNIK_DEPENDENCIES += jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_PROJ),y)
+LIBMAPNIK_DEPENDENCIES += proj
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LIBMAPNIK_DEPENDENCIES += libpng
+endif
+
+ifeq ($(BR2_PACKAGE_WEBP),y)
+LIBMAPNIK_DEPENDENCIES += webp
+endif
+
+ifeq ($(BR2_PACKAGE_TIFF),y)
+LIBMAPNIK_DEPENDENCIES += tiff
+endif
+
+
+LIBMAPNIK_SCONS_OPTS = \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	HOST="$(GNU_TARGET_NAME)" \
+	CUSTOM_CXXFLAGS="$(TARGET_CXXFLAGS) -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H" \
+	CUSTOM_CFLAGS="$(TARGET_CFLAGS) -DACCEPT_USE_OF_DEPRECATED_PROJ_API_H" \
+	PLUGIN_LINKING=shared \
+	PREFIX=/usr \
+	DEMO=no \
+	CPP_TESTS=no \
+	PRIORITIZE_LINKING=no \
+	INPUT_PLUGINS=postgis,pgraster,sqlite,shape,csv,raster,geojson,topojson \
+	ICU_INCLUDES=$(STAGING_DIR)/usr/include \
+	ICU_LIBS=$(TARGET_DIR)/usr/lib \
+	SQLITE_INCLUDES=$(STAGING_DIR)/usr/include \
+	SQLITE_LIBS=$(TARGET_DIR)/usr/lib \
+	HB_INCLUDES=$(STAGING_DIR)/usr/include \
+	HB_LIBS=$(TARGET_DIR)/usr/lib \
+	JPEG_INCLUDES=$(STAGING_DIR)/usr/include \
+	JPEG_LIBS=$(TARGET_DIR)/usr/lib \
+	PROJ_INCLUDES=$(STAGING_DIR)/usr/include \
+	PROJ_LIBS=$(TARGET_DIR)/usr/lib \
+	PNG_INCLUDES=$(STAGING_DIR)/usr/include \
+	PNG_LIBS=$(TARGET_DIR)/usr/lib \
+	WEBP_INCLUDES=$(STAGING_DIR)/usr/include \
+	WEBP_LIBS=$(TARGET_DIR)/usr/lib \
+	TIFF_INCLUDES=$(STAGING_DIR)/usr/include \
+	TIFF_LIBS=$(TARGET_DIR)/usr/lib \
+	BOOST_INCLUDES=$(STAGING_DIR)/usr/include/boost \
+	BOOST_LIBS=$(TARGET_DIR)/usr/lib \
+	RASTERLITE_LIBS=$(TARGET_DIR)/usr/lib \
+	PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig \
+	FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+
+define LIBMAPNIK_CONFIGURE_CMDS
+       (export PROJ_LIB=$(TARGET_DIR)/usr/lib; cd $(@D); $(LIBMAPNIK_SCONS_ENV) $(HOST_DIR)/bin/python3 scons/scons.py configure $(LIBMAPNIK_SCONS_OPTS))
+endef
+
+define LIBMAPNIK_BUILD_CMDS
+	   (cd $(@D); $(LIBMAPNIK_SCONS_ENV) $(HOST_DIR)/bin/python3 scons/scons.py)
+endef
+
+define LIBMAPNIK_INSTALL_STAGING_CMDS
+	cp -rdpf $(@D)/src/libmapnik.* \
+		$(STAGING_DIR)/usr/lib/
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/mapnik
+	cp -rdpf $(@D)/include/mapnik/. \
+		$(STAGING_DIR)/usr/include/mapnik
+	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/mapbox
+	cp -rdpf $(@D)/deps/mapbox/variant/include/mapbox/. \
+		$(STAGING_DIR)/usr/include/mapbox
+
+endef
+
+define LIBMAPNIK_INSTALL_TARGET_CMDS
+	cp -rdpf $(@D)/src/libmapnik.* \
+		$(TARGET_DIR)/usr/lib/
+	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/lib/mapnik/input
+	cp -rdpf $(@D)/plugins/input/*.input \
+		$(TARGET_DIR)/usr/lib/mapnik/input
+
+endef
+
+$(eval $(generic-package))
-- 
2.29.2
