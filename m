From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jun 2012 22:32:37 +0200
Subject: [Buildroot] [git commit] libnfc: make example build optional
Message-ID: <20120610203309.978F596E81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6855bd347013f58f22395f60dfba037d69a693cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: trip patch, add AUTORECONF]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnfc/Config.in                           |    5 +
 ...build-systems-make-example-build-optional.patch |   98 ++++++++++++++++++++
 package/libnfc/libnfc.mk                           |    8 ++
 3 files changed, 111 insertions(+), 0 deletions(-)

diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 42418e0..3d67d58 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -6,3 +6,8 @@ config BR2_PACKAGE_LIBNFC
 	  Public platform independent Near Field Communication (NFC) library.
 
 	  http://www.libnfc.org/
+
+config BR2_PACKAGE_LIBNFC_EXAMPLES
+	bool "build libnfc examples"
+	depends on BR2_PACKAGE_LIBNFC
+	select BR2_PACKAGE_READLINE
diff --git a/package/libnfc/libnfc-build-systems-make-example-build-optional.patch b/package/libnfc/libnfc-build-systems-make-example-build-optional.patch
new file mode 100644
index 0000000..b0ca220
--- /dev/null
+++ b/package/libnfc/libnfc-build-systems-make-example-build-optional.patch
@@ -0,0 +1,98 @@
+From 40a4871b171293d98acb40cf54be9ee9b78a3244 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 6 Jun 2012 00:49:25 +0200
+Subject: [PATCH 1/1] build systems: make example build optional
+
+This patch makes example build optional for both cmake and autotools build
+systems.
+
+In order to keep the former behavior, example build is enabled by default.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index dd7904d..0e35229 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -27,6 +27,7 @@ INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_SOURCE_DIR}/incl
+ SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules/")
+ 
+ # Options
++SET(BUILD_EXAMPLES ON CACHE BOOL "Build examples")
+ SET(LIBNFC_DEBUG_OUTPUT OFF CACHE BOOL "Debug output of communication with the NFC chip")
+ IF(LIBNFC_DEBUG_OUTPUT)
+   ADD_DEFINITIONS(-DDEBUG -g3)
+@@ -84,7 +85,7 @@ IF(NOT WIN32)
+   ENDIF(LIBNFC_DRIVER_ACR122)
+   # CMake lists are separated by a semi colon, replace with colon
+   STRING(REPLACE ";" "," PKG_CONFIG_REQUIRES "${PKG_REQ}")
+-  CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libnfc.pc.in ${CMAKE_CURRENT_BINARY_DIR}/libnfc.pc @ONLY) 
++  CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/libnfc.pc.in ${CMAKE_CURRENT_BINARY_DIR}/libnfc.pc @ONLY)
+   INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/libnfc.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ ENDIF(NOT WIN32)
+ 
+@@ -101,7 +102,10 @@ ENDIF(LIBUSB_INCLUDE_DIRS)
+ ADD_SUBDIRECTORY(libnfc)
+ ADD_SUBDIRECTORY(include)
+ ADD_SUBDIRECTORY(utils)
+-ADD_SUBDIRECTORY(examples)
++
++IF(BUILD_EXAMPLES)
++  ADD_SUBDIRECTORY(examples)
++ENDIF(BUILD_EXAMPLES)
+ 
+ # Binary Package
+ IF(WIN32)
+diff --git a/Makefile.am b/Makefile.am
+index 3671cb6..59fd75a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,13 @@ ACLOCAL_AMFLAGS = -I m4
+ 
+ AM_CFLAGS = $(LIBNFC_CFLAGS)
+ 
+-SUBDIRS = libnfc utils examples include contrib cmake test
++SUBDIRS = libnfc utils
++
++if EXAMPLE_ENABLED
++SUBDIRS += examples
++endif
++
++SUBDIRS += include contrib cmake test
+ 
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = libnfc.pc
+diff --git a/configure.ac b/configure.ac
+index 0a222a8..6988164 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -111,6 +111,14 @@ then
+ fi
+ AM_CONDITIONAL(DOC_ENABLED, [test x"$enable_doc" = xyes])
+ 
++# Example build (default: yes)
++AC_ARG_ENABLE([example],AS_HELP_STRING([--enable-example],[Enable example build.]),[enable_example=$enableval],[enable_example="yes"])
++
++AC_MSG_CHECKING(for example build)
++AC_MSG_RESULT($enable_example)
++
++AM_CONDITIONAL(EXAMPLE_ENABLED, [test x"$enable_example" = xyes])
++
+ # Dependencies
+ PKG_CONFIG_REQUIRES=""
+ 
+@@ -129,7 +137,11 @@ if test x$ac_cv_with_cutter = xyes -a x$ac_cv_use_cutter = xno; then
+ fi
+ AM_CONDITIONAL([WITH_CUTTER], [test "$ac_cv_use_cutter" != "no"])
+ 
++
++if test x"$enable_example" = "xyes"
++then
+ AC_CHECK_READLINE
++fi
+ 
+ # Help us to write great code ;-)
+ CFLAGS="$CFLAGS -Wall -pedantic -Wextra"
+-- 
+1.7.10.3
+
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index f1028b1..eef09b0 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -6,6 +6,7 @@
 LIBNFC_VERSION = 1.5.1
 LIBNFC_SITE = http://libnfc.googlecode.com/files/
 LIBNFC_SOURCE = libnfc-$(LIBNFC_VERSION).tar.gz
+LIBNFC_AUTORECONF = YES
 LIBNFC_INSTALL_STAGING = YES
 
 LIBNFC_DEPENDENCIES = host-pkg-config libusb libusb-compat
@@ -13,4 +14,11 @@ LIBNFC_DEPENDENCIES = host-pkg-config libusb libusb-compat
 # N.B. The acr122 driver requires pcsc-lite.
 LIBNFC_CONF_OPT = --with-drivers=arygon,pn53x_usb
 
+ifeq ($(BR2_PACKAGE_LIBNFC_EXAMPLES),y)
+LIBNFC_CONF_OPT += --enable-example
+LIBNFC_DEPENDENCIES += readline
+else
+LIBNFC_CONF_OPT += --disable-example
+endif
+
 $(eval $(call AUTOTARGETS))
