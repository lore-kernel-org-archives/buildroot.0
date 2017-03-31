From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Fri, 31 Mar 2017 20:21:24 +0200
Subject: [Buildroot] [PATCH] package/synergy: fix install when building in
	debug
Message-ID: <1490984484-18637-1-git-send-email-pieterjan.camerlynck@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Synergy places it's executables in another location when building in
debug. Patch CMakeLists.txt to disable the behavior.

Fixes:
http://autobuild.buildroot.net/results/22d4d9a5d4363b1c9f3074f287b1383a366e0ce9

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 ...change-output-path-when-building-in-debug.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch

diff --git a/package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch b/package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch
new file mode 100644
index 0000000..a261b6b
--- /dev/null
+++ b/package/synergy/0002-do-not-change-output-path-when-building-in-debug.patch
@@ -0,0 +1,33 @@
+From 2868add1b7375ef4e2427edb85e27759c5ee226b Mon Sep 17 00:00:00 2001
+From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+Date: Fri, 31 Mar 2017 20:05:30 +0200
+Subject: [PATCH] do not change output path when building in debug
+
+Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+---
+ CMakeLists.txt | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 94c474e..1080e41 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -43,15 +43,6 @@ project(synergy C CXX)
+ set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
+ set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
+ 
+-# for unix, put debug files in a separate bin "debug" dir.
+-# release bin files should stay in the root of the bin dir.
+-if (CMAKE_GENERATOR STREQUAL "Unix Makefiles")
+-	if (CMAKE_BUILD_TYPE STREQUAL Debug)
+-		set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin/debug)
+-		set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib/debug)
+-	endif()
+-endif()
+-
+ # Set some easy to type variables.
+ set(root_dir ${CMAKE_SOURCE_DIR})
+ set(cmake_dir ${root_dir}/res)
+-- 
+2.7.4
+
-- 
2.7.4
