From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:56:47 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] netsnmp: improve linking
 avoiding useless -lz listing in shared build
Message-ID: <20181020165534.8B02A83B5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7948dcf3a89bbb1ff0db00da5fac45459de867a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

In commit:
https://git.buildroot.net/buildroot/commit/?id=13722d58f77d0e9fea9eefc50bf083d19f835433
Patch "0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch"
was intended to fix AC_CHECK_FUNCS() failure on openssl functions. This
was due to missing -lz during static linking.
But the patch is wrong and results in explicitly linking against -lz in
both shared and static build.
This makes no sense, since shared linking has transitive dependency so
it doesn't need to list -lz after -lssl, -lssl is enough.
Differently static linking needs -lz to be listed after -lssl.

So the real cause of previous build failure:
http://autobuild.buildroot.net/results/881/881139fb049738b16609d39ad5a49bd77ff6b4aa/
is that when AC_CHECK_FUNCS(), $LIBS variable is overwritten with
$LIBCRYPTO without taking into accout previous $LIBS content(i.e. where
-lz is present). This results in AC_CHEC_FUNCS() to fail while trying to
statically link without listing -lz.

Then:
- Remove current "0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch"
- Add patch "0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch"
  where add $LIBS content to tail of new $LIBS variable like this:
  LIBS="$LIBCRYPTO $LIBS"
  NOTE: $LIBS is at the end to ensure static linking to work correctly.
- Add patch 0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
  where add $LIBS content to tail of new $LIBS variable like this:
  LIBS="-lssl $LIBCRYPTO $LIBS"
  NOTE: $LIBS is at the end to ensure static linking to work correctly.

This way AC_CHECK_FUNCS(), when static linking, try to link with -lz too
appending it at the end of linking library list.
And after every AC_CHECK_FUNCS(), previously saved $LIBS variable gets
back to its original value(i.e. containing -lz if present) resulting in
having or not -lz appended to library list according to static or
shared build.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c5a7c287de4a3108d8aaf965731ef7978a903875)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nvert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch | 41 ----------------------
 ...ix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch | 39 ++++++++++++++++++++
 ...ix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch | 39 ++++++++++++++++++++
 3 files changed, 78 insertions(+), 41 deletions(-)

diff --git a/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch b/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch
deleted file mode 100644
index 5cbc35600f..0000000000
--- a/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 77062d4a76f5dbd8aee03a25e9eb514b7d924bcc Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Mon, 17 Sep 2018 21:44:20 +0200
-Subject: [PATCH 3/3] configure: Invert AC_CHECK_LIB(EVP_md5,..) without -lz
- with -lz
-
-First AC_CHECK_LIB(EVP_md5,...) is going to succeed due to
-[other-libraries] fields, but in that case it won't add -lz to LIBCRYPTO
-resulting in failing AC_CHECH_FUNCS() with LIBS=LIBCRYPTO.
-
-Try AC_CHECK_LIB(EVP_md5,..) where LIBS can miss -lz
-and in action-if-not-found try AC_CHECK_LIB(EVP_md5,...) without -lz.
-In the first case append -lz to LIBCRYPTO, in the second don't.
-This is done to check if -lz is present and used in -lcrypto.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- configure.d/config_os_libs2 | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
-index 81788a209..bfd14c191 100644
---- a/configure.d/config_os_libs2
-+++ b/configure.d/config_os_libs2
-@@ -307,11 +307,10 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
- 
-         if test x$CRYPTO = x; then
-             AC_CHECK_LIB([crypto], [EVP_md5],
--			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [
-+			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [
- 		unset ac_cv_lib_crypto_EVP_md5
- 		AC_CHECK_LIB([crypto], [EVP_md5],
--			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [],
--			     [-lz])
-+			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [])
- 	    ])
- 	else
- 	    LIBCRYPTO="-l${CRYPTO}"
--- 
-2.17.1
-
diff --git a/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch b/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch
new file mode 100644
index 0000000000..0829042128
--- /dev/null
+++ b/package/netsnmp/0003-configure-fix-AC_CHECK_FUNCS-EVP_sha224-EVP_sha384-..patch
@@ -0,0 +1,39 @@
+From 8e273c688aa235ed9c68570a700d31596bac14df Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Mon, 15 Oct 2018 19:07:05 +0200
+Subject: [PATCH 1/2] configure: fix AC_CHECK_FUNCS(EVP_sha224 EVP_sha384 ...)
+ failure on static linking
+
+If building as static lib, AC_CHECK_FUNCS(EVP_sha224 EVP_sha384 ...)
+fails due to missing -lz in $LIBS.
+At the moment, $LIBS contains $LIBCRYPTO only discarding previous $LIBS
+content.
+
+Add $LIBS to:
+LIBS="$LIBCRYPTO"
+as:
+LIBS="$LIBCRYPTO $LIBS"
+This way $LIBS will contain -lz at the end of linking command that in
+static linking build is mandatory.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ configure.d/config_os_libs2 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 81788a209..93044000b 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -321,7 +321,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
+             AC_DEFINE(HAVE_LIBCRYPTO, 1,
+                 [Define to 1 if you have the OpenSSL library (-lcrypto or -leay32).])
+             netsnmp_save_LIBS="$LIBS"
+-            LIBS="$LIBCRYPTO"
++            LIBS="$LIBCRYPTO $LIBS"
+             AC_CHECK_FUNCS([AES_cfb128_encrypt]dnl
+                            [EVP_sha224        EVP_sha384        ]dnl
+                            [EVP_MD_CTX_create EVP_MD_CTX_destroy]dnl
+-- 
+2.17.1
+
diff --git a/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
new file mode 100644
index 0000000000..a731f25761
--- /dev/null
+++ b/package/netsnmp/0004-configure-fix-AC_CHECK_FUNCS-TLS_method-TLSv1_method.patch
@@ -0,0 +1,39 @@
+From 1ab6e3fc3cf61fa5a7b7363e59095e868474524b Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Mon, 15 Oct 2018 19:34:26 +0200
+Subject: [PATCH 2/2] configure: fix AC_CHECK_FUNCS(TLS_method TLSv1_method
+ ...) failure on static linking
+
+If building as static lib, AC_CHECK_FUNCS(TLS_method TLSv1_method ...)
+fails due to missing -lz in $LIBS.
+At the moment, $LIBS contains "-lssl $LIBCRYPTO" only discarding
+previous $LIBS content.
+
+Add $LIBS to:
+LIBS="-lssl $LIBCRYPTO"
+as:
+LIBS="-lssl $LIBCRYPTO $LIBS"
+This way $LIBS will contain -lz at the end of linking command that in
+static linking build is mandatory.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ configure.d/config_os_libs2 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 93044000b..c811c63ec 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -349,7 +349,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
+             LIBS="$netsnmp_save_LIBS"
+         fi
+         netsnmp_save_LIBS="$LIBS"
+-        LIBS="-lssl $LIBCRYPTO"
++        LIBS="-lssl $LIBCRYPTO $LIBS"
+         AC_CHECK_FUNCS([TLS_method TLSv1_method DTLS_method DTLSv1_method]dnl
+                        [SSL_library_init SSL_load_error_strings])
+         LIBS="$netsnmp_save_LIBS"
+-- 
+2.17.1
+
