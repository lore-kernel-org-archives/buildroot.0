From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Oct 2019 22:41:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix static build
 with openssl
Message-ID: <20191016204128.27360-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/65d0528b208c0a470264f7e2433be89425971dd7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ts.txt-fix-static-build-with-openssl.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch

diff --git a/package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch b/package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch
new file mode 100644
index 0000000000..c5aaafab85
--- /dev/null
+++ b/package/libwebsockets/0002-CMakeLists.txt-fix-static-build-with-openssl.patch
@@ -0,0 +1,36 @@
+From faf26eee75f5d58ff499cdc40ad1af58a33fb83f Mon Sep 17 00:00:00 2001
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
+[Upstream status: https://github.com/warmcat/libwebsockets/pull/1717]
+---
+ CMakeLists.txt | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 2693ac56..888f65e8 100644
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
+-- 
+2.23.0
+
-- 
2.23.0
