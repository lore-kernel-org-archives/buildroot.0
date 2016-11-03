From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  3 Nov 2016 22:05:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/openpowerlink: bump to v2.5.0
Message-ID: <1478207123-27787-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

 - Rebase existing patches
 - Use a "menu" instead of "choice" to select Ethernet Powerlink
   Drivers since we can now build several kernel modules at once.
 - Select the Intel 82573 driver by default.
 - Disable library with simulation interface.
 - Disable zynq/FPGA (PCIe) interface otherwise the kernelpcp library
   is always build.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...l-the-stack-libraries-to-lib-subdirectory.patch | 73 ++++++++++++++--------
 .../0002-cmake-install-oplk-headers-files.patch    |  8 +--
 .../0003-Add-top-level-CMakeLists.txt.patch        | 10 +--
 package/openpowerlink/Config.in                    |  6 +-
 package/openpowerlink/openpowerlink.hash           |  8 +--
 package/openpowerlink/openpowerlink.mk             | 27 ++++----
 6 files changed, 77 insertions(+), 55 deletions(-)

diff --git a/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
index 3c99409..1f5eb89 100644
--- a/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
+++ b/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
@@ -1,4 +1,4 @@
-From ded9f83ef3bcb4c688da80354c179543e4862e52 Mon Sep 17 00:00:00 2001
+From 4e8aa3a9e1696e5e02ff0a3ae5a72f034ee60c2f Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 25 May 2016 15:57:10 +0200
 Subject: [PATCH] install the stack libraries to "lib" subdirectory
@@ -36,109 +36,132 @@ refactoring is needed to fix this properly.
 
 [1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/#8f80/a50a/4649/f07c
 
+[rebase on v2.5.0]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
+ stack/proj/linux/liboplkcn-sim/CMakeLists.txt           | 2 +-
  stack/proj/linux/liboplkcn/CMakeLists.txt               | 2 +-
  stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt | 2 +-
  stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt   | 2 +-
  stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt       | 2 +-
+ stack/proj/linux/liboplkmn-sim/CMakeLists.txt           | 2 +-
  stack/proj/linux/liboplkmn/CMakeLists.txt               | 2 +-
  stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt | 2 +-
- stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt | 2 +-
+ stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt  | 2 +-
  stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt   | 2 +-
  stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt       | 2 +-
- 9 files changed, 9 insertions(+), 9 deletions(-)
+ 11 files changed, 11 insertions(+), 11 deletions(-)
 
+diff --git a/stack/proj/linux/liboplkcn-sim/CMakeLists.txt b/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
+index 73b641d..b8b5c9d 100644
+--- a/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcn-sim/CMakeLists.txt
+@@ -96,4 +96,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcn/CMakeLists.txt b/stack/proj/linux/liboplkcn/CMakeLists.txt
-index c700d9d..b891553 100644
+index 323eafc..459124a 100644
 --- a/stack/proj/linux/liboplkcn/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcn/CMakeLists.txt
-@@ -94,4 +94,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -90,4 +90,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
-index 03752df..7b1050c 100644
+index f8b1850..c16194a 100644
 --- a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
-@@ -87,4 +87,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
-index bcc4273..8ca5b7e 100644
+index 0f07e63..0074616 100644
 --- a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
-@@ -87,4 +87,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
-index 440f02c..6ffcbe9 100644
+index d0dad78..ee0fdec 100644
 --- a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
-@@ -77,4 +77,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -76,4 +76,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmn-sim/CMakeLists.txt b/stack/proj/linux/liboplkmn-sim/CMakeLists.txt
+index eb6396a..5beaa07 100644
+--- a/stack/proj/linux/liboplkmn-sim/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmn-sim/CMakeLists.txt
+@@ -91,4 +91,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkmn/CMakeLists.txt b/stack/proj/linux/liboplkmn/CMakeLists.txt
-index a8850b8..d762d4c 100644
+index cf7927f..6b19557 100644
 --- a/stack/proj/linux/liboplkmn/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkmn/CMakeLists.txt
-@@ -93,4 +93,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -89,4 +89,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
-index f2606a3..f71b182 100644
+index 9daa2df..bfccb25 100644
 --- a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
-@@ -86,4 +86,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -82,4 +82,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
-diff --git a/stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt
-index 9362ad8..1d5fb6d 100644
---- a/stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt
-+++ b/stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt
-@@ -88,4 +88,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+diff --git a/stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt
+index 0135f46..83128eb 100644
+--- a/stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-kernelpcp/CMakeLists.txt
+@@ -91,4 +91,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
-index 6741eef..042cbcf 100644
+index cd97882..aaaa526 100644
 --- a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
-@@ -86,4 +86,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -82,4 +82,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
-index b4dd41b..cf875ca 100644
+index 7e1a820..82205c2 100644
 --- a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
-@@ -80,4 +80,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -79,4 +79,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 -- 
-2.5.5
+2.8.1
 
diff --git a/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch b/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
index 4cfbb51..7d338a4 100644
--- a/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
+++ b/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
@@ -1,4 +1,4 @@
-From 535f50e30afaa4fc6389273d1a5b6c20cb7cf5a4 Mon Sep 17 00:00:00 2001
+From 8cb39257e12d6b82190aec8ab9ad89a9ee13af71 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 25 May 2016 15:57:29 +0200
 Subject: [PATCH] cmake: install oplk headers files
@@ -15,10 +15,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/stack/CMakeLists.txt b/stack/CMakeLists.txt
-index c6cde8c..2652858 100644
+index 3b11c54..4eadf44 100644
 --- a/stack/CMakeLists.txt
 +++ b/stack/CMakeLists.txt
-@@ -104,3 +104,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
+@@ -105,3 +105,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
  ELSE()
      MESSAGE(FATAL_ERROR "Unknown Platform and processor combination ${CMAKE_SYSTEM_NAME} and ${CMAKE_SYSTEM_PROCESSOR}!!")
  ENDIF()
@@ -28,5 +28,5 @@ index c6cde8c..2652858 100644
 +################################################################################
 +INSTALL(DIRECTORY ${STACK_INCLUDE_DIR}/oplk DESTINATION "include")
 -- 
-2.5.5
+2.8.1
 
diff --git a/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch b/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
index 267c807..9cbf02d 100644
--- a/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
+++ b/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
@@ -1,4 +1,4 @@
-From 1b92df6f8283e15b6877f7cd70063648727fc88b Mon Sep 17 00:00:00 2001
+From 7f81c74726aec4aef6bd93ee644200ab34375437 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 25 May 2016 15:59:20 +0200
 Subject: [PATCH] Add top level CMakeLists.txt
@@ -83,10 +83,10 @@ index 0000000..28d4e7a
 +    ADD_SUBDIRECTORY("apps/demo_mn_qt")
 +ENDIF (CFG_DEMO_MN_QT)
 diff --git a/apps/common/cmake/findoplklib.cmake b/apps/common/cmake/findoplklib.cmake
-index aa427a6..e6a802e 100644
+index f7e710f..b8b04c5 100644
 --- a/apps/common/cmake/findoplklib.cmake
 +++ b/apps/common/cmake/findoplklib.cmake
-@@ -89,36 +89,42 @@ MACRO(FIND_OPLK_LIBRARY OPLK_NODE_TYPE)
+@@ -85,36 +85,42 @@ MACRO(FIND_OPLK_LIBRARY OPLK_NODE_TYPE)
      # Set oplk library directory
      SET(OPLKLIB_DIR ${OPLK_BASE_DIR}/stack/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR})
  
@@ -174,7 +174,7 @@ index 49aab66..d9fd418 100644
              TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB})
          ENDIF()
 diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-index 2702abd..81bb598 100644
+index 1ef9353..e720834 100644
 --- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
 +++ b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
 @@ -104,9 +104,15 @@ ENDIF()
@@ -197,5 +197,5 @@ index 2702abd..81bb598 100644
  
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -pedantic -std=c99 -pthread -fno-strict-aliasing")
 -- 
-2.5.5
+2.8.1
 
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 0b68ca8..88e0ef3 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -87,11 +87,11 @@ endchoice
 
 if BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 
-choice
-	prompt "select Ethernet Powerlink Driver"
+menu "select Ethernet Powerlink Driver"
 
 config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_82573
 	bool "Intel 82573"
+	default y
 
 config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_8255x
 	bool "Intel 8255x"
@@ -105,7 +105,7 @@ config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8111
 config BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8139
 	bool "Realtek RTL-8139"
 
-endchoice
+endmenu
 
 endif # BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index a6026cb..f9c94f9 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.4.1/
-md5	13389a419f3727b9c5f07b1b412eff30	openPOWERLINK_V2.4.1.tar.gz
-sha1	eb3883f1771d665d1f948fc35e57bb97dd5c7ca5	openPOWERLINK_V2.4.1.tar.gz
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.5.0/
+md5	929b778a6a4d448d502da5a428322949	openPOWERLINK_V2.5.0.tar.gz
+sha1	28e2e5621550421e74ba94738f6c12eb8c279fce	openPOWERLINK_V2.5.0.tar.gz
 # sha256 locally computed
-sha256	f627fb8efcb5d9b1b9d8e7701ad611d44d05ad046b1b62ea0f71bd8244d5bf49	openPOWERLINK_V2.4.1.tar.gz
+sha256	1cb8c44626dbb7f224520667e437b4b430a32699560914f379679b6c58c1309c	openPOWERLINK_V2.5.0.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 5b1b175..dcb548c 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.4.1
+OPENPOWERLINK_VERSION = V2.5.0
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
@@ -21,7 +21,12 @@ OPENPOWERLINK_CN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_CN),ON,OFF)
 #### OPLK LIBRARY ####
 
 # Always build a oplk stack
-OPENPOWERLINK_CONF_OPTS += -DCFG_OPLK_LIB=ON
+# Disable library with simulation interface
+# Disable zynq/FPGA (PCIe) interface
+OPENPOWERLINK_CONF_OPTS += -DCFG_OPLK_LIB=ON \
+	-DCFG_COMPILE_LIB_MN_SIM=OFF \
+	-DCFG_COMPILE_LIB_CN_SIM=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_ZYNQINTF=OFF
 
 # All option are ON by default
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
@@ -89,18 +94,12 @@ OPENPOWERLINK_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_DRIVERS=ON
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_82573),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=82573
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_8255x),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8255x
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_I210),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=i210
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8111),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8111
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8139),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8139
-endif
+OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_DRIVERS=ON \
+	-DCFG_POWERLINK_EDRV_82573=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_82573),ON,OFF) \
+	-DCFG_POWERLINK_EDRV_8255X=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_8255x),ON,OFF) \
+	-DCFG_POWERLINK_EDRV_I210=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_I210),ON,OFF) \
+	-DCFG_POWERLINK_EDRV_8111=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8111),ON,OFF) \
+	-DCFG_POWERLINK_EDRV_8139=$(if $(BR2_PACKAGE_OPENPOWERLINK_KERNEL_DRIVER_RTL8139),ON,OFF)
 else
 OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_DRIVERS=OFF
 endif
-- 
2.5.5
