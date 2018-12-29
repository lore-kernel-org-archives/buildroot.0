From: qwendu <qwendu@gmail.com>
Date: Sat, 29 Dec 2018 15:21:03 +0800
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: bump to v3.1.0
Message-ID: <1546068063-11514-1-git-send-email-qwendu@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: qwen dux <qwendu@gmail.com>

Signed-off-by: qwen dux <qwendu@gmail.com>
---
 package/libwebsockets/0001-cmake-no-strict-aliasin.patch | 16 ++++++++++++++++
 package/libwebsockets/0002-libuv.c.uninitialized.patch   | 13 +++++++++++++
 package/libwebsockets/libwebsockets.hash                 |  2 +-
 package/libwebsockets/libwebsockets.mk                   |  2 +-
 4 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 package/libwebsockets/0001-cmake-no-strict-aliasin.patch
 create mode 100644 package/libwebsockets/0002-libuv.c.uninitialized.patch

diff --git a/package/libwebsockets/0001-cmake-no-strict-aliasin.patch b/package/libwebsockets/0001-cmake-no-strict-aliasin.patch
new file mode 100644
index 0000000..8515d40
--- /dev/null
+++ b/package/libwebsockets/0001-cmake-no-strict-aliasin.patch
@@ -0,0 +1,16 @@
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 453fdfd..6fd1712 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1233,9 +1233,9 @@ if (CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX OR (CMAKE_C_COMPILER_ID
+     endif()
+ 
+     if (UNIX AND NOT LWS_WITH_ESP32)
+-	    set(CMAKE_C_FLAGS "-Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits -Wuninitialized -Werror ${VISIBILITY_FLAG} -Wundef ${GCOV_FLAGS} ${CMAKE_C_FLAGS} ${ASAN_FLAGS}" )
++	    set(CMAKE_C_FLAGS "-fno-strict-aliasing -Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits -Wuninitialized -Werror ${VISIBILITY_FLAG} -Wundef ${GCOV_FLAGS} ${CMAKE_C_FLAGS} ${ASAN_FLAGS}" )
+     else()
+-	    set(CMAKE_C_FLAGS "-Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits -Wuninitialized -Werror ${VISIBILITY_FLAG} ${GCOV_FLAGS} ${CMAKE_C_FLAGS}" )
++	    set(CMAKE_C_FLAGS "-fno-strict-aliasing -Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits -Wuninitialized -Werror ${VISIBILITY_FLAG} ${GCOV_FLAGS} ${CMAKE_C_FLAGS}" )
+     endif()
+ endif ()
+ 
diff --git a/package/libwebsockets/0002-libuv.c.uninitialized.patch b/package/libwebsockets/0002-libuv.c.uninitialized.patch
new file mode 100644
index 0000000..319afee
--- /dev/null
+++ b/package/libwebsockets/0002-libuv.c.uninitialized.patch
@@ -0,0 +1,13 @@
+diff --git a/lib/event-libs/libuv/libuv.c b/lib/event-libs/libuv/libuv.c
+index 39363f1..746d6ba 100644
+--- a/lib/event-libs/libuv/libuv.c
++++ b/lib/event-libs/libuv/libuv.c
+@@ -503,7 +503,7 @@ static int
+ elops_destroy_context1_uv(struct lws_context *context)
+ {
+ 	struct lws_context_per_thread *pt;
+-	int n, m;
++	int n, m=0;
+ 
+ 	for (n = 0; n < context->count_threads; n++) {
+ 		int budget = 10000;
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index ea7c8ca..2cd94dac 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	73012d7fcf428dedccc816e83a63a01462e27819d5537b8e0d0c7264bfacfad6    libwebsockets-v2.4.2.tar.gz
+sha256 db948be74c78fc13f1f1a55e76707d7baae3a1c8f62b625f639e8f2736298324    libwebsockets-v3.1.0.tar.gz
 sha256  078fbbbeab357fc6d4f8090e95e9022fa4cb9eac1efd77b2f1387e9ccc51917a    LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 81e398b..238410f 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v2.4.2
+LIBWEBSOCKETS_VERSION = v3.1.0
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.7.4
