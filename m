From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 15 May 2020 18:20:57 +0200
Subject: [Buildroot] [PATCH] package/librtlsdr: bump to last commit
Message-ID: <20200515162057.3039940-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Last official release is 2 years ago.

Current master branch provides fixes and improvements:
- fix crash with usbfs mmap on ARM/ARM64 plaforms
- better SDR dongle configuration

This patch:
- bump librtlsdr to d794155ba65796a76cd0a436f9709f4601509320 (2020/03/18)
- adapt 0001-disable_shared_library_target_in_build.patch
  (http://lists.osmocom.org/pipermail/osmocom-sdr/2020-May/002075.html)
- add option to enable/disable zerocopy buffer on non arm platform

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 ...sable_shared_library_target_in_build.patch | 94 ++++++++++++-------
 package/librtlsdr/Config.in                   | 10 ++
 package/librtlsdr/librtlsdr.hash              |  2 +-
 package/librtlsdr/librtlsdr.mk                |  8 +-
 4 files changed, 77 insertions(+), 37 deletions(-)

diff --git a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch b/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
index b9f53d2393..376aa23344 100644
--- a/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
+++ b/package/librtlsdr/0001-disable_shared_library_target_in_build.patch
@@ -1,44 +1,46 @@
-From d47e3aed12414be59bf77177c93853ec4b24d705 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 2 Jun 2018 16:53:36 +0200
+From c8878472bf84c656979ea1d07e7ed55b0aa2c939 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Fri, 15 May 2020 16:14:48 +0200
 Subject: [PATCH] disable shared library target in build
 
 Disable shared library target if BUILD_SHARED_LIBS if OFF.
 
 Patch retrieved from
-https://git.buildroot.net/buildroot/tree/package/librtlsdr/0001-disable_shared_library_target_in_build.patch?h=2018.05
+https://git.buildroot.net/buildroot/tree/package/librtlsdr/0001-disable_shared_library_target_in_build.patch?h=2020.02.x
 
-Patch has been updated to work with 0.5.4 and to be able to keep current
+Patch has been updated to work with master and to be able to keep current
 behavior of building shared and static version of library if
 BUILD_SHARED_LIBS and BUILD_STATIC_LIBS are both set.
 Moreover, if BUILD_STATIC_LIBS is OFF, only shared version of library
 will be install.
 
-[Upstream status: https://github.com/steve-m/librtlsdr/pull/46]
+[Upstream status: http://lists.osmocom.org/pipermail/osmocom-sdr/2020-May/002075.html]
 
 Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 ---
- src/CMakeLists.txt | 24 ++++++++++++++++--------
- 1 file changed, 16 insertions(+), 8 deletions(-)
+ src/CMakeLists.txt | 30 +++++++++++++++++++++---------
+ 1 file changed, 21 insertions(+), 9 deletions(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 07d64ab..2b7cbae 100644
+index 33faee7..d82fc87 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -47,16 +47,22 @@ ENDIF(MSVC)
+@@ -18,6 +18,8 @@
  ########################################################################
  # Setup shared library variant
  ########################################################################
 +option(BUILD_SHARED_LIBS "Build shared library" ON)
 +if(BUILD_SHARED_LIBS)
- add_library(rtlsdr_shared SHARED ${rtlsdr_srcs})
- target_link_libraries(rtlsdr_shared ${LIBUSB_LIBRARIES})
- set_target_properties(rtlsdr_shared PROPERTIES DEFINE_SYMBOL "rtlsdr_EXPORTS")
- set_target_properties(rtlsdr_shared PROPERTIES OUTPUT_NAME rtlsdr)
- set_target_properties(rtlsdr_shared PROPERTIES SOVERSION ${MAJOR_VERSION})
- set_target_properties(rtlsdr_shared PROPERTIES VERSION ${LIBVER})
-+list(APPEND rtlsdr_lib rtlsdr_shared)
+ add_library(rtlsdr SHARED librtlsdr.c
+   tuner_e4k.c tuner_fc0012.c tuner_fc0013.c tuner_fc2580.c tuner_r82xx.c)
+ target_link_libraries(rtlsdr PkgConfig::LIBUSB)
+@@ -30,10 +32,14 @@ set_target_properties(rtlsdr PROPERTIES OUTPUT_NAME rtlsdr)
+ set_target_properties(rtlsdr PROPERTIES SOVERSION ${MAJOR_VERSION})
+ set_target_properties(rtlsdr PROPERTIES VERSION ${LIBVER})
+ generate_export_header(rtlsdr)
++list(APPEND rtlsdr_lib rtlsdr)
 +endif()
  
  ########################################################################
@@ -46,60 +48,82 @@ index 07d64ab..2b7cbae 100644
  ########################################################################
 +option(BUILD_STATIC_LIBS "Build static library" ON)
 +if(BUILD_STATIC_LIBS)
- add_library(rtlsdr_static STATIC ${rtlsdr_srcs})
- target_link_libraries(rtlsdr_static ${LIBUSB_LIBRARIES})
- set_property(TARGET rtlsdr_static APPEND PROPERTY COMPILE_DEFINITIONS "rtlsdr_STATIC" )
-@@ -64,6 +70,8 @@ if(NOT WIN32)
- # Force same library filename for static and shared variants of the library
+ add_library(rtlsdr_static STATIC librtlsdr.c
+   tuner_e4k.c tuner_fc0012.c tuner_fc0013.c tuner_fc2580.c tuner_r82xx.c)
+ target_link_libraries(rtlsdr_static PkgConfig::LIBUSB)
+@@ -47,6 +53,8 @@ if(NOT WIN32)
  set_target_properties(rtlsdr_static PROPERTIES OUTPUT_NAME rtlsdr)
  endif()
+ generate_export_header(rtlsdr_static)
 +list(APPEND rtlsdr_lib rtlsdr_static)
 +endif()
  
  ########################################################################
- # Setup libraries used in executables
-@@ -91,33 +99,33 @@ add_executable(rtl_fm rtl_fm.c)
- add_executable(rtl_eeprom rtl_eeprom.c)
+ # Set up Windows DLL resource files
+@@ -90,37 +98,37 @@ add_executable(rtl_eeprom rtl_eeprom.c)
  add_executable(rtl_adsb rtl_adsb.c)
  add_executable(rtl_power rtl_power.c)
--set(INSTALL_TARGETS rtlsdr_shared rtlsdr_static rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power)
-+set(INSTALL_TARGETS ${rtlsdr_lib} rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power)
+ add_executable(rtl_biast rtl_biast.c)
+-set(INSTALL_TARGETS rtlsdr rtlsdr_static rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast)
++set(INSTALL_TARGETS ${rtlsdr_lib} rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power rtl_biast)
  
--target_link_libraries(rtl_sdr rtlsdr_shared convenience_static
+-target_link_libraries(rtl_sdr rtlsdr convenience_static
 +target_link_libraries(rtl_sdr ${rtlsdr_lib} convenience_static
      ${LIBUSB_LIBRARIES}
      ${CMAKE_THREAD_LIBS_INIT}
  )
--target_link_libraries(rtl_tcp rtlsdr_shared convenience_static
+-target_link_libraries(rtl_tcp rtlsdr convenience_static
 +target_link_libraries(rtl_tcp ${rtlsdr_lib} convenience_static
      ${LIBUSB_LIBRARIES}
      ${CMAKE_THREAD_LIBS_INIT}
  )
--target_link_libraries(rtl_test rtlsdr_shared convenience_static
+-target_link_libraries(rtl_test rtlsdr convenience_static
 +target_link_libraries(rtl_test ${rtlsdr_lib} convenience_static
      ${LIBUSB_LIBRARIES}
      ${CMAKE_THREAD_LIBS_INIT}
  )
--target_link_libraries(rtl_fm rtlsdr_shared convenience_static
+-target_link_libraries(rtl_fm rtlsdr convenience_static
 +target_link_libraries(rtl_fm ${rtlsdr_lib} convenience_static
      ${LIBUSB_LIBRARIES}
      ${CMAKE_THREAD_LIBS_INIT}
  )
--target_link_libraries(rtl_eeprom rtlsdr_shared convenience_static
+-target_link_libraries(rtl_eeprom rtlsdr convenience_static
 +target_link_libraries(rtl_eeprom ${rtlsdr_lib} convenience_static
      ${LIBUSB_LIBRARIES}
      ${CMAKE_THREAD_LIBS_INIT}
  )
--target_link_libraries(rtl_adsb rtlsdr_shared convenience_static
+-target_link_libraries(rtl_adsb rtlsdr convenience_static
 +target_link_libraries(rtl_adsb ${rtlsdr_lib} convenience_static
      ${LIBUSB_LIBRARIES}
      ${CMAKE_THREAD_LIBS_INIT}
  )
--target_link_libraries(rtl_power rtlsdr_shared convenience_static
+-target_link_libraries(rtl_power rtlsdr convenience_static
 +target_link_libraries(rtl_power ${rtlsdr_lib} convenience_static
      ${LIBUSB_LIBRARIES}
      ${CMAKE_THREAD_LIBS_INIT}
  )
+-target_link_libraries(rtl_biast rtlsdr convenience_static
++target_link_libraries(rtl_biast ${rtlsdr_lib} convenience_static
+     ${LIBUSB_LIBRARIES}
+     ${CMAKE_THREAD_LIBS_INIT}
+ )
+@@ -156,12 +164,16 @@ endif()
+ ########################################################################
+ # Install built library files & utilities
+ ########################################################################
++if(BUILD_SHARED_LIBS)
+ install(TARGETS rtlsdr EXPORT RTLSDR-export
+   LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} # .so/.dylib file
+   )
++endif()
++if(BUILD_STATIC_LIBS)
+ install(TARGETS rtlsdr_static EXPORT RTLSDR-export
+   ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} # .so/.dylib file
+   )
++endif()
+ install(TARGETS rtl_sdr rtl_tcp rtl_test rtl_fm rtl_eeprom rtl_adsb rtl_power
+   DESTINATION ${CMAKE_INSTALL_BINDIR}
+   )
 -- 
-2.14.1
+2.26.2
 
diff --git a/package/librtlsdr/Config.in b/package/librtlsdr/Config.in
index c2bf1a9fb1..9b4344bdb9 100644
--- a/package/librtlsdr/Config.in
+++ b/package/librtlsdr/Config.in
@@ -18,6 +18,16 @@ config BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER
 	  automatically detach any kernel driver associated to the
 	  RTL2832U USB device on startup if one is loaded.
 
+config BR2_PACKAGE_LIBRTLSDR_ZEROCOPY
+	bool "Enable usbfs zero-copy support"
+	default y
+	# The Linux Kernel has a bug on ARM/ARM64 systems where the USB CMA
+	# memory is incorrectly mapped to userspace, breaking zerocopy.
+	depends on !(BR2_arm || BR2_armeb || BR2_aarch64)
+	help
+	  Enable this option if you would like to use kernel
+	  usbfs mmap instead of buffers in userspace.
+
 endif
 
 comment "librtlsdr needs a toolchain w/ threads"
diff --git a/package/librtlsdr/librtlsdr.hash b/package/librtlsdr/librtlsdr.hash
index e7b0e84f4a..920a755033 100644
--- a/package/librtlsdr/librtlsdr.hash
+++ b/package/librtlsdr/librtlsdr.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 80a5155f3505bca8f1b808f8414d7dcd7c459b662a1cde84d3a2629a6e72ae55  librtlsdr-0.6.0.tar.gz
+sha256 78c20031287017d057941640dcf05cb7666cfedcfad1b4a1186ed00cabfabc2f  librtlsdr-d794155ba65796a76cd0a436f9709f4601509320.tar.gz
 # License file, locally calculated
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/librtlsdr/librtlsdr.mk b/package/librtlsdr/librtlsdr.mk
index 500ccc5d17..16f2632789 100644
--- a/package/librtlsdr/librtlsdr.mk
+++ b/package/librtlsdr/librtlsdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRTLSDR_VERSION = 0.6.0
+LIBRTLSDR_VERSION = d794155ba65796a76cd0a436f9709f4601509320
 LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr,$(LIBRTLSDR_VERSION))
 LIBRTLSDR_LICENSE = GPL-2.0+
 LIBRTLSDR_LICENSE_FILES = COPYING
@@ -28,6 +28,12 @@ ifeq ($(BR2_PACKAGE_LIBRTLSDR_DETACH_DRIVER),y)
 LIBRTLSDR_CONF_OPTS += -DDETACH_KERNEL_DRIVER=1
 endif
 
+ifeq ($(BR2_PACKAGE_LIBRTLSDR_ZEROCOPY),y)
+LIBRTLSDR_CONF_OPTS += -DENABLE_ZEROCOPY=ON
+else
+LIBRTLSDR_CONF_OPTS += -DENABLE_ZEROCOPY=OFF
+endif
+
 # In case of static-lib-only builds, CMake's FindThreads.cmake code tries to
 # get the right flags, checking first for -lpthreads, then -lpthread, and lastly
 # for -pthread.
-- 
2.26.2
