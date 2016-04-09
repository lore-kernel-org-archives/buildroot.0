From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 10 Apr 2016 00:15:25 +0200
Subject: [Buildroot] [PATCH v2] yajl: fix static linking in a parallel build
Message-ID: <1460240125-2981-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The yajl build system contains a race condition, which gets triggered by
high BR2_JLEVEL settings - It tries to link the executable gen-extra-close
against the shared libyajl before it is created:

[ 21%] Linking C executable gen-extra-close
[ 26%] Building C object src/CMakeFiles/yajl_s.dir/yajl_buf.c.o
/home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: cannot find -lyajl

Fix this issue by linking gen-extra-close against the shared library in a shared
build and the static library otherwise.
Apply this to all other build targets from yail who are linking against the
library, too.

Fixes:
http://autobuild.buildroot.net/results/a9b/a9b5209377acb51e69f376e0c008ee71fe00397a/
http://autobuild.buildroot.net/results/55f/55fe22463d49addb42b635d10be5176522f4a561/
http://autobuild.buildroot.net/results/808/808acca0cfed93465845c2aa055a7a4fc56a8a17/
http://autobuild.buildroot.net/results/b92/b92a9c84b71a8a2d022d307245ca6be36a000e6c/
http://autobuild.buildroot.net/results/55d/55df698ab53f7d94235166e8576eb681ed68668e/
.. and more.

Upstream status: Pending
https://github.com/lloyd/yajl/pull/187

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v1 -> v2:
 - conditionally link gen-extra-close against the shared libyajl in a shared
   build and against the static libyajl otherwise (Samuel Martin)
 - apply this to all other build targets linking against yajl

---
 ...ink-with-shared-libyajl-in-a-shared-build.patch | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch

diff --git a/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch b/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch
new file mode 100644
index 0000000..6a6e5e3
--- /dev/null
+++ b/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch
@@ -0,0 +1,125 @@
+From 3e4c0ce8c2b4c9dad6b7ce11f017f3f639fdab27 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sat, 9 Apr 2016 23:24:27 +0200
+Subject: [PATCH] Link with shared libyajl in a shared build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Building yajl in a static context fails in a parallel build:
+
+[ 21%] Linking C executable gen-extra-close
+[ 26%] Building C object src/CMakeFiles/yajl_s.dir/yajl_buf.c.o
+/home/test/autobuild/instance-3/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: cannot find -lyajl
+
+Fix this issue by linking against the shared libyail in a shared build. Apply
+this fix also to all other build targets who are linking against the library.
+
+Upstream status: Pending
+https://github.com/lloyd/yajl/pull/187
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ example/CMakeLists.txt      | 7 ++++++-
+ perf/CMakeLists.txt         | 6 +++++-
+ reformatter/CMakeLists.txt  | 6 +++++-
+ test/api/CMakeLists.txt     | 6 +++++-
+ test/parsing/CMakeLists.txt | 6 +++++-
+ verify/CMakeLists.txt       | 6 +++++-
+ 6 files changed, 31 insertions(+), 6 deletions(-)
+
+diff --git a/example/CMakeLists.txt b/example/CMakeLists.txt
+index 0a7f622..8cfcef8 100644
+--- a/example/CMakeLists.txt
++++ b/example/CMakeLists.txt
+@@ -20,4 +20,9 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../${YAJL_DIST_NAME}/lib)
+ 
+ ADD_EXECUTABLE(parse_config ${SRCS})
+ 
+-TARGET_LINK_LIBRARIES(parse_config yajl_s)
++IF(BUILD_SHARED_LIBS)
++  TARGET_LINK_LIBRARIES(parse_config yajl)
++ELSE()
++  TARGET_LINK_LIBRARIES(parse_config yajl_s)
++ENDIF()
++
+diff --git a/perf/CMakeLists.txt b/perf/CMakeLists.txt
+index b438d7a..40ba363 100644
+--- a/perf/CMakeLists.txt
++++ b/perf/CMakeLists.txt
+@@ -20,4 +20,8 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../${YAJL_DIST_NAME}/lib)
+ 
+ ADD_EXECUTABLE(perftest ${SRCS})
+ 
+-TARGET_LINK_LIBRARIES(perftest yajl_s)
++IF(BUILD_SHARED_LIBS)
++  TARGET_LINK_LIBRARIES(perftest yajl)
++ELSE()
++  TARGET_LINK_LIBRARIES(perftest yajl_s)
++ENDIF()
+diff --git a/reformatter/CMakeLists.txt b/reformatter/CMakeLists.txt
+index 52a9bee..7629094 100644
+--- a/reformatter/CMakeLists.txt
++++ b/reformatter/CMakeLists.txt
+@@ -26,7 +26,11 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../${YAJL_DIST_NAME}/lib)
+ 
+ ADD_EXECUTABLE(json_reformat ${SRCS})
+ 
+-TARGET_LINK_LIBRARIES(json_reformat yajl_s)
++IF(BUILD_SHARED_LIBS)
++  TARGET_LINK_LIBRARIES(json_reformat yajl)
++ELSE()
++  TARGET_LINK_LIBRARIES(json_reformat yajl_s)
++ENDIF()
+ 
+ # In some environments, we must explicitly link libm (like qnx,
+ # thanks @shahbag)
+diff --git a/test/api/CMakeLists.txt b/test/api/CMakeLists.txt
+index e0ce2f6..9adebdc 100644
+--- a/test/api/CMakeLists.txt
++++ b/test/api/CMakeLists.txt
+@@ -21,5 +21,9 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../../${YAJL_DIST_NAME}/lib)
+ FOREACH (test ${TESTS})
+   GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
+   ADD_EXECUTABLE(${testProg} ${test})
+-  TARGET_LINK_LIBRARIES(${testProg} yajl m)
++  IF(BUILD_SHARED_LIBS)
++    TARGET_LINK_LIBRARIES(${testProg} yajl m)
++  ELSE()
++    TARGET_LINK_LIBRARIES(${testProg} yajl_s m)
++  ENDIF()
+ ENDFOREACH()
+diff --git a/test/parsing/CMakeLists.txt b/test/parsing/CMakeLists.txt
+index c22a388..285f048 100644
+--- a/test/parsing/CMakeLists.txt
++++ b/test/parsing/CMakeLists.txt
+@@ -20,4 +20,8 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../../${YAJL_DIST_NAME}/lib)
+ 
+ ADD_EXECUTABLE(yajl_test ${SRCS})
+ 
+-TARGET_LINK_LIBRARIES(yajl_test yajl_s)
++IF(BUILD_SHARED_LIBS)
++  TARGET_LINK_LIBRARIES(yajl_test yajl)
++ELSE()
++  TARGET_LINK_LIBRARIES(yajl_test yajl_s)
++ENDIF()
+diff --git a/verify/CMakeLists.txt b/verify/CMakeLists.txt
+index 967fca1..06cb2dc 100644
+--- a/verify/CMakeLists.txt
++++ b/verify/CMakeLists.txt
+@@ -26,7 +26,11 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../${YAJL_DIST_NAME}/lib)
+ 
+ ADD_EXECUTABLE(json_verify ${SRCS})
+ 
+-TARGET_LINK_LIBRARIES(json_verify yajl_s)
++IF(BUILD_SHARED_LIBS)
++  TARGET_LINK_LIBRARIES(json_verify yajl)
++ELSE()
++  TARGET_LINK_LIBRARIES(json_verify yajl_s)
++ENDIF()
+ 
+ # copy in the binary
+ GET_TARGET_PROPERTY(binPath json_verify LOCATION)
+-- 
+2.8.0
+
-- 
2.8.0
