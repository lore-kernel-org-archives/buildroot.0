From: Romain Naour <romain.naour@openwide.fr>
Date: Fri,  7 Aug 2015 15:29:00 +0200
Subject: [Buildroot] [PATCHv3 1/4] package/openpowerlink: bump to v2.2.0
In-Reply-To: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
References: <1438954143-23533-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438954143-23533-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provide only the stack libraries due to
a build system refactoring. Kernel drivers, user space
daemon and demos application will be packaged separately.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v3: Add patch info about patches status
    bump to v2.2.0
    remove old openpowerlink stack (v1.8.5)
    Rename openpowerlin2 to openpowerlink
    fix build with musl toolchains
v2: switch to tar.gz archive
    add hash file
    merge openpowerlink2 and openpowerlink2-stack
    Add a new patch to install headers files
    add OPENPOWERLINK2_*_ONOFF
---
 ...a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch | 158 +++++++++++++++++++++
 ...a-better-regex-for-cmake-system-processor.patch |  89 ------------
 ...l-the-stack-libraries-to-lib-subdirectory.patch | 133 +++++++++++++++++
 ...-fix-user-space-stack-enable-shared-build.patch |  54 -------
 ...0003-FIX-cmake-install-oplk-headers-files.patch |  34 +++++
 ...-FIX-Fix-name-of-sched_priority-element-2.patch |  96 +++++++++++++
 .../0005-FIX-add-missing-header-sys-time.h.patch   |  47 ++++++
 package/openpowerlink/Config.in                    | 114 +++++----------
 package/openpowerlink/openpowerlink.hash           |   3 +
 package/openpowerlink/openpowerlink.mk             | 104 +++++++-------
 10 files changed, 562 insertions(+), 270 deletions(-)
 create mode 100644 package/openpowerlink/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
 delete mode 100644 package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
 create mode 100644 package/openpowerlink/0002-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
 delete mode 100644 package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch
 create mode 100644 package/openpowerlink/0003-FIX-cmake-install-oplk-headers-files.patch
 create mode 100644 package/openpowerlink/0004-FIX-Fix-name-of-sched_priority-element-2.patch
 create mode 100644 package/openpowerlink/0005-FIX-add-missing-header-sys-time.h.patch
 create mode 100644 package/openpowerlink/openpowerlink.hash

diff --git a/package/openpowerlink/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch b/package/openpowerlink/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
new file mode 100644
index 0000000..597f2ca
--- /dev/null
+++ b/package/openpowerlink/0001-FIX-use-a-better-regex-for-CMAKE_SYSTEM_PROCESSOR.patch
@@ -0,0 +1,158 @@
+From af32be7a321860310148d75bbe178fc9f19e31ed Mon Sep 17 00:00:00 2001
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
+Thanks to Samuel Martin [1].
+
+The issue has been reported [2] upstream an this patch will be merged
+for the next release.
+
+[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112163.html
+[2] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/#8f80/9f7c
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
+index 1f09b09..363a54e 100644
+--- a/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
++++ b/drivers/linux/drv_kernelmod_edrv/CMakeLists.txt
+@@ -228,7 +228,7 @@ ELSE()
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${KERNEL_SOURCE_DIR}/timer/hrestimer-linuxkernel.c)
+ ENDIF()
+ 
+-IF((CMAKE_SYSTEM_PROCESSOR MATCHES x86*) OR (CMAKE_SYSTEM_PROCESSOR MATCHES i686))
++IF(CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${COMMON_SOURCE_DIR}/ami/amix86.c)
+ ELSEIF(CMAKE_SYSTEM_PROCESSOR MATCHES arm*)
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${COMMON_SOURCE_DIR}/ami/amile.c)
+diff --git a/stack/proj/linux/liboplkcn/CMakeLists.txt b/stack/proj/linux/liboplkcn/CMakeLists.txt
+index ac4b595..b7c73e6 100644
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
+index 7887fce..6c3bec6 100644
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
+index 4df9d9d..fdf6fd4 100644
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
+index a48b9d6..440f02c 100644
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
+index bddcf9d..8f97144 100644
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
+index b0cabcc..df74265 100644
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
+index 369a46d..98835c7 100644
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
+index ca5c403..b4dd41b 100644
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
+2.4.3
+
diff --git a/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch b/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
deleted file mode 100644
index 6fd1990..0000000
--- a/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 9fd3aef2f9bb7a2b05b6823281bb5c988fa25149 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Mon, 17 Nov 2014 23:27:05 +0100
-Subject: [PATCH 1/2] [FIX] use a better regex for CMAKE_SYSTEM_PROCESSOR
-
-According to CMake doc, CMAKE_SYSTEM_PROCESSOR is set to the
-output of the command "uname -p" (in fact it is the output of "uname
--m"). This is only true for native compilation.
-
-In the case of cross-compilation, the CMake code does not set anything,
-it just expects the CMAKE_SYSTEM_* variables to be set in the
-toolchain file.
-
-Add a test matching the patern "^i.86$" and keep the old one "x86" for
-compatibility.
-By doing that, factorize this test using "^(i.86|x86(_64)?)$".
-
-Thanks to Samuel Martin [1]
-[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112163.html
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt         | 15 ++++-----------
- .../X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt  | 15 ++++-----------
- 2 files changed, 8 insertions(+), 22 deletions(-)
-
-diff --git a/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt b/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
-index 271ecdc..b49ef53 100644
---- a/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
-+++ b/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
-@@ -154,21 +154,14 @@ SET(MODULE_SOURCE_FILES
-     ${POWERLINK_SOURCE_DIR}/ObjDicts/${OBJDICT}/Objdict.c
- )
- 
--IF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
-+IF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
-     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
--
--ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL arm
--        OR CMAKE_SYSTEM_PROCESSOR STREQUAL armv7l)
-+ELSEIF (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "armv7l")
-     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amiarm.c)
--
--ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL i686
--    OR CMAKE_SYSTEM_PROCESSOR STREQUAL x86_64)
--    SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
--
--ELSE (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
-+ELSE (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
-     MESSAGE(FATAL_ERROR
-             "ami: CMAKE_SYSTEM_PROCESSOR is set to ${CMAKE_SYSTEM_PROCESSOR}. Valid targets are (x86, x86_64, arm, armv7l, i686).")
--ENDIF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
-+ENDIF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
- 
- SET(MODULE_FILE
-     ${MODULE_NAME}.ko
-diff --git a/Examples/X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt b/Examples/X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt
-index 1b47c76..f534a4d 100644
---- a/Examples/X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt
-+++ b/Examples/X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt
-@@ -171,21 +171,14 @@ ELSE(CFG_POWERLINK_EDRV STREQUAL "I210")
-     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/Target/X86/Linux/gnu/generic/TimerHighReskX86.c)
- ENDIF(CFG_POWERLINK_EDRV STREQUAL "I210")
- 
--IF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
-+IF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
-     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
--
--ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL arm
--        OR CMAKE_SYSTEM_PROCESSOR STREQUAL armv7l)
-+ELSEIF (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "armv7l")
-     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amiarm.c)
--
--ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL i686
--	OR CMAKE_SYSTEM_PROCESSOR STREQUAL x86_64)
--    SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
--
--ELSE (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
-+ELSE (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
-     MESSAGE(FATAL_ERROR
-             "ami: CMAKE_SYSTEM_PROCESSOR is set to ${CMAKE_SYSTEM_PROCESSOR}. Valid targets are (x86, x86_64, arm, armv7l, i686).")
--ENDIF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
-+ENDIF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
- 
- SET(MODULE_FILE
-     ${MODULE_NAME}.ko
--- 
-1.9.3
-
diff --git a/package/openpowerlink/0002-FIX-install-the-stack-libraries-to-lib-subdirectory.patch b/package/openpowerlink/0002-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
new file mode 100644
index 0000000..98ed007
--- /dev/null
+++ b/package/openpowerlink/0002-FIX-install-the-stack-libraries-to-lib-subdirectory.patch
@@ -0,0 +1,133 @@
+From 08ef3113a9fb5beb6e06bdbc9cb5c71bacb7441a Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 1 May 2015 12:19:34 +0200
+Subject: [PATCH] [FIX] install the stack libraries to "lib" subdirectory
+
+Using '.' to install the stack libraries is not correct since
+it will install them to /usr/.
+
+ls /usr/liboplkmnapp-kernelintf.so
+
+Fix this by using 'lib' instead of '.'
+
+The problem with the openpowerlink build system is that it expect
+the stack directory to be a "local staging" directory which
+contains headers and libraries. So the libraries build by the
+stack project are installed in stack/lib by default.
+
+This is wrong to do that because it becomes difficult to package
+openpowerlink for normal Linux systems.
+
+Buildroot like others build system expect from a packaged software
+to install libraries and headers build/provided in a staging
+directory.
+
+It seems that CMAKE_INSTALL_PREFIX is misused by the default value
+"${CMAKE_CURRENT_SOURCE_DIR}/lib/${SYSTEM_NAME_DIR}/${SYSTEM_PROCESSOR_DIR}"
+since it already contains the lib directory and therefore the
+entire build system is messed up.
+
+It seems that the openpowerlink's build system doesn't allow/support
+CMAKE_INSTALL_PREFIX to be set externally
+(which is the standard approach).
+
+The issue has been reported [1] upstream and a build system
+refactoring is needed to fix this properly.
+
+[1] http://sourceforge.net/p/openpowerlink/discussion/newbie/thread/3f13af65/#8f80/a50a/4649/f07c
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
+index b7c73e6..23e3112 100644
+--- a/stack/proj/linux/liboplkcn/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcn/CMakeLists.txt
+@@ -88,4 +88,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
+index 6c3bec6..a6f9271 100644
+--- a/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcnapp-kernelintf/CMakeLists.txt
+@@ -81,4 +81,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
+index fdf6fd4..6df8bb7 100644
+--- a/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcnapp-userintf/CMakeLists.txt
+@@ -81,4 +81,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
+index 440f02c..6ffcbe9 100644
+--- a/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
++++ b/stack/proj/linux/liboplkcndrv-pcap/CMakeLists.txt
+@@ -77,4 +77,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmn/CMakeLists.txt b/stack/proj/linux/liboplkmn/CMakeLists.txt
+index 8f97144..e29f795 100644
+--- a/stack/proj/linux/liboplkmn/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmn/CMakeLists.txt
+@@ -92,4 +92,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
+index df74265..2ba1cd1 100644
+--- a/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-kernelintf/CMakeLists.txt
+@@ -85,4 +85,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
+index 98835c7..12b3dc6 100644
+--- a/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmnapp-userintf/CMakeLists.txt
+@@ -85,4 +85,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+diff --git a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
+index b4dd41b..cf875ca 100644
+--- a/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
++++ b/stack/proj/linux/liboplkmndrv-pcap/CMakeLists.txt
+@@ -80,4 +80,4 @@ ADD_LIBRARY(${LIB_NAME} ${LIB_TYPE} ${LIB_SOURCES})
+ TARGET_LINK_LIBRARIES(${LIB_NAME} ${ARCH_LIBRARIES})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+ SET_PROPERTY(TARGET ${LIB_NAME} PROPERTY DEBUG_POSTFIX "_d")
+-INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION . LIBRARY DESTINATION .)
++INSTALL(TARGETS ${LIB_NAME} ARCHIVE DESTINATION lib LIBRARY DESTINATION lib)
+-- 
+2.4.3
+
diff --git a/package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch b/package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch
deleted file mode 100644
index 2345594..0000000
--- a/package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 9c11eef037dc1137ab7a4656e45afde7d1a615c4 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 22 Nov 2014 16:38:01 +0100
-Subject: [PATCH 2/2] [FIX]: user space stack: enable dynamic build
-
-The build fail if BUILD_SHARED_LIBS is set to ON.
-
-Depending on BUILD_SHARED_LIBS, link with STATIC or SHARED.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt b/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
-index 40b7756..27360f2 100644
---- a/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
-+++ b/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
-@@ -93,7 +93,13 @@ ENDIF(CFG_STORE_RESTORE)
- #
- # Set type of library
- #
--IF (WIN32)
-+IF (UNIX)
-+    IF (BUILD_SHARED_LIBS)
-+        SET(LIB_TYPE "SHARED")
-+    ELSE (BUILD_SHARED_LIBS)
-+        SET(LIB_TYPE "STATIC")
-+    ENDIF(BUILD_SHARED_LIBS)
-+ELSEIF (WIN32)
-     IF(CFG_X86_WINDOWS_DLL)
-         SET(LIB_TYPE "SHARED")
-     ELSE(CFG_X86_WINDOWS_DLL)
-@@ -313,7 +319,7 @@ ENDIF ()
- # Define library source code
- #
- IF (UNIX)
--    ADD_LIBRARY(powerlink ${LIB_SOURCES} ${LIB_SOURCES_KERNEL} ${LIB_SOURCES_USER} ${LIB_HEADERS} ${LIB_HEADERS_KERNEL} ${LIB_HEADERS_USER} ${LIB_OBJDICT})
-+    ADD_LIBRARY(powerlink ${LIB_TYPE} ${LIB_SOURCES} ${LIB_SOURCES_KERNEL} ${LIB_SOURCES_USER} ${LIB_HEADERS} ${LIB_HEADERS_KERNEL} ${LIB_HEADERS_USER} ${LIB_OBJDICT})
- 
-     SET_PROPERTY(TARGET powerlink
-                  PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
-@@ -330,7 +336,7 @@ ENDIF ()
- # Installation
- #
- IF (UNIX)
--    INSTALL(TARGETS powerlink ARCHIVE DESTINATION lib)
-+    INSTALL(TARGETS powerlink ARCHIVE DESTINATION lib LIBRARY DESTINATION lib COMPONENT library)
- ELSEIF (WIN32)
-     IF (CFG_X86_WINDOWS_DLL)
-         INSTALL(TARGETS openPOWERLINK RUNTIME DESTINATION bin)
--- 
-1.9.3
-
diff --git a/package/openpowerlink/0003-FIX-cmake-install-oplk-headers-files.patch b/package/openpowerlink/0003-FIX-cmake-install-oplk-headers-files.patch
new file mode 100644
index 0000000..5950986
--- /dev/null
+++ b/package/openpowerlink/0003-FIX-cmake-install-oplk-headers-files.patch
@@ -0,0 +1,34 @@
+From 3fe4bf46e395b7b2e87e91850fa638ed86670f41 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 4 May 2015 11:47:05 +0200
+Subject: [PATCH] [FIX] cmake: install oplk headers files
+
+In order to be able to link a third paries application
+with openpowerlink libraries, we need to install oplk
+headers files related to openpowerlink stack.
+
+Install all headers file from STACK_INCLUDE_DIR/oplk.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+v4: install only include/oplk directory
+---
+ stack/CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/stack/CMakeLists.txt b/stack/CMakeLists.txt
+index 9ff13f4..f4614cd 100644
+--- a/stack/CMakeLists.txt
++++ b/stack/CMakeLists.txt
+@@ -103,3 +103,8 @@ ELSEIF((CMAKE_SYSTEM_NAME STREQUAL "Generic") AND (CMAKE_SYSTEM_PROCESSOR STREQU
+ ELSE()
+     MESSAGE(FATAL_ERROR "Unknown Platform and processor combination ${CMAKE_SYSTEM_NAME} and ${CMAKE_SYSTEM_PROCESSOR}!!")
+ ENDIF()
++
++################################################################################
++# Install oplk headers files
++################################################################################
++INSTALL(DIRECTORY ${STACK_INCLUDE_DIR}/oplk DESTINATION "include")
+-- 
+2.4.3
+
diff --git a/package/openpowerlink/0004-FIX-Fix-name-of-sched_priority-element-2.patch b/package/openpowerlink/0004-FIX-Fix-name-of-sched_priority-element-2.patch
new file mode 100644
index 0000000..e7ad2c0
--- /dev/null
+++ b/package/openpowerlink/0004-FIX-Fix-name-of-sched_priority-element-2.patch
@@ -0,0 +1,96 @@
+From 476dd275076bfb313ca7b5f1a1de722548b24219 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 7 Aug 2015 14:45:30 +0200
+Subject: [PATCH] [FIX] Fix name of sched_priority element (2)
+
+commit 6212747994ff00c06d7285777ea194e725e62011 already
+removed __sched_priority but a merge between develop-2.1
+and develop-2.2 readded some of them.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ drivers/linux/drv_daemon_pcap/daemon.c                  | 4 ++--
+ stack/src/kernel/edrv/edrv-pcap_linux.c                 | 2 +-
+ stack/src/kernel/timer/hrestimer-posix.c                | 2 +-
+ stack/src/kernel/timer/hrestimer-posix_clocknanosleep.c | 2 +-
+ stack/src/user/event/eventucal-linuxioctl.c             | 4 ++--
+ 5 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/linux/drv_daemon_pcap/daemon.c b/drivers/linux/drv_daemon_pcap/daemon.c
+index c06caea..06e259b 100644
+--- a/drivers/linux/drv_daemon_pcap/daemon.c
++++ b/drivers/linux/drv_daemon_pcap/daemon.c
+@@ -142,11 +142,11 @@ int  main (int argc, char** argv)
+     {
+         DEBUG_LVL_ERROR_TRACE("%s() couldn't set nice value! (%s)\n", __func__, strerror(errno));
+     }
+-    schedParam.__sched_priority = MAIN_THREAD_PRIORITY;
++    schedParam.sched_priority = MAIN_THREAD_PRIORITY;
+     if (pthread_setschedparam(pthread_self(), SCHED_RR, &schedParam) != 0)
+     {
+         DEBUG_LVL_ERROR_TRACE("%s() couldn't set thread scheduling parameters! %d\n",
+-                              __func__, schedParam.__sched_priority);
++                              __func__, schedParam.sched_priority);
+     }
+ 
+ #ifdef SET_CPU_AFFINITY
+diff --git a/stack/src/kernel/edrv/edrv-pcap_linux.c b/stack/src/kernel/edrv/edrv-pcap_linux.c
+index 297c271..94e4dc1 100644
+--- a/stack/src/kernel/edrv/edrv-pcap_linux.c
++++ b/stack/src/kernel/edrv/edrv-pcap_linux.c
+@@ -198,7 +198,7 @@ tOplkError edrv_init(tEdrvInitParam* pEdrvInitParam_p)
+         return kErrorEdrvInit;
+     }
+ 
+-    schedParam.__sched_priority = CONFIG_THREAD_PRIORITY_MEDIUM;
++    schedParam.sched_priority = CONFIG_THREAD_PRIORITY_MEDIUM;
+     if (pthread_setschedparam(edrvInstance_l.hThread, SCHED_FIFO, &schedParam) != 0)
+     {
+         DEBUG_LVL_ERROR_TRACE("%s() couldn't set thread scheduling parameters!\n",
+diff --git a/stack/src/kernel/timer/hrestimer-posix.c b/stack/src/kernel/timer/hrestimer-posix.c
+index e236f42..8346e6f 100644
+--- a/stack/src/kernel/timer/hrestimer-posix.c
++++ b/stack/src/kernel/timer/hrestimer-posix.c
+@@ -171,7 +171,7 @@ tOplkError hrestimer_init(void)
+         return kErrorNoResource;
+     }
+ 
+-    schedParam.__sched_priority = CONFIG_THREAD_PRIORITY_HIGH;
++    schedParam.sched_priority = CONFIG_THREAD_PRIORITY_HIGH;
+     if (pthread_setschedparam(hresTimerInstance_l.threadId, SCHED_FIFO, &schedParam) != 0)
+     {
+         DEBUG_LVL_ERROR_TRACE("%s() Couldn't set thread scheduling parameters!\n", __func__);
+diff --git a/stack/src/kernel/timer/hrestimer-posix_clocknanosleep.c b/stack/src/kernel/timer/hrestimer-posix_clocknanosleep.c
+index d878049..2cf8e8f 100644
+--- a/stack/src/kernel/timer/hrestimer-posix_clocknanosleep.c
++++ b/stack/src/kernel/timer/hrestimer-posix_clocknanosleep.c
+@@ -191,7 +191,7 @@ tOplkError hrestimer_init(void)
+             return kErrorNoResource;
+         }
+ 
+-        schedParam.__sched_priority = CONFIG_THREAD_PRIORITY_HIGH;
++        schedParam.sched_priority = CONFIG_THREAD_PRIORITY_HIGH;
+         if (pthread_setschedparam(pTimerInfo->timerThreadId, SCHED_FIFO, &schedParam) != 0)
+         {
+             DEBUG_LVL_ERROR_TRACE("%s() Couldn't set thread scheduling parameters!\n", __func__);
+diff --git a/stack/src/user/event/eventucal-linuxioctl.c b/stack/src/user/event/eventucal-linuxioctl.c
+index d74e629..60698ac 100644
+--- a/stack/src/user/event/eventucal-linuxioctl.c
++++ b/stack/src/user/event/eventucal-linuxioctl.c
+@@ -145,11 +145,11 @@ tOplkError eventucal_init(void)
+     {
+         goto Exit;
+     }
+-    schedParam.__sched_priority = USER_EVENT_THREAD_PRIORITY;
++    schedParam.sched_priority = USER_EVENT_THREAD_PRIORITY;
+     if (pthread_setschedparam(instance_l.threadId, SCHED_FIFO, &schedParam) != 0)
+     {
+         DEBUG_LVL_ERROR_TRACE("%s(): couldn't set thread scheduling parameters! %d\n",
+-                              __func__, schedParam.__sched_priority);
++                              __func__, schedParam.sched_priority);
+     }
+ 
+ #if (defined(__GLIBC__) && __GLIBC__ >= 2 && __GLIBC_MINOR__ >= 12)
+-- 
+2.4.3
+
diff --git a/package/openpowerlink/0005-FIX-add-missing-header-sys-time.h.patch b/package/openpowerlink/0005-FIX-add-missing-header-sys-time.h.patch
new file mode 100644
index 0000000..5436c64
--- /dev/null
+++ b/package/openpowerlink/0005-FIX-add-missing-header-sys-time.h.patch
@@ -0,0 +1,47 @@
+From e225e4bde06f78a840eddffed4bc4955b8494f7e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Fri, 7 Aug 2015 14:58:22 +0200
+Subject: [PATCH] [FIX] add missing header sys/time.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+sys/time.h is missing when a musl based toolchain is used.
+
+Fixes:
+/stack/src/arch/linux/target-linux.c:118:21: error: storage size of ?timeout? isn?t known
+     struct  timeval timeout;
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ apps/common/src/system/system-linux.c | 1 +
+ stack/src/arch/linux/target-linux.c   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/apps/common/src/system/system-linux.c b/apps/common/src/system/system-linux.c
+index 7c3a643..81b14a2 100644
+--- a/apps/common/src/system/system-linux.c
++++ b/apps/common/src/system/system-linux.c
+@@ -47,6 +47,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include <errno.h>
+ #include <pthread.h>
+ #include <signal.h>
++#include <sys/time.h>
+ 
+ #include "system.h"
+ 
+diff --git a/stack/src/arch/linux/target-linux.c b/stack/src/arch/linux/target-linux.c
+index 4265b9e..595d4e9 100644
+--- a/stack/src/arch/linux/target-linux.c
++++ b/stack/src/arch/linux/target-linux.c
+@@ -43,6 +43,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #include <fcntl.h>
+ #include <signal.h>
+ #include <time.h>
++#include <sys/time.h>
+ 
+ #include <common/oplkinc.h>
+ #include <common/ftracedebug.h>
+-- 
+2.4.3
+
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index d87f8be..713fb83 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -1,14 +1,11 @@
-comment "openpowerlink needs a toolchain w/ C++, threads"
-	depends on BR2_USE_MMU
+comment "openpowerlink needs a toolchain w/ threads"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_OPENPOWERLINK
 	bool "openpowerlink"
-	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_USE_MMU # qt
 	help
 	  openPOWERLINK is an Open Source Industrial Ethernet
 	  stack implementing the POWERLINK protocol for Managing Node
@@ -19,100 +16,67 @@ config BR2_PACKAGE_OPENPOWERLINK
 	  B&R (http://www.br-automation.com) and
 	  Kalycito (http://www.kalycito.com).
 
-	  https://sourceforge.net/projects/openpowerlink/
+	  http://openpowerlink.sourceforge.net/web/
 
 if BR2_PACKAGE_OPENPOWERLINK
 
 choice
-	prompt "stack implementation"
-
-config BR2_PACKAGE_OPENPOWERLINK_LIBPCAP
-	bool "userspace stack"
-	select BR2_PACKAGE_LIBPCAP
-	help
-	  The Linux userspace implementation of the openPOWERLINK stack provides
-	  all functions for a software based POWERLINK solution running as Linux
-	  userspace application. The stack uses the libpcap library for accessing
-	  the network interface and is therefore totally independant of the used
-	  network card and driver.
-
-config BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
-	bool "kernel stack"
-	depends on BR2_LINUX_KERNEL
-	help
-	  The openPOWERLINK stack may be implemented as Linux kernel module.
-	  This solution provides the best performance, but is limited to the
-	  available openPOWERLINK network drivers.
-	  You may select BR2_PACKAGE_PCIUTILS for lscpi,
-	  and BR2_PACKAGE_PROCPS for ps command.
-	  These commands are used in EplLoad and EplUndload scripts.
-
-endchoice
-
-if BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
-
-choice
-	prompt "select Ethernet Powerlink Driver"
-
-config BR2_PACKAGE_OPENPOWERLINK_82573
-	bool "Intel 82573"
-
-config BR2_PACKAGE_OPENPOWERLINK_8255x
-	bool "Intel 8255x"
-
-config BR2_PACKAGE_OPENPOWERLINK_I210
-	bool "Intel I210"
-
-config BR2_PACKAGE_OPENPOWERLINK_RTL8139
-	bool "Realtek RTL-8139"
-
-endchoice
-
-endif
-
-choice
 	prompt "Select MN/CN mode"
 
 	config BR2_PACKAGE_OPENPOWERLINK_MN
 	bool "MN"
 	help
-	  Enable Managing Node mode
+	  Enable Managing Node (master) mode
 
 	config BR2_PACKAGE_OPENPOWERLINK_CN
 	bool "CN"
 	help
-	  Enable Controlled Node mode
+	  Enable Controlled Node (slave) mode
 
 endchoice
 
-menu "openpowerlink demos"
-
-config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE
-	bool "console MN demo"
-	depends on BR2_PACKAGE_OPENPOWERLINK_MN
+choice
+	prompt "Select openPOWERLINK library type"
 
-config BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT
-	bool "qt MN demo"
-	depends on BR2_PACKAGE_OPENPOWERLINK_MN
-	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_STL
+config BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB
+	bool "the EPL stack is directly linked into application."
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Compile a monolithic openPOWERLINK library. The library contains
+	  an Ethernet driver which is using the PCAP library for accessing
+	  the network. No kernel-side driver is needed.
 
-config BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE
-	bool "console CN demo"
-	depends on !BR2_PACKAGE_OPENPOWERLINK_MN
+config BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
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
+config BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
+	bool "build EPL stack as linux kernelspace module."
+	depends on BR2_LINUX_KERNEL # openpowerlink-kernel-driver
+	help
+	  Compile openPOWERLINK application library which contains the
+	  interface to a Linux kernel space driver. This will also build
+	  and install a Linux kernel module openPOWERLINK driver.
 
-config BR2_PACKAGE_OPENPOWERLINK_DEMO_LINUX_KERNEL
-	bool "kernel demo"
-	depends on BR2_PACKAGE_OPENPOWERLINK_KERNEL_MODULE
-	depends on BR2_PACKAGE_OPENPOWERLINK_MN
+comment "openpowerlink kernel stack needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
 
-endmenu
+endchoice
 
 config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 	string "debug level for openpowerlink stack"
 	default "0xEC000000L"
+	depends on BR2_ENABLE_DEBUG
 	help
 	  Debug level to be used for openPOWERLINK debugging functions.
+	  The bit field is defined in oplk/debug.h and allows to enable
+	  only debug trace on corresponding openpowerlink stack layers.
 
-endif
+endif # BR2_PACKAGE_OPENPOWERLINK
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
new file mode 100644
index 0000000..31aaa22
--- /dev/null
+++ b/package/openpowerlink/openpowerlink.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.2.0/
+md5	d3833cd7151f92c5a64adc61a32508a3	openPOWERLINK-V2.2.0.tar.gz
+sha1	84e52376704b5389dae50a83881d98f2e7b33e62	openPOWERLINK-V2.2.0.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index d9cdcdd..ced9fd6 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,67 +4,67 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V1.08.5
-OPENPOWERLINK_SITE = http://git.code.sf.net/p/openpowerlink/code
-OPENPOWERLINK_SITE_METHOD = git
+OPENPOWERLINK_VERSION = V2.2.0
+OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
+OPENPOWERLINK_SOURCE = openPOWERLINK-$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
-OPENPOWERLINK_LICENSE_FILES = license.txt
-OPENPOWERLINK_INSTALL_STAGING = YES
+OPENPOWERLINK_LICENSE_FILES = license.md
 
-OPENPOWERLINK_CONF_OPTS = -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
+OPENPOWERLINK_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
-#  use the user space stack (libpcap)
-OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=OFF
-OPENPOWERLINK_DEPENDENCIES = libpcap
-else
-# use the kernel stack
-OPENPOWERLINK_CONF_OPTS += \
-	-DCFG_KERNEL_STACK=ON \
-	-DCFG_KERNEL_DIR=$(LINUX_DIR) \
-	-DCMAKE_SYSTEM_VERSION=$(LINUX_VERSION)
-OPENPOWERLINK_DEPENDENCIES = linux
+# CFG_DEBUG_LVL is taken into account only in Debug
+ifeq ($(BR2_ENABLE_DEBUG),y)
+OPENPOWERLINK_CONF_OPTS = \
+	-DCFG_DEBUG_LVL="$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))"
 endif
 
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_82573),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=82573
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_8255x),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8255x
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_I210),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=I210
-else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_RTL8139),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_EDRV=8139
-endif
+define OPENPOWERLINK_EXTRACT_CMDS
+	$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
+		$(TAR) -C $($(PKG)_DIR) $(TAR_OPTIONS) - $($(PKG)_TAR_OPTIONS)
+endef
 
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_MN),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_MN=ON
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_POWERLINK_MN=OFF
-endif
+# Use the openPOWERLINK project which build the stack libraries.
+OPENPOWERLINK_SUBDIR = stack
 
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_CONSOLE),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_CONSOLE=ON
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_CONSOLE=OFF
-endif
+OPENPOWERLINK_MN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_MN),ON,OFF)
+OPENPOWERLINK_CN_ONOFF = $(if $(BR2_PACKAGE_OPENPOWERLINK_CN),ON,OFF)
 
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_MN_QT),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_QT=ON
-OPENPOWERLINK_DEPENDENCIES += qt
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_MN_QT=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_CN_CONSOLE),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_CN_CONSOLE=ON
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_CN_CONSOLE=OFF
+# All option are ON by default
+ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB),y)
+OPENPOWERLINK_DEPENDENCIES += libpcap
+OPENPOWERLINK_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=$(OPENPOWERLINK_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
+	-DCFG_COMPILE_LIB_CN=$(OPENPOWERLINK_CN_ONOFF) \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
+OPENPOWERLINK_DEPENDENCIES += libpcap
+OPENPOWERLINK_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=$(OPENPOWERLINK_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=$(OPENPOWERLINK_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_CN=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(OPENPOWERLINK_CN_ONOFF) \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(OPENPOWERLINK_CN_ONOFF)
+else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
+OPENPOWERLINK_CONF_OPTS += \
+	-DCFG_COMPILE_LIB_MN=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_MNAPP_KERNELINTF=$(OPENPOWERLINK_MN_ONOFF) \
+	-DCFG_COMPILE_LIB_MNDRV_PCAP=OFF \
+	-DCFG_COMPILE_LIB_CN=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
+	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=$(OPENPOWERLINK_CN_ONOFF) \
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENPOWERLINK_DEMO_LINUX_KERNEL),y)
-OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_LINUX_KERNEL=ON
-else
-OPENPOWERLINK_CONF_OPTS += -DCFG_X86_DEMO_LINUX_KERNEL=OFF
-endif
+OPENPOWERLINK_CONF_OPTS += \
+	-DCFG_COMPILE_SHARED_LIBRARY=$(if $(BR2_STATIC_LIBS),OFF,ON)
 
 $(eval $(cmake-package))
-- 
2.4.3
