From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Sep 2018 10:51:19 +0200
Subject: [Buildroot] [PATCH 1/1] netsnmp: fix static build with openssl
Message-ID: <20180909085119.27976-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add a patch to add crypto and zlib when statically linking
- Add AUTORECONF=YES
- Remove "hack" of setting -lz in mk as it is now done in patch

Fixes:
 - http://autobuild.buildroot.org/results/1b30f9813a4605056963bfe4532374f725830fda

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-fix-static-build-with-openssl.patch  | 67 +++++++++++++++++++
 package/netsnmp/netsnmp.mk                    |  6 +-
 2 files changed, 69 insertions(+), 4 deletions(-)
 create mode 100644 package/netsnmp/0001-fix-static-build-with-openssl.patch

diff --git a/package/netsnmp/0001-fix-static-build-with-openssl.patch b/package/netsnmp/0001-fix-static-build-with-openssl.patch
new file mode 100644
index 0000000000..e73175e6af
--- /dev/null
+++ b/package/netsnmp/0001-fix-static-build-with-openssl.patch
@@ -0,0 +1,67 @@
+From 2675e97b76d20780a685ff4fa645d672a5513954 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 9 Sep 2018 10:00:13 +0200
+Subject: [PATCH] fix static build with openssl
+
+When checking for crypto functions such as EVP_sha224, it is needed to
+link with zlib otherwise static build fails:
+
+configure:24665: checking for EVP_sha224
+configure:24665: /home/naourr/work/instance-3/output/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -DNETSNMP_ENABLE_IPV6 -fno-strict-aliasing -DNETSNMP_REMOVE_U64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -static -Ulinux -Dlinux=linux -I/home/naourr/work/instance-3/output/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/include/libnl3   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lcrypto >&5
+/home/naourr/work/instance-3/output/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o): In function `zlib_stateful_expand_block':
+c_zlib.c:(.text+0x30): undefined reference to `inflate'
+/home/naourr/work/instance-3/output/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a(c_zlib.o): In function `zlib_stateful_compress_block':
+c_zlib.c:(.text+0x78): undefined reference to `deflate'
+
+Also when checking for ssl functions such as DTLSv1_method, it is needed
+to link also with crypto (and zlib) otherwise static build fails:
+
+configure:24717: checking for DTLSv1_method
+configure:24717: /home/naourr/work/instance-3/output/host/bin/xtensa-buildroot-linux-uclibc-gcc -o conftest -DNETSNMP_ENABLE_IPV6 -fno-strict-aliasing -DNETSNMP_REMOVE_U64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -Os -static -Ulinux -Dlinux=linux -I/home/naourr/work/instance-3/output/host/bin/../xtensa-buildroot-linux-uclibc/sysroot/usr/include/libnl3   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lssl >&5
+/home/naourr/work/instance-3/output/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(d1_srvr.o):(.text+0x4): undefined reference to `RAND_add'
+/home/naourr/work/instance-3/output/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(d1_srvr.o):(.text+0x8): undefined reference to `ERR_clear_error'
+/home/naourr/work/instance-3/output/host/xtensa-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(d1_srvr.o): In function `dtls1_accept':
+d1_srvr.c:(.text+0x23c): undefined reference to `ERR_put_error'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1b30f9813a4605056963bfe4532374f725830fda
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://sourceforge.net/p/net-snmp/code/merge-requests/17]
+---
+ configure.d/config_os_libs2 | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 74bed6bf7..84ebb77f5 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -309,13 +309,13 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
+         LIBS="$netsnmp_save_LIBS"
+ 
+         if test x$CRYPTO = x; then
+-            AC_CHECK_LIB([crypto], [EVP_md5], [CRYPTO="crypto"])
++            AC_CHECK_LIB([crypto], [EVP_md5], [CRYPTO="crypto"], [], -lz)
+         fi
+ 
+         if test x$CRYPTO != x; then
+             AC_DEFINE(HAVE_LIBCRYPTO, 1,
+                 [Define to 1 if you have the OpenSSL library (-lcrypto or -leay32).])
+-            LIBCRYPTO="-l${CRYPTO}"
++            LIBCRYPTO="-l${CRYPTO} -lz"
+             netsnmp_save_LIBS="$LIBS"
+             LIBS="$LIBCRYPTO"
+             AC_CHECK_FUNCS([AES_cfb128_encrypt]dnl
+@@ -345,7 +345,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
+             LIBS="$netsnmp_save_LIBS"
+         fi
+         netsnmp_save_LIBS="$LIBS"
+-        LIBS="-lssl"
++        LIBS="-lssl $LIBCRYPTO"
+         AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method DTLSv1_method]dnl
+                        [SSL_library_init SSL_load_error_strings])
+         LIBS="$netsnmp_save_LIBS"
+-- 
+2.17.1
+
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 6c712ae075..acf6ecdc27 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -36,6 +36,8 @@ NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true inst
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
+# We're patching configure.d/config_os_libs2
+NETSNMP_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_CONF_OPTS += --with-endianness=big
@@ -57,10 +59,6 @@ NETSNMP_CONF_OPTS += \
 	--with-openssl=$(STAGING_DIR)/usr/include/openssl \
 	--with-security-modules="tsm,usm" \
 	--with-transports="DTLSUDP,TLSTCP"
-ifeq ($(BR2_STATIC_LIBS),y)
-# openssl uses zlib, so we need to explicitly link with it when static
-NETSNMP_CONF_ENV += LIBS=-lz
-endif
 else ifeq ($(BR2_PACKAGE_NETSNMP_OPENSSL_INTERNAL),y)
 NETSNMP_CONF_OPTS += --with-openssl=internal
 else
-- 
2.17.1
