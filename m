From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 23 Feb 2019 15:17:36 -0500
Subject: [Buildroot] [PATCH next 1/1] package/libwebsockets: bump version to
 3.1.0
Message-ID: <20190223201736.106101-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also:
- Update LICENSE file hash because of directory changes.

- Remove the dependency on BR2_USE_MMU, as libwebsockets no longer requires
  fork.

- Add 3 new patches:
  - The first patch sets a variable in libuv.c to 0 by default, which prevents
    a "may be used uninitialized" error if the option LWS_WITH_LIBUV is set to
    on. This patch is accepted upstream.

  - The second patch removes a check for both  LWS_WITH_LIBEV and
    LWS_WITH_LIBEVENT, as Buildroot removes libev's libevent.h, making this
    check unnecessary.

  - The third patch adds a -Wno-error=strict-aliasing to the compiling flags
    because of a bug in GCC 7.1.0 that gives a false strict-aliasing warning
    when compiling (See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80593
    for details.)

Tested with test-pkg:
./utils/test-pkg -c ./defconfig -p libwebsockets
             br-arm-full [1/6]: OK
  br-arm-cortex-a9-glibc [2/6]: OK
   br-arm-cortex-m4-full [3/6]: OK
          br-x86-64-musl [4/6]: OK
      br-arm-full-static [5/6]: OK
armv5-ctng-linux-gnueabi [6/6]: OK

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../0001-set-m-to-0-by-default.patch          | 30 +++++++++++++++++
 ...ve-check-for-both-libev-and-libevent.patch | 30 +++++++++++++++++
 ...-error-strict-aliasing-to-cmakelists.patch | 33 +++++++++++++++++++
 package/libwebsockets/Config.in               |  1 -
 package/libwebsockets/libwebsockets.hash      |  4 +--
 package/libwebsockets/libwebsockets.mk        |  2 +-
 6 files changed, 96 insertions(+), 4 deletions(-)
 create mode 100644 package/libwebsockets/0001-set-m-to-0-by-default.patch
 create mode 100644 package/libwebsockets/0002-remove-check-for-both-libev-and-libevent.patch
 create mode 100644 package/libwebsockets/0003-add-wno-error-strict-aliasing-to-cmakelists.patch

diff --git a/package/libwebsockets/0001-set-m-to-0-by-default.patch b/package/libwebsockets/0001-set-m-to-0-by-default.patch
new file mode 100644
index 0000000000..10f8f00d73
--- /dev/null
+++ b/package/libwebsockets/0001-set-m-to-0-by-default.patch
@@ -0,0 +1,30 @@
+From cb83154726f60ddc877df018ff9fd2bff48f0c8d Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Fri, 22 Feb 2019 15:47:41 -0500
+Subject: [PATCH] lib/event-libs/libuv/libuv.c: set m to 0 by default
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Setting m to 0 by default will prevent "error: ?m? may be used uninitialized in
+this function" while compiling with the option -DLWS_WITH_LIBUV=ON.
+
+Upstream status: Accepted
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ lib/event-libs/libuv/libuv.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/event-libs/libuv/libuv.c b/lib/event-libs/libuv/libuv.c
+index 39363f14c..c38eb2ac5 100644
+--- a/lib/event-libs/libuv/libuv.c
++++ b/lib/event-libs/libuv/libuv.c
+@@ -503,7 +503,7 @@ static int
+ elops_destroy_context1_uv(struct lws_context *context)
+ {
+ 	struct lws_context_per_thread *pt;
+-	int n, m;
++	int n, m = 0;
+ 
+ 	for (n = 0; n < context->count_threads; n++) {
+ 		int budget = 10000;
diff --git a/package/libwebsockets/0002-remove-check-for-both-libev-and-libevent.patch b/package/libwebsockets/0002-remove-check-for-both-libev-and-libevent.patch
new file mode 100644
index 0000000000..470636285f
--- /dev/null
+++ b/package/libwebsockets/0002-remove-check-for-both-libev-and-libevent.patch
@@ -0,0 +1,30 @@
+From 779afff73528938b6d988759f5c0cd3cc1fa628a Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 23 Feb 2019 12:43:18 -0500
+Subject: [PATCH] remove check for both libev and libevent
+
+Buildroot removes event.h from libev, so this check is unnecessary.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ CMakeLists.txt | 4 ----
+ 1 file changed, 0 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e808f126..a42b7c0f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -548,10 +548,6 @@ if (LWS_WITH_SQLITE3)
+ endif()
+ 
+ 
+-if (LWS_WITH_LIBEV AND LWS_WITH_LIBEVENT)
+-	message(FATAL_ERROR "Sorry libev and libevent conflict with each others' namespace, you can only have one or the other")
+-endif()
+-
+ # The base dir where the test-apps look for the SSL certs.
+ set(LWS_OPENSSL_CLIENT_CERTS ../share CACHE PATH "Server SSL certificate directory")
+ if (WIN32)
+-- 
+2.20.1
+
diff --git a/package/libwebsockets/0003-add-wno-error-strict-aliasing-to-cmakelists.patch b/package/libwebsockets/0003-add-wno-error-strict-aliasing-to-cmakelists.patch
new file mode 100644
index 0000000000..f32ce641e9
--- /dev/null
+++ b/package/libwebsockets/0003-add-wno-error-strict-aliasing-to-cmakelists.patch
@@ -0,0 +1,33 @@
+From 5e80e03cb5fcbad26b64afcc4e878cf4b3462d10 Mon Sep 17 00:00:00 2001
+From: Adam Duskett <Aduskett@gmail.com>
+Date: Sat, 23 Feb 2019 13:04:02 -0500
+Subject: [PATCH] Add -Wno-error=strict-aliasing to cmakelists
+
+GCC 7.1.0 contain a bug that gives a false positive for strict
+aliasing warnings. (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80593)
+
+This false positive causes libwebsockets to fail to compile using some versions
+of GCC7 because -Werror is turned on. Because this warning is a false positive,
+it is safe to set -Wno-error=strict-aliasing in the CmakeLists.txt file.
+
+Signed-off-by: Adam Duskett <Aduskett@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a42b7c0f..88d14a15 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1338,7 +1338,7 @@ if (CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX OR (CMAKE_C_COMPILER_ID
+     endif()
+ 
+     if (UNIX AND NOT LWS_WITH_ESP32)
+-	    set(CMAKE_C_FLAGS "-Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits -Wuninitialized -Werror ${VISIBILITY_FLAG} -Wundef ${GCOV_FLAGS} ${CMAKE_C_FLAGS} ${ASAN_FLAGS}" )
++	    set(CMAKE_C_FLAGS "-Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits -Wuninitialized -Werror -Wno-error=strict-aliasing ${VISIBILITY_FLAG} -Wundef ${GCOV_FLAGS} ${CMAKE_C_FLAGS} ${ASAN_FLAGS}" )
+     else()
+ 	    set(CMAKE_C_FLAGS "-Wall -Wsign-compare -Wignored-qualifiers -Wtype-limits -Wuninitialized -Werror ${VISIBILITY_FLAG} ${GCOV_FLAGS} ${CMAKE_C_FLAGS}" )
+     endif()
+-- 
+2.20.1
+
diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 2b350bf389..1d927bb4ea 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBWEBSOCKETS
 	bool "libwebsockets"
-	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Libwebsockets is a lightweight pure C library built to use
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index ea7c8ca6ba..daf3bd8574 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	73012d7fcf428dedccc816e83a63a01462e27819d5537b8e0d0c7264bfacfad6    libwebsockets-v2.4.2.tar.gz
-sha256  078fbbbeab357fc6d4f8090e95e9022fa4cb9eac1efd77b2f1387e9ccc51917a    LICENSE
+sha256	db948be74c78fc13f1f1a55e76707d7baae3a1c8f62b625f639e8f2736298324	libwebsockets-v3.1.0.tar.gz
+sha256	4d092cd5e062c5ab0cf6408963d74619b5baf1571344410be6aa5bcef512eb70	LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 81e398bedd..238410f77c 100644
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
2.20.1
