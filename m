From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 23:12:54 +0200
Subject: [Buildroot] [git commit] package/libgeotiff: fix static linking
 with tiff
Message-ID: <20191010210704.338F58CA75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ddc19a89bb250eac67c570f9104dc7d5e92760c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Put back patch that was wrongly removed when bumping libgeotiff to
version 1.5.1 in commit	1edf0383a6a9d17a27d831bb02833870655d43d9

Fixes:
 - http://autobuild.buildroot.org/results/3eb3d41d3288c08616b68d52fdc7525c57c8e023

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Use-pkg-config-for-libtiff-detection.patch | 49 ++++++++++++++++++++++
 package/libgeotiff/libgeotiff.mk                   |  2 +
 2 files changed, 51 insertions(+)

diff --git a/package/libgeotiff/0001-Use-pkg-config-for-libtiff-detection.patch b/package/libgeotiff/0001-Use-pkg-config-for-libtiff-detection.patch
new file mode 100644
index 0000000000..e2ce26e97c
--- /dev/null
+++ b/package/libgeotiff/0001-Use-pkg-config-for-libtiff-detection.patch
@@ -0,0 +1,49 @@
+From 2fbae8298d7cc976d7c0f329fc26dafe57fb0fc4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 1 Apr 2019 08:04:39 +0200
+Subject: [PATCH] Use pkg-config for libtiff detection
+
+Using pkg-config allows proper behavior in static-only contexts: the
+libtiff library might depend on libz and libjpeg.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Patch retrieved (and slightly updated) from:
+https://git.buildroot.net/buildroot/tree/package/libgeotiff/0001-use-pkg-config.patch]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and slightly updated) from:
+https://github.com/OSGeo/libgeotiff/commit/2fbae8298d7cc976d7c0f329fc26dafe57fb0fc4]
+---
+ libgeotiff/configure.ac | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index aa38af4..c3395d5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -211,16 +211,18 @@ if test "$with_libtiff" != "" ; then
+ libgeotiff. Please upgrade or use an older version of libgeotiff.]),-lm)
+   LIBS="$LIBS_SAVED"
+ else
+-  AC_CHECK_LIB(tiff,TIFFOpen,[TIFF_CONFIG=yes],
+-               AC_MSG_ERROR([You will need to substantially rewrite libxtiff to
++  PKG_CHECK_MODULES(LIBTIFF, libtiff-4,
++                    [TIFF_INC="$LIBTIFF_CFLAGS" LIBS="$LIBS $LIBTIFF_LIBS" TIFF_CONFIG="yes"],
++                    [AC_CHECK_LIB(tiff,TIFFOpen,[TIFF_CONFIG=yes],
++                                  AC_MSG_ERROR([You will need to substantially rewrite libxtiff to
+ build libgeotiff without libtiff]),-lm)
+-  LIBS_SAVED="$LIBS"
+-  AC_CHECK_LIB(tiff,TIFFMergeFieldInfo,[TIFF_CONFIG=yes],
+-               AC_MSG_ERROR([Libtiff 3.6.0 Beta or later required for this version of
++                    LIBS_SAVED="$LIBS"
++                    AC_CHECK_LIB(tiff,TIFFMergeFieldInfo,[TIFF_CONFIG=yes],
++                                 AC_MSG_ERROR([Libtiff 3.6.0 Beta or later required for this version of
+ libgeotiff. Please upgrade libtiff or use an older version of libgeotiff.]),-lm)
+-  LIBS="$LIBS -ltiff"
+-  TIFF_INC=
+-  TIFF_CONFIG="yes"
++                    LIBS="$LIBS -ltiff"
++                    TIFF_INC=
++                    TIFF_CONFIG="yes"])
+ fi
+ 
+ 
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 4fc229cf0b..5a3c487d00 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -11,6 +11,8 @@ LIBGEOTIFF_LICENSE_FILES = LICENSE
 LIBGEOTIFF_DEPENDENCIES = proj tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
 LIBGEOTIFF_CONF_OPTS = --with-proj=$(STAGING_DIR)/usr
+# We're patching configure.ac
+LIBGEOTIFF_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBGEOTIFF_DEPENDENCIES += zlib
