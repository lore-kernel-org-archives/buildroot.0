From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  6 Jun 2012 01:58:09 +0200
Subject: [Buildroot] [PATCH v2 1/1] libnfc: make example build optional
Message-ID: <1338940689-5808-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 package/libnfc/0001-build-systems-make-example-build-optional.patch

diff --git a/package/libnfc/0001-build-systems-make-example-build-optional.patch b/package/libnfc/0001-build-systems-make-example-build-optional.patch
new file mode 100644
index 0000000..3f8697d
--- /dev/null
+++ b/package/libnfc/0001-build-systems-make-example-build-optional.patch
@@ -0,0 +1,121 @@
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
+@@ -71,11 +71,11 @@ AC_SUBST(LIBNFC_CFLAGS)
+ 
+ # Debug support (default:no)
+ AC_ARG_ENABLE([debug],AS_HELP_STRING([--enable-debug],[Enable debug output]),[enable_debug=$enableval],[enable_debug="no"])
+- 
++
+ AC_MSG_CHECKING(for debug flag)
+ AC_MSG_RESULT($enable_debug)
+ AM_CONDITIONAL([WITH_DEBUG], [test "$enable_debug" != "no"])
+- 
++
+ if test x"$enable_debug" = "xyes"
+ then
+   CFLAGS="$CFLAGS -g -DDEBUG -O0 -ggdb"
+@@ -86,7 +86,7 @@ LIBNFC_ARG_WITH_DRIVERS
+ 
+ # Serial autoprobing support (default:no)
+ AC_ARG_ENABLE([serial-autoprobe],AS_HELP_STRING([--enable-serial-autoprobe],[Allow serial ports to be probed (can seriously disturb connected serial devices)]),[enable_serial_autoprobe=$enableval],[enable_serial_autoprobe="no"])
+- 
++
+ AC_MSG_CHECKING(for serial autoprobe flag)
+ AC_MSG_RESULT($enable_serial_autoprobe)
+ 
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
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index f1028b1..54cc5f9 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -11,6 +11,18 @@ LIBNFC_INSTALL_STAGING = YES
 LIBNFC_DEPENDENCIES = host-pkg-config libusb libusb-compat
 
 # N.B. The acr122 driver requires pcsc-lite.
-LIBNFC_CONF_OPT = --with-drivers=arygon,pn53x_usb
+LIBNFC_CONF_OPT += \
+	-DLIBNFC_DRIVER_ACR122=OFF \
+	-DLIBNFC_DRIVER_ARYGON=ON \
+	-DLIBNFC_DRIVER_PN532_UART=OFF \
+	-DLIBNFC_DRIVER_PN532_USB=ON \
+	-DLIBNFC_SERIAL_AUTOPROBE_ENABLED=OFF
 
-$(eval $(call AUTOTARGETS))
+ifeq ($(BR2_PACKAGE_LIBNFC_EXAMPLES),y)
+LIBNFC_CONF_OPT += -DBUILD_EXAMPLES=ON
+LIBNFC_DEPENDENCIES += readline
+else
+LIBNFC_CONF_OPT += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(call CMAKETARGETS))
-- 
1.7.10.3
