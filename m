From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Wed, 24 Sep 2014 18:01:55 +0530
Subject: [Buildroot] [PATCH] librtlsdr: disable shared library target
Message-ID: <1411561915-3225-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable shared library target if BUILD_SHARES_LIBS is OFF.

Fixes:
http://autobuild.buildroot.net/results/d68/d68a23e2a57fd5430d74b8151931f36959d9578d//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 ...01_disable_shared_library_target_in_build.patch |   80 ++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/librtlsdr/librtlsdr_001_disable_shared_library_target_in_build.patch

diff --git a/package/librtlsdr/librtlsdr_001_disable_shared_library_target_in_build.patch b/package/librtlsdr/librtlsdr_001_disable_shared_library_target_in_build.patch
new file mode 100644
index 0000000..b763c48
--- /dev/null
+++ b/package/librtlsdr/librtlsdr_001_disable_shared_library_target_in_build.patch
@@ -0,0 +1,80 @@
+librtlsdr: disable shared library target in build
+
+Disable shared library target if BUILD_SHARED_LIBS if OFF.
+
+Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
+---
+diff -Nurp librtlsdr-v0.5.3_orig/src/CMakeLists.txt librtlsdr-v0.5.3/src/CMakeLists.txt
+--- librtlsdr-v0.5.3_orig/src/CMakeLists.txt	2014-09-24 17:31:40.610337074 +0530
++++ librtlsdr-v0.5.3/src/CMakeLists.txt	2014-09-24 17:32:38.838334632 +0530
+@@ -20,6 +20,7 @@
+ ########################################################################
+ # Setup library
+ ########################################################################
++if(BUILD_SHARED_LIBS)
+ add_library(rtlsdr_shared SHARED
+     librtlsdr.c
+     tuner_e4k.c
+@@ -37,6 +38,7 @@ set_target_properties(rtlsdr_shared PROP
+ set_target_properties(rtlsdr_shared PROPERTIES OUTPUT_NAME rtlsdr)
+ set_target_properties(rtlsdr_shared PROPERTIES SOVERSION ${MAJOR_VERSION})
+ set_target_properties(rtlsdr_shared PROPERTIES VERSION ${LIBVER})
++endif()
+ 
+ add_library(rtlsdr_static STATIC
+     librtlsdr.c
+@@ -71,6 +73,12 @@ if(NOT WIN32)
+ set_target_properties(rtlsdr_static PROPERTIES OUTPUT_NAME rtlsdr)
+ endif()
+ 
++if(BUILD_SHARED_LIBS)
++set(rtlsdr_lib rtlsdr_shared)
++else()
++set(rtlsdr_lib rtlsdr_static)
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
-- 
1.7.9.5
