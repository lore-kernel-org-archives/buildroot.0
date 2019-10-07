From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 23:00:27 +0200
Subject: [Buildroot] [git commit] package/libgeotiff: bump version to 1.5.1
Message-ID: <20191007205445.D80728A5EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1edf0383a6a9d17a27d831bb02833870655d43d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:
https://github.com/OSGeo/libgeotiff/commit/2fbae8298d7cc976d7c0f329fc26dafe57fb0fc4
https://github.com/OSGeo/libgeotiff/commit/b5895ac935914f5b5c2af66f78b11d059867d71a
https://github.com/OSGeo/libgeotiff/commit/edc9ec69b43c27955ee4f24db2e6808bb1a8974d

Updated upstream URL in Config.in due to the upstream switch to github:
https://trac.osgeo.org/geotiff/

Updated license hash after upstream commit:
https://github.com/OSGeo/libgeotiff/commit/e3dd2e1bf1ce58aa98d25cc778cb491794a13197

proj 6 is now a mandatory dependency:
https://github.com/OSGeo/libgeotiff/commit/a0526817886614c41ba5fdee4a5998bafcdff658

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgeotiff/0001-use-pkg-config.patch       | 79 ----------------------
 ...-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch | 20 ------
 ...ibgeotiff-configure.ac-do-not-check-for-C.patch | 65 ------------------
 package/libgeotiff/Config.in                       |  7 +-
 package/libgeotiff/libgeotiff.hash                 |  4 +-
 package/libgeotiff/libgeotiff.mk                   | 13 +---
 6 files changed, 11 insertions(+), 177 deletions(-)

diff --git a/package/libgeotiff/0001-use-pkg-config.patch b/package/libgeotiff/0001-use-pkg-config.patch
deleted file mode 100644
index a4b11f1523..0000000000
--- a/package/libgeotiff/0001-use-pkg-config.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-Use pkg-config for libtiff detection
-
-Using pkg-config allows proper behavior in static-only contexts: the
-libtiff library might depend on libz and libjpeg.
-
-This patch also fixes a few other issues in the configure.ac script
-that prevents autoreconf to work, or proper detection of the proj
-library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -196,39 +196,12 @@
- 
- TIFF_CONFIG="no"
- 
--AC_ARG_WITH(libtiff, [  --with-libtiff=dir      Use libtiff in directory dir],,)
--
--if test "$with_libtiff" != "" ; then
--  if test -f $with_libtiff/include/tiffio.h -a -d $with_libtiff/lib ; then
--    LIBS="-L$with_libtiff/lib -ltiff $LIBS"
--    TIFF_INC=-I$with_libtiff/include
--  else
--    LIBS="-L$with_libtiff -ltiff $LIBS"
--    TIFF_INC=-I$with_libtiff
--  fi
--  LIBS_SAVED="$LIBS"
--  AC_CHECK_LIB(tiff,TIFFOpen,[TIFF_CONFIG=yes],
--               AC_MSG_ERROR([failed to link with -ltiff to find TIFFOpen]),-lm)
--  AC_CHECK_LIB(tiff,TIFFMergeFieldInfo,[TIFF_CONFIG=yes],
--               AC_MSG_ERROR([Libtiff 3.6.0 Beta or later required for this version of
--libgeotiff. Please upgrade or use an older version of libgeotiff.]),-lm)
--  LIBS="$LIBS_SAVED"
--else
--  AC_CHECK_LIB(tiff,TIFFOpen,[TIFF_CONFIG=yes],
--               AC_MSG_ERROR([You will need to substantially rewrite libxtiff to
--build libgeotiff without libtiff]),-lm)
--  LIBS_SAVED="$LIBS"
--  AC_CHECK_LIB(tiff,TIFFMergeFieldInfo,[TIFF_CONFIG=yes],
--               AC_MSG_ERROR([Libtiff 3.6.0 Beta or later required for this version of
--libgeotiff. Please upgrade libtiff or use an older version of libgeotiff.]),-lm)
--  LIBS="$LIBS -ltiff"
--  TIFF_INC=
--  TIFF_CONFIG="yes"
--fi
--
-+PKG_CHECK_MODULES(LIBTIFF, libtiff-4)
-+TIFF_INC="$LIBTIFF_CFLAGS"
-+LIBS="$LIBS $LIBTIFF_LIBS"
-+TIFF_CONFIG="yes"
- 
- AC_SUBST([TIFF_INC])
--AC_SUBST([TIFF_PREFIX])
- AM_CONDITIONAL([TIFF_IS_CONFIG], [test ! x$TIFF_CONFIG = xno])
- 
- dnl
-@@ -280,15 +253,16 @@
-   PROJ_INC=-I$PROJ_INC
- 
-   AC_SUBST(PROJ_INC,$PROJ_INC)
--  AC_DEFINE(HAVE_PROJECTS_H)
-+  AC_DEFINE([HAVE_PROJECTS_H], [], [Whether proj library header is available])
-   AC_DEFINE(HAVE_LIBPROJ)
-   AC_SUBST([HAVE_LIBPROJ])
-   PROJ_CONFIG="yes"
--
- else
-   AC_CHECK_LIB(proj,pj_init,,,-lm)
-   AC_CHECK_HEADERS(proj_api.h,,)
--  PROJ_CONFIG="yes"
-+  if "$ac_cv_lib_proj_pj_init" = "yes" -a "$ac_cv_header_proj_api_h" = "yes"; then
-+    PROJ_CONFIG="yes"
-+  fi
- fi
- 
- AM_CONDITIONAL([PROJ_IS_CONFIG], [test ! x$PROJ_CONFIG = xno])
diff --git a/package/libgeotiff/0002-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch b/package/libgeotiff/0002-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch
deleted file mode 100644
index a8a2d257cb..0000000000
--- a/package/libgeotiff/0002-fix-GEO_NORMALIZE_DISABLE_TOWGS84-define.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fix GEO_NORMALIZE_DISABLE_TOWGS84 definition
-
-Fix "missing template: GEO_NORMALIZE_DISABLE_TOWGS84" error by adding
-a non-empty description of GEO_NORMALIZE_DISABLE_TOWGS84 in AC_DEFINE
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-Index: libgeotiff/configure.ac
-===================================================================
---- libgeotiff/configure.ac	(r??vision 2818)
-+++ libgeotiff/configure.ac	(copie de travail)
-@@ -317,7 +317,7 @@
- AM_CONDITIONAL([CSV_IS_CONFIG], [test ! x$CSV_CONFIG = xno])
- 
- 
--AC_ARG_ENABLE(towgs84, [  --disable-towgs84       Disable WGS84 parameters for binary compatibility with pre-1.4.1], AC_DEFINE(GEO_NORMALIZE_DISABLE_TOWGS84))
-+AC_ARG_ENABLE(towgs84, [  --disable-towgs84       Disable WGS84 parameters for binary compatibility with pre-1.4.1], AC_DEFINE(GEO_NORMALIZE_DISABLE_TOWGS84, [], [Disable WGS84 parameters]))
- 
- dnl #########################################################################
- dnl Doxygen settings
diff --git a/package/libgeotiff/0003-libgeotiff-configure.ac-do-not-check-for-C.patch b/package/libgeotiff/0003-libgeotiff-configure.ac-do-not-check-for-C.patch
deleted file mode 100644
index 68082dd023..0000000000
--- a/package/libgeotiff/0003-libgeotiff-configure.ac-do-not-check-for-C.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From edc9ec69b43c27955ee4f24db2e6808bb1a8974d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 3 Feb 2019 23:20:43 +0100
-Subject: [PATCH] libgeotiff/configure.ac: do not check for C++
-
-Do not check for C++ compiler as libgeotiff is written in C otherwise
-build will fail on toolchains without a working C++ compiler:
-
-checking how to run the C++ preprocessor... /lib/cpp
-configure: error: in `/data/buildroot/buildroot-test/instance-1/output/build/libgeotiff-1.4.2':
-configure: error: C++ preprocessor "/lib/cpp" fails sanity check
-
-Fixes:
- - http://autobuild.buildroot.org/results/72f1c5c1b8fc337a1cff4b280abe99afd65f945b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OSGeo/libgeotiff/pull/9]
----
- libgeotiff/configure.ac | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a334416..4ebbd6f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -25,8 +25,6 @@ dnl #########################################################################
- AM_INIT_AUTOMAKE
- AM_MAINTAINER_MODE
- AC_PROG_CC
--AC_PROG_CXX
--AC_PROG_CXXCPP
- AC_PROG_INSTALL
- AC_PROG_LN_S
- AC_PROG_MAKE_SET
-@@ -46,7 +44,6 @@ dnl #########################################################################
- m4_define([debug_default],[no])
- 
- CFLAGS="$CFLAGS"
--CXXFLAGS="$CXXFLAGS"
- 
- dnl We want to honor the users wishes with regard to linking.
- LIBS="$LDFLAGS $LIBS"
-@@ -82,11 +79,9 @@ AC_MSG_CHECKING([for debug enabled])
- 
- if test "x$enable_debug" = "xyes"; then
-     CFLAGS="$CFLAGS -g -DDEBUG -Wall"
--    CXXFLAGS="$CXXFLAGS -g -DDEBUG -Wall"
-     AC_MSG_RESULT(yes)
- else
-     CFLAGS="$CFLAGS -O3 -DNDEBUG"
--    CXXFLAGS="$CXXFLAGS -O3 -DNDEBUG"
-     AC_MSG_RESULT(no)
- fi
- 
-@@ -367,7 +362,6 @@ LOC_MSG()
- LOC_MSG([  Version..................: ${RELEASE_VERSION}])
- LOC_MSG([  Installation directory...: ${prefix}])
- LOC_MSG([  C compiler...............: ${CC} ${CFLAGS}])
--LOC_MSG([  C++ compiler.............: ${CXX} ${CXXFLAGS}])
- 
- LOC_MSG([  Debugging support........: ${enable_debug}])
- LOC_MSG()
--- 
-2.14.1
-
diff --git a/package/libgeotiff/Config.in b/package/libgeotiff/Config.in
index 530cd450b4..60ca4115d9 100644
--- a/package/libgeotiff/Config.in
+++ b/package/libgeotiff/Config.in
@@ -1,8 +1,13 @@
 config BR2_PACKAGE_LIBGEOTIFF
 	bool "libgeotiff"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
+	select BR2_PACKAGE_PROJ
 	select BR2_PACKAGE_TIFF
 	help
 	  Libgeotiff is an open source library normally hosted on top of
 	  libtiff for reading, and writing GeoTIFF information tags.
 
-	  http://geotiff.osgeo.org
+	  https://github.com/OSGeo/libgeotiff
+
+comment "libgeotiff needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index 08e8e06788..12d3b2a166 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b8510d9b968b5ee899282cdd5bef13fd02d5a4c19f664553f81e31127bc47265 libgeotiff-1.4.3.tar.gz
-sha256 16b83cf7c3bbfd20bffa768b9bfdb16506ca50f5c140a9f3431e740b155359c1 LICENSE
+sha256 f9e99733c170d11052f562bcd2c7cb4de53ed405f7acdde4f16195cd3ead612c libgeotiff-1.5.1.tar.gz
+sha256 6a22340b8293c50a34ce8e95589489bd3ec65bcb8b93e61cbda3daaafe498375 LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index a4606bc30c..4fc229cf0b 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.4.3
+LIBGEOTIFF_VERSION = 1.5.1
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = X11-style, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
-LIBGEOTIFF_DEPENDENCIES = tiff host-pkgconf
+LIBGEOTIFF_DEPENDENCIES = proj tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
-LIBGEOTIFF_AUTORECONF = YES
+LIBGEOTIFF_CONF_OPTS = --with-proj=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBGEOTIFF_DEPENDENCIES += zlib
@@ -26,11 +26,4 @@ else
 LIBGEOTIFF_CONF_OPTS += --without-jpeg
 endif
 
-ifeq ($(BR2_PACKAGE_PROJ),y)
-LIBGEOTIFF_DEPENDENCIES += proj
-LIBGEOTIFF_CONF_OPTS += --with-proj=$(STAGING_DIR)/usr
-else
-LIBGEOTIFF_CONF_OPTS += --without-proj
-endif
-
 $(eval $(autotools-package))
