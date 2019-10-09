From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 Oct 2019 19:03:25 +0200
Subject: [Buildroot] [PATCH 3/3] package/libgeotiff: fix static linking with
 proj
In-Reply-To: <20191009170325.24709-1-fontaine.fabrice@gmail.com>
References: <20191009170325.24709-1-fontaine.fabrice@gmail.com>
Message-ID: <20191009170325.24709-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-config to retrieve proj static dependency such as -lstdc++

Fixes:
 - http://autobuild.buildroot.org/results/77721989e5b057995e6c5f1f184fe368d8a8fa78

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e-pkg-config-to-find-proj-dependency.patch | 37 +++++++++++++++++++
 package/libgeotiff/libgeotiff.mk              |  1 -
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 package/libgeotiff/0002-configure.ac-use-pkg-config-to-find-proj-dependency.patch

diff --git a/package/libgeotiff/0002-configure.ac-use-pkg-config-to-find-proj-dependency.patch b/package/libgeotiff/0002-configure.ac-use-pkg-config-to-find-proj-dependency.patch
new file mode 100644
index 0000000000..faf409cd5e
--- /dev/null
+++ b/package/libgeotiff/0002-configure.ac-use-pkg-config-to-find-proj-dependency.patch
@@ -0,0 +1,37 @@
+From 33937e2861fda87dc314378bf87db2c766c37a6b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 9 Oct 2019 15:11:34 +0200
+Subject: [PATCH] configure.ac: use pkg-config to find proj dependency
+
+Use pkg-config to retrieve proj and its static dependencies such as
+-lstdc++
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OSGeo/libgeotiff/pull/24]
+---
+ libgeotiff/configure.ac | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/libgeotiff/configure.ac
+index c3395d5..f7a8f28 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -246,9 +246,12 @@ if test "x$with_proj" = "xno" ; then
+ else
+ 
+   if test "x$with_proj" = "xyes" -o "x$with_proj" = "x"; then
+-    ORIG_LIBS="$LIBS"
+-    LIBS="-lproj $ORIG_LIBS"
+-    AC_CHECK_LIB(proj,proj_create_from_wkt,PROJ_FOUND=yes,PROJ_FOUND=no,)
++    PKG_CHECK_MODULES(PROJ, proj, [LIBS="$LIBS $PROJ_LIBS" PROJ_FOUND=yes], [PROJ_FOUND=no])
++    if test "$PROJ_FOUND" = "no"; then
++        ORIG_LIBS="$LIBS"
++        LIBS="-lproj $ORIG_LIBS"
++        AC_CHECK_LIB(proj,proj_create_from_wkt,PROJ_FOUND=yes,PROJ_FOUND=no,)
++    fi
+     if test "$PROJ_FOUND" = "no"; then
+         AC_CHECK_LIB(proj,internal_proj_create_from_wkt,PROJ_FOUND=yes,PROJ_FOUND=no,)
+         if test "$PROJ_FOUND" = "yes"; then
+-- 
+2.23.0
+
diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
index 5a3c487d00..c196b804a2 100644
--- a/package/libgeotiff/libgeotiff.mk
+++ b/package/libgeotiff/libgeotiff.mk
@@ -10,7 +10,6 @@ LIBGEOTIFF_LICENSE = X11-style, public domain
 LIBGEOTIFF_LICENSE_FILES = LICENSE
 LIBGEOTIFF_DEPENDENCIES = proj tiff host-pkgconf
 LIBGEOTIFF_INSTALL_STAGING = YES
-LIBGEOTIFF_CONF_OPTS = --with-proj=$(STAGING_DIR)/usr
 # We're patching configure.ac
 LIBGEOTIFF_AUTORECONF = YES
 
-- 
2.23.0
