From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 21:55:16 +0200
Subject: [Buildroot] [PATCH v2 3/9] package/yajl: fix static link
In-Reply-To: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409514922-9509-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable shared object build when BR2_PREFER_STATIC_LIB is set

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- new patch
---
 ...le-shared-library-build-when-BUILD_SHARED.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch

diff --git a/package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch b/package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
new file mode 100644
index 0000000..261c486
--- /dev/null
+++ b/package/yajl/yajl-0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch
@@ -0,0 +1,44 @@
+From bb4fb7ff71fd6cadd9c1bf8716845a91e5998c0c Mon Sep 17 00:00:00 2001
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
+index e36b736..6a24424 100644
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
+@@ -78,7 +80,9 @@ INCLUDE_DIRECTORIES(${incDir}/..)
+ IF(NOT WIN32)
+   # at build time you may specify the cmake variable LIB_SUFFIX to handle
+   # 64-bit systems which use 'lib64'
++  IF(BUILD_SHARED_LIBS)
+   INSTALL(TARGETS yajl LIBRARY DESTINATION lib${LIB_SUFFIX})
++  ENDIF(BUILD_SHARED_LIBS)
+   INSTALL(TARGETS yajl_s ARCHIVE DESTINATION lib${LIB_SUFFIX})
+   INSTALL(FILES ${PUB_HDRS} DESTINATION include/yajl)
+   INSTALL(FILES ${incDir}/yajl_version.h DESTINATION include/yajl)
+-- 
+2.1.0
+
-- 
2.1.0
