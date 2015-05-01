From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  1 May 2015 17:35:58 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/openpowerlink2: new package
Message-ID: <1430494560-5196-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The openpowerlink2 package archive contains several cmake projects,
and each of them must be packaged separately in Buildroot.

"With version 2.0, the source code has been cleanly split into an
application-oriented user library and a time-critical stack driver."

This complicates the packaging but it help to refine the dependencies
compared to openpowerlink v1 build system.
(openpowerlink v1 require C++ only for the qt demo)

The generic openpowerlink2 package provide all sources files and
patches which are then used by other openpowerlink2-* packages
(sub-packages).
Doing this avoids patches duplication over all sub-packages.

All patches fixes several issues with the cmake build system.

For each sub-packages, the extract hook create a symlink to the
sources and the path to the cmake project is provided by *_SUBDIR
value.

There is one project for the EPL stack libraries wich provides:
 * an user space EPL stack to be linked into application
 * an user space EPL stack pcap daemon
 * an kernel space EPL library interface

There is two projects for EPL network driver:
 * pcap daemon driver
 * kernel module driver.

Note: On x86/x86_64 only few EPL ethernet driver are available for
the EPL kernel stack implementation:
 * Intel 82573
 * Intel 8255x
 * Intel I210
 * Realtek RTL-8111/8168 (new since V2.1.0)
 * Realtek RTL-8139

There are one project for each demo applications:
 * demo_cn_embedded
 * demo_mn_embedded
 * demo_cn_console
 * demo_mn_console
 * demo_mn_qt

Only demo_mn_console will be packaged in Buildroot for now.

This patch add the package for the stack libraries.

[1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: add a patch to install the stack libraries to "lib" subdirectory
    remove -DCMAKE_INSTALL_PREFIX="/usr/lib" from OPENPOWERLINK2_STACK_CONF_OPTS
---
 package/Config.in                                  |   1 +
 ...a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch | 153 +++++++++++++++++++++
 ...ink-demos-with-Debug-and-Release-librarie.patch | 116 ++++++++++++++++
 ...l-the-stack-libraries-to-lib-subdirectory.patch | 108 +++++++++++++++
 package/openpowerlink2/Config.in                   |  46 +++++++
 .../openpowerlink2/openpowerlink2-stack/Config.in  |  34 +++++
 .../openpowerlink2-stack/openpowerlink2-stack.mk   |  69 ++++++++++
 package/openpowerlink2/openpowerlink2.mk           |  17 +++
 8 files changed, 544 insertions(+)
 create mode 100644 package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
 create mode 100644 package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
 create mode 100644 package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
 create mode 100644 package/openpowerlink2/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-stack/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
 create mode 100644 package/openpowerlink2/openpowerlink2.mk

diff --git a/package/Config.in b/package/Config.in
index afa145e..17b466f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -384,6 +384,7 @@ endif
 	source "package/open2300/Config.in"
 	source "package/openocd/Config.in"
 	source "package/openpowerlink/Config.in"
+	source "package/openpowerlink2/Config.in"
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
diff --git a/package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch b/package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
new file mode 100644
index 0000000..62ae04b
--- /dev/null
+++ b/package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
@@ -0,0 +1,153 @@
+From 7f48aa5b0790882b308013199a30be2e14f97b06 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 23 Apr 2015 14:34:08 +0200
+Subject: [PATCH] [FIX] use a better regex for CMAKE_SYSTEM_PROCESSOR
+
+According to CMake doc, CMAKE_SYSTEM_PROCESSOR is set to the
+output of the command "uname -p" (in fact it is the output of "uname
+-m"). This is only true for native compilation.
+
+In the case of cross-compilation, the CMake code does not set anything,
+it just expects the CMAKE_SYSTEM_* variables to be set in the
+toolchain file.
+
+Add a test matching the patern "^i.86$" and keep the old one "x86" for
+compatibility.
+By doing that, factorize this test using "^(i.86|x86(_64)?)$".
+
+Thanks to Samuel Martin [1]
+[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112163.html
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ drivers/linux/drv_kernelmod_edrv/CMakeLists.txt         |    2 +-
+ stack/proj/linux/liboplkcn/CMakeLists.txt               |    2 +-
+ stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt |    2 +-
+ stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt   |    2 +-
+ stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt       |    2 +-
+ stack/proj/linux/liboplkmn/CMakeLists.txt               |    2 +-
+ stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt |    2 +-
+ stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt   |    2 +-
+ stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt       |    2 +-
+ 9 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt b/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
+index 2e0bc40..23c58f2 100644
+--- a/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
++++ b/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
+@@ -219,7 +219,7 @@ ELSE()
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${KERNEL_SOURCE_DIR}/timer/hrestimer-linuxkernel.c)
+ ENDIF()
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${COMMON_SOURCE_DIR}/ami/amix86.c)
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${COMMON_SOURCE_DIR}/ami/amile.c)
+diff --git a/stack/proj/linux/liboplkcn/CMakeLists.txt b/stack/proj/linux/liboplkcn/CMakeLists.txt
+index 4fb6801..0badff7 100644
+--- a/stack/proj/linux/liboplkcn/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcn/CMakeLists.txt
+@@ -65,7 +65,7 @@ SET (LIB_SOURCES
+      ${MEMMAP_NULL_SOURCES}
+      )
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_X86_SOURCES})
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_LE_SOURCES})
+diff --git a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
+index 823156e..8fa52b1 100644
+--- a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
+@@ -58,7 +58,7 @@ SET (LIB_SOURCES
+      ${MEMMAP_NULL_SOURCES}
+      )
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_X86_SOURCES})
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_LE_SOURCES})
+diff --git a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
+index b15b798..5fbe345 100644
+--- a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
+@@ -58,7 +58,7 @@ SET (LIB_SOURCES
+      ${MEMMAP_NULL_SOURCES}
+      )
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_X86_SOURCES})
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_LE_SOURCES})
+diff --git a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
+index bce75c4..c597747 100644
+--- a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
+@@ -54,7 +54,7 @@ SET (LIB_SOURCES
+      ${CIRCBUF_POSIX_SOURCES}
+      )
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_X86_SOURCES})
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_LE_SOURCES})
+diff --git a/stack/proj/linux/liboplkmn/CMakeLists.txt b/stack/proj/linux/liboplkmn/CMakeLists.txt
+index d6228ee..fcc751e 100644
+--- a/stack/proj/linux/liboplkmn/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmn/CMakeLists.txt
+@@ -66,7 +66,7 @@ SET (LIB_SOURCES
+      ${MEMMAP_NULL_SOURCES}
+      )
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_X86_SOURCES})
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_LE_SOURCES})
+diff --git a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
+index 94e5dc1..ba179cc 100644
+--- a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
+@@ -59,7 +59,7 @@ SET (LIB_SOURCES
+      ${MEMMAP_NULL_SOURCES}
+      )
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_X86_SOURCES})
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_LE_SOURCES})
+diff --git a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
+index fad7054..e01ff1d 100644
+--- a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
+@@ -59,7 +59,7 @@ SET (LIB_SOURCES
+      ${MEMMAP_NULL_SOURCES}
+      )
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_X86_SOURCES})
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_LE_SOURCES})
+diff --git a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
+index a08c23b..c46943f 100644
+--- a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
+@@ -54,7 +54,7 @@ SET (LIB_SOURCES
+      ${CIRCBUF_POSIX_SOURCES}
+      )
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_X86_SOURCES})
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(LIB_SOURCES ${LIB_SOURCES} ${ARCH_LE_SOURCES})
+-- 
+1.7.10.4
+
diff --git a/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch b/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
new file mode 100644
index 0000000..16602ac
--- /dev/null
+++ b/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
@@ -0,0 +1,116 @@
+From 545fc1d84a224093f7f79b5193aa3f7308f86b3a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 17 Sep 2014 13:45:19 +0200
+Subject: [PATCH] [FIX] Don't link demos with Debug and Release libraries
+
+This is acutualy used by Visual Studio:
+
+"When you create a Visual Studio Solution on Windows by CMake,
+the solution contains both Release and Debug build configurations.
+You can switch between them in Visual Studio.
+Therefore, you need both release and debug libraries."
+
+This patch break the build for Windows.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ apps/demo_cn_console/CMakeLists.txt  |    6 +++++-
+ apps/demo_cn_embedded/CMakeLists.txt |    6 +++++-
+ apps/demo_mn_console/CMakeLists.txt  |    6 +++++-
+ apps/demo_mn_embedded/CMakeLists.txt |    6 +++++-
+ apps/demo_mn_qt/CMakeLists.txt       |    6 +++++-
+ 5 files changed, 25 insertions(+), 5 deletions(-)
+
+diff --git a/apps/demo_cn_console/CMakeLists.txt b/apps/demo_cn_console/CMakeLists.txt
+index 2ba2bbd..4051bc8 100644
+--- a/apps/demo_cn_console/CMakeLists.txt
++++ b/apps/demo_cn_console/CMakeLists.txt
+@@ -105,8 +105,12 @@ SET_PROPERTY(TARGET demo_cn_console
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(demo_cn_console debug ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(demo_cn_console optimized ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(demo_cn_console optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(demo_cn_console ${ARCH_LIBRARIES})
+ 
+ ################################################################################
+diff --git a/apps/demo_cn_embedded/CMakeLists.txt b/apps/demo_cn_embedded/CMakeLists.txt
+index 0115981..8ea5a20 100644
+--- a/apps/demo_cn_embedded/CMakeLists.txt
++++ b/apps/demo_cn_embedded/CMakeLists.txt
+@@ -93,8 +93,12 @@ SET_PROPERTY(TARGET ${EXECUTABLE_NAME}
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} debug ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} ${ARCH_LIBRARIES})
+ 
+ ################################################################################
+diff --git a/apps/demo_mn_console/CMakeLists.txt b/apps/demo_mn_console/CMakeLists.txt
+index b517fbd..e232e87 100644
+--- a/apps/demo_mn_console/CMakeLists.txt
++++ b/apps/demo_mn_console/CMakeLists.txt
+@@ -116,8 +116,12 @@ ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/mnobd.cdc
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(demo_mn_console debug ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(demo_mn_console optimized ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(demo_mn_console optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(demo_mn_console ${ARCH_LIBRARIES})
+ 
+ ################################################################################
+diff --git a/apps/demo_mn_embedded/CMakeLists.txt b/apps/demo_mn_embedded/CMakeLists.txt
+index 388c803..b5d8bd4 100644
+--- a/apps/demo_mn_embedded/CMakeLists.txt
++++ b/apps/demo_mn_embedded/CMakeLists.txt
+@@ -107,8 +107,12 @@ ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/mnobd.cdc
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} debug ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} ${ARCH_LIBRARIES})
+ 
+ ################################################################################
+diff --git a/apps/demo_mn_qt/CMakeLists.txt b/apps/demo_mn_qt/CMakeLists.txt
+index f1abd28..1e06c14 100644
+--- a/apps/demo_mn_qt/CMakeLists.txt
++++ b/apps/demo_mn_qt/CMakeLists.txt
+@@ -152,8 +152,12 @@ ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/mnobd.cdc
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(demo_mn_qt debug ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(demo_mn_qt optimized ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(demo_mn_qt optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(demo_mn_qt ${ARCH_LIBRARIES} ${QT_LIBRARIES})
+ 
+ ################################################################################
+-- 
+1.7.10.4
+
diff --git a/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
new file mode 100644
index 0000000..9d68288
--- /dev/null
+++ b/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
@@ -0,0 +1,108 @@
+From e322ca01613f6a51f1465711c2f890a372053a30 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 1 May 2015 12:19:34 +0200
+Subject: [PATCH] [FIX] install the stack libraries to "lib" subdirectory
+
+Using '.' to install the stack libraries is not correct since
+it will install them to /usr/ when CMAKE_INSTALL_PREFIX is set
+to "/usr/".
+
+ls /usr/liboplkmnapp-kernelintf.so
+
+Fix this by using ${CMAKE_INSTALL_PREFIX}/lib instead of '.'
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ stack/proj/linux/liboplkcn/CMakeLists.txt               | 2 +-
+ stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt | 2 +-
+ stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt   | 2 +-
+ stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt       | 2 +-
+ stack/proj/linux/liboplkmn/CMakeLists.txt               | 2 +-
+ stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt | 2 +-
+ stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt   | 2 +-
+ stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt       | 2 +-
+ 8 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/stack/proj/linux/liboplkcn/CMakeLists.txt b/stack/proj/linux/liboplkcn/CMakeLists.txt
+index 0badff7..11e847e 100644
+--- a/stack/proj/linux/liboplkcn/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcn/CMakeLists.txt
+@@ -88,4 +88,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
+diff --git a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
+index 8fa52b1..fdab0d0 100644
+--- a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
+@@ -81,4 +81,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
+diff --git a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
+index 5fbe345..ad7dfe8 100644
+--- a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
+@@ -81,4 +81,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
+diff --git a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
+index c597747..167b441 100644
+--- a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
+@@ -78,4 +78,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
+diff --git a/stack/proj/linux/liboplkmn/CMakeLists.txt b/stack/proj/linux/liboplkmn/CMakeLists.txt
+index fcc751e..f707c05 100644
+--- a/stack/proj/linux/liboplkmn/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmn/CMakeLists.txt
+@@ -90,4 +90,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
+diff --git a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
+index ba179cc..4d23e2d 100644
+--- a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
+@@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
+diff --git a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
+index e01ff1d..eda68eb 100644
+--- a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
+@@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
+diff --git a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
+index c46943f..930660f 100644
+--- a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
+@@ -78,4 +78,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION ${CMAKE_INSTALL_PREFIX}/lib LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
+-- 
+1.9.3
+
diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
new file mode 100644
index 0000000..8e61a7d
--- /dev/null
+++ b/package/openpowerlink2/Config.in
@@ -0,0 +1,46 @@
+comment "openpowerlink2 needs a toolchain w/ threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+menuconfig BR2_PACKAGE_OPENPOWERLINK2
+	bool "openpowerlink2"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  openPOWERLINK2 is an Open Source Industrial Ethernet
+	  stack implementing the POWERLINK protocol for Managing Node
+	  (MN, POWERLINK Master) and Controlled Node (CN, POWERLINK Slave).
+
+	  It is provided by
+	  SYSTEC electronic (http://www.systec-electronic.com),
+	  B&R (http://www.br-automation.com) and
+	  Kalycito (http://www.kalycito.com).
+
+	  https://sourceforge.net/projects/openpowerlink/
+
+if BR2_PACKAGE_OPENPOWERLINK2
+
+choice
+	prompt "Select MN/CN mode"
+
+	config BR2_PACKAGE_OPENPOWERLINK2_MN
+	bool "MN"
+	help
+	  Enable Managing Node mode
+
+	config BR2_PACKAGE_OPENPOWERLINK2_CN
+	bool "CN"
+	help
+	  Enable Controlled Node mode
+
+endchoice
+
+source "package/openpowerlink2/openpowerlink2-stack/Config.in"
+
+config BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL
+	string "debug level for openpowerlink stack"
+	default "0xEC000000L"
+	help
+	  Debug level to be used for openPOWERLINK debugging functions.
+
+endif # BR2_PACKAGE_OPENPOWERLINK2
diff --git a/package/openpowerlink2/openpowerlink2-stack/Config.in b/package/openpowerlink2/openpowerlink2-stack/Config.in
new file mode 100644
index 0000000..c3ddf47
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-stack/Config.in
@@ -0,0 +1,34 @@
+
+choice
+	prompt "Select openPOWERLINK library type"
+
+config BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB
+	bool "the EPL stack is directly linked into application."
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Compile a monolithic openPOWERLINK library. The library contains
+	  an Ethernet driver which is using the PCAP library for accessing
+	  the network.
+
+config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
+	bool "build EPL stack as linux userspace pcap daemon."
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Compile openPOWERLINK application library which contains the
+	  interface to a Linux user space driver, and the Linux user space
+	  driver. It is used for implementing a multi-process solution
+	  where the openPOWERLINK kernel layer is running as a separate
+	  Linux user space daemon (e.g. a PCAP based user space daemon).
+
+config BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB
+	bool "build EPL stack as linux kernelspace module."
+	depends on BR2_LINUX_KERNEL # openpowerlink-kernel-driver
+	help
+	  Compile openPOWERLINK application library which contains the
+	  interface to a Linux kernel space driver. It is used together
+	  with a Linux kernel module openPOWERLINK driver.
+
+comment "openpowerlink kernel stack needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+endchoice
diff --git a/package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk b/package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
new file mode 100644
index 0000000..9fa2d63
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# openpowerlink2-stack
+#
+################################################################################
+
+OPENPOWERLINK2_STACK_VERSION = $(OPENPOWERLINK2_VERSION)
+
+OPENPOWERLINK2_STACK_LICENSE = $(OPENPOWERLINK2_LICENSE)
+OPENPOWERLINK2_STACK_LICENSE_FILES = $(OPENPOWERLINK2_LICENSE_FILES)
+
+# We want to use the same archive for all sub-packages.
+OPENPOWERLINK2_STACK_SOURCE =
+OPENPOWERLINK2_STACK_DEPENDENCIES = openpowerlink2
+
+define OPENPOWERLINK2_STACK_SYMLINK_TO_SRC_HOOK
+	ln -s $(OPENPOWERLINK2_DIR) $(OPENPOWERLINK2_STACK_DIR)/src
+endef
+
+OPENPOWERLINK2_STACK_POST_EXTRACT_HOOKS += OPENPOWERLINK2_STACK_SYMLINK_TO_SRC_HOOK
+
+OPENPOWERLINK2_STACK_SUBDIR = src/stack
+
+OPENPOWERLINK2_STACK_INSTALL_STAGING = YES
+
+OPENPOWERLINK2_STACK_CONF_OPTS = -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL))
+
+# All option are ON by default
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB),y)
+OPENPOWERLINK2_STACK_DEPENDENCIES += libpcap
+OPENPOWERLINK2_STACK_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=$(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF) \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
+	-DCFG_COMPILE_LIB_CN=$(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF) \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB),y)
+OPENPOWERLINK2_STACK_DEPENDENCIES += libpcap
+OPENPOWERLINK2_STACK_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=$(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF) \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=$(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF) \
+	-DCFG_COMPILE_LIB_CN=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF) \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF)
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB),y)
+OPENPOWERLINK2_STACK_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=$(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF) \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
+	-DCFG_COMPILE_LIB_CN=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=$(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF) \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+OPENPOWERLINK2_STACK_CONF_OPTS += -DCFG_COMPILE_SHARED_LIBRARY=NO
+else
+OPENPOWERLINK2_STACK_CONF_OPTS += -DCFG_COMPILE_SHARED_LIBRARY=YES
+endif
+
+$(eval $(cmake-package))
diff --git a/package/openpowerlink2/openpowerlink2.mk b/package/openpowerlink2/openpowerlink2.mk
new file mode 100644
index 0000000..82c4277
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# openpowerlink2
+#
+################################################################################
+
+OPENPOWERLINK2_VERSION = V2.1.1
+OPENPOWERLINK2_SITE = http://git.code.sf.net/p/openpowerlink/openPOWERLINK2
+OPENPOWERLINK2_SITE_METHOD = git
+OPENPOWERLINK2_LICENSE = BSD-2c, GPLv2
+OPENPOWERLINK2_LICENSE_FILES = license.md
+
+# Just extract the archive
+
+$(eval $(generic-package))
+
+include package/openpowerlink2/openpowerlink2-stack/openpowerlink2-stack.mk
-- 
1.9.3
