From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Jan 2020 19:03:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix back static
 build with openssl
Message-ID: <20200125180308.3482382-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Put back an updated version of the patch that was wrongly removed when
bumping to version 3.2.2 with commit
55d49a3882a657caedc27cb241ccb2a97b07e2a

Fixes:
 - http://autobuild.buildroot.org/results/543652b958bae2f5dbd847d6de4256089be2da73

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ts-txt-fix-static-build-with-openssl.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch

diff --git a/package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch b/package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch
new file mode 100644
index 0000000000..868685d397
--- /dev/null
+++ b/package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch
@@ -0,0 +1,34 @@
+From 5f8134cfe5e7b90a8ce07d27ae737dcc54b523b3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 16 Oct 2019 20:09:13 +0200
+Subject: [PATCH] CMakeLists.txt: fix static build with openssl
+
+openssl can depends on -latomic so use pkg-config (if available) to
+retrieve these static dependencies otherwise build will fail because
+HMAC_CTX_new test will return a wrong result
+
+Fixes:
+ - http://autobuild.buildroot.org/results/65d0528b208c0a470264f7e2433be89425971dd7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/warmcat/libwebsockets/commit/5f8134cfe5e7b90a8ce07d27ae737dcc54b523b3]
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2693ac56a..888f65e83 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1803,7 +1803,10 @@ if (LWS_WITH_SSL)
+ 		if (NOT OPENSSL_FOUND AND NOT LWS_WITH_BORINGSSL)
+ 			# TODO: Add support for STATIC also.
+ 		if (NOT LWS_WITH_ESP32)
++			find_package(PkgConfig QUIET)
++			pkg_check_modules(PC_OPENSSL openssl QUIET)
+ 			find_package(OpenSSL REQUIRED)
++			list(APPEND OPENSSL_LIBRARIES ${PC_OPENSSL_LIBRARIES})
+ 		endif()
+ 			set(OPENSSL_INCLUDE_DIRS "${OPENSSL_INCLUDE_DIR}")
+ 		endif()
-- 
2.24.1
