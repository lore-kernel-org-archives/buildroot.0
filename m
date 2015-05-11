From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 11 May 2015 18:14:11 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/openpowerlink2: new package
In-Reply-To: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
References: <1431360854-18305-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1431360854-18305-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the package for the stack libraries.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: switch to tar.gz archive
    add hash file
    merge openpowerlink2 and openpowerlink2-stack
    Add a new patch to install headers files
    add OPENPOWERLINK2_*_ONOFF
---
 package/Config.in                                  |   1 +
 ...a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch | 153 +++++++++++++++++++++
 ...ink-demos-with-Debug-and-Release-librarie.patch | 124 +++++++++++++++++
 ...l-the-stack-libraries-to-lib-subdirectory.patch | 110 +++++++++++++++
 ...0004-FIX-cmake-install-oplk-headers-files.patch |  30 ++++
 package/openpowerlink2/Config.in                   |  82 +++++++++++
 package/openpowerlink2/openpowerlink2.hash         |   2 +
 package/openpowerlink2/openpowerlink2.mk           |  71 ++++++++++
 8 files changed, 573 insertions(+)
 create mode 100644 package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
 create mode 100644 package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
 create mode 100644 package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
 create mode 100644 package/openpowerlink2/0004-FIX-cmake-install-oplk-headers-files.patch
 create mode 100644 package/openpowerlink2/Config.in
 create mode 100644 package/openpowerlink2/openpowerlink2.hash
 create mode 100644 package/openpowerlink2/openpowerlink2.mk

diff --git a/package/Config.in b/package/Config.in
index af4d2b7..ad21925 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -386,6 +386,7 @@ endif
 	source "package/open2300/Config.in"
 	source "package/openocd/Config.in"
 	source "package/openpowerlink/Config.in"
+	source "package/openpowerlink2/Config.in"
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
diff --git a/package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch b/package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
new file mode 100644
index 0000000..487d9b7
--- /dev/null
+++ b/package/openpowerlink2/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
@@ -0,0 +1,153 @@
+From b386e36248909b3ee450ce37464d6379f7d782f7 Mon Sep 17 00:00:00 2001
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
+ drivers/linux/drv_kernelmod_edrv/CMakeLists.txt         | 2 +-
+ stack/proj/linux/liboplkcn/CMakeLists.txt               | 2 +-
+ stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt | 2 +-
+ stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt   | 2 +-
+ stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt       | 2 +-
+ stack/proj/linux/liboplkmn/CMakeLists.txt               | 2 +-
+ stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt | 2 +-
+ stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt   | 2 +-
+ stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt       | 2 +-
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
+1.9.3
+
diff --git a/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch b/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
new file mode 100644
index 0000000..5de036d
--- /dev/null
+++ b/package/openpowerlink2/0002-FIX-Don-t-link-demos-with-Debug-and-Release-librarie.patch
@@ -0,0 +1,124 @@
+From d2b8b405c2b1afde47c019efb1bc17c04bc7c86f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 17 Sep 2014 13:45:19 +0200
+Subject: [PATCH] [FIX] Don't link demos with Debug and Release libraries
+
+TARGET_LINK_LIBRARIES() will link only with the 'debug' libraries in debug mode
+and only with the 'optimized' libraries in any other mode, but CMake still
+checks if the libraries that you don't link with exist. That makes it impossible
+to release just an optimized library without debug library [1].
+
+Therefore, this patch provides an alternative way to distinguish between debug
+and optimized, with an explicit condition.
+
+Thanks to Arnout Vandecappelle [2] for the patch review and help.
+
+[1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/
+[2] http://lists.busybox.net/pipermail/buildroot/2015-May/127611.html
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+v2: take into acount Arnout's comments
+    remove redundant debug/optimized key word for TARGET_LINK_LIBRARIES
+    reword the commit log
+---
+ apps/demo_cn_console/CMakeLists.txt  | 6 +++++-
+ apps/demo_cn_embedded/CMakeLists.txt | 6 +++++-
+ apps/demo_mn_console/CMakeLists.txt  | 6 +++++-
+ apps/demo_mn_embedded/CMakeLists.txt | 6 +++++-
+ apps/demo_mn_qt/CMakeLists.txt       | 6 +++++-
+ 5 files changed, 25 insertions(+), 5 deletions(-)
+
+diff --git a/apps/demo_cn_console/CMakeLists.txt b/apps/demo_cn_console/CMakeLists.txt
+index 2ba2bbd..aef4e6c 100644
+--- a/apps/demo_cn_console/CMakeLists.txt
++++ b/apps/demo_cn_console/CMakeLists.txt
+@@ -105,8 +105,12 @@ SET_PROPERTY(TARGET demo_cn_console
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(demo_cn_console ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(demo_cn_console ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(demo_cn_console optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(demo_cn_console ${ARCH_LIBRARIES})
+ 
+ ################################################################################
+diff --git a/apps/demo_cn_embedded/CMakeLists.txt b/apps/demo_cn_embedded/CMakeLists.txt
+index 0115981..dac24be 100644
+--- a/apps/demo_cn_embedded/CMakeLists.txt
++++ b/apps/demo_cn_embedded/CMakeLists.txt
+@@ -93,8 +93,12 @@ SET_PROPERTY(TARGET ${EXECUTABLE_NAME}
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} ${ARCH_LIBRARIES})
+ 
+ ################################################################################
+diff --git a/apps/demo_mn_console/CMakeLists.txt b/apps/demo_mn_console/CMakeLists.txt
+index b517fbd..0e35a35 100644
+--- a/apps/demo_mn_console/CMakeLists.txt
++++ b/apps/demo_mn_console/CMakeLists.txt
+@@ -116,8 +116,12 @@ ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/mnobd.cdc
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(demo_mn_console ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(demo_mn_console ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(demo_mn_console optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(demo_mn_console ${ARCH_LIBRARIES})
+ 
+ ################################################################################
+diff --git a/apps/demo_mn_embedded/CMakeLists.txt b/apps/demo_mn_embedded/CMakeLists.txt
+index 388c803..4176336 100644
+--- a/apps/demo_mn_embedded/CMakeLists.txt
++++ b/apps/demo_mn_embedded/CMakeLists.txt
+@@ -107,8 +107,12 @@ ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/mnobd.cdc
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} ${ARCH_LIBRARIES})
+ 
+ ################################################################################
+diff --git a/apps/demo_mn_qt/CMakeLists.txt b/apps/demo_mn_qt/CMakeLists.txt
+index f1abd28..b2247c8 100644
+--- a/apps/demo_mn_qt/CMakeLists.txt
++++ b/apps/demo_mn_qt/CMakeLists.txt
+@@ -152,8 +152,12 @@ ADD_CUSTOM_COMMAND(OUTPUT ${CMAKE_BINARY_DIR}/mnobd.cdc
+ 
+ ################################################################################
+ # Libraries to link
++IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
++    TARGET_LINK_LIBRARIES(demo_mn_qt ${OPLKLIB_DEBUG})
++ELSE ()
++    TARGET_LINK_LIBRARIES(demo_mn_qt ${OPLKLIB})
++ENDIF()
+ 
+-TARGET_LINK_LIBRARIES(demo_mn_qt optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+ TARGET_LINK_LIBRARIES(demo_mn_qt ${ARCH_LIBRARIES} ${QT_LIBRARIES})
+ 
+ ################################################################################
+-- 
+1.9.3
+
diff --git a/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
new file mode 100644
index 0000000..99a7f5f
--- /dev/null
+++ b/package/openpowerlink2/0003-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
@@ -0,0 +1,110 @@
+From d3f5e3b671efba4c1e94f932182ea8ed765b9ae5 Mon Sep 17 00:00:00 2001
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
+Fix this by using lib instead of '.'
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+v2: remove useless CMAKE_INSTALL_PREFIX (Arnout Vandecappelle)
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
+index 0badff7..2464bfd 100644
+--- a/stack/proj/linux/liboplkcn/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcn/CMakeLists.txt
+@@ -88,4 +88,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
+index 8fa52b1..b45ef0b 100644
+--- a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
+@@ -81,4 +81,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
+index 5fbe345..4ad302e 100644
+--- a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
+@@ -81,4 +81,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
+index c597747..53c097c 100644
+--- a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
+@@ -78,4 +78,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmn/CMakeLists.txt b/stack/proj/linux/liboplkmn/CMakeLists.txt
+index fcc751e..6f6617d 100644
+--- a/stack/proj/linux/liboplkmn/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmn/CMakeLists.txt
+@@ -90,4 +90,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
+index ba179cc..6ba1fa1 100644
+--- a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
+@@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
+index e01ff1d..594fc66 100644
+--- a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
+@@ -83,4 +83,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
+index c46943f..4375905 100644
+--- a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
+@@ -78,4 +78,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+-- 
+1.9.3
+
diff --git a/package/openpowerlink2/0004-FIX-cmake-install-oplk-headers-files.patch b/package/openpowerlink2/0004-FIX-cmake-install-oplk-headers-files.patch
new file mode 100644
index 0000000..405a596
--- /dev/null
+++ b/package/openpowerlink2/0004-FIX-cmake-install-oplk-headers-files.patch
@@ -0,0 +1,30 @@
+From fa83d1badcc0923a8de524a98bb2c0ded12f181c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 4 May 2015 11:47:05 +0200
+Subject: [PATCH] [FIX]cmake: install oplk headers files
+
+In order to be able to link a third paries application
+with openpowerlink libraries, we also needs to install oplk
+headers files.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ stack/CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/stack/CMakeLists.txt b/stack/CMakeLists.txt
+index f3c6a76..c1577e5 100644
+--- a/stack/CMakeLists.txt
++++ b/stack/CMakeLists.txt
+@@ -103,3 +103,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
+ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQUAL "zynqarm"))
+     INCLUDE(cmake/options-zynqarm.cmake)
+ ENDIF()
++
++################################################################################
++# Install oplk headers files
++################################################################################
++INSTALL(DIRECTORY ${STACK_INCLUDE_DIR}/oplk DESTINATION "include")
+-- 
+1.9.3
+
diff --git a/package/openpowerlink2/Config.in b/package/openpowerlink2/Config.in
new file mode 100644
index 0000000..757615f
--- /dev/null
+++ b/package/openpowerlink2/Config.in
@@ -0,0 +1,82 @@
+comment "openpowerlink2 needs a toolchain w/ threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_OPENPOWERLINK2
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
+	  http://openpowerlink.sourceforge.net/web/
+
+if BR2_PACKAGE_OPENPOWERLINK2
+
+choice
+	prompt "Select MN/CN mode"
+
+	config BR2_PACKAGE_OPENPOWERLINK2_MN
+	bool "MN"
+	help
+	  Enable Managing Node (master) mode
+
+	config BR2_PACKAGE_OPENPOWERLINK2_CN
+	bool "CN"
+	help
+	  Enable Controlled Node (slave) mode
+
+endchoice
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
+	  the network. No kernel-side driver is needed.
+
+config BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB
+	bool "build EPL stack as linux userspace pcap daemon."
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Compile openPOWERLINK application library which contains the
+	  interface to a Linux user space driver, and the Linux user space
+	  driver. It is used for implementing a multi-process solution
+	  where the openPOWERLINK layer is running as a separate
+	  Linux user space daemon (i.e. a PCAP based user space daemon).
+	  No kernel-side stack is needed.
+
+config BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB
+	bool "build EPL stack as linux kernelspace module."
+	depends on BR2_LINUX_KERNEL # openpowerlink-kernel-driver
+	help
+	  Compile openPOWERLINK application library which contains the
+	  interface to a Linux kernel space driver. This will also build
+	  and install a Linux kernel module openPOWERLINK driver.
+
+comment "openpowerlink kernel stack needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+endchoice
+
+config BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL
+	string "debug level for openpowerlink stack"
+	default "0xEC000000L"
+	depends on BR2_ENABLE_DEBUG
+	help
+	  Debug level to be used for openPOWERLINK debugging functions.
+	  The bit field is defined in oplk/debug.h and allows to enable
+	  only debug trace on corresponding openpowerlink stack layers.
+
+endif # BR2_PACKAGE_OPENPOWERLINK2
diff --git a/package/openpowerlink2/openpowerlink2.hash b/package/openpowerlink2/openpowerlink2.hash
new file mode 100644
index 0000000..5958a2b
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.1.1/openPOWERLINK-V2.1.1.tar.gz.md5
+md5	13117a5886fb36764d17af9c989552a9	openPOWERLINK-V2.1.1.tar.gz
diff --git a/package/openpowerlink2/openpowerlink2.mk b/package/openpowerlink2/openpowerlink2.mk
new file mode 100644
index 0000000..ea3afa7
--- /dev/null
+++ b/package/openpowerlink2/openpowerlink2.mk
@@ -0,0 +1,71 @@
+################################################################################
+#
+# openpowerlink2
+#
+################################################################################
+
+OPENPOWERLINK2_VERSION = V2.1.1
+OPENPOWERLINK2_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK2_VERSION)
+OPENPOWERLINK2_SOURCE = openPOWERLINK-$(OPENPOWERLINK2_VERSION).tar.gz
+OPENPOWERLINK2_LICENSE = BSD-2c, GPLv2
+OPENPOWERLINK2_LICENSE_FILES = license.md
+
+OPENPOWERLINK2_INSTALL_STAGING = YES
+
+# CFG_DEBUG_LVL is taken into account only in Debug
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK2_CONF_OPTS = \
+	-DCFG_DEBUG_LVL="$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK2_DEBUG_LEVEL))"
+endif
+
+define OPENPOWERLINK2_EXTRACT_CMDS
+	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
+endef
+
+# Use the openPOWERLINK project which build the stack libraries.
+OPENPOWERLINK2_SUBDIR = stack
+
+OPENPOWERLINK2_MN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK2_MN),ON,OFF)
+OPENPOWERLINK2_CN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK2_CN),ON,OFF)
+
+# All option are ON by default
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_MONOLITHIC_USER_STACK_LIB),y)
+OPENPOWERLINK2_DEPENDENCIES += libpcap
+OPENPOWERLINK2_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=$(OPENPOWERLINK2_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
+	-DCFG_COMPILE_LIB_CN=$(OPENPOWERLINK2_CN_ONOFF) \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_USERSPACE_DAEMON_LIB),y)
+OPENPOWERLINK2_DEPENDENCIES += libpcap
+OPENPOWERLINK2_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=$(OPENPOWERLINK2_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=$(OPENPOWERLINK2_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_CN=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(OPENPOWERLINK2_CN_ONOFF) \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(OPENPOWERLINK2_CN_ONOFF)
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK2_STACK_KERNEL_STACK_LIB),y)
+OPENPOWERLINK2_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=$(OPENPOWERLINK2_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
+	-DCFG_COMPILE_LIB_CN=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=$(OPENPOWERLINK2_CN_ONOFF) \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
+endif
+
+OPENPOWERLINK2_CONF_OPTS += \
+	-DCFG_COMPILE_SHARED_LIBRARY=$(if $(BR2_STATIC_LIBS),OFF,ON)
+
+$(eval $(cmake-package))
+
-- 
1.9.3
