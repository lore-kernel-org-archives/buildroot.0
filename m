From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 21:48:51 +0200
Subject: [Buildroot] [git commit] package/rtty: fix static build with openssl
Message-ID: <20200329193532.6CA8489035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=171f94cfc4cb73ddbeb0fa9f964176e6dd646bf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/6105b69d8598f0033044a26f53a768e2d4b2915e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...keLists.txt-fix-static-build-with-openssl.patch | 43 ++++++++++++++++++++++
 package/rtty/rtty.mk                               |  2 +-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-openssl.patch b/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-openssl.patch
new file mode 100644
index 0000000000..590f336593
--- /dev/null
+++ b/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-openssl.patch
@@ -0,0 +1,43 @@
+From 225218e52ce387dc011431842ef6f45aeac74d33 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 26 Mar 2020 21:11:42 +0100
+Subject: [PATCH] src/CMakeLists.txt: fix static build with openssl
+
+As usual, cmake is unable to correctly handle static dependencies by its
+own and as a result a static build with openssl will fail on:
+
+/home/naourr/work/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/naourr/work/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(c_zlib.o): in function `zlib_stateful_expand_block':
+/home/naourr/work/instance-0/output-1/build/libopenssl-1.1.1d/crypto/comp/c_zlib.c:201: undefined reference to `inflate'
+
+To fix this, use pkg-config to retrieve openssl dependencies such as -lz
+or -latomic and fallback on existing mechanism
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6105b69d8598f0033044a26f53a768e2d4b2915e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zhaojh329/rtty/pull/64]
+---
+ src/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index bb65d43..b192606 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -29,7 +29,11 @@ set(RTTY_HAVE_MBEDTLS_CONFIG 0)
+ if(NOT RTTY_SSL_SUPPORT)
+     set(RTTY_SSL_SUPPORT_CONFIG 0)
+ else()
+-    find_package(OpenSSL)
++    find_package(PkgConfig QUIET)
++    pkg_check_modules(OPENSSL QUIET openssl)
++    if (NOT OPENSSL_FOUND)
++        find_package(OpenSSL)
++    endif()
+     find_package(WolfSSL)
+     find_package(MbedTLS)
+ 
+-- 
+2.25.1
+
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index bcd0fb3625..88599f6636 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -18,7 +18,7 @@ RTTY_CONF_OPTS += \
 	-DRTTY_USE_OPENSSL=OFF \
 	-DRTTY_USE_WOLFSSL=OFF
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-RTTY_DEPENDENCIES += openssl
+RTTY_DEPENDENCIES += host-pkgconf openssl
 RTTY_CONF_OPTS += \
 	-DRTTY_SSL_SUPPORT=ON \
 	-DRTTY_USE_MBEDTLS=OFF \
