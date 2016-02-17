From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 12:10:58 +0100
Subject: [Buildroot] [git commit branch/next] yajl: Bump version to 2.1.0
Message-ID: <20160217111915.996BE8188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cb39521e382746674a3756a4c0224a5f360ddaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove 0001-math-link.patch as some added code render it useless.
Rework 0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
because it did not apply anymore.
This patch is already in a PR upstream.

Add 0001-cmake-uClibc-Fix-missing-libm-for-tests.patch, to fix a build
error with uClibc toolchain.
This has been sent upstream:
https://github.com/lloyd/yajl/pull/184

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-cmake-uClibc-Fix-missing-libm-for-tests.patch | 30 +++++++++++++++++
 package/yajl/0001-math-link.patch                  | 24 -------------
 ...le-shared-library-build-when-BUILD_SHARED.patch | 39 ++++++++++++----------
 package/yajl/yajl.hash                             |  2 +-
 package/yajl/yajl.mk                               |  2 +-
 5 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch b/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch
new file mode 100644
index 0000000..08553f9
--- /dev/null
+++ b/package/yajl/0001-cmake-uClibc-Fix-missing-libm-for-tests.patch
@@ -0,0 +1,30 @@
+From a36814a6f9fbb62f49897f9fb1e68d204602e199 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Tue, 2 Feb 2016 17:28:31 +0100
+Subject: [PATCH] cmake: uClibc: Fix missing libm for tests
+
+At the link time, the tests are not linked against libm which cause an
+error with uClibc based toolchain:
+
+../../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isnan'
+../../yajl-2.1.0/lib/libyajl.so.2.1.0: undefined reference to `__isinf'
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ test/api/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/api/CMakeLists.txt b/test/api/CMakeLists.txt
+index cd65a54..e0ce2f6 100644
+--- a/test/api/CMakeLists.txt
++++ b/test/api/CMakeLists.txt
+@@ -21,5 +21,5 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../../${YAJL_DIST_NAME}/lib)
+ FOREACH (test ${TESTS})
+   GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
+   ADD_EXECUTABLE(${testProg} ${test})
+-  TARGET_LINK_LIBRARIES(${testProg} yajl)
++  TARGET_LINK_LIBRARIES(${testProg} yajl m)
+ ENDFOREACH()
+-- 
+2.7.0
+
diff --git a/package/yajl/0001-math-link.patch b/package/yajl/0001-math-link.patch
deleted file mode 100644
index 355a248..0000000
--- a/package/yajl/0001-math-link.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-[PATCH] fix json_reformat linking on uClibc
-
-json_reformat calls yajl_gen_* functions, which internally use isnan() /
-isinf(). On Glibc, these are provided by libc, but on uClibc you need to
-link with -lm (like the spec says), so ensure we do so.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- reformatter/CMakeLists.txt |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: yajl-2.0.2/reformatter/CMakeLists.txt
-===================================================================
---- yajl-2.0.2.orig/reformatter/CMakeLists.txt
-+++ yajl-2.0.2/reformatter/CMakeLists.txt
-@@ -26,7 +26,7 @@
- 
- ADD_EXECUTABLE(json_reformat ${SRCS})
- 
--TARGET_LINK_LIBRARIES(json_reformat yajl_s)
-+TARGET_LINK_LIBRARIES(json_reformat yajl_s m)
- 
- # copy the binary into the output directory
- GET_TARGET_PROPERTY(binPath json_reformat LOCATION)
diff --git a/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
index 261c486..53decca 100644
--- a/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
+++ b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -1,8 +1,10 @@
-From bb4fb7ff71fd6cadd9c1bf8716845a91e5998c0c Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 31 Aug 2014 00:39:11 +0200
-Subject: [PATCH 2/2] cmake: disable shared library build when
- BUILD_SHARED_LIBS is off
+From b3cddf92adacfe5ca40574afb3e323cc7cdebc5c Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Tue, 2 Feb 2016 15:46:09 +0100
+Subject: [PATCH] cmake: Add shared library conditonnal build
+
+When BUILD_SHARED_LIBS is off, you don't want to build the shared
+library.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 ---
@@ -10,7 +12,7 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index e36b736..6a24424 100644
+index 99cf9e9..9e9c77d 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
 @@ -37,6 +37,7 @@ SET(LIBRARY_OUTPUT_PATH ${libDir})
@@ -29,16 +31,19 @@ index e36b736..6a24424 100644
  
  #### build up an sdk as a post build step
  
-@@ -78,7 +80,9 @@ INCLUDE_DIRECTORIES(${incDir}/..)
- IF(NOT WIN32)
-   # at build time you may specify the cmake variable LIB_SUFFIX to handle
-   # 64-bit systems which use 'lib64'
-+  IF(BUILD_SHARED_LIBS)
-   INSTALL(TARGETS yajl LIBRARY DESTINATION lib${LIB_SUFFIX})
-+  ENDIF(BUILD_SHARED_LIBS)
-   INSTALL(TARGETS yajl_s ARCHIVE DESTINATION lib${LIB_SUFFIX})
-   INSTALL(FILES ${PUB_HDRS} DESTINATION include/yajl)
-   INSTALL(FILES ${incDir}/yajl_version.h DESTINATION include/yajl)
+@@ -77,10 +79,12 @@ INCLUDE_DIRECTORIES(${incDir}/..)
+ 
+ # at build time you may specify the cmake variable LIB_SUFFIX to handle
+ # 64-bit systems which use 'lib64'
++IF(BUILD_SHARED_LIBS)
+ INSTALL(TARGETS yajl
+         RUNTIME DESTINATION lib${LIB_SUFFIX}
+         LIBRARY DESTINATION lib${LIB_SUFFIX}
+         ARCHIVE DESTINATION lib${LIB_SUFFIX})
++ENDIF(BUILD_SHARED_LIBS)
+ INSTALL(TARGETS yajl_s ARCHIVE DESTINATION lib${LIB_SUFFIX})
+ INSTALL(FILES ${PUB_HDRS} DESTINATION include/yajl)
+ INSTALL(FILES ${incDir}/yajl_version.h DESTINATION include/yajl)
 -- 
-2.1.0
+2.7.0
 
diff --git a/package/yajl/yajl.hash b/package/yajl/yajl.hash
index 315d847..7b3abec 100644
--- a/package/yajl/yajl.hash
+++ b/package/yajl/yajl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	0e78f516dc53ecce7dc073f9a9bb0343186b58ef29dcd1dad74e5e853b216dd5  yajl-2.0.4.tar.gz
+sha256	3fb73364a5a30efe615046d07e6db9d09fd2b41c763c5f7d3bfb121cd5c5ac5a  yajl-2.1.0.tar.gz
 sha256	0f075b5f9a38bc02077370d4d57d12e615cfaaf7f634e3f2fc746b6582854e53  6d09f11b8fd358cab0e31b965327e64a599f9ce9.patch
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index 81f29e7..7770e86 100644
--- a/package/yajl/yajl.mk
+++ b/package/yajl/yajl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YAJL_VERSION = 2.0.4
+YAJL_VERSION = 2.1.0
 YAJL_SITE = $(call github,lloyd,yajl,$(YAJL_VERSION))
 YAJL_INSTALL_STAGING = YES
 YAJL_LICENSE = ISC
