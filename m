From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:45 +0100
Subject: [Buildroot] [PATCH 39/51] yajl: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-39-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patches have been refreshed and their name have been changed.
The patches were not sent upstream, they will be sent shortly.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 ...PATCH-fix-json_reformat-linking-on-uClibc.patch | 30 ++++++++++++++
 ...le-shared-library-build-when-BUILD_SHARED.patch | 47 ++++++++++++++++++++++
 package/yajl/yajl-0001-math-link.patch             | 24 -----------
 ...le-shared-library-build-when-BUILD_SHARED.patch | 44 --------------------
 package/yajl/yajl.mk                               |  2 +-
 5 files changed, 78 insertions(+), 69 deletions(-)
 create mode 100644 package/yajl/0001-PATCH-fix-json_reformat-linking-on-uClibc.patch
 create mode 100644 package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
 delete mode 100644 package/yajl/yajl-0001-math-link.patch
 delete mode 100644 package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch

diff --git a/package/yajl/0001-PATCH-fix-json_reformat-linking-on-uClibc.patch b/package/yajl/0001-PATCH-fix-json_reformat-linking-on-uClibc.patch
new file mode 100644
index 0000000..6aa4dee
--- /dev/null
+++ b/package/yajl/0001-PATCH-fix-json_reformat-linking-on-uClibc.patch
@@ -0,0 +1,30 @@
+From 159f55fba332a25f059b391699f85640c47feb6d Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Sat, 25 Oct 2014 20:03:52 +0200
+Subject: [PATCH 1/2] [PATCH] fix json_reformat linking on uClibc
+
+json_reformat calls yajl_gen_* functions, which internally use isnan() /
+isinf(). On Glibc, these are provided by libc, but on uClibc you need to
+link with -lm (like the spec says), so ensure we do so.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ reformatter/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/reformatter/CMakeLists.txt b/reformatter/CMakeLists.txt
+index 52a9bee..e630851 100644
+--- a/reformatter/CMakeLists.txt
++++ b/reformatter/CMakeLists.txt
+@@ -26,7 +26,7 @@ LINK_DIRECTORIES(${CMAKE_CURRENT_BINARY_DIR}/../${YAJL_DIST_NAME}/lib)
+ 
+ ADD_EXECUTABLE(json_reformat ${SRCS})
+ 
+-TARGET_LINK_LIBRARIES(json_reformat yajl_s)
++TARGET_LINK_LIBRARIES(json_reformat yajl_s m)
+ 
+ # In some environments, we must explicitly link libm (like qnx,
+ # thanks @shahbag)
+-- 
+2.1.1
+
diff --git a/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
new file mode 100644
index 0000000..df7d3b3
--- /dev/null
+++ b/package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -0,0 +1,47 @@
+From cb3ce94eb85924c8ae1aab3951efcec8be43cfff Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 31 Aug 2014 00:39:11 +0200
+Subject: [PATCH 2/2] cmake: disable shared library build when
+ BUILD_SHARED_LIBS is off
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ src/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 99cf9e9..9e9c77d 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -37,6 +37,7 @@ SET(LIBRARY_OUTPUT_PATH ${libDir})
+ 
+ ADD_LIBRARY(yajl_s STATIC ${SRCS} ${HDRS} ${PUB_HDRS})
+ 
++IF(BUILD_SHARED_LIBS)
+ ADD_LIBRARY(yajl SHARED ${SRCS} ${HDRS} ${PUB_HDRS})
+ 
+ #### setup shared library version number
+@@ -51,6 +52,7 @@ IF(APPLE)
+   SET_TARGET_PROPERTIES(yajl PROPERTIES
+                         INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib")
+ ENDIF(APPLE)
++ENDIF(BUILD_SHARED_LIBS)
+ 
+ #### build up an sdk as a post build step
+ 
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
+-- 
+2.1.1
+
diff --git a/package/yajl/yajl-0001-math-link.patch b/package/yajl/yajl-0001-math-link.patch
deleted file mode 100644
index 355a248..0000000
--- a/package/yajl/yajl-0001-math-link.patch
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
diff --git a/package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
deleted file mode 100644
index 261c486..0000000
--- a/package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From bb4fb7ff71fd6cadd9c1bf8716845a91e5998c0c Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 31 Aug 2014 00:39:11 +0200
-Subject: [PATCH 2/2] cmake: disable shared library build when
- BUILD_SHARED_LIBS is off
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- src/CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index e36b736..6a24424 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -37,6 +37,7 @@ SET(LIBRARY_OUTPUT_PATH ${libDir})
- 
- ADD_LIBRARY(yajl_s STATIC ${SRCS} ${HDRS} ${PUB_HDRS})
- 
-+IF(BUILD_SHARED_LIBS)
- ADD_LIBRARY(yajl SHARED ${SRCS} ${HDRS} ${PUB_HDRS})
- 
- #### setup shared library version number
-@@ -51,6 +52,7 @@ IF(APPLE)
-   SET_TARGET_PROPERTIES(yajl PROPERTIES
-                         INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib")
- ENDIF(APPLE)
-+ENDIF(BUILD_SHARED_LIBS)
- 
- #### build up an sdk as a post build step
- 
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
--- 
-2.1.0
-
diff --git a/package/yajl/yajl.mk b/package/yajl/yajl.mk
index ff64123..1fb16f5 100644
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
-- 
2.1.1
