From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Apr 2020 17:30:37 +0200
Subject: [Buildroot] [git commit] package/rtty: bump version to 7.1.3
Message-ID: <20200404151744.6A90C811E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cdb127fecaa001b93d2a203bdca69c095713c1d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...keLists.txt-fix-static-build-with-openssl.patch | 43 ----------------------
 package/rtty/rtty.hash                             |  2 +-
 package/rtty/rtty.mk                               |  2 +-
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-openssl.patch b/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-openssl.patch
deleted file mode 100644
index 590f336593..0000000000
--- a/package/rtty/0001-src-CMakeLists.txt-fix-static-build-with-openssl.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 225218e52ce387dc011431842ef6f45aeac74d33 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 26 Mar 2020 21:11:42 +0100
-Subject: [PATCH] src/CMakeLists.txt: fix static build with openssl
-
-As usual, cmake is unable to correctly handle static dependencies by its
-own and as a result a static build with openssl will fail on:
-
-/home/naourr/work/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/naourr/work/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libcrypto.a(c_zlib.o): in function `zlib_stateful_expand_block':
-/home/naourr/work/instance-0/output-1/build/libopenssl-1.1.1d/crypto/comp/c_zlib.c:201: undefined reference to `inflate'
-
-To fix this, use pkg-config to retrieve openssl dependencies such as -lz
-or -latomic and fallback on existing mechanism
-
-Fixes:
- - http://autobuild.buildroot.org/results/6105b69d8598f0033044a26f53a768e2d4b2915e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zhaojh329/rtty/pull/64]
----
- src/CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index bb65d43..b192606 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -29,7 +29,11 @@ set(RTTY_HAVE_MBEDTLS_CONFIG 0)
- if(NOT RTTY_SSL_SUPPORT)
-     set(RTTY_SSL_SUPPORT_CONFIG 0)
- else()
--    find_package(OpenSSL)
-+    find_package(PkgConfig QUIET)
-+    pkg_check_modules(OPENSSL QUIET openssl)
-+    if (NOT OPENSSL_FOUND)
-+        find_package(OpenSSL)
-+    endif()
-     find_package(WolfSSL)
-     find_package(MbedTLS)
- 
--- 
-2.25.1
-
diff --git a/package/rtty/rtty.hash b/package/rtty/rtty.hash
index 51d4b9fd32..feaac4762d 100644
--- a/package/rtty/rtty.hash
+++ b/package/rtty/rtty.hash
@@ -1,2 +1,2 @@
-sha256  6faafe75d82edbcfe154da5f1ffc0ddfd14dd88a2315f19aeed7f2631df96f41  rtty-7.1.2.tar.gz
+sha256  e10ee2048a29e18e6b21c77cb9cf7772eb95646e69567f8b40e85b816d93a3fa  rtty-7.1.3.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/rtty/rtty.mk b/package/rtty/rtty.mk
index 88599f6636..0b787a6353 100644
--- a/package/rtty/rtty.mk
+++ b/package/rtty/rtty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTTY_VERSION = 7.1.2
+RTTY_VERSION = 7.1.3
 RTTY_SITE = https://github.com/zhaojh329/rtty/releases/download/v$(RTTY_VERSION)
 RTTY_LICENSE = MIT
 RTTY_LICENSE_FILES = LICENSE
