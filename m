From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 14:29:00 +0100
Subject: [Buildroot] [git commit] package/openjpeg: fix static build
Message-ID: <20161113133325.D4A758028F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de90e02c60d65f9bcef5a9b757a6b59473d37cc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change adds a patch to openjpeg fixing the tiff indirect
dependencies in case of static build.

A similar patch for upstream master has been submitted [1].

Fixes:
  http://autobuild.buildroot.net/results/d0d/d0d22727311d6300e0e400728126170407bfd699/
  and many others...

[1] https://github.com/uclouvain/openjpeg/pull/866

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tiff-append-flags-found-by-pkg-config-if-.patch | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch b/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
new file mode 100644
index 0000000..be50902
--- /dev/null
+++ b/package/openjpeg/0001-thirdparty-tiff-append-flags-found-by-pkg-config-if-.patch
@@ -0,0 +1,72 @@
+From 38f50c7d9ad3ba06b64583045665203afb53cbd9 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 6 Nov 2016 16:29:08 +0100
+Subject: [PATCH] thirdparty: tiff: append flags found by pkg-config if
+ available
+
+This change allows to get all required CFLAGS/LDFLAGS in case of static only
+build.
+
+This build issue [1] was triggered by the Buildroot farms.
+
+[1] http://autobuild.buildroot.net/results/d0d/d0d22727311d6300e0e400728126170407bfd699/build-end.log
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ thirdparty/CMakeLists.txt | 23 +++++++++++++++++++++--
+ 1 file changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/thirdparty/CMakeLists.txt b/thirdparty/CMakeLists.txt
+index d1e68ca..225f51d 100644
+--- a/thirdparty/CMakeLists.txt
++++ b/thirdparty/CMakeLists.txt
+@@ -1,5 +1,9 @@
+ # 3rd party libs
+ 
++IF(NOT BUILD_THIRDPARTY)
++  include(FindPkgConfig)
++ENDIF(NOT BUILD_THIRDPARTY)
++
+ #------------
+ # Try to find lib Z
+ IF(BUILD_THIRDPARTY)
+@@ -35,6 +39,9 @@ IF(BUILD_THIRDPARTY)
+   SET(PNG_INCLUDE_DIRNAME ${OPENJPEG_SOURCE_DIR}/thirdparty/libpng PARENT_SCOPE)
+ ELSE (BUILD_THIRDPARTY)
+   IF (ZLIB_FOUND)
++    # Static only build:
++    #   it is not necessary to invoke pkg_check_module on libpng, because libpng
++    #   only depends on zlib, which is already checked.
+     FIND_PACKAGE(PNG)
+     IF(PNG_FOUND)
+       message(STATUS "Your system seems to have a PNG lib available, we will use it")
+@@ -66,12 +73,24 @@ IF(BUILD_THIRDPARTY)
+   SET(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
+ ELSE (BUILD_THIRDPARTY)
+   FIND_PACKAGE(TIFF)
++  # Static only build:
++  #   it is necessary to invoke pkg_check_module on libtiff since it may have
++  #   several other dependencies not declared by its cmake module, but they are
++  #   in the its pkgconfig module.
++  IF(PKG_CONFIG_FOUND)
++    FOREACH(pc_tiff_module tiff tiff3 tiff4 tiff-3 tiff-4 libtiff libtiff3 libtiff4 libtiff-3 libtiff-4)
++      pkg_check_modules(PC_TIFF QUIET ${pc_tiff_module})
++      IF(PC_TIFF_FOUND)
++        break()
++      ENDIF(PC_TIFF_FOUND)
++    ENDFOREACH()
++  ENDIF(PKG_CONFIG_FOUND)
+   IF(TIFF_FOUND)
+     message(STATUS "Your system seems to have a TIFF lib available, we will use it")
+     SET(OPJ_HAVE_TIFF_H 1 PARENT_SCOPE)
+     SET(OPJ_HAVE_LIBTIFF 1 PARENT_SCOPE)
+-    SET(TIFF_LIBNAME ${TIFF_LIBRARIES} PARENT_SCOPE)
+-    SET(TIFF_INCLUDE_DIRNAME ${TIFF_INCLUDE_DIR} PARENT_SCOPE)
++    SET(TIFF_LIBNAME ${TIFF_LIBRARIES} ${PC_TIFF_STATIC_LIBRARIES} PARENT_SCOPE)
++    SET(TIFF_INCLUDE_DIRNAME ${TIFF_INCLUDE_DIR} ${PC_TIFF_STATIC_INCLUDE_DIRS} PARENT_SCOPE)
+   ELSE (TIFF_FOUND) # not found
+     SET(OPJ_HAVE_TIFF_H 0 PARENT_SCOPE)
+     SET(OPJ_HAVE_LIBTIFF 0 PARENT_SCOPE)
+-- 
+2.10.2
+
