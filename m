From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Mar 2021 22:29:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: needs dynamic library
Message-ID: <20210319212900.353459-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

kismets fails to build statically with libwebsockets since commit
14522a8f9d272204763c49a21ebce5653430c612 because libwebsockets does not
specify any Libs.Private field in its pkg-config file resulting in the
following failure:

configure:10659: checking for lws_client_connect_via_info in -lwebsockets
configure:10684: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/bin/arm-linux-g++ -std=gnu++17 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -static -static -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp -lwebsockets  -latomic -lz >&5
/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libwebsockets.a(tls.c.o): in function `alpn_cb':
tls.c:(.text+0x24): undefined reference to `SSL_select_next_proto'

As it is not trivial to specify Libs.Private with cmake buildsystem
(i.e. LIB_LIST contains the list of libraries but in the "cmake format"
with full paths and ';'), just disable static build with libwebsockets.

Fixes:
 - http://autobuild.buildroot.org/results/9fc7891b61b1c487b95f07c59b802dd98ef71e3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libwebsockets/Config.in        | 4 ++++
 package/libwebsockets/libwebsockets.mk | 4 ----
 package/ttyd/Config.in                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index dff6688e83..d7b529cafd 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBWEBSOCKETS
 	bool "libwebsockets"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ZLIB
 	help
 	  Libwebsockets is a lightweight pure C library built to use
@@ -7,3 +8,6 @@ config BR2_PACKAGE_LIBWEBSOCKETS
 	  in both directions.
 
 	  https://libwebsockets.org/
+
+comment "libwebsockets needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 6f752f998e..c25686d385 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -69,10 +69,6 @@ else
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_LIBUV=OFF
 endif
 
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SHARED=OFF
-endif
-
 ifeq ($(BR2_SHARED_LIBS),y)
 LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_STATIC=OFF
 endif
diff --git a/package/ttyd/Config.in b/package/ttyd/Config.in
index df710fbac3..ecc705b17e 100644
--- a/package/ttyd/Config.in
+++ b/package/ttyd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TTYD
 	bool "ttyd"
-	depends on !BR2_STATIC_LIBS # libuv
+	depends on !BR2_STATIC_LIBS # libuv, libwebsockets
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv, json-c
 	depends on BR2_USE_MMU # libuv
-- 
2.30.1
