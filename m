From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 28 May 2017 00:51:19 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: use pcap-config to fix
	static linking with libpcap
Message-ID: <20170527225119.26015-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When linking demo_mn_console statically with pcap, the CMake build
system forget to link with other libraries linked with libpcap
(-lnl-genl-3 -lnl-3 -ldbus-1 -pthread).

[100%] Linking C executable demo_mn_console
lib64/libpcap.a(pcap-linux.o): In function nl80211_init': pcap-linux.c:(.text+0x41e): undefined reference tonl_socket_alloc'

To fix this, the build system could use pcap-config:
pcap-config --libs --static
-L/path/to/sysroot/usr/lib -lpcap -L/path/to/sysroot/usr/lib/.libs
-lnl-genl-3 -lnl-3 -L/path/to/sysroot/usr/lib -ldbus-1 -pthread

Also don't use getopt() from contrib directory to avoid a clash with
libc definition.

Fixes:
http://autobuild.buildroot.net/results/f43/f437d09ac6c689c911e1885b95da33b692f2cb3c
http://autobuild.buildroot.net/results/385/3859dc0f4de7e3284a96d5841f040f69f71842df
https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/issues/187

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...04-FIX-use-contrib-getopt-only-on-Windows.patch | 102 +++++++++++++
 ...p-config-to-fix-static-linking-with-libpc.patch | 166 +++++++++++++++++++++
 package/openpowerlink/openpowerlink.mk             |   6 +-
 3 files changed, 272 insertions(+), 2 deletions(-)
 create mode 100644 package/openpowerlink/0004-FIX-use-contrib-getopt-only-on-Windows.patch
 create mode 100644 package/openpowerlink/0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch

diff --git a/package/openpowerlink/0004-FIX-use-contrib-getopt-only-on-Windows.patch b/package/openpowerlink/0004-FIX-use-contrib-getopt-only-on-Windows.patch
new file mode 100644
index 0000000..2edf9f2
--- /dev/null
+++ b/package/openpowerlink/0004-FIX-use-contrib-getopt-only-on-Windows.patch
@@ -0,0 +1,102 @@
+From d05273e65657d82e44fb7bd91a8fba0ba990ff2c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 27 May 2017 23:51:41 +0200
+Subject: [PATCH] [FIX] use contrib getopt() only on Windows
+
+Otherwise, contrib getopt will clash with the one from the libc when
+building statically.
+
+lib64/libc.a(getopt.os):(.data+0x8): multiple definition of `optind'
+CMakeFiles/demo_mn_console.dir/__/__/contrib/getopt/getopt.c.o:(.data+0x8): first defined here
+lib64/libc.a(getopt.os):(.data+0x4): multiple definition of `opterr'
+CMakeFiles/demo_mn_console.dir/__/__/contrib/getopt/getopt.c.o:(.data+0xc): first defined here
+/lib64/libc.a(getopt.os): In function `__GI_getopt':
+getopt.c:(.text+0x76e): multiple definition of `getopt'
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ apps/demo_cn_console/CMakeLists.txt | 2 +-
+ apps/demo_cn_console/src/main.c     | 6 ++++++
+ apps/demo_mn_console/CMakeLists.txt | 2 +-
+ apps/demo_mn_console/src/main.c     | 6 ++++++
+ 4 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/apps/demo_cn_console/CMakeLists.txt b/apps/demo_cn_console/CMakeLists.txt
+index a3a80bb..5733213 100644
+--- a/apps/demo_cn_console/CMakeLists.txt
++++ b/apps/demo_cn_console/CMakeLists.txt
+@@ -61,7 +61,6 @@ SET(DEMO_SOURCES
+     ${COMMON_SOURCE_DIR}/eventlog/eventlog.c
+     ${COMMON_SOURCE_DIR}/eventlog/eventlogstring.c
+     ${CONTRIB_SOURCE_DIR}/console/printlog.c
+-    ${CONTRIB_SOURCE_DIR}/getopt/getopt.c
+     )
+ 
+ INCLUDE_DIRECTORIES(
+@@ -114,6 +113,7 @@ ENDIF (CFG_KERNEL_STACK_DIRECTLINK)
+ IF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
+     include(linux.cmake)
+ ELSEIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
++    SET(DEMO_SOURCES ${DEMO_SOURCES} ${CONTRIB_SOURCE_DIR}/getopt/getopt.c)
+     include (windows.cmake)
+ ELSE()
+     MESSAGE(FATAL_ERROR "System ${CMAKE_SYSTEM_NAME} is not supported!")
+diff --git a/apps/demo_cn_console/src/main.c b/apps/demo_cn_console/src/main.c
+index c630586..9406473 100644
+--- a/apps/demo_cn_console/src/main.c
++++ b/apps/demo_cn_console/src/main.c
+@@ -50,7 +50,13 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+ #include <system/system.h>
+ #include <obdcreate/obdcreate.h>
++
++#if (TARGET_SYSTEM == _WIN32_)
+ #include <getopt/getopt.h>
++#else
++#include <unistd.h>
++#endif
++
+ #include <console/console.h>
+ #include <eventlog/eventlog.h>
+ 
+diff --git a/apps/demo_mn_console/CMakeLists.txt b/apps/demo_mn_console/CMakeLists.txt
+index 9c3378c..a81c4b3 100644
+--- a/apps/demo_mn_console/CMakeLists.txt
++++ b/apps/demo_mn_console/CMakeLists.txt
+@@ -67,7 +67,6 @@ SET(DEMO_SOURCES
+     ${COMMON_SOURCE_DIR}/eventlog/eventlog.c
+     ${COMMON_SOURCE_DIR}/eventlog/eventlogstring.c
+     ${CONTRIB_SOURCE_DIR}/console/printlog.c
+-    ${CONTRIB_SOURCE_DIR}/getopt/getopt.c
+     )
+ 
+ INCLUDE_DIRECTORIES(
+@@ -129,6 +128,7 @@ ENDIF()
+ IF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
+     include(linux.cmake)
+ ELSEIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
++    SET(DEMO_SOURCES ${DEMO_SOURCES} ${CONTRIB_SOURCE_DIR}/getopt/getopt.c)
+     include (windows.cmake)
+ ELSE()
+     MESSAGE(FATAL_ERROR "System ${CMAKE_SYSTEM_NAME} is not supported!")
+diff --git a/apps/demo_mn_console/src/main.c b/apps/demo_mn_console/src/main.c
+index 12d9be0..194e446 100644
+--- a/apps/demo_mn_console/src/main.c
++++ b/apps/demo_mn_console/src/main.c
+@@ -50,7 +50,13 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ 
+ #include <system/system.h>
+ #include <obdcreate/obdcreate.h>
++
++#if (TARGET_SYSTEM == _WIN32_)
+ #include <getopt/getopt.h>
++#else
++#include <unistd.h>
++#endif
++
+ #include <console/console.h>
+ #include <eventlog/eventlog.h>
+ 
+-- 
+2.9.4
+
diff --git a/package/openpowerlink/0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch b/package/openpowerlink/0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch
new file mode 100644
index 0000000..091f18c
--- /dev/null
+++ b/package/openpowerlink/0005-FIX-use-pcap-config-to-fix-static-linking-with-libpc.patch
@@ -0,0 +1,166 @@
+From 406e1759dc6a4c18f6a38c3d7571aacb177487c6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 28 May 2017 00:25:11 +0200
+Subject: [PATCH] [FIX]: use pcap-config to fix static linking with libpcap
+
+When linking demo_mn_console statically with pcap, the CMake build
+system forget to link with other libraries linked with libpcap
+(-lnl-genl-3 -lnl-3 -ldbus-1 -pthread).
+
+[100%] Linking C executable demo_mn_console
+lib64/libpcap.a(pcap-linux.o): In function nl80211_init': pcap-linux.c:(.text+0x41e): undefined reference tonl_socket_alloc'
+
+To fix this, the build system could use pcap-config:
+pcap-config --libs --static
+-L/path/to/sysroot/usr/lib -lpcap -L/path/to/sysroot/usr/lib/.libs
+-lnl-genl-3 -lnl-3 -L/path/to/sysroot/usr/lib -ldbus-1 -pthread
+
+Fixes:
+http://autobuild.buildroot.net/results/f43/f437d09ac6c689c911e1885b95da33b692f2cb3c
+http://autobuild.buildroot.net/results/385/3859dc0f4de7e3284a96d5841f040f69f71842df
+https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/issues/187
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ apps/demo_cn_console/linux.cmake             | 20 ++++++++++++++++++++
+ apps/demo_mn_console/linux.cmake             | 20 ++++++++++++++++++++
+ apps/demo_mn_qt/linux.cmake                  | 22 +++++++++++++++++++++-
+ drivers/linux/drv_daemon_pcap/CMakeLists.txt | 22 +++++++++++++++++++++-
+ 4 files changed, 82 insertions(+), 2 deletions(-)
+
+diff --git a/apps/demo_cn_console/linux.cmake b/apps/demo_cn_console/linux.cmake
+index 1c6f51c..7752917 100644
+--- a/apps/demo_cn_console/linux.cmake
++++ b/apps/demo_cn_console/linux.cmake
+@@ -46,8 +46,28 @@ SET (DEMO_ARCH_SOURCES
+ ################################################################################
+ # Set architecture specific libraries
+ 
++IF (NOT CFG_COMPILE_SHARED_LIBRARY)
++    SET(PCAP_CONFIG_OPTS --static)
++ENDIF()
++
+ IF (CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
++
++find_program(PCAP_CONFIG  NAMES pcap-config PATHS)
++
++if (PCAP_CONFIG)
++    message (STATUS "Looking for pcap-config... ${PCAP_CONFIG}")
++
++    execute_process (COMMAND ${PCAP_CONFIG} --libs ${PCAP_CONFIG_OPTS}
++        OUTPUT_VARIABLE PCAP_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
++    execute_process (COMMAND ${PCAP_CONFIG} --cflags ${PCAP_CONFIG_OPTS}
++        OUTPUT_VARIABLE PCAP_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
++
++   SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} ${PCAP_LDFLAGS})
++else (PCAP_CONFIG)
++    message (STATUS "pcap-config not found, using defaults...")
+     SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
++endif (PCAP_CONFIG)
++
+ ENDIF (CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
+ SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
+ 
+diff --git a/apps/demo_mn_console/linux.cmake b/apps/demo_mn_console/linux.cmake
+index d24e4fc..5951dbf 100644
+--- a/apps/demo_mn_console/linux.cmake
++++ b/apps/demo_mn_console/linux.cmake
+@@ -46,8 +46,28 @@ SET (DEMO_ARCH_SOURCES
+ ################################################################################
+ # Set architecture specific libraries
+ 
++IF (NOT CFG_COMPILE_SHARED_LIBRARY)
++    SET(PCAP_CONFIG_OPTS --static)
++ENDIF()
++
+ IF (CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
++
++find_program(PCAP_CONFIG  NAMES pcap-config PATHS)
++
++if (PCAP_CONFIG)
++    message (STATUS "Looking for pcap-config... ${PCAP_CONFIG}")
++
++    execute_process (COMMAND ${PCAP_CONFIG} --libs ${PCAP_CONFIG_OPTS}
++        OUTPUT_VARIABLE PCAP_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
++    execute_process (COMMAND ${PCAP_CONFIG} --cflags ${PCAP_CONFIG_OPTS}
++        OUTPUT_VARIABLE PCAP_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
++
++   SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} ${PCAP_LDFLAGS})
++else (PCAP_CONFIG)
++    message (STATUS "pcap-config not found, using defaults...")
+     SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
++endif (PCAP_CONFIG)
++
+ ENDIF (CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
+ SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
+ 
+diff --git a/apps/demo_mn_qt/linux.cmake b/apps/demo_mn_qt/linux.cmake
+index 6ed75ee..c69dbd9 100644
+--- a/apps/demo_mn_qt/linux.cmake
++++ b/apps/demo_mn_qt/linux.cmake
+@@ -37,8 +37,28 @@
+ ################################################################################
+ # Set architecture specific libraries
+ 
++IF (NOT CFG_COMPILE_SHARED_LIBRARY)
++    SET(PCAP_CONFIG_OPTS --static)
++ENDIF()
++
+ IF(CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
+-    SET(ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
++
++find_program(PCAP_CONFIG  NAMES pcap-config PATHS)
++
++if (PCAP_CONFIG)
++    message (STATUS "Looking for pcap-config... ${PCAP_CONFIG}")
++
++    execute_process (COMMAND ${PCAP_CONFIG} --libs ${PCAP_CONFIG_OPTS}
++        OUTPUT_VARIABLE PCAP_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
++    execute_process (COMMAND ${PCAP_CONFIG} --cflags ${PCAP_CONFIG_OPTS}
++        OUTPUT_VARIABLE PCAP_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
++
++   SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} ${PCAP_LDFLAGS})
++else (PCAP_CONFIG)
++    message (STATUS "pcap-config not found, using defaults...")
++    SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
++endif (PCAP_CONFIG)
++
+ ENDIF()
+ SET(ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
+ 
+diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
+index 2b4a2c1..98f693f 100644
+--- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
++++ b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
+@@ -134,7 +134,27 @@ INCLUDE_DIRECTORIES(
+     ${CONTRIB_SOURCE_DIR}
+     )
+ 
+-SET (ARCH_LIBRARIES pcap pthread rt)
++IF (NOT CFG_COMPILE_SHARED_LIBRARY)
++    SET(PCAP_CONFIG_OPTS --static)
++ENDIF()
++
++find_program(PCAP_CONFIG  NAMES pcap-config PATHS)
++
++if (PCAP_CONFIG)
++    message (STATUS "Looking for pcap-config... ${PCAP_CONFIG}")
++
++    execute_process (COMMAND ${PCAP_CONFIG} --libs ${PCAP_CONFIG_OPTS}
++        OUTPUT_VARIABLE PCAP_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
++    execute_process (COMMAND ${PCAP_CONFIG} --cflags ${PCAP_CONFIG_OPTS}
++        OUTPUT_VARIABLE PCAP_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
++
++   SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} ${PCAP_LDFLAGS})
++else (PCAP_CONFIG)
++    message (STATUS "pcap-config not found, using defaults...")
++    SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
++endif (PCAP_CONFIG)
++
++SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
+ 
+ ADD_EXECUTABLE(${EXE_NAME} ${DRV_SOURCES})
+ SET_PROPERTY(TARGET ${EXE_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+-- 
+2.9.4
+
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index adcc48b..f52cc8d 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -40,7 +40,8 @@ OPENPOWERLINK_CONF_OPTS += \
 	-DCFG_COMPILE_LIB_CN=$(OPENPOWERLINK_CN_ONOFF) \
 	-DCFG_COMPILE_LIB_CNAPP_USERINTF=OFF \
 	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
-	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=OFF \
+	-DPCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB),y)
 OPENPOWERLINK_DEPENDENCIES += libpcap
 OPENPOWERLINK_CONF_OPTS += \
@@ -52,7 +53,8 @@ OPENPOWERLINK_CONF_OPTS += \
 	-DCFG_COMPILE_LIB_CN=OFF \
 	-DCFG_COMPILE_LIB_CNAPP_USERINTF=$(OPENPOWERLINK_CN_ONOFF) \
 	-DCFG_COMPILE_LIB_CNAPP_KERNELINTF=OFF \
-	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(OPENPOWERLINK_CN_ONOFF)
+	-DCFG_COMPILE_LIB_CNDRV_PCAP=$(OPENPOWERLINK_CN_ONOFF) \
+	-DPCAP_CONFIG="$(STAGING_DIR)/usr/bin/pcap-config"
 else ifeq ($(BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB),y)
 OPENPOWERLINK_CONF_OPTS += \
 	-DCFG_COMPILE_LIB_MN=OFF \
-- 
2.9.4
