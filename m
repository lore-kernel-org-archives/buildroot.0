From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Dec 2017 09:00:25 +0100
Subject: [Buildroot] [git commit] package/openpowerlink: bump to v2.6.2
Message-ID: <20171215080029.924A982BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05004228cb17daec0b01d9393d409cf834ae0d0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the latest release of the v2.6.x release series.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0004-use-contrib-getopt-only-on-Windows.patch  | 102 -------------
 ...config-to-fix-static-linking-with-libpcap.patch | 166 ---------------------
 package/openpowerlink/openpowerlink.hash           |   8 +-
 package/openpowerlink/openpowerlink.mk             |   2 +-
 4 files changed, 5 insertions(+), 273 deletions(-)

diff --git a/package/openpowerlink/0004-use-contrib-getopt-only-on-Windows.patch b/package/openpowerlink/0004-use-contrib-getopt-only-on-Windows.patch
deleted file mode 100644
index 9680c27..0000000
--- a/package/openpowerlink/0004-use-contrib-getopt-only-on-Windows.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From e7e421526b17c179d5ac33a982b180ff5f7ef7a7 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 27 May 2017 23:51:41 +0200
-Subject: [PATCH] use contrib getopt() only on Windows
-
-Otherwise, contrib getopt will clash with the one from the libc when
-building statically.
-
-lib64/libc.a(getopt.os):(.data+0x8): multiple definition of `optind'
-CMakeFiles/demo_mn_console.dir/__/__/contrib/getopt/getopt.c.o:(.data+0x8): first defined here
-lib64/libc.a(getopt.os):(.data+0x4): multiple definition of `opterr'
-CMakeFiles/demo_mn_console.dir/__/__/contrib/getopt/getopt.c.o:(.data+0xc): first defined here
-/lib64/libc.a(getopt.os): In function `__GI_getopt':
-getopt.c:(.text+0x76e): multiple definition of `getopt'
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- apps/demo_cn_console/CMakeLists.txt | 2 +-
- apps/demo_cn_console/src/main.c     | 6 ++++++
- apps/demo_mn_console/CMakeLists.txt | 2 +-
- apps/demo_mn_console/src/main.c     | 6 ++++++
- 4 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/apps/demo_cn_console/CMakeLists.txt b/apps/demo_cn_console/CMakeLists.txt
-index 3bb8f25..800797a 100644
---- a/apps/demo_cn_console/CMakeLists.txt
-+++ b/apps/demo_cn_console/CMakeLists.txt
-@@ -61,7 +61,6 @@ SET(DEMO_SOURCES
-     ${COMMON_SOURCE_DIR}/eventlog/eventlog.c
-     ${COMMON_SOURCE_DIR}/eventlog/eventlogstring.c
-     ${CONTRIB_SOURCE_DIR}/console/printlog.c
--    ${CONTRIB_SOURCE_DIR}/getopt/getopt.c
-     )
- 
- INCLUDE_DIRECTORIES(
-@@ -114,6 +113,7 @@ ENDIF (CFG_KERNEL_STACK_DIRECTLINK)
- IF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
-     include(linux.cmake)
- ELSEIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
-+    SET(DEMO_SOURCES ${DEMO_SOURCES} ${CONTRIB_SOURCE_DIR}/getopt/getopt.c)
-     include (windows.cmake)
- ELSE()
-     MESSAGE(FATAL_ERROR "System ${CMAKE_SYSTEM_NAME} is not supported!")
-diff --git a/apps/demo_cn_console/src/main.c b/apps/demo_cn_console/src/main.c
-index d64536c..f790570 100644
---- a/apps/demo_cn_console/src/main.c
-+++ b/apps/demo_cn_console/src/main.c
-@@ -50,7 +50,13 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
- #include <system/system.h>
- #include <obdcreate/obdcreate.h>
-+
-+#if (TARGET_SYSTEM == _WIN32_)
- #include <getopt/getopt.h>
-+#else
-+#include <unistd.h>
-+#endif
-+
- #include <console/console.h>
- #include <eventlog/eventlog.h>
- 
-diff --git a/apps/demo_mn_console/CMakeLists.txt b/apps/demo_mn_console/CMakeLists.txt
-index 6f9c5a1..2e74529 100644
---- a/apps/demo_mn_console/CMakeLists.txt
-+++ b/apps/demo_mn_console/CMakeLists.txt
-@@ -68,7 +68,6 @@ SET(DEMO_SOURCES
-     ${COMMON_SOURCE_DIR}/eventlog/eventlog.c
-     ${COMMON_SOURCE_DIR}/eventlog/eventlogstring.c
-     ${CONTRIB_SOURCE_DIR}/console/printlog.c
--    ${CONTRIB_SOURCE_DIR}/getopt/getopt.c
-     ${FIRMWARE_MANAGER_SOURCES}
-     )
- 
-@@ -131,6 +130,7 @@ ENDIF()
- IF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
-     include(linux.cmake)
- ELSEIF(CMAKE_SYSTEM_NAME STREQUAL "Windows")
-+    SET(DEMO_SOURCES ${DEMO_SOURCES} ${CONTRIB_SOURCE_DIR}/getopt/getopt.c)
-     include (windows.cmake)
- ELSE()
-     MESSAGE(FATAL_ERROR "System ${CMAKE_SYSTEM_NAME} is not supported!")
-diff --git a/apps/demo_mn_console/src/main.c b/apps/demo_mn_console/src/main.c
-index cba747d..b766ed1 100644
---- a/apps/demo_mn_console/src/main.c
-+++ b/apps/demo_mn_console/src/main.c
-@@ -50,7 +50,13 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- 
- #include <system/system.h>
- #include <obdcreate/obdcreate.h>
-+
-+#if (TARGET_SYSTEM == _WIN32_)
- #include <getopt/getopt.h>
-+#else
-+#include <unistd.h>
-+#endif
-+
- #include <console/console.h>
- #include <eventlog/eventlog.h>
- #include <firmwaremanager/firmwaremanager.h>
--- 
-2.9.4
-
diff --git a/package/openpowerlink/0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch b/package/openpowerlink/0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch
deleted file mode 100644
index e2c0311..0000000
--- a/package/openpowerlink/0005-use-pcap-config-to-fix-static-linking-with-libpcap.patch
+++ /dev/null
@@ -1,166 +0,0 @@
-From 88c0af910edd156075acf04d8497f541ed377d4b Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 28 May 2017 00:25:11 +0200
-Subject: [PATCH] use pcap-config to fix static linking with libpcap
-
-When linking demo_mn_console statically with pcap, the CMake build
-system forget to link with other libraries linked with libpcap
-(-lnl-genl-3 -lnl-3 -ldbus-1 -pthread).
-
-[100%] Linking C executable demo_mn_console
-lib64/libpcap.a(pcap-linux.o): In function nl80211_init': pcap-linux.c:(.text+0x41e): undefined reference tonl_socket_alloc'
-
-To fix this, the build system could use pcap-config:
-pcap-config --libs --static
--L/path/to/sysroot/usr/lib -lpcap -L/path/to/sysroot/usr/lib/.libs
--lnl-genl-3 -lnl-3 -L/path/to/sysroot/usr/lib -ldbus-1 -pthread
-
-Fixes:
-http://autobuild.buildroot.net/results/f43/f437d09ac6c689c911e1885b95da33b692f2cb3c
-http://autobuild.buildroot.net/results/385/3859dc0f4de7e3284a96d5841f040f69f71842df
-https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/issues/187
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- apps/demo_cn_console/linux.cmake             | 20 ++++++++++++++++++++
- apps/demo_mn_console/linux.cmake             | 20 ++++++++++++++++++++
- apps/demo_mn_qt/linux.cmake                  | 22 +++++++++++++++++++++-
- drivers/linux/drv_daemon_pcap/CMakeLists.txt | 22 +++++++++++++++++++++-
- 4 files changed, 82 insertions(+), 2 deletions(-)
-
-diff --git a/apps/demo_cn_console/linux.cmake b/apps/demo_cn_console/linux.cmake
-index 1c6f51c..7752917 100644
---- a/apps/demo_cn_console/linux.cmake
-+++ b/apps/demo_cn_console/linux.cmake
-@@ -46,8 +46,28 @@ SET (DEMO_ARCH_SOURCES
- ################################################################################
- # Set architecture specific libraries
- 
-+IF (NOT CFG_COMPILE_SHARED_LIBRARY)
-+    SET(PCAP_CONFIG_OPTS --static)
-+ENDIF()
-+
- IF (CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
-+
-+find_program(PCAP_CONFIG  NAMES pcap-config PATHS)
-+
-+if (PCAP_CONFIG)
-+    message (STATUS "Looking for pcap-config... ${PCAP_CONFIG}")
-+
-+    execute_process (COMMAND ${PCAP_CONFIG} --libs ${PCAP_CONFIG_OPTS}
-+        OUTPUT_VARIABLE PCAP_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
-+    execute_process (COMMAND ${PCAP_CONFIG} --cflags ${PCAP_CONFIG_OPTS}
-+        OUTPUT_VARIABLE PCAP_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
-+
-+   SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} ${PCAP_LDFLAGS})
-+else (PCAP_CONFIG)
-+    message (STATUS "pcap-config not found, using defaults...")
-     SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
-+endif (PCAP_CONFIG)
-+
- ENDIF (CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
- SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
- 
-diff --git a/apps/demo_mn_console/linux.cmake b/apps/demo_mn_console/linux.cmake
-index d24e4fc..5951dbf 100644
---- a/apps/demo_mn_console/linux.cmake
-+++ b/apps/demo_mn_console/linux.cmake
-@@ -46,8 +46,28 @@ SET (DEMO_ARCH_SOURCES
- ################################################################################
- # Set architecture specific libraries
- 
-+IF (NOT CFG_COMPILE_SHARED_LIBRARY)
-+    SET(PCAP_CONFIG_OPTS --static)
-+ENDIF()
-+
- IF (CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
-+
-+find_program(PCAP_CONFIG  NAMES pcap-config PATHS)
-+
-+if (PCAP_CONFIG)
-+    message (STATUS "Looking for pcap-config... ${PCAP_CONFIG}")
-+
-+    execute_process (COMMAND ${PCAP_CONFIG} --libs ${PCAP_CONFIG_OPTS}
-+        OUTPUT_VARIABLE PCAP_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
-+    execute_process (COMMAND ${PCAP_CONFIG} --cflags ${PCAP_CONFIG_OPTS}
-+        OUTPUT_VARIABLE PCAP_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
-+
-+   SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} ${PCAP_LDFLAGS})
-+else (PCAP_CONFIG)
-+    message (STATUS "pcap-config not found, using defaults...")
-     SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
-+endif (PCAP_CONFIG)
-+
- ENDIF (CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
- SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
- 
-diff --git a/apps/demo_mn_qt/linux.cmake b/apps/demo_mn_qt/linux.cmake
-index 6ed75ee..c69dbd9 100644
---- a/apps/demo_mn_qt/linux.cmake
-+++ b/apps/demo_mn_qt/linux.cmake
-@@ -37,8 +37,28 @@
- ################################################################################
- # Set architecture specific libraries
- 
-+IF (NOT CFG_COMPILE_SHARED_LIBRARY)
-+    SET(PCAP_CONFIG_OPTS --static)
-+ENDIF()
-+
- IF(CFG_KERNEL_STACK_DIRECTLINK OR CFG_KERNEL_STACK_USERSPACE_DAEMON)
--    SET(ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
-+
-+find_program(PCAP_CONFIG  NAMES pcap-config PATHS)
-+
-+if (PCAP_CONFIG)
-+    message (STATUS "Looking for pcap-config... ${PCAP_CONFIG}")
-+
-+    execute_process (COMMAND ${PCAP_CONFIG} --libs ${PCAP_CONFIG_OPTS}
-+        OUTPUT_VARIABLE PCAP_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
-+    execute_process (COMMAND ${PCAP_CONFIG} --cflags ${PCAP_CONFIG_OPTS}
-+        OUTPUT_VARIABLE PCAP_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
-+
-+   SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} ${PCAP_LDFLAGS})
-+else (PCAP_CONFIG)
-+    message (STATUS "pcap-config not found, using defaults...")
-+    SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
-+endif (PCAP_CONFIG)
-+
- ENDIF()
- SET(ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
- 
-diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-index ecceb4c..b362a34 100644
---- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-+++ b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
-@@ -140,7 +140,27 @@ INCLUDE_DIRECTORIES(
-     ${CONTRIB_SOURCE_DIR}
-     )
- 
--SET (ARCH_LIBRARIES pcap pthread rt)
-+IF (NOT CFG_COMPILE_SHARED_LIBRARY)
-+    SET(PCAP_CONFIG_OPTS --static)
-+ENDIF()
-+
-+find_program(PCAP_CONFIG  NAMES pcap-config PATHS)
-+
-+if (PCAP_CONFIG)
-+    message (STATUS "Looking for pcap-config... ${PCAP_CONFIG}")
-+
-+    execute_process (COMMAND ${PCAP_CONFIG} --libs ${PCAP_CONFIG_OPTS}
-+        OUTPUT_VARIABLE PCAP_LDFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
-+    execute_process (COMMAND ${PCAP_CONFIG} --cflags ${PCAP_CONFIG_OPTS}
-+        OUTPUT_VARIABLE PCAP_CFLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
-+
-+   SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} ${PCAP_LDFLAGS})
-+else (PCAP_CONFIG)
-+    message (STATUS "pcap-config not found, using defaults...")
-+    SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pcap)
-+endif (PCAP_CONFIG)
-+
-+SET (ARCH_LIBRARIES ${ARCH_LIBRARIES} pthread rt)
- 
- ADD_EXECUTABLE(${EXE_NAME} ${DRV_SOURCES})
- SET_PROPERTY(TARGET ${EXE_NAME} PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
--- 
-2.9.4
-
diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index 5c95431..f69950d 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.6.1/
-md5	9f53ccc72356cf421ecd089f91421393	openPOWERLINK_V2.6.1.tar.gz
-sha1	dfb97845937e8d1de3e554c17b951a115352faa6	openPOWERLINK_V2.6.1.tar.gz
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.6.2/
+md5	bbb268e33e55424de563cb677703d8f7	openPOWERLINK_V2.6.2.tar.gz
+sha1	bf6a8b202c1192b531ce6d6c4c6254e5689c65fe	openPOWERLINK_V2.6.2.tar.gz
 # sha256 locally computed
-sha256	89a8b321938f965aa03610f40c38d2f17242aab1b0b5f24b93c4542f2f3fbd5c	openPOWERLINK_V2.6.1.tar.gz
+sha256	38d7a93c05cc0167be5c498e625d1efddeac2616ceb1bc8c3c6679552ae6da15	openPOWERLINK_V2.6.2.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index c9ca4cc..e2958b3 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.6.1
+OPENPOWERLINK_VERSION = V2.6.2
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
