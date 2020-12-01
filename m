From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Dec 2020 23:33:02 +0100
Subject: [Buildroot] [git commit] package/libuhttpd: fix static build with
 mbedtls and zlib
Message-ID: <20201201222241.80B54815D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50a76d7ae725658d2d052df6dbaf414f13a9f894
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/5891d12e90182460cde1ddfa0ca75e9fd55e3dff

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sts.txt-fix-static-build-with-a-zlib-and-.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/libuhttpd/0001-src-CMakeLists.txt-fix-static-build-with-a-zlib-and-.patch b/package/libuhttpd/0001-src-CMakeLists.txt-fix-static-build-with-a-zlib-and-.patch
new file mode 100644
index 0000000000..289ed1aaed
--- /dev/null
+++ b/package/libuhttpd/0001-src-CMakeLists.txt-fix-static-build-with-a-zlib-and-.patch
@@ -0,0 +1,51 @@
+From 0c2d85450e3eb77dfbe11e8612a5131c5f3f3938 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 1 Dec 2020 20:39:54 +0100
+Subject: [PATCH] src/CMakeLists.txt: fix static build with a zlib and mbedtls
+
+Static build with a zlib-enabled mbedtls fails on:
+
+[100%] Linking C executable example
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: /home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-uclinux-uclibcgnueabi/sysroot/usr/lib/libmbedtls.a(ssl_tls.c.o): in function `mbedtls_ssl_transform_free.part.24':
+ssl_tls.c:(.text+0xbc6): undefined reference to `deflateEnd'
+
+As mbedtls does not provide a pkg-config file, search for zlib and link
+with it if necessary
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5891d12e90182460cde1ddfa0ca75e9fd55e3dff
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zhaojh329/libuhttpd/pull/13]
+---
+ src/CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 132f243..f00fc8f 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -57,6 +57,7 @@ else()
+     endif()
+     find_package(WolfSSL)
+     find_package(MbedTLS)
++    find_package(ZLIB)
+ 
+ 	if(UHTTPD_USE_OPENSSL)
+ 		if (NOT OPENSSL_FOUND)
+@@ -97,7 +98,11 @@ else()
+ 	elseif(UHTTPD_USE_MBEDTLS)
+ 		set(SSL_NAME "MbedTLS(PolarSSL)")
+ 		set(SSL_INC ${MBEDTLS_INCLUDE_DIR})
+-		set(SSL_LIB ${MBEDTLS_LIBRARIES})
++		if(ZLIB_FOUND)
++			set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})
++		else()
++			set(SSL_LIB ${MBEDTLS_LIBRARIES})
++		endif()
+ 		set(UHTTPD_HAVE_MBEDTLS_CONFIG 1)
+ 	endif()
+ 
+-- 
+2.29.2
+
