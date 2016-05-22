From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 22 May 2016 22:45:50 +0200
Subject: [Buildroot] [PACH: for-master] package/openpowerlink: fix build
	issue with debugging symbols
Message-ID: <1463949950-14164-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the top level build patch to fix a build issue with debugging symbols.

This only affect the demo applications build.

Fixes:
http://autobuild.buildroot.net/results/da4/da445b65cb136d71577f04e3a17fdb2ef6302a9b

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../0005-Add-top-level-CMakeLists.txt.patch        | 31 +++++++++++++++++++---
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/package/openpowerlink/0005-Add-top-level-CMakeLists.txt.patch b/package/openpowerlink/0005-Add-top-level-CMakeLists.txt.patch
index f7e3c16..259a81a 100644
--- a/package/openpowerlink/0005-Add-top-level-CMakeLists.txt.patch
+++ b/package/openpowerlink/0005-Add-top-level-CMakeLists.txt.patch
@@ -1,4 +1,4 @@
-From 5cf3f37e12d0bb4649e3cda29a43d748708aa554 Mon Sep 17 00:00:00 2001
+From 6f4bcf829efe5ce31592003e049606ae1de05e90 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@openwide.fr>
 Date: Wed, 12 Aug 2015 11:24:24 +0200
 Subject: [PATCH] Add top level CMakeLists.txt
@@ -11,15 +11,25 @@ level build (ie CFG_OPLK_LIB is ON).
 For a top level build, CMake will automatically add a build
 dependency on oplk libraries for building demos applications.
 
-This patch has been submitted upstream:
+Also replace OPLKLIB_DEBUG by OPLKLIB in OPLK_LINK_LIBRARIES macro
+if CMAKE_BUILD_TYPE is "Debug", otherwise TARGET_LINK_LIBRARIES can't
+find the openpowerlink library.
+This issue may be related to:
+https://github.com/OpenAutomationTechnologies/openPOWERLINK_V2/issues/109
+
+Fixes:
+http://autobuild.buildroot.net/results/da4/da445b65cb136d71577f04e3a17fdb2ef6302a9b
+
+This patch has not been accepted by upstream:
 https://github.com/openPOWERLINK/openPOWERLINK_V2/pull/57
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
  CMakeLists.txt                               | 36 +++++++++++++++
  apps/common/cmake/findoplklib.cmake          | 68 +++++++++++++++-------------
+ apps/common/cmake/linkoplklib.cmake          |  2 +-
  drivers/linux/drv_daemon_pcap/CMakeLists.txt | 12 +++--
- 3 files changed, 82 insertions(+), 34 deletions(-)
+ 4 files changed, 83 insertions(+), 35 deletions(-)
  create mode 100644 CMakeLists.txt
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
@@ -142,6 +152,19 @@ index 1bf570e..79ea35b 100644
 +    ENDIF(CFG_OPLK_LIB)
  
  ENDMACRO(FIND_OPLK_LIBRARY)
+diff --git a/apps/common/cmake/linkoplklib.cmake b/apps/common/cmake/linkoplklib.cmake
+index 49aab66..d9fd418 100644
+--- a/apps/common/cmake/linkoplklib.cmake
++++ b/apps/common/cmake/linkoplklib.cmake
+@@ -33,7 +33,7 @@ MACRO(OPLK_LINK_LIBRARIES EXECUTABLE_NAME)
+         TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB} debug ${OPLKLIB_DEBUG})
+     ELSE()
+         IF(${CMAKE_BUILD_TYPE} STREQUAL "Debug")
+-            TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} debug ${OPLKLIB_DEBUG})
++            TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} debug ${OPLKLIB})
+         ELSE ()
+             TARGET_LINK_LIBRARIES(${EXECUTABLE_NAME} optimized ${OPLKLIB})
+         ENDIF()
 diff --git a/drivers/linux/drv_daemon_pcap/CMakeLists.txt b/drivers/linux/drv_daemon_pcap/CMakeLists.txt
 index 2702abd..81bb598 100644
 --- a/drivers/linux/drv_daemon_pcap/CMakeLists.txt
@@ -166,5 +189,5 @@ index 2702abd..81bb598 100644
  
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -pedantic -std=c99 -pthread -fno-strict-aliasing")
 -- 
-2.4.3
+2.5.5
 
-- 
2.5.5
