From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 21:55:18 +0200
Subject: [Buildroot] [PATCH v2 5/9] package/librtlsdr: fix static link
In-Reply-To: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409514922-9509-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds 2 patches to librtlsdr fixing static linking.

The first one makes sure the libusb CMake module will find all the
dependencies, so the ldflags will be correct, even for static link.

The second patch disable the shared object build when it
BUILD_SHARED_LIBS is off.

Fixes:
  http://autobuild.buildroot.org/results/2d9/2d91d7fa10ac3bd22fb5ce72acd7a0ce177f054f/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- make the libusb CMake module correctly handles/checks its deps.
---
 ...sure-the-libusb-module-correctly-set-all-.patch |  45 +++++++++
 ...le-rtlsdr_shared-library-target-in-BUILD_.patch | 104 +++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 package/librtlsdr/librtlsdr-0001-cmake-make-sure-the-libusb-module-correctly-set-all-.patch
 create mode 100644 package/librtlsdr/librtlsdr-0002-cmake-disable-rtlsdr_shared-library-target-in-BUILD_.patch

diff --git a/package/librtlsdr/librtlsdr-0001-cmake-make-sure-the-libusb-module-correctly-set-all-.patch b/package/librtlsdr/librtlsdr-0001-cmake-make-sure-the-libusb-module-correctly-set-all-.patch
new file mode 100644
index 0000000..a1faca0
--- /dev/null
+++ b/package/librtlsdr/librtlsdr-0001-cmake-make-sure-the-libusb-module-correctly-set-all-.patch
@@ -0,0 +1,45 @@
+From 3d5ab5eea351b5b19b8236c9c39857b6f2d3d126 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 31 Aug 2014 10:14:38 +0200
+Subject: [PATCH] cmake: make sure the libusb module correctly set all ldflags
+ in case of static link
+
+When executing a statically linked build, the default libusb CMake
+module fails to get the libusb dependencies; so the link phase fails.
+
+However, pkg-config correctly gives these dependencies, even for static
+build. So, extend the libusb library list with what the pkg_check_modules
+CMake primitive found.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ cmake/Modules/FindLibUSB.cmake | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/cmake/Modules/FindLibUSB.cmake b/cmake/Modules/FindLibUSB.cmake
+index c2c3f63..8adf805 100644
+--- a/cmake/Modules/FindLibUSB.cmake
++++ b/cmake/Modules/FindLibUSB.cmake
+@@ -24,6 +24,19 @@ endif()
+     /usr/local/lib
+   )
+ 
++  # Make sure we get all ldflags in case of static link
++  if(NOT BUILD_SHARED_LIBS)
++    foreach(_lib ${LIBUSB_PKG_STATIC_LIBRARIES})
++          string(TOUPPER ${_lib} _Ulib)
++          find_library(_${_Ulib}_LIBRARIES NAMES ${_lib} lib${_lib}
++              HINTS
++              ${LIBUSB_PKG_LIBDIR}
++              ${LIBUSB_PKG_LIBRARY_DIRS}
++              )
++            list(APPEND LIBUSB_LIBRARIES ${_${_Ulib}_LIBRARIES})
++      endforeach()
++  endif()
++
+ include(CheckFunctionExists)
+ if(LIBUSB_INCLUDE_DIRS)
+     set(CMAKE_REQUIRED_INCLUDES ${LIBUSB_INCLUDE_DIRS})
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
