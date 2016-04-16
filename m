From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 16 Apr 2016 19:35:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/yajl: Update patch to link with
	libm for gcc6
Message-ID: <1460828140-5867-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently yajl does not compile using gcc6 from
http://patchwork.ozlabs.org/patch/611249/

Patch 0003 needed a rebase after patch 0001 was replaced by a version
which also works with gcc6.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...1-cmake-uClibc-Fix-missing-libm-for-tests.patch | 30 -------------------
 .../yajl/0001-cmake-uClibc-Fix-missing-libm.patch  | 34 ++++++++++++++++++++++
 ...ink-with-shared-libyajl-in-a-shared-build.patch |  6 ++--
 3 files changed, 37 insertions(+), 33 deletions(-)
 delete mode 100644 package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch
 create mode 100644 package/yajl/0001-cmake-uClibc-Fix-missing-libm.patch

diff --git a/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch b/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch
deleted file mode 100644
index 08553f9..0000000
--- a/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a36814a6f9fbb62f49897f9fb1e68d204602e199 Mon Sep 17 00:00:00 2001
-From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-Date: Tue, 2 Feb 2016 17:28:31 +0100
-Subject: [PATCH] cmake: uClibc: Fix missing libm for tests
-
-At the link time, the tests are not linked against libm which cause an
-error with uClibc based toolchain:
-
-../../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isnan'
-../../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isinf'
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
----
- test/api/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/api/CMakeLists.txt b/test/api/CMakeLists.txt
-index cd65a54..e0ce2f6 100644
---- a/test/api/CMakeLists.txt
-+++ b/test/api/CMakeLists.txt
-@@ -21,5 +21,5 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../../${YAJL_DIST_NAME}/lib)
- FOREACH (test ${TESTS})
-   GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
-   ADD_EXECUTABLE(${testProg} ${test})
--  TARGET_LINK_LIBRARIES(${testProg} yajl)
-+  TARGET_LINK_LIBRARIES(${testProg} yajl m)
- ENDFOREACH()
--- 
-2.7.0
-
diff --git a/package/yajl/0001-cmake-uClibc-Fix-missing-libm.patch b/package/yajl/0001-cmake-uClibc-Fix-missing-libm.patch
new file mode 100644
index 0000000..3564cb2
--- /dev/null
+++ b/package/yajl/0001-cmake-uClibc-Fix-missing-libm.patch
@@ -0,0 +1,34 @@
+From 76f6ead65b46e4a9cceca4e21efa940cc8a77a6e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 16 Apr 2016 19:28:41 +0200
+Subject: [PATCH 1/1] cmake: uClibc: Fix missing libm
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Patch created by Ren? Rh?aume, downloaded from
+https://bugs.gentoo.org/show_bug.cgi?id=512738#c9
+
+Patch is discussed upstream:
+https://github.com/lloyd/yajl/pull/184#issuecomment-201549734
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 471eee1..08d69ec 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -60,6 +60,7 @@ ELSE (WIN32)
+ 
+   SET(CMAKE_C_FLAGS_DEBUG "-DDEBUG -g")
+   SET(CMAKE_C_FLAGS_RELEASE "-DNDEBUG -O2 -Wuninitialized")
++  SET(CMAKE_SHARED_LINKER_FLAGS "-lm ${CMAKE_SHARED_LINKER_FLAGS}")
+ ENDIF (WIN32)
+ 
+ 
+-- 
+2.8.0.rc3
+
diff --git a/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch b/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch
index 6a6e5e3..46e652d 100644
--- a/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch
+++ b/package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch
@@ -82,11 +82,11 @@ index e0ce2f6..9adebdc 100644
  FOREACH (test ${TESTS})
    GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
    ADD_EXECUTABLE(${testProg} ${test})
--  TARGET_LINK_LIBRARIES(${testProg} yajl m)
+-  TARGET_LINK_LIBRARIES(${testProg} yajl)
 +  IF(BUILD_SHARED_LIBS)
-+    TARGET_LINK_LIBRARIES(${testProg} yajl m)
++    TARGET_LINK_LIBRARIES(${testProg} yajl)
 +  ELSE()
-+    TARGET_LINK_LIBRARIES(${testProg} yajl_s m)
++    TARGET_LINK_LIBRARIES(${testProg} yajl_s)
 +  ENDIF()
  ENDFOREACH()
 diff --git a/test/parsing/CMakeLists.txt b/test/parsing/CMakeLists.txt
-- 
2.8.0.rc3
