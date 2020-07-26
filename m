From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 19:28:59 -0700
Subject: [Buildroot] [PATCH 3/5] package/libwebsockets: bump version to
 4.0.20
In-Reply-To: <20200726022901.295552-1-aduskett@gmail.com>
References: <20200726022901.295552-1-aduskett@gmail.com>
Message-ID: <20200726022901.295552-4-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Remove upstream patch.
  - Change license type to MIT.
  - Update license shasum due to the above change.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...ts-txt-fix-static-build-with-openssl.patch | 34 -------------------
 package/libwebsockets/libwebsockets.hash      |  4 +--
 package/libwebsockets/libwebsockets.mk        |  4 +--
 3 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch

diff --git a/package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch b/package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch
deleted file mode 100644
index 868685d397..0000000000
--- a/package/libwebsockets/0001-CMakeLists-txt-fix-static-build-with-openssl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5f8134cfe5e7b90a8ce07d27ae737dcc54b523b3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 16 Oct 2019 20:09:13 +0200
-Subject: [PATCH] CMakeLists.txt: fix static build with openssl
-
-openssl can depends on -latomic so use pkg-config (if available) to
-retrieve these static dependencies otherwise build will fail because
-HMAC_CTX_new test will return a wrong result
-
-Fixes:
- - http://autobuild.buildroot.org/results/65d0528b208c0a470264f7e2433be89425971dd7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/warmcat/libwebsockets/commit/5f8134cfe5e7b90a8ce07d27ae737dcc54b523b3]
----
- CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2693ac56a..888f65e83 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1803,7 +1803,10 @@ if (LWS_WITH_SSL)
- 		if (NOT OPENSSL_FOUND AND NOT LWS_WITH_BORINGSSL)
- 			# TODO: Add support for STATIC also.
- 		if (NOT LWS_WITH_ESP32)
-+			find_package(PkgConfig QUIET)
-+			pkg_check_modules(PC_OPENSSL openssl QUIET)
- 			find_package(OpenSSL REQUIRED)
-+			list(APPEND OPENSSL_LIBRARIES ${PC_OPENSSL_LIBRARIES})
- 		endif()
- 			set(OPENSSL_INCLUDE_DIRS "${OPENSSL_INCLUDE_DIR}")
- 		endif()
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index ca0c1db2d5..3963370710 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	166d6e17cab64bfc10c2a71799c298284540a1fa63f6ea3de5caccb34502243c  libwebsockets-3.2.2.tar.gz
-sha256  4d092cd5e062c5ab0cf6408963d74619b5baf1571344410be6aa5bcef512eb70  LICENSE
+sha256  a26d243f2642a9b810e7d91f1e66b149d1da978decdca58ce1c9218c454f397e  libwebsockets-4.0.20.tar.gz
+sha256  5756db345eb9c21cb06dd7cb69c38ec234657a233f9a186b4f5fa453681bd394  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 6716d52796..6c2667b867 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 3.2.2
+LIBWEBSOCKETS_VERSION = 4.0.20
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
-LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
+LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
-- 
2.26.2
