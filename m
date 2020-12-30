From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 09:38:17 +0100
Subject: [Buildroot] [git commit] package/libuhttpd: bump version to 3.6.0
Message-ID: <20201230082206.EB5B882C1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fd01e9e0552bf6378e484c6dd07940dbd72e718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sts.txt-fix-static-build-with-a-zlib-and-.patch | 51 ----------------------
 package/libuhttpd/libuhttpd.hash                   |  2 +-
 package/libuhttpd/libuhttpd.mk                     |  2 +-
 3 files changed, 2 insertions(+), 53 deletions(-)

diff --git a/package/libuhttpd/0001-src-CMakeLists.txt-fix-static-build-with-a-zlib-and-.patch b/package/libuhttpd/0001-src-CMakeLists.txt-fix-static-build-with-a-zlib-and-.patch
deleted file mode 100644
index 289ed1aaed..0000000000
--- a/package/libuhttpd/0001-src-CMakeLists.txt-fix-static-build-with-a-zlib-and-.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 0c2d85450e3eb77dfbe11e8612a5131c5f3f3938 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 1 Dec 2020 20:39:54 +0100
-Subject: [PATCH] src/CMakeLists.txt: fix static build with a zlib and mbedtls
-
-Static build with a zlib-enabled mbedtls fails on:
-
-[100%] Linking C executable example
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libmbedtls.a(ssl_tls.c.o): in function `mbedtls_ssl_transform_free.part.24':
-ssl_tls.c:(.text+0xbc6): undefined reference to `deflateEnd'
-
-As mbedtls does not provide a pkg-config file, search for zlib and link
-with it if necessary
-
-Fixes:
- - http://autobuild.buildroot.org/results/5891d12e90182460cde1ddfa0ca75e9fd55e3dff
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zhaojh329/libuhttpd/pull/13]
----
- src/CMakeLists.txt | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 132f243..f00fc8f 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -57,6 +57,7 @@ else()
-     endif()
-     find_package(WolfSSL)
-     find_package(MbedTLS)
-+    find_package(ZLIB)
- 
- 	if(UHTTPD_USE_OPENSSL)
- 		if (NOT OPENSSL_FOUND)
-@@ -97,7 +98,11 @@ else()
- 	elseif(UHTTPD_USE_MBEDTLS)
- 		set(SSL_NAME "MbedTLS(PolarSSL)")
- 		set(SSL_INC ${MBEDTLS_INCLUDE_DIR})
--		set(SSL_LIB ${MBEDTLS_LIBRARIES})
-+		if(ZLIB_FOUND)
-+			set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})
-+		else()
-+			set(SSL_LIB ${MBEDTLS_LIBRARIES})
-+		endif()
- 		set(UHTTPD_HAVE_MBEDTLS_CONFIG 1)
- 	endif()
- 
--- 
-2.29.2
-
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 0e2d125fe0..6053df6593 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a7650915f4444c84ad7ea813fcff44ae03eaf0c4cddfd2de4dcbf5ce9083874f  libuhttpd-3.4.2.tar.gz
+sha256  5cdbff570430530b46ed071363c52cc655bbb349943008b57f63061481586391  libuhttpd-3.6.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index fe8621c803..f665b27969 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.4.2
+LIBUHTTPD_VERSION = 3.6.0
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
