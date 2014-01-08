From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed,  8 Jan 2014 13:37:56 +0000
Subject: [Buildroot] [PATCH] libnfc: bump version
Message-ID: <1389188276-29818-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...build-systems-make-example-build-optional.patch | 52 ++++++++--------------
 package/libnfc/libnfc.mk                           |  2 +-
 2 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/package/libnfc/libnfc-build-systems-make-example-build-optional.patch b/package/libnfc/libnfc-build-systems-make-example-build-optional.patch
index b0ca220..06577c5 100644
--- a/package/libnfc/libnfc-build-systems-make-example-build-optional.patch
+++ b/package/libnfc/libnfc-build-systems-make-example-build-optional.patch
@@ -10,28 +10,18 @@ In order to keep the former behavior, example build is enabled by default.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index dd7904d..0e35229 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -27,6 +27,7 @@ INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/incl
- SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules/")
+diff -Nurp a/CMakeLists.txt b/CMakeLists.txt
+--- a/CMakeLists.txt	2013-12-08 18:51:01.000000000 +0000
++++ b/CMakeLists.txt	2014-01-08 12:51:42.435096403 +0000
+@@ -39,6 +39,7 @@ IF(LIBNFC_ENVVARS)
+   ADD_DEFINITIONS(-DENVVARS)
+ ENDIF(LIBNFC_ENVVARS)
  
- # Options
 +SET(BUILD_EXAMPLES ON CACHE BOOL "Build examples")
- SET(LIBNFC_DEBUG_OUTPUT OFF CACHE BOOL "Debug output of communication with the NFC chip")
- IF(LIBNFC_DEBUG_OUTPUT)
-   ADD_DEFINITIONS(-DDEBUG -g3)
-@@ -84,7 +85,7 @@ IF(NOT WIN32)
-   ENDIF(LIBNFC_DRIVER_ACR122)
-   # CMake lists are separated by a semi colon, replace with colon
-   STRING(REPLACE ";" "," PKG_CONFIG_REQUIRES "${PKG_REQ}")
--  CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libnfc.pc.in ${CMAKE_CURRENT_BINARY_DIR}/libnfc.pc @ONLY) 
-+  CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libnfc.pc.in ${CMAKE_CURRENT_BINARY_DIR}/libnfc.pc @ONLY)
-   INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/libnfc.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
- ENDIF(NOT WIN32)
- 
-@@ -101,7 +102,10 @@ ENDIF(LIBUSB_INCLUDE_DIRS)
+ SET(LIBNFC_DEBUG_MODE OFF CACHE BOOL "Debug mode")
+ IF(LIBNFC_DEBUG_MODE)
+   ADD_DEFINITIONS(-DDEBUG)
+@@ -155,7 +156,10 @@ ENDIF(WIN32)
  ADD_SUBDIRECTORY(libnfc)
  ADD_SUBDIRECTORY(include)
  ADD_SUBDIRECTORY(utils)
@@ -43,10 +33,9 @@ index dd7904d..0e35229 100644
  
  # Binary Package
  IF(WIN32)
-diff --git a/Makefile.am b/Makefile.am
-index 3671cb6..59fd75a 100644
---- a/Makefile.am
-+++ b/Makefile.am
+diff -Nurp a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2013-12-08 18:51:01.000000000 +0000
++++ b/Makefile.am	2014-01-08 12:52:12.807018593 +0000
 @@ -2,7 +2,13 @@ ACLOCAL_AMFLAGS = -I m4
  
  AM_CFLAGS = $(LIBNFC_CFLAGS)
@@ -62,11 +51,10 @@ index 3671cb6..59fd75a 100644
  
  pkgconfigdir = $(libdir)/pkgconfig
  pkgconfig_DATA = libnfc.pc
-diff --git a/configure.ac b/configure.ac
-index 0a222a8..6988164 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -111,6 +111,14 @@ then
+diff -Nurp a/configure.ac b/configure.ac
+--- a/configure.ac	2013-12-08 18:51:01.000000000 +0000
++++ b/configure.ac	2014-01-08 12:53:02.054872564 +0000
+@@ -142,6 +142,14 @@ then
  fi
  AM_CONDITIONAL(DOC_ENABLED, [test x"$enable_doc" = xyes])
  
@@ -81,11 +69,10 @@ index 0a222a8..6988164 100644
  # Dependencies
  PKG_CONFIG_REQUIRES=""
  
-@@ -129,7 +137,11 @@ if test x$ac_cv_with_cutter = xyes -a x$ac_cv_use_cutter = xno; then
+@@ -160,7 +168,10 @@ if test x$ac_cv_with_cutter = xyes -a x$
  fi
  AM_CONDITIONAL([WITH_CUTTER], [test "$ac_cv_use_cutter" != "no"])
  
-+
 +if test x"$enable_example" = "xyes"
 +then
  AC_CHECK_READLINE
@@ -93,6 +80,3 @@ index 0a222a8..6988164 100644
  
  # Help us to write great code ;-)
  CFLAGS="$CFLAGS -Wall -pedantic -Wextra"
--- 
-1.7.10.3
-
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index 50bfcd5..a0ea877 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFC_VERSION = fda8d60ce062409bb32c76a229f02f7502948ce8
+LIBNFC_VERSION = 7b7f5061427b5456835dd48923a8cc0563cfd1e9
 LIBNFC_SITE = http://libnfc.googlecode.com/git/
 LIBNFC_SITE_METHOD = git
 LIBNFC_LICENSE = LGPLv3+
-- 
1.8.3.2
