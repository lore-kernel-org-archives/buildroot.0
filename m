From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 26 Feb 2015 00:17:05 +0100
Subject: [Buildroot] [PATCH] package/libsrtp: fix static build only
Message-ID: <1424906225-11543-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use PKG_CHECK_MODULES to check openssl, otherwise the check fail
to detect it due to a link issue with zlib.

Fixes:
http://autobuild.buildroot.net/results/a71/a71d85a5bb9af2ee82a8e61054025bceb03dbdeb/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0002-configure-fix-static-build-only.patch     | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/libsrtp/0002-configure-fix-static-build-only.patch

diff --git a/package/libsrtp/0002-configure-fix-static-build-only.patch b/package/libsrtp/0002-configure-fix-static-build-only.patch
new file mode 100644
index 0000000..49b608f
--- /dev/null
+++ b/package/libsrtp/0002-configure-fix-static-build-only.patch
@@ -0,0 +1,45 @@
+From 1296962830e8c7469f1b5a58dac982dc9a66c69c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 25 Feb 2015 22:30:41 +0100
+Subject: [PATCH] configure: fix static build only
+
+Use PKG_CHECK_MODULES to check openssl, otherwise the check fail
+to detect it due to a link issue with zlib.
+
+config.log:
+arm-linux-gcc -o conftest -Os  -static -I/usr/include -static -L/usr/lib -lz -lcrypto -lssl
+conftest.c -lcrypto /usr/lib/libcrypto.a(c_zlib.o): In function `zlib_stateful_expand_block':
+c_zlib.c:(.text+0x54): undefined reference to `inflate'
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.in | 13 +++----------
+ 1 file changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index ee30daf..101a58a 100644
+--- a/configure.in
++++ b/configure.in
+@@ -144,16 +144,9 @@ AC_ARG_ENABLE(openssl,
+   [], enable_openssl=no)
+ AC_MSG_RESULT($enable_openssl)
+ if test "$enable_openssl" = "yes"; then
+-   LDFLAGS="$LDFLAGS $(pkg-config --libs openssl)";
+-   CFLAGS="$CFLAGS $(pkg-config --cflags openssl)";
+-
+-   AC_CHECK_LIB([crypto], [EVP_EncryptInit], [],
+-             [AC_MSG_FAILURE([can't find openssl >1.0.1 crypto lib])])
+-   AC_CHECK_LIB([crypto], [EVP_aes_128_ctr], [],
+-             [AC_MSG_FAILURE([can't find openssl >1.0.1 crypto lib])])
+-   AC_CHECK_LIB([crypto], [EVP_aes_128_gcm], [],
+-             [AC_MSG_FAILURE([can't find openssl >1.0.1 crypto lib])])
+-   AC_DEFINE(OPENSSL, 1, [Define this to use OpenSSL crypto.])
++   PKG_CHECK_MODULES([OPENSSL], [openssl],
++		[AC_DEFINE(OPENSSL, 1, [Define this to use OpenSSL crypto.])],
++		[AC_MSG_FAILURE([can't find openssl >1.0.1 crypto lib])])
+    AES_ICM_OBJS="crypto/cipher/aes_icm_ossl.o crypto/cipher/aes_gcm_ossl.o"
+    RNG_OBJS=rand_source_ossl.o
+    HMAC_OBJS=crypto/hash/hmac_ossl.o
+-- 
+1.9.3
+
-- 
1.9.3
