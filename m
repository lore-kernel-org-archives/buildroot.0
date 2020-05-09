From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 May 2020 21:29:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/rtty: fix static build with mbedtls
 and zlib
Message-ID: <20200509192921.3451413-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/61de143cdde1f0a9e734f46e9c68ce3504989890

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...xt-fix-static-build-with-mbedtls-and.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-mbedtls-and.patch

diff --git a/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-mbedtls-and.patch b/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-mbedtls-and.patch
new file mode 100644
index 0000000000..f33a5eaae9
--- /dev/null
+++ b/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-mbedtls-and.patch
@@ -0,0 +1,47 @@
+From 7b8efe11dbafce97971dc130bf6cc1756f34ce07 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 2 May 2020 21:02:53 +0200
+Subject: [PATCH] src/CMakeLists.txt: fix static build with mbedtls and zlib
+
+Static build with a zlib-enabled mbedtls fails on:
+
+[100%] Linking C executable rtty
+/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
+/home/buildroot/autobuild/instance-2/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libmbedtls.a(ssl_tls.c.o):
+in function `mbedtls_ssl_transform_free.part.24':
+(.text+0x1724): undefined reference to `deflateEnd'
+
+As mbedtls does not provide a pkg-config file, search for zlib and link
+with it if necessary
+
+Fixes:
+ - http://autobuild.buildroot.org/results/61de143cdde1f0a9e734f46e9c68ce3504989890
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/zhaojh329/rtty/commit/7b8efe11dbafce97971dc130bf6cc1756f34ce07]
+---
+ src/CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 9bb3097..d69c665 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -36,6 +36,7 @@ else()
+     endif()
+     find_package(WolfSSL)
+     find_package(MbedTLS)
++    find_package(ZLIB)
+ 
+     if(RTTY_USE_OPENSSL)
+         if (NOT OPENSSL_FOUND)
+@@ -76,7 +77,7 @@ else()
+     elseif(RTTY_USE_MBEDTLS)
+         set(SSL_NAME "MbedTLS(PolarSSL)")
+         set(SSL_INC ${MBEDTLS_INCLUDE_DIR})
+-        set(SSL_LIB ${MBEDTLS_LIBRARIES})
++        set(SSL_LIB ${MBEDTLS_LIBRARIES} ${ZLIB_LIBRARIES})
+         set(RTTY_HAVE_MBEDTLS_CONFIG 1)
+     endif()
+ 
-- 
2.26.2
