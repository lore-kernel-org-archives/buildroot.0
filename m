From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 27 Aug 2014 22:04:22 +0200
Subject: [Buildroot] [PATCH] package/librtlsdr: fix static linking
Message-ID: <1409169862-27871-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds 2 patches to librtlsdr fixing static linking.

The first one actually use pkgconfig CMake primitive to detect libusb
and ensures the cflags contain the libusb header path.

The second patch disable the shared object build when it
BUILD_SHARED_LIBS is off.

Fixes:
  http://autobuild.buildroot.org/results/2d9/2d91d7fa10ac3bd22fb5ce72acd7a0ce177f054f/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...se-pkg_check_modules-to-fill-libusb-flags.patch |  36 +++++++
 ...le-rtlsdr_shared-library-target-in-BUILD_.patch | 104 +++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 package/librtlsdr/librtlsdr-0001-cmake-use-pkg_check_modules-to-fill-libusb-flags.patch
 create mode 100644 package/librtlsdr/librtlsdr-0002-cmake-disable-rtlsdr_shared-library-target-in-BUILD_.patch

diff --git a/package/librtlsdr/librtlsdr-0001-cmake-use-pkg_check_modules-to-fill-libusb-flags.patch b/package/librtlsdr/librtlsdr-0001-cmake-use-pkg_check_modules-to-fill-libusb-flags.patch
new file mode 100644
index 0000000..ddc5240
--- /dev/null
+++ b/package/librtlsdr/librtlsdr-0001-cmake-use-pkg_check_modules-to-fill-libusb-flags.patch
@@ -0,0 +1,36 @@
+From 714ae704b8a0fde5944978451d6e2874ba91a227 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 27 Aug 2014 21:30:15 +0200
+Subject: [PATCH 1/2] cmake: use pkg_check_modules to fill libusb flags
+
+Also make sure libusb headers are correctly added to the CFLAGS.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5a4d9fc..c422bcc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -61,7 +61,7 @@ endif()
+ # Find build dependencies
+ ########################################################################
+ find_package(PkgConfig)
+-find_package(LibUSB)
++pkg_check_modules(LIBUSB libusb-1.0 REQUIRED)
+ set(THREADS_USE_PTHREADS_WIN32 true)
+ find_package(Threads)
+ 
+@@ -77,6 +77,7 @@ endif()
+ include_directories(
+     ${CMAKE_SOURCE_DIR}/include
+     ${LIBUSB_INCLUDE_DIR}
++    ${LIBUSB_INCLUDE_DIRS}
+     ${THREADS_PTHREADS_INCLUDE_DIR}
+ )
+ 
+-- 
+2.1.0
+
diff --git a/package/librtlsdr/librtlsdr-0002-cmake-disable-rtlsdr_shared-library-target-in-BUILD_.patch b/package/librtlsdr/librtlsdr-0002-cmake-disable-rtlsdr_shared-library-target-in-BUILD_.patch
new file mode 100644
index 0000000..2e414e7
--- /dev/null
+++ b/package/librtlsdr/librtlsdr-0002-cmake-disable-rtlsdr_shared-library-target-in-BUILD_.patch
@@ -0,0 +1,104 @@
+From b707a645cbd0eb2118be66d90ba5e2ff6a8f663a Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Wed, 27 Aug 2014 21:34:00 +0200
+Subject: [PATCH 2/2] cmake: disable rtlsdr_shared library target in
+ BUILD_SHARED_LIBS is off
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ src/CMakeLists.txt | 32 ++++++++++++++++++++------------
+ 1 file changed, 20 insertions(+), 12 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 77e1dc4..3e99b3b 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -20,6 +20,7 @@
+ ########################################################################
+ # Setup library
+ ########################################################################
++if(BUILD_SHARED_LIBS)
+ add_library(rtlsdr_shared SHARED
+     librtlsdr.c
+     tuner_e4k.c
+@@ -38,6 +39,11 @@ set_target_properties(rtlsdr_shared PROPERTIES OUTPUT_NAME rtlsdr)
+ set_target_properties(rtlsdr_shared PROPERTIES SOVERSION ${MAJOR_VERSION})
+ set_target_properties(rtlsdr_shared PROPERTIES VERSION ${LIBVER})
+ 
++target_link_libraries(rtlsdr_static
++    ${LIBUSB_LIBRARIES}
++)
++endif()
++
+ add_library(rtlsdr_static STATIC
+     librtlsdr.c
+     tuner_e4k.c
+@@ -60,10 +66,6 @@ target_link_libraries(convenience_static
+ )
+ endif()
+ 
+-target_link_libraries(rtlsdr_static
+-    ${LIBUSB_LIBRARIES}
+-)
+-
+ set_property(TARGET rtlsdr_static APPEND PROPERTY COMPILE_DEFINITIONS "rtlsdr_STATIC" )
+ 
+ if(NOT WIN32)
+@@ -71,6 +73,12 @@ if(NOT WIN32)
+ set_target_properties(rtlsdr_static PROPERTIES OUTPUT_NAME rtlsdr)
+ endif()
+ 
++if(BUILD_SHARED_LIBS)
++    set(rtlsdr_lib rtlsdr_shared)
++else()
++    set(rtlsdr_lib rtlsdr_static)
++endif()
++
+ ########################################################################
+ # Build utility
+ ########################################################################
+@@ -81,33 +89,33 @@ add_executable(rtl_fm rtl_fm.c)
+ add_executable(rtl_eeprom rtl_eeprom.c)
+ add_executable(rtl_adsb rtl_adsb.c)
+ add_executable(rtl_power rtl_power.c)
+-set(INSTALL_TARGETS rtlsdr_shared rtlsdr_static rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power)
++set(INSTALL_TARGETS ${rtlsdr_lib} rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power)
+ 
+-target_link_libraries(rtl_sdr rtlsdr_shared convenience_static
++target_link_libraries(rtl_sdr ${rtlsdr_lib} convenience_static
+     ${LIBUSB_LIBRARIES}
+     ${CMAKE_THREAD_LIBS_INIT}
+ )
+-target_link_libraries(rtl_tcp rtlsdr_shared convenience_static
++target_link_libraries(rtl_tcp ${rtlsdr_lib} convenience_static
+     ${LIBUSB_LIBRARIES}
+     ${CMAKE_THREAD_LIBS_INIT}
+ )
+-target_link_libraries(rtl_test rtlsdr_shared convenience_static
++target_link_libraries(rtl_test ${rtlsdr_lib} convenience_static
+     ${LIBUSB_LIBRARIES}
+     ${CMAKE_THREAD_LIBS_INIT}
+ )
+-target_link_libraries(rtl_fm rtlsdr_shared convenience_static
++target_link_libraries(rtl_fm ${rtlsdr_lib} convenience_static
+     ${LIBUSB_LIBRARIES}
+     ${CMAKE_THREAD_LIBS_INIT}
+ )
+-target_link_libraries(rtl_eeprom rtlsdr_shared convenience_static
++target_link_libraries(rtl_eeprom ${rtlsdr_lib} convenience_static
+     ${LIBUSB_LIBRARIES}
+     ${CMAKE_THREAD_LIBS_INIT}
+ )
+-target_link_libraries(rtl_adsb rtlsdr_shared convenience_static
++target_link_libraries(rtl_adsb ${rtlsdr_lib} convenience_static
+     ${LIBUSB_LIBRARIES}
+     ${CMAKE_THREAD_LIBS_INIT}
+ )
+-target_link_libraries(rtl_power rtlsdr_shared convenience_static
++target_link_libraries(rtl_power ${rtlsdr_lib} convenience_static
+     ${LIBUSB_LIBRARIES}
+     ${CMAKE_THREAD_LIBS_INIT}
+ )
+-- 
+2.1.0
+
-- 
2.1.0
