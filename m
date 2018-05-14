From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 14 May 2018 16:04:29 +0200
Subject: [Buildroot] [PATCH] librtlsdr: bump to version v0.5.4
Message-ID: <20180514140429.23428-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 ...01-disable_shared_library_target_in_build.patch | 80 ----------------------
 package/librtlsdr/librtlsdr.hash                   |  4 +-
 package/librtlsdr/librtlsdr.mk                     |  2 +-
 3 files changed, 4 insertions(+), 82 deletions(-)
 delete mode 100644 package/librtlsdr/0001-disable_shared_library_target_in_build.patch

diff --git a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch b/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
deleted file mode 100644
index b763c48b2e..0000000000
--- a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-librtlsdr: disable shared library target in build
-
-Disable shared library target if BUILD_SHARED_LIBS if OFF.
-
-Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
----
-diff -Nurp librtlsdr-v0.5.3_orig/src/CMakeLists.txt librtlsdr-v0.5.3/src/CMakeLists.txt
---- librtlsdr-v0.5.3_orig/src/CMakeLists.txt	2014-09-24 17:31:40.610337074 +0530
-+++ librtlsdr-v0.5.3/src/CMakeLists.txt	2014-09-24 17:32:38.838334632 +0530
-@@ -20,6 +20,7 @@
- ########################################################################
- # Setup library
- ########################################################################
-+if(BUILD_SHARED_LIBS)
- add_library(rtlsdr_shared SHARED
-     librtlsdr.c
-     tuner_e4k.c
-@@ -37,6 +38,7 @@ set_target_properties(rtlsdr_shared PROP
- set_target_properties(rtlsdr_shared PROPERTIES OUTPUT_NAME rtlsdr)
- set_target_properties(rtlsdr_shared PROPERTIES SOVERSION ${MAJOR_VERSION})
- set_target_properties(rtlsdr_shared PROPERTIES VERSION ${LIBVER})
-+endif()
- 
- add_library(rtlsdr_static STATIC
-     librtlsdr.c
-@@ -71,6 +73,12 @@ if(NOT WIN32)
- set_target_properties(rtlsdr_static PROPERTIES OUTPUT_NAME rtlsdr)
- endif()
- 
-+if(BUILD_SHARED_LIBS)
-+set(rtlsdr_lib rtlsdr_shared)
-+else()
-+set(rtlsdr_lib rtlsdr_static)
-+endif()
-+
- ########################################################################
- # Build utility
- ########################################################################
-@@ -81,33 +89,33 @@ add_executable(rtl_fm rtl_fm.c)
- add_executable(rtl_eeprom rtl_eeprom.c)
- add_executable(rtl_adsb rtl_adsb.c)
- add_executable(rtl_power rtl_power.c)
--set(INSTALL_TARGETS rtlsdr_shared rtlsdr_static rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power)
-+set(INSTALL_TARGETS ${rtlsdr_lib} rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power)
- 
--target_link_libraries(rtl_sdr rtlsdr_shared convenience_static
-+target_link_libraries(rtl_sdr ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_tcp rtlsdr_shared convenience_static
-+target_link_libraries(rtl_tcp ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_test rtlsdr_shared convenience_static
-+target_link_libraries(rtl_test ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_fm rtlsdr_shared convenience_static
-+target_link_libraries(rtl_fm ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_eeprom rtlsdr_shared convenience_static
-+target_link_libraries(rtl_eeprom ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_adsb rtlsdr_shared convenience_static
-+target_link_libraries(rtl_adsb ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
--target_link_libraries(rtl_power rtlsdr_shared convenience_static
-+target_link_libraries(rtl_power ${rtlsdr_lib} convenience_static
-     ${LIBUSB_LIBRARIES}
-     ${CMAKE_THREAD_LIBS_INIT}
- )
diff --git a/package/librtlsdr/librtlsdr.hash b/package/librtlsdr/librtlsdr.hash
index 24bca467b1..9184196d9a 100644
--- a/package/librtlsdr/librtlsdr.hash
+++ b/package/librtlsdr/librtlsdr.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 98fb5c34ac94d6f2235a0bb41a08f8bed7949e1d1b91ea57a7c1110191ea58de  librtlsdr-v0.5.3.tar.gz
+sha256 6fd0d298c1a18fc8005b0c2f6199b08bc15e3fb4f4312f551eea2ae269c940c5  librtlsdr-v0.5.4.tar.gz
+# License file, locally calculated
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index ca0a43829d..02b3d31fd9 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRTLSDR_VERSION = v0.5.3
+LIBRTLSDR_VERSION = v0.5.4
 LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
 LIBRTLSDR_LICENSE = GPL-2.0+
 LIBRTLSDR_LICENSE_FILES = COPYING
-- 
2.16.1
