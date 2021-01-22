From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 20:04:42 +0100
Subject: [Buildroot] [git commit] package/rtty: bump version to 7.2.1
Message-ID: <20210122184901.3C7F381730@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac7a7c308ce6f2b3660877ac8119f51a3fd973af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sts.txt-fix-build-with-mbedtls-but-withou.patch | 47 ----------------------
 package/rtty/rtty.hash                             |  2 +-
 package/rtty/rtty.mk                               |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)

diff --git a/package/rtty/0001-src-CMakeLists.txt-fix-build-with-mbedtls-but-withou.patch b/package/rtty/0001-src-CMakeLists.txt-fix-build-with-mbedtls-but-withou.patch
deleted file mode 100644
index b7275462af..0000000000
--- a/package/rtty/0001-src-CMakeLists.txt-fix-build-with-mbedtls-but-withou.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0982308255dd3fd70e7b93aa88a8f3c5b9c1b845 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 30 Aug 2020 21:15:06 +0200
-Subject: [PATCH] src/CMakeLists.txt: fix build with mbedtls but without zlib
-
-Building with mbedtls but without zlib will result in the following
-build failure:
-
--- Found MbedTLS: /home/peko/autobuild/instance-0/output-1/per-package/rtty/host/powerpc64-buildroot-linux-gnu/sysroot/usr/lib/libmbedtls.so (found version "2.16.7")
--- Could NOT find ZLIB (missing: ZLIB_LIBRARY ZLIB_INCLUDE_DIR)
--- Select MbedTLS(PolarSSL) as the SSL backend
-CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
-Please set them or make sure they are set and tested correctly in the CMake files:
-ZLIB_LIBRARY
-    linked by target "rtty" in directory /home/peko/autobuild/instance-0/output-1/build/rtty-7.1.4/src
-
--- Configuring incomplete, errors occurred!
-
-Fixes:
- - http://autobuild.buildroot.org/results/a0ebffe58bbf14cab74b7d2111d4d88a9c725273
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zhaojh329/rtty/pull/77]
----
- src/CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 10f6626..d09e848 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -77,7 +77,11 @@ else()
-     elseif(RTTY_USE_MBEDTLS)
-         set(SSL_NAME "MbedTLS(PolarSSL)")
-         set(SSL_INC ${MBEDTLS_INCLUDE_DIR})
--        set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})
-+        if(ZLIB_FOUND)
-+            set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})
-+        else()
-+            set(SSL_LIB ${MBEDTLS_LIBRARIES}) 
-+        endif()
-         set(RTTY_HAVE_MBEDTLS_CONFIG 1)
-     endif()
- 
--- 
-2.28.0
-
diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index b49004ca1f..176bae0995 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  f0b8cf4c4d3d4b34d10097fe430d32ab1576edbf41131d27b6b964e078be1716  rtty-7.1.4.tar.gz
+sha256  10675a12f4333d5b552b6489f04ca4be8821bb67c1fcfca7b002ed7a7fe498c7  rtty-7.2.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index b0efda0470..7fbd7c06b6 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.1.4
+RTTY_VERSION = 7.2.1
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
