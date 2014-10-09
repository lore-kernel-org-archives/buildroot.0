From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Oct 2014 18:10:45 +0200
Subject: [Buildroot] [PATCH 2/5] libgeotiff: fix static linking issue
In-Reply-To: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412871048-28981-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1412871048-28981-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to improve the libgeotiff configure script to
use pkg-config to detect libtiff, which allows to properly take into
account dependant libraries such as libz and libjpeg.

As a consequence, we now autoreconf the libgeotiff package, and add
host-pkgconf as a dependency.

Fixes:

  http://autobuild.buildroot.org/results/649/6498d6516a412b12d68fa9f6a66172021abadc34/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libgeotiff-0001-use-pkg-config.patch           | 79 ++++++++++++++++++++++
 package/libgeotiff/libgeotiff.mk                   |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 package/libgeotiff/libgeotiff-0001-use-pkg-config.patch

diff --git a/package/libgeotiff/libgeotiff-0001-use-pkg-config.patch b/package/libgeotiff/libgeotiff-0001-use-pkg-config.patch
new file mode 100644
index 0000000..a4b11f1
--- /dev/null
+++ b/package/libgeotiff/libgeotiff-0001-use-pkg-config.patch
@@ -0,0 +1,79 @@
+Use pkg-config for libtiff detection
+
+Using pkg-config allows proper behavior in static-only contexts: the
+libtiff library might depend on libz and libjpeg.
+
+This patch also fixes a few other issues in the configure.ac script
+that prevents autoreconf to work, or proper detection of the proj
+library.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -196,39 +196,12 @@
+ 
+ TIFF_CONFIG="no"
+ 
+-AC_ARG_WITH(libtiff, [  --with-libtiff=dir      Use libtiff in directory dir],,)
+-
+-if test "$with_libtiff" != "" ; then
+-  if test -f $with_libtiff/include/tiffio.h -a -d $with_libtiff/lib ; then
+-    LIBS="-L$with_libtiff/lib -ltiff $LIBS"
+-    TIFF_INC=-I$with_libtiff/include
+-  else
+-    LIBS="-L$with_libtiff -ltiff $LIBS"
+-    TIFF_INC=-I$with_libtiff
+-  fi
+-  LIBS_SAVED="$LIBS"
+-  AC_CHECK_LIB(tiff,TIFFOpen,[TIFF_CONFIG=yes],
+-               AC_MSG_ERROR([failed to link with -ltiff to find TIFFOpen]),-lm)
+-  AC_CHECK_LIB(tiff,TIFFMergeFieldInfo,[TIFF_CONFIG=yes],
+-               AC_MSG_ERROR([Libtiff 3.6.0 Beta or later required for this version of
+-libgeotiff. Please upgrade or use an older version of libgeotiff.]),-lm)
+-  LIBS="$LIBS_SAVED"
+-else
+-  AC_CHECK_LIB(tiff,TIFFOpen,[TIFF_CONFIG=yes],
+-               AC_MSG_ERROR([You will need to substantially rewrite libxtiff to
+-build libgeotiff without libtiff]),-lm)
+-  LIBS_SAVED="$LIBS"
+-  AC_CHECK_LIB(tiff,TIFFMergeFieldInfo,[TIFF_CONFIG=yes],
+-               AC_MSG_ERROR([Libtiff 3.6.0 Beta or later required for this version of
+-libgeotiff. Please upgrade libtiff or use an older version of libgeotiff.]),-lm)
+-  LIBS="$LIBS -ltiff"
+-  TIFF_INC=
+-  TIFF_CONFIG="yes"
+-fi
+-
++PKG_CHECK_MODULES(LIBTIFF, libtiff-4)
++TIFF_INC="$LIBTIFF_CFLAGS"
++LIBS="$LIBS $LIBTIFF_LIBS"
++TIFF_CONFIG="yes"
+ 
+ AC_SUBST([TIFF_INC])
+-AC_SUBST([TIFF_PREFIX])
+ AM_CONDITIONAL([TIFF_IS_CONFIG], [test ! x$TIFF_CONFIG = xno])
+ 
+ dnl
+@@ -280,15 +253,16 @@
+   PROJ_INC=-I$PROJ_INC
+ 
+   AC_SUBST(PROJ_INC,$PROJ_INC)
+-  AC_DEFINE(HAVE_PROJECTS_H)
++  AC_DEFINE([HAVE_PROJECTS_H], [], [Whether proj library header is available])
+   AC_DEFINE(HAVE_LIBPROJ)
+   AC_SUBST([HAVE_LIBPROJ])
+   PROJ_CONFIG="yes"
+-
+ else
+   AC_CHECK_LIB(proj,pj_init,,,-lm)
+   AC_CHECK_HEADERS(proj_api.h,,)
+-  PROJ_CONFIG="yes"
++  if "$ac_cv_lib_proj_pj_init" = "yes" -a "$ac_cv_header_proj_api_h" = "yes"; then
++    PROJ_CONFIG="yes"
++  fi
+ fi
+ 
+ AM_CONDITIONAL([PROJ_IS_CONFIG], [test ! x$PROJ_CONFIG = xno])
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index f6568c1..722e71c 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -6,7 +6,8 @@
 
 LIBGEOTIFF_VERSION = 1.4.0
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
-LIBGEOTIFF_DEPENDENCIES = tiff
+LIBGEOTIFF_DEPENDENCIES = tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
+LIBGEOTIFF_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.0.0
