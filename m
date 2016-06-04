From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  4 Jun 2016 16:38:10 +0200
Subject: [Buildroot] [PATCH 1/2] package/openpowerlink: bump to v2.4.0
Message-ID: <1465051091-6494-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove upstream patches and rebase all remaining patches.

Disable PCIe MN library by default, it will be added in a follow up patch.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...l-the-stack-libraries-to-lib-subdirectory.patch |  47 ++++---
 .../0002-cmake-install-oplk-headers-files.patch    |  14 +-
 ...tch => 0003-Add-top-level-CMakeLists.txt.patch} |  30 ++--
 ...se-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch | 154 ---------------------
 ...ROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch | 125 -----------------
 ...veth-avoid-kernel-header-issue-with-musl.patch} |  17 ++-
 package/openpowerlink/openpowerlink.hash           |   8 +-
 package/openpowerlink/openpowerlink.mk             |   5 +-
 8 files changed, 71 insertions(+), 329 deletions(-)
 rename package/openpowerlink/{0005-Add-top-level-CMakeLists.txt.patch => 0003-Add-top-level-CMakeLists.txt.patch} (91%)
 delete mode 100644 package/openpowerlink/0003-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch
 delete mode 100644 package/openpowerlink/0004-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch
 rename package/openpowerlink/{0006-veth-avoid-kernel-header-issue-with-musl.patch => 0004-veth-avoid-kernel-header-issue-with-musl.patch} (84%)

diff --git a/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
index e46cbf7..3c99409 100644
--- a/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
+++ b/package/openpowerlink/0001-install-the-stack-libraries-to-lib-subdirectory.patch
@@ -1,6 +1,6 @@
-From ebc5aeff65aeda610d9e23ecf4b26b79f9305a0e Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Fri, 1 May 2015 12:19:34 +0200
+From ded9f83ef3bcb4c688da80354c179543e4862e52 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 25 May 2016 15:57:10 +0200
 Subject: [PATCH] install the stack libraries to "lib" subdirectory
 
 Using '.' to install the stack libraries is not correct since
@@ -36,7 +36,7 @@ refactoring is needed to fix this properly.
 
 [1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/#8f80/a50a/4649/f07c
 
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  stack/proj/linux/liboplkcn/CMakeLists.txt               | 2 +-
  stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt | 2 +-
@@ -44,35 +44,36 @@ Signed-off-by: Romain Naour <romain.naour@openwide.fr>
  stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt       | 2 +-
  stack/proj/linux/liboplkmn/CMakeLists.txt               | 2 +-
  stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt | 2 +-
+ stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt | 2 +-
  stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt   | 2 +-
  stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt       | 2 +-
- 8 files changed, 8 insertions(+), 8 deletions(-)
+ 9 files changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/stack/proj/linux/liboplkcn/CMakeLists.txt b/stack/proj/linux/liboplkcn/CMakeLists.txt
-index b7c73e6..23e3112 100644
+index c700d9d..b891553 100644
 --- a/stack/proj/linux/liboplkcn/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcn/CMakeLists.txt
-@@ -88,4 +88,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -94,4 +94,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
-index 6c3bec6..a6f9271 100644
+index 03752df..7b1050c 100644
 --- a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
-@@ -81,4 +81,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -87,4 +87,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
-index fdf6fd4..6df8bb7 100644
+index bcc4273..8ca5b7e 100644
 --- a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
-@@ -81,4 +81,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -87,4 +87,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
@@ -89,30 +90,40 @@ index 440f02c..6ffcbe9 100644
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkmn/CMakeLists.txt b/stack/proj/linux/liboplkmn/CMakeLists.txt
-index 8f97144..e29f795 100644
+index a8850b8..d762d4c 100644
 --- a/stack/proj/linux/liboplkmn/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkmn/CMakeLists.txt
-@@ -92,4 +92,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -93,4 +93,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
-index df74265..2ba1cd1 100644
+index f2606a3..f71b182 100644
 --- a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
-@@ -85,4 +85,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -86,4 +86,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt
+index 9362ad8..1d5fb6d 100644
+--- a/stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-kernelpcie/CMakeLists.txt
+@@ -88,4 +88,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 diff --git a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
-index 98835c7..12b3dc6 100644
+index 6741eef..042cbcf 100644
 --- a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
 +++ b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
-@@ -85,4 +85,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+@@ -86,4 +86,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
  TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
  SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
@@ -129,5 +140,5 @@ index b4dd41b..cf875ca 100644
 -INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
 +INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
 -- 
-2.4.3
+2.5.5
 
diff --git a/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch b/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
index 7553c30..4cfbb51 100644
--- a/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
+++ b/package/openpowerlink/0002-cmake-install-oplk-headers-files.patch
@@ -1,6 +1,6 @@
-From c904fb6ce3c29e77d51d8bcbbbdd48b8d22c754b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Mon, 4 May 2015 11:47:05 +0200
+From 535f50e30afaa4fc6389273d1a5b6c20cb7cf5a4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 25 May 2016 15:57:29 +0200
 Subject: [PATCH] cmake: install oplk headers files
 
 In order to be able to link a third party application
@@ -9,16 +9,16 @@ oplk headers files related to openpowerlink stack.
 
 Install all headers file from STACK_INCLUDE_DIR/oplk.
 
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  stack/CMakeLists.txt | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/stack/CMakeLists.txt b/stack/CMakeLists.txt
-index 9ff13f4..f4614cd 100644
+index c6cde8c..2652858 100644
 --- a/stack/CMakeLists.txt
 +++ b/stack/CMakeLists.txt
-@@ -103,3 +103,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
+@@ -104,3 +104,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
  ELSE()
      MESSAGE(FATAL_ERROR "Unknown Platform and processor combination ${CMAKE_SYSTEM_NAME} and ${CMAKE_SYSTEM_PROCESSOR}!!")
  ENDIF()
@@ -28,5 +28,5 @@ index 9ff13f4..f4614cd 100644
 +################################################################################
 +INSTALL(DIRECTORY ${STACK_INCLUDE_DIR}/oplk DESTINATION "include")
 -- 
-2.4.3
+2.5.5
 
diff --git a/package/openpowerlink/0005-Add-top-level-CMakeLists.txt.patch b/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
similarity index 91%
rename from package/openpowerlink/0005-Add-top-level-CMakeLists.txt.patch
rename to package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
index 259a81a..267c807 100644
--- a/package/openpowerlink/0005-Add-top-level-CMakeLists.txt.patch
+++ b/package/openpowerlink/0003-Add-top-level-CMakeLists.txt.patch
@@ -1,6 +1,6 @@
-From 6f4bcf829efe5ce31592003e049606ae1de05e90 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Wed, 12 Aug 2015 11:24:24 +0200
+From 1b92df6f8283e15b6877f7cd70063648727fc88b Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 25 May 2016 15:59:20 +0200
 Subject: [PATCH] Add top level CMakeLists.txt
 
 This CMakeLists.txt can be used to build openpowerlink
@@ -23,21 +23,23 @@ http://autobuild.buildroot.net/results/da4/da445b65cb136d71577f04e3a17fdb2ef6302
 This patch has not been accepted by upstream:
 https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/57
 
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+Add PCIe support (v2.3.2)
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
- CMakeLists.txt                               | 36 +++++++++++++++
+ CMakeLists.txt                               | 42 +++++++++++++++++
  apps/common/cmake/findoplklib.cmake          | 68 +++++++++++++++-------------
  apps/common/cmake/linkoplklib.cmake          |  2 +-
  drivers/linux/drv_daemon_pcap/CMakeLists.txt | 12 +++--
- 4 files changed, 83 insertions(+), 35 deletions(-)
+ 4 files changed, 89 insertions(+), 35 deletions(-)
  create mode 100644 CMakeLists.txt
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 new file mode 100644
-index 0000000..96e3d0f
+index 0000000..28d4e7a
 --- /dev/null
 +++ b/CMakeLists.txt
-@@ -0,0 +1,36 @@
+@@ -0,0 +1,42 @@
 +
 +CMAKE_MINIMUM_REQUIRED (VERSION 2.8.7)
 +
@@ -47,12 +49,18 @@ index 0000000..96e3d0f
 +    ADD_SUBDIRECTORY("stack")
 +ENDIF (CFG_OPLK_LIB)
 +
-+#### Linux kernel module  ####
++#### Linux kernel Ethernet module  ####
 +
 +IF (CFG_KERNEL_DRIVERS)
 +    ADD_SUBDIRECTORY("drivers/linux/drv_kernelmod_edrv")
 +ENDIF (CFG_KERNEL_DRIVERS)
 +
++#### Linux kernel PCIe module  ####
++
++IF (CFG_KERNEL_PCIE_DRIVERS)
++    ADD_SUBDIRECTORY("drivers/linux/drv_kernelmod_pcie")
++ENDIF (CFG_KERNEL_PCIE_DRIVERS)
++
 +#### Pcap userspace driver  ####
 +
 +IF (CFG_PCAP_DAEMON)
@@ -75,10 +83,10 @@ index 0000000..96e3d0f
 +    ADD_SUBDIRECTORY("apps/demo_mn_qt")
 +ENDIF (CFG_DEMO_MN_QT)
 diff --git a/apps/common/cmake/findoplklib.cmake b/apps/common/cmake/findoplklib.cmake
-index 1bf570e..79ea35b 100644
+index aa427a6..e6a802e 100644
 --- a/apps/common/cmake/findoplklib.cmake
 +++ b/apps/common/cmake/findoplklib.cmake
-@@ -81,36 +81,42 @@ MACRO(FIND_OPLK_LIBRARY OPLK_NODE_TYPE)
+@@ -89,36 +89,42 @@ MACRO(FIND_OPLK_LIBRARY OPLK_NODE_TYPE)
      # Set oplk library directory
      SET(OPLKLIB_DIR ${OPLK_BASE_DIR}/stack/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR})
  
diff --git a/package/openpowerlink/0003-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch b/package/openpowerlink/0003-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch
deleted file mode 100644
index 668c907..0000000
--- a/package/openpowerlink/0003-cmake-use-CMAKE_CURRENT_SOURCE_DIR-instead-of-CM.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From c354e8d9599aa02566c8acc341f3a2c73281483b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Wed, 17 Sep 2014 13:27:44 +0200
-Subject: [PATCH] cmake: use CMAKE_CURRENT_SOURCE_DIR instead of
- CMAKE_SOURCE_DIR
-
-The aim of this patch is to be able to call each subproject's CMakeLists.txt
-from a top-level CMakeLists.txt.
-
-This will help to build automatically the epl libraries, epl driver, unittests
-and demos.
-
-This patch has been submitted upstream:
-https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/57
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- drivers/linux/drv_daemon_pcap/CMakeLists.txt    | 6 +++---
- drivers/linux/drv_kernelmod_edrv/CMakeLists.txt | 8 ++++----
- hardware/CMakeLists.txt                         | 4 ++--
- hardware/drivers/hostinterface/CMakeLists.txt   | 2 +-
- hardware/drivers/openmac/CMakeLists.txt         | 4 ++--
- unittests/CMakeLists.txt                        | 4 ++--
- 6 files changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-index 4c3f933..9041e4d 100644
---- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-+++ b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-@@ -57,8 +57,8 @@ MESSAGE(STATUS "Configuring ${EXE_NAME}")
- ###############################################################################
- # Set global directories
- ###############################################################################
--SET(OPLK_BASE_DIR ${CMAKE_SOURCE_DIR}/../../..)
--SET(DRV_SOURCE_DIR ${CMAKE_SOURCE_DIR})
-+SET(OPLK_BASE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../..)
-+SET(DRV_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
- SET(CONTRIB_SOURCE_DIR ${OPLK_BASE_DIR}/contrib)
- SET(OPLK_INCLUDE_DIR ${OPLK_BASE_DIR}/stack/include)
- SET(TOOLS_DIR ${OPLK_BASE_DIR}/tools)
-@@ -66,7 +66,7 @@ SET(TOOLS_DIR ${OPLK_BASE_DIR}/tools)
- ###############################################################################
- # Include CMake Modules
- ###############################################################################
--SET(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/../../cmake ${CMAKE_MODULE_PATH})
-+SET(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../cmake ${CMAKE_MODULE_PATH})
- 
- # include standard cmake modules
- INCLUDE(CMakeDependentOption)
-diff --git a/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt b/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
-index 2ad1a0d..af85f86 100644
---- a/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
-+++ b/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
-@@ -75,7 +75,7 @@ SET_PROPERTY(CACHE CFG_POWERLINK_EDRV PROPERTY STRINGS 8139 82573 8255x i210 811
- ################################################################################
- # Set global directories
- ################################################################################
--SET(OPLK_BASE_DIR ${CMAKE_SOURCE_DIR}/../../..)
-+SET(OPLK_BASE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../..)
- SET(CONTRIB_SOURCE_DIR ${OPLK_BASE_DIR}/contrib)
- SET(STACK_SOURCE_DIR ${OPLK_BASE_DIR}/stack/src)
- SET(COMMON_SOURCE_DIR ${OPLK_BASE_DIR}/stack/src/common)
-@@ -152,10 +152,10 @@ IF(CFG_OPLK_MN)
-     ENDIF()
-     SET(MODULE_DEFS "${MODULE_DEFS} -DCONFIG_MN")
-     SET(MODULE_NAME "${MODULE_NAME}mn")
--    INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR}/proj/mn)
-+    INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/proj/mn)
- ELSE()
-     SET(MODULE_NAME "${MODULE_NAME}cn")
--    INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR}/proj/cn)
-+    INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/proj/cn)
- ENDIF()
- 
- ###############################################################################
-@@ -189,7 +189,7 @@ ENDFOREACH()
- #
- SET(MODULE_SOURCE_FILES
-     ${MODULE_SOURCE_FILES}
--    ${CMAKE_SOURCE_DIR}/main.c
-+    ${CMAKE_CURRENT_SOURCE_DIR}/main.c
-     ${CONTRIB_SOURCE_DIR}/trace/trace-printk.c
-     ${EDRV_SOURCE_DIR}/edrvcyclic.c
-     ${KERNEL_SOURCE_DIR}/ctrl/ctrlk.c
-diff --git a/hardware/CMakeLists.txt b/hardware/CMakeLists.txt
-index 218c4eb..3ba85ca 100644
---- a/hardware/CMakeLists.txt
-+++ b/hardware/CMakeLists.txt
-@@ -40,7 +40,7 @@ INCLUDE(reduceboardname)
- 
- ################################################################################
- # Set paths
--SET(OPLK_BASE_DIR ${CMAKE_SOURCE_DIR}/..)
-+SET(OPLK_BASE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/..)
- SET(OMETHLIB_BASE_DIR ${PROJECT_SOURCE_DIR}/drivers/openmac)
- SET(OMETHLIB_BUILD_DIR ${PROJECT_BINARY_DIR}/drivers/openmac)
- SET(HOSTIF_BASE_DIR ${PROJECT_SOURCE_DIR}/drivers/hostinterface)
-@@ -56,7 +56,7 @@ STRING(TOLOWER "${CMAKE_SYSTEM_PROCESSOR}" SYSTEM_PROCESSOR_DIR)
- 
- IF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
-   SET(CMAKE_INSTALL_PREFIX
--    ${CMAKE_SOURCE_DIR}/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR} CACHE PATH "openPOWERLINK hardware install prefix" FORCE
-+    ${CMAKE_CURRENT_SOURCE_DIR}/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR} CACHE PATH "openPOWERLINK hardware install prefix" FORCE
-     )
- ENDIF()
- 
-diff --git a/hardware/drivers/hostinterface/CMakeLists.txt b/hardware/drivers/hostinterface/CMakeLists.txt
-index 1a9d2aa..9c56c16 100644
---- a/hardware/drivers/hostinterface/CMakeLists.txt
-+++ b/hardware/drivers/hostinterface/CMakeLists.txt
-@@ -71,7 +71,7 @@ ELSE()
-     SET( HOSTIF_LIB_NAME "${HOSTIF_NAME}")
- ENDIF()
- 
--SET(BOARDS_COMMON_DIR ${CMAKE_SOURCE_DIR}/boards/${BOARD_NAME}/common)
-+SET(BOARDS_COMMON_DIR ${CMAKE_CURRENT_SOURCE_DIR}/boards/${BOARD_NAME}/common)
- SET(EXAMPLE_BINARY_DIR ${CMAKE_BINARY_DIR}/boards/${BOARD_NAME}/${EXAMPLE_NAME})
- 
- ########################################################################
-diff --git a/hardware/drivers/openmac/CMakeLists.txt b/hardware/drivers/openmac/CMakeLists.txt
-index 560c0d9..d532996 100644
---- a/hardware/drivers/openmac/CMakeLists.txt
-+++ b/hardware/drivers/openmac/CMakeLists.txt
-@@ -55,8 +55,8 @@ ELSE()
-     SET(OMETH_LIB_NAME "${OMETH_NAME}")
- ENDIF()
- 
--SET(BOARD_EXAMPLE_DIR ${CMAKE_SOURCE_DIR}/boards/${BOARD_NAME}/${EXAMPLE_NAME})
--SET(BOARDS_COMMON_DIR ${CMAKE_SOURCE_DIR}/boards/${BOARD_NAME}/common)
-+SET(BOARD_EXAMPLE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/boards/${BOARD_NAME}/${EXAMPLE_NAME})
-+SET(BOARDS_COMMON_DIR ${CMAKE_CURRENT_SOURCE_DIR}/boards/${BOARD_NAME}/common)
- SET(EXAMPLE_BINARY_DIR ${CMAKE_BINARY_DIR}/boards/${BOARD_NAME}/${EXAMPLE_NAME})
- 
- ########################################################################
-diff --git a/unittests/CMakeLists.txt b/unittests/CMakeLists.txt
-index 533d4e7..4460c2e 100644
---- a/unittests/CMakeLists.txt
-+++ b/unittests/CMakeLists.txt
-@@ -55,10 +55,10 @@ ENDMACRO(ADD_UNIT_TEST)
- 
- ################################################################################
- # Set general directories
--SET(OPLK_BASE_DIR ${CMAKE_SOURCE_DIR}/..)
-+SET(OPLK_BASE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/..)
- SET(OPLK_SOURCE_DIR ${OPLK_BASE_DIR}/stack/src)
- SET(OPLK_INCLUDE_DIR ${OPLK_BASE_DIR}/stack/include)
--SET(TEST_COMMON_SOURCE_DIR ${CMAKE_SOURCE_DIR}/common)
-+SET(TEST_COMMON_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/common)
- 
- # We need a oplkcfg.h file for compiling the sources
- # We are using the project for the complete MN library
--- 
-2.4.3
-
diff --git a/package/openpowerlink/0004-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch b/package/openpowerlink/0004-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch
deleted file mode 100644
index 3957cd1..0000000
--- a/package/openpowerlink/0004-Use-PROJECT_NAME-instead-of-CMAKE_PROJECT_NAME.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 7aace6a9d28b02c4325610255dc8afe198f02c4d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Wed, 12 Aug 2015 10:54:32 +0200
-Subject: [PATCH] Use PROJECT_NAME instead of CMAKE_PROJECT_NAME
-
-In order to support a top level CMakeLists.txt, use the current project
-name instead of the top level one.
-
-This patch has been submitted upstream:
-https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/57
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- apps/demo_cn_console/CMakeLists.txt             |  2 +-
- apps/demo_cn_console/linux.cmake                |  2 +-
- apps/demo_mn_console/CMakeLists.txt             |  4 ++--
- apps/demo_mn_console/linux.cmake                |  2 +-
- apps/demo_mn_qt/CMakeLists.txt                  |  4 ++--
- apps/demo_mn_qt/linux.cmake                     |  2 +-
- drivers/linux/drv_daemon_pcap/CMakeLists.txt    |  2 +-
- drivers/linux/drv_kernelmod_edrv/CMakeLists.txt | 10 +++++-----
- 8 files changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/apps/demo_cn_console/CMakeLists.txt b/apps/demo_cn_console/CMakeLists.txt
-index cd3b418..c5a47a8 100644
---- a/apps/demo_cn_console/CMakeLists.txt
-+++ b/apps/demo_cn_console/CMakeLists.txt
-@@ -112,6 +112,6 @@ TARGET_LINK_LIBRARIES(demo_cn_console ${ARCH_LIBRARIES})
- ################################################################################
- # Installation rules
- 
--INSTALL(TARGETS demo_cn_console RUNTIME DESTINATION ${CMAKE_PROJECT_NAME})
-+INSTALL(TARGETS demo_cn_console RUNTIME DESTINATION ${PROJECT_NAME})
- 
- 
-diff --git a/apps/demo_cn_console/linux.cmake b/apps/demo_cn_console/linux.cmake
-index 409bf11..76e381d 100644
---- a/apps/demo_cn_console/linux.cmake
-+++ b/apps/demo_cn_console/linux.cmake
-@@ -53,5 +53,5 @@ SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
- ################################################################################
- # Set architecture specific installation files
- 
--INSTALL(PROGRAMS ${TOOLS_DIR}/linux/set_prio DESTINATION ${CMAKE_PROJECT_NAME})
-+INSTALL(PROGRAMS ${TOOLS_DIR}/linux/set_prio DESTINATION ${PROJECT_NAME})
- 
-diff --git a/apps/demo_mn_console/CMakeLists.txt b/apps/demo_mn_console/CMakeLists.txt
-index 0c54a98..d8df68e 100644
---- a/apps/demo_mn_console/CMakeLists.txt
-+++ b/apps/demo_mn_console/CMakeLists.txt
-@@ -120,6 +120,6 @@ TARGET_LINK_LIBRARIES(demo_mn_console ${ARCH_LIBRARIES})
- ################################################################################
- # Installation rules
- 
--INSTALL(TARGETS demo_mn_console RUNTIME DESTINATION ${CMAKE_PROJECT_NAME})
--INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/mnobd.cdc DESTINATION ${CMAKE_PROJECT_NAME})
-+INSTALL(TARGETS demo_mn_console RUNTIME DESTINATION ${PROJECT_NAME})
-+INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/mnobd.cdc DESTINATION ${PROJECT_NAME})
- 
-diff --git a/apps/demo_mn_console/linux.cmake b/apps/demo_mn_console/linux.cmake
-index a9e9072..a994928 100644
---- a/apps/demo_mn_console/linux.cmake
-+++ b/apps/demo_mn_console/linux.cmake
-@@ -53,5 +53,5 @@ SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
- ################################################################################
- # Set architecture specific installation files
- 
--INSTALL(PROGRAMS ${TOOLS_DIR}/linux/set_prio DESTINATION ${CMAKE_PROJECT_NAME})
-+INSTALL(PROGRAMS ${TOOLS_DIR}/linux/set_prio DESTINATION ${PROJECT_NAME})
- 
-diff --git a/apps/demo_mn_qt/CMakeLists.txt b/apps/demo_mn_qt/CMakeLists.txt
-index ff3a9aa..282a9d8 100644
---- a/apps/demo_mn_qt/CMakeLists.txt
-+++ b/apps/demo_mn_qt/CMakeLists.txt
-@@ -161,5 +161,5 @@ TARGET_LINK_LIBRARIES(demo_mn_qt ${ARCH_LIBRARIES} ${QT_LIBRARIES})
- ################################################################################
- # Installation rules
- 
--INSTALL(TARGETS demo_mn_qt RUNTIME DESTINATION ${CMAKE_PROJECT_NAME})
--INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/mnobd.cdc DESTINATION ${CMAKE_PROJECT_NAME})
-+INSTALL(TARGETS demo_mn_qt RUNTIME DESTINATION ${PROJECT_NAME})
-+INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/mnobd.cdc DESTINATION ${PROJECT_NAME})
-diff --git a/apps/demo_mn_qt/linux.cmake b/apps/demo_mn_qt/linux.cmake
-index 6f19ff2..6ed75ee 100644
---- a/apps/demo_mn_qt/linux.cmake
-+++ b/apps/demo_mn_qt/linux.cmake
-@@ -45,5 +45,5 @@ SET(ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
- ################################################################################
- # Set architecture specific installation files
- 
--INSTALL(PROGRAMS ${TOOLS_DIR}/linux/set_prio DESTINATION ${CMAKE_PROJECT_NAME})
-+INSTALL(PROGRAMS ${TOOLS_DIR}/linux/set_prio DESTINATION ${PROJECT_NAME})
- 
-diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-index 9041e4d..2702abd 100644
---- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-+++ b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-@@ -136,5 +136,5 @@ SET_PROPERTY(TARGET ${EXE_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEB
- TARGET_LINK_LIBRARIES(${EXE_NAME} ${OPLKLIB} ${ARCH_LIBRARIES})
- 
- # add installation rules
--INSTALL(TARGETS ${EXE_NAME} RUNTIME DESTINATION ${CMAKE_PROJECT_NAME})
-+INSTALL(TARGETS ${EXE_NAME} RUNTIME DESTINATION ${PROJECT_NAME})
- 
-diff --git a/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt b/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
-index af85f86..59400c0 100644
---- a/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
-+++ b/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
-@@ -301,8 +301,8 @@ ADD_CUSTOM_TARGET(
- ################################################################################
- # add installation rules
- 
--INSTALL(FILES ${MODULE_OUTPUT_DIR}/${MODULE_NAME}.ko DESTINATION ${CMAKE_PROJECT_NAME})
--INSTALL(FILES ${TOOLS_DIR}/linux/50-openPOWERLINK.rules DESTINATION ${CMAKE_PROJECT_NAME})
--INSTALL(PROGRAMS ${TOOLS_DIR}/linux/plkload DESTINATION ${CMAKE_PROJECT_NAME})
--INSTALL(PROGRAMS ${TOOLS_DIR}/linux/plkunload DESTINATION ${CMAKE_PROJECT_NAME})
--INSTALL(PROGRAMS ${TOOLS_DIR}/linux/devices.txt DESTINATION ${CMAKE_PROJECT_NAME})
-+INSTALL(FILES ${MODULE_OUTPUT_DIR}/${MODULE_NAME}.ko DESTINATION ${PROJECT_NAME})
-+INSTALL(FILES ${TOOLS_DIR}/linux/50-openPOWERLINK.rules DESTINATION ${PROJECT_NAME})
-+INSTALL(PROGRAMS ${TOOLS_DIR}/linux/plkload DESTINATION ${PROJECT_NAME})
-+INSTALL(PROGRAMS ${TOOLS_DIR}/linux/plkunload DESTINATION ${PROJECT_NAME})
-+INSTALL(PROGRAMS ${TOOLS_DIR}/linux/devices.txt DESTINATION ${PROJECT_NAME})
--- 
-2.4.3
-
diff --git a/package/openpowerlink/0006-veth-avoid-kernel-header-issue-with-musl.patch b/package/openpowerlink/0004-veth-avoid-kernel-header-issue-with-musl.patch
similarity index 84%
rename from package/openpowerlink/0006-veth-avoid-kernel-header-issue-with-musl.patch
rename to package/openpowerlink/0004-veth-avoid-kernel-header-issue-with-musl.patch
index 383f047..a85b94e 100644
--- a/package/openpowerlink/0006-veth-avoid-kernel-header-issue-with-musl.patch
+++ b/package/openpowerlink/0004-veth-avoid-kernel-header-issue-with-musl.patch
@@ -1,4 +1,4 @@
-From 42a95209c5650662b86d222678ec14e7edfae156 Mon Sep 17 00:00:00 2001
+From 9cd93aeecbca62db278f2fe4a2c0a2f6fd04924b Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Wed, 25 May 2016 13:26:49 +0200
 Subject: [PATCH] veth: avoid kernel header issue with musl
@@ -16,7 +16,6 @@ http://autobuild.buildroot.org/results/2ca/2ca04bb046263e479e7597867b56469893d3c
 Upsteam status: pending
 https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/pull/120
 
-[Rebase on v2.2.2]
 [1] http://wiki.musl-libc.org/wiki/FAQ#Q:_why_am_i_getting_.22error:_redefinition_of_struct_ethhdr.2Ftcphdr.2Fetc.22_.3F
 [2] https://git.musl-libc.org/cgit/musl/tree/include/net/ethernet.h?h=v1.1.14#n35
 [3] https://git.musl-libc.org/cgit/musl/tree/include/net/ethernet.h?h=v1.1.14#n48
@@ -27,7 +26,7 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 6 insertions(+), 7 deletions(-)
 
 diff --git a/stack/src/kernel/veth/veth-linuxuser.c b/stack/src/kernel/veth/veth-linuxuser.c
-index 2a0bdd0..2bfaa87 100644
+index d70566c..ddcf950 100644
 --- a/stack/src/kernel/veth/veth-linuxuser.c
 +++ b/stack/src/kernel/veth/veth-linuxuser.c
 @@ -61,7 +61,6 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
@@ -51,14 +50,14 @@ index 2a0bdd0..2bfaa87 100644
  
      // replace the MAC address of the POWERLINK Ethernet interface with virtual
      // Ethernet MAC address before forwarding it into the virtual Ethernet interface
--    if (OPLK_MEMCMP(pFrameInfo_p->pFrame->aDstMac, vethInstance_l.macAdrs, ETHER_ADDR_LEN) == 0)
-+    if (OPLK_MEMCMP(pFrameInfo_p->pFrame->aDstMac, vethInstance_l.macAdrs, ETH_ALEN) == 0)
+-    if (OPLK_MEMCMP(pFrameInfo_p->frame.pBuffer->aDstMac, vethInstance_l.macAdrs, ETHER_ADDR_LEN) == 0)
++    if (OPLK_MEMCMP(pFrameInfo_p->frame.pBuffer->aDstMac, vethInstance_l.macAdrs, ETH_ALEN) == 0)
      {
--        OPLK_MEMCPY(pFrameInfo_p->pFrame->aDstMac, vethInstance_l.tapMacAdrs, ETHER_ADDR_LEN);
-+        OPLK_MEMCPY(pFrameInfo_p->pFrame->aDstMac, vethInstance_l.tapMacAdrs, ETH_ALEN);
+-        OPLK_MEMCPY(pFrameInfo_p->frame.pBuffer->aDstMac, vethInstance_l.tapMacAdrs, ETHER_ADDR_LEN);
++        OPLK_MEMCPY(pFrameInfo_p->frame.pBuffer->aDstMac, vethInstance_l.tapMacAdrs, ETH_ALEN);
      }
  
-     nwrite = write(vethInstance_l.fd, pFrameInfo_p->pFrame, pFrameInfo_p->frameSize);
+     nwrite = write(vethInstance_l.fd, pFrameInfo_p->frame.pBuffer, pFrameInfo_p->frameSize);
 @@ -302,7 +301,7 @@ to be used as a thread which does a blocking read in a while loop.
  //------------------------------------------------------------------------------
  static void* vethRecvThread(void* pArg_p)
@@ -84,7 +83,7 @@ index 2a0bdd0..2bfaa87 100644
 -                    OPLK_MEMCPY(&buffer[6], pInstance->macAdrs, ETHER_ADDR_LEN);
 +                    OPLK_MEMCPY(&buffer[6], pInstance->macAdrs, ETH_ALEN);
  
-                     frameInfo.pFrame = (tPlkFrame *)buffer;
+                     frameInfo.frame.pBuffer = (tPlkFrame *)buffer;
                      frameInfo.frameSize = nread;
 -- 
 2.5.5
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index 6b28be8..c879df1 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.2.2/
-md5	d7f2b08d332b36fed5427ebc5ec118f2	openPOWERLINK_V2.2.2.tar.gz
-sha1	f565c6a8e10ba320325d120f6030158f4c4278f8	openPOWERLINK_V2.2.2.tar.gz
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.4.0/
+md5	a833ca76a162db04a28c36ccecfd8a05	openPOWERLINK_V2.4.0.tar.gz
+sha1	d2260f7d1b7f264dd7a0323509bec233d36aed11	openPOWERLINK_V2.4.0.tar.gz
 # sha256 locally computed
-sha256	4de00eaf8af1ff3877bfa2e878a59989873406845fc8031bd6fc58cb1f7cf7e7	openPOWERLINK_V2.2.2.tar.gz
+#sha256	e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855	openPOWERLINK_V2.4.0.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index d9ceca4..3ac4ccb 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.2.2
+OPENPOWERLINK_VERSION = V2.4.0
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
@@ -30,6 +30,7 @@ OPENPOWERLINK_CONF_OPTS += \
 	-DCFG_COMPILE_LIB_MN=$(OPENPOWERLINK_MN_ONOFF) \
 	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
 	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_PCIEINTF=OFF \
 	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
 	-DCFG_COMPILE_LIB_CN=$(OPENPOWERLINK_CN_ONOFF) \
 	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
@@ -41,6 +42,7 @@ OPENPOWERLINK_CONF_OPTS += \
 	-DCFG_COMPILE_LIB_MN=OFF \
 	-DCFG_COMPILE_LIB_MNAPP_USERINTF=$(OPENPOWERLINK_MN_ONOFF) \
 	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_PCIEINTF=OFF \
 	-DCFG_COMPILE_LIB_MNDRV_PCAP=$(OPENPOWERLINK_MN_ONOFF) \
 	-DCFG_COMPILE_LIB_CN=OFF \
 	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(OPENPOWERLINK_CN_ONOFF) \
@@ -51,6 +53,7 @@ OPENPOWERLINK_CONF_OPTS += \
 	-DCFG_COMPILE_LIB_MN=OFF \
 	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
 	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=$(OPENPOWERLINK_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_MNAPP_PCIEINTF=OFF \
 	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
 	-DCFG_COMPILE_LIB_CN=OFF \
 	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
-- 
2.5.5
