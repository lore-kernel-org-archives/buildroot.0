From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 18:34:32 +0200
Subject: [Buildroot] [git commit] package/libgeotiff: bump to version 1.6.0
Message-ID: <20200502163126.2700590C09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7cf6d5d65e5abc8351f2fb1016907d22e4fb0315
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version) and so AUTORECONF
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...0001-Use-pkg-config-for-libtiff-detection.patch | 49 ----------------------
 ...ac-use-pkg-config-to-find-proj-dependency.patch | 37 ----------------
 package/libgeotiff/libgeotiff.hash                 |  4 +-
 package/libgeotiff/libgeotiff.mk                   |  4 +-
 4 files changed, 3 insertions(+), 91 deletions(-)

diff --git a/package/libgeotiff/0001-Use-pkg-config-for-libtiff-detection.patch b/package/libgeotiff/0001-Use-pkg-config-for-libtiff-detection.patch
deleted file mode 100644
index e2ce26e97c..0000000000
--- a/package/libgeotiff/0001-Use-pkg-config-for-libtiff-detection.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2fbae8298d7cc976d7c0f329fc26dafe57fb0fc4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 1 Apr 2019 08:04:39 +0200
-Subject: [PATCH] Use pkg-config for libtiff detection
-
-Using pkg-config allows proper behavior in static-only contexts: the
-libtiff library might depend on libz and libjpeg.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Patch retrieved (and slightly updated) from:
-https://git.buildroot.net/buildroot/tree/package/libgeotiff/0001-use-pkg-config.patch]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and slightly updated) from:
-https://github.com/OSGeo/libgeotiff/commit/2fbae8298d7cc976d7c0f329fc26dafe57fb0fc4]
----
- libgeotiff/configure.ac | 18 ++++++++++--------
- 1 file changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index aa38af4..c3395d5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -211,16 +211,18 @@ if test "$with_libtiff" != "" ; then
- libgeotiff. Please upgrade or use an older version of libgeotiff.]),-lm)
-   LIBS="$LIBS_SAVED"
- else
--  AC_CHECK_LIB(tiff,TIFFOpen,[TIFF_CONFIG=yes],
--               AC_MSG_ERROR([You will need to substantially rewrite libxtiff to
-+  PKG_CHECK_MODULES(LIBTIFF, libtiff-4,
-+                    [TIFF_INC="$LIBTIFF_CFLAGS" LIBS="$LIBS $LIBTIFF_LIBS" TIFF_CONFIG="yes"],
-+                    [AC_CHECK_LIB(tiff,TIFFOpen,[TIFF_CONFIG=yes],
-+                                  AC_MSG_ERROR([You will need to substantially rewrite libxtiff to
- build libgeotiff without libtiff]),-lm)
--  LIBS_SAVED="$LIBS"
--  AC_CHECK_LIB(tiff,TIFFMergeFieldInfo,[TIFF_CONFIG=yes],
--               AC_MSG_ERROR([Libtiff 3.6.0 Beta or later required for this version of
-+                    LIBS_SAVED="$LIBS"
-+                    AC_CHECK_LIB(tiff,TIFFMergeFieldInfo,[TIFF_CONFIG=yes],
-+                                 AC_MSG_ERROR([Libtiff 3.6.0 Beta or later required for this version of
- libgeotiff. Please upgrade libtiff or use an older version of libgeotiff.]),-lm)
--  LIBS="$LIBS -ltiff"
--  TIFF_INC=
--  TIFF_CONFIG="yes"
-+                    LIBS="$LIBS -ltiff"
-+                    TIFF_INC=
-+                    TIFF_CONFIG="yes"])
- fi
- 
- 
diff --git a/package/libgeotiff/0002-configure.ac-use-pkg-config-to-find-proj-dependency.patch b/package/libgeotiff/0002-configure.ac-use-pkg-config-to-find-proj-dependency.patch
deleted file mode 100644
index faf409cd5e..0000000000
--- a/package/libgeotiff/0002-configure.ac-use-pkg-config-to-find-proj-dependency.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 33937e2861fda87dc314378bf87db2c766c37a6b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 9 Oct 2019 15:11:34 +0200
-Subject: [PATCH] configure.ac: use pkg-config to find proj dependency
-
-Use pkg-config to retrieve proj and its static dependencies such as
--lstdc++
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OSGeo/libgeotiff/pull/24]
----
- libgeotiff/configure.ac | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/libgeotiff/configure.ac
-index c3395d5..f7a8f28 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -246,9 +246,12 @@ if test "x$with_proj" = "xno" ; then
- else
- 
-   if test "x$with_proj" = "xyes" -o "x$with_proj" = "x"; then
--    ORIG_LIBS="$LIBS"
--    LIBS="-lproj $ORIG_LIBS"
--    AC_CHECK_LIB(proj,proj_create_from_wkt,PROJ_FOUND=yes,PROJ_FOUND=no,)
-+    PKG_CHECK_MODULES(PROJ, proj, [LIBS="$LIBS $PROJ_LIBS" PROJ_FOUND=yes], [PROJ_FOUND=no])
-+    if test "$PROJ_FOUND" = "no"; then
-+        ORIG_LIBS="$LIBS"
-+        LIBS="-lproj $ORIG_LIBS"
-+        AC_CHECK_LIB(proj,proj_create_from_wkt,PROJ_FOUND=yes,PROJ_FOUND=no,)
-+    fi
-     if test "$PROJ_FOUND" = "no"; then
-         AC_CHECK_LIB(proj,internal_proj_create_from_wkt,PROJ_FOUND=yes,PROJ_FOUND=no,)
-         if test "$PROJ_FOUND" = "yes"; then
--- 
-2.23.0
-
diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
index 12d3b2a166..51adcc2843 100644
--- a/package/libgeotiff/libgeotiff.hash
+++ b/package/libgeotiff/libgeotiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f9e99733c170d11052f562bcd2c7cb4de53ed405f7acdde4f16195cd3ead612c libgeotiff-1.5.1.tar.gz
-sha256 6a22340b8293c50a34ce8e95589489bd3ec65bcb8b93e61cbda3daaafe498375 LICENSE
+sha256  9311017e5284cffb86f2c7b7a9df1fb5ebcdc61c30468fb2e6bca36e4272ebca  libgeotiff-1.6.0.tar.gz
+sha256  6a22340b8293c50a34ce8e95589489bd3ec65bcb8b93e61cbda3daaafe498375  LICENSE
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index c196b804a2..c6fb61b4a2 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBGEOTIFF_VERSION = 1.5.1
+LIBGEOTIFF_VERSION = 1.6.0
 LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
 LIBGEOTIFF_LICENSE = X11-style, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
 LIBGEOTIFF_DEPENDENCIES = proj tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
-# We're patching configure.ac
-LIBGEOTIFF_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBGEOTIFF_DEPENDENCIES += zlib
