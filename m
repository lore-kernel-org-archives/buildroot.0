From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:56:36 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] netsnmp: fix static build
 failure due to missing -lssl and -lz
Message-ID: <20181020165534.82AD783B5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa0c2b3ec30e92136da624569248d5c303e11547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

During configure some checking needing -lssl and -lz don't have them
appended to linker tail. Since we are building static this leads to
configure failure because of mandatory functions lack produces:
"configure: error: The DTLS based transports require the libssl library
from OpenSSL to be available and support DTLS"

- Add 1 patch to fix -lssl lack in configure and .ac modules:
upstreamed: https://sourceforge.net/p/net-snmp/code/ci/bd59be8e4e339870a1400f6866a7b73ca11f6460/
- Add 2 patches to fix -lz lack in configure and .ac modules:
1 upstreamed: https://sourceforge.net/p/net-snmp/code/ci/13da2bcde8e22dd0127a668374fdf79bed04d353/
1 in Merge Request: https://sourceforge.net/p/net-snmp/code/merge-requests/19/
- Add NETSNMP_AUTORECONF = YES

Fixes:
http://autobuild.buildroot.net/results/ece/ece7af756c910f65f618c1d04a5de70cc574b5f4/
http://autobuild.buildroot.net/results/2a7/2a7020de6a4095cf9991d09fbe8f6e364783f63b/
http://autobuild.buildroot.net/results/e27/e2787d15f72949cbb347e8a1d344f5f80b4d7697/
http://autobuild.buildroot.net/results/439/4393ce8ddee294f91bdc3e6fb53e08d56fe52184/
http://autobuild.buildroot.net/results/da6/da6bbbbb3a8d8193ec1389b9d976164181e88ae2/
http://autobuild.buildroot.net/results/cf5/cf57686e7620cc0ec361631a9ff906aa0123fdb4/
http://autobuild.buildroot.net/results/104/1043a958314529240627005d1bf21a76f4e6fcf5/
http://autobuild.buildroot.net/results/885/8855545bd09388e0da451a3cb53b312e13b29c2c/
http://autobuild.buildroot.net/results/a3d/a3dab9618a7ed88f94597418a5892c87adc23c66/
http://autobuild.buildroot.net/results/18e/18e70b88c9bcb3b8ede7308e54bba9417d1fd3fb/
http://autobuild.buildroot.net/results/ee3/ee34f65f26da20c0f2fdb9e86bcbddd389f59a29/
http://autobuild.buildroot.net/results/a1e/a1eb848079080ddf7cf2fc9e554cdd63ade0e9aa/
http://autobuild.buildroot.net/results/4dc/4dc8b53ff9f504c0a3dfc2d72c2609ad4d34559b/
http://autobuild.buildroot.net/results/9cc/9cc19e481de20ea0b4b5163e45c5aee525b81229/
http://autobuild.buildroot.net/results/f15/f15c22e0257d7498456049d8aae195ed6a265d2e/
http://autobuild.buildroot.net/results/1b3/1b30f9813a4605056963bfe4532374f725830fda/
http://autobuild.buildroot.net/results/d02/d02afc174ac4c9888f0a2cf725820cc1f05fc4bf/
http://autobuild.buildroot.net/results/57b/57b3f4663058d728987ef848e4b346656cae21d4/
http://autobuild.buildroot.net/results/ed4/ed4c27bdffccc4374ab7f951c30baba8171d30e1/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 13722d58f77d0e9fea9eefc50bf083d19f835433)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-configure-static-linking-Fix-SSL-checks.patch | 142 +++++++++++++++++++++
 .../0002-configure-Fix-lcrypto-lz-test.patch       |  41 ++++++
 ...nvert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch |  41 ++++++
 package/netsnmp/netsnmp.mk                         |   1 +
 4 files changed, 225 insertions(+)

diff --git a/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch b/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
new file mode 100644
index 0000000000..8431d46868
--- /dev/null
+++ b/package/netsnmp/0001-configure-static-linking-Fix-SSL-checks.patch
@@ -0,0 +1,142 @@
+From bd59be8e4e339870a1400f6866a7b73ca11f6460 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Wed, 12 Sep 2018 20:16:39 +0200
+Subject: [PATCH 1/3] configure, static linking: Fix SSL checks
+
+During checking of DTLS_method, the stub program is linked only with -ssl
+libssl.a lacks some function from -lcrypto:
+RAND_*()
+ERR_*()
+BUF_MEM_*()
+etc.
+and -lz:
+- inflate()
+- deflate()
+
+Append -lcrypto and -lz to LIBS variable when checking DTLS_method.
+
+See also https://sourceforge.net/p/net-snmp/patches/1374/.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+[bvanassche: Edited subject / rewrote this patch]
+---
+ configure                   | 52 ++++++++++++++++++++++++++++++++++---
+ configure.d/config_os_libs2 | 14 +++++++---
+ 2 files changed, 58 insertions(+), 8 deletions(-)
+
+diff --git a/configure b/configure
+index 6504a8e58..1116cecaa 100755
+--- a/configure
++++ b/configure
+@@ -23228,16 +23228,60 @@ fi
+ { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_crypto_EVP_md5" >&5
+ $as_echo "$ac_cv_lib_crypto_EVP_md5" >&6; }
+ if test "x$ac_cv_lib_crypto_EVP_md5" = xyes; then :
+-  CRYPTO="crypto"
++  CRYPTO="crypto"; LIBCRYPTO="-lcrypto"
++else
++
++		{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for EVP_md5 in -lcrypto" >&5
++$as_echo_n "checking for EVP_md5 in -lcrypto... " >&6; }
++if ${ac_cv_lib_crypto_EVP_md5+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  ac_check_lib_save_LIBS=$LIBS
++LIBS="-lcrypto -lz $LIBS"
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++/* Override any GCC internal prototype to avoid an error.
++   Use char because int might match the return type of a GCC
++   builtin and then its argument prototype would still apply.  */
++#ifdef __cplusplus
++extern "C"
++#endif
++char EVP_md5 ();
++int
++main ()
++{
++return EVP_md5 ();
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_link "$LINENO"; then :
++  ac_cv_lib_crypto_EVP_md5=yes
++else
++  ac_cv_lib_crypto_EVP_md5=no
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
++LIBS=$ac_check_lib_save_LIBS
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_crypto_EVP_md5" >&5
++$as_echo "$ac_cv_lib_crypto_EVP_md5" >&6; }
++if test "x$ac_cv_lib_crypto_EVP_md5" = xyes; then :
++  CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"
+ fi
+ 
+-        fi
++
++fi
++
++	else
++	    LIBCRYPTO="-l${CRYPTO}"
++	fi
+ 
+         if test x$CRYPTO != x; then
+ 
+ $as_echo "#define HAVE_LIBCRYPTO 1" >>confdefs.h
+ 
+-            LIBCRYPTO="-l${CRYPTO}"
+             netsnmp_save_LIBS="$LIBS"
+             LIBS="$LIBCRYPTO"
+             for ac_func in AES_cfb128_encrypt                           EVP_sha224        EVP_sha384                                   EVP_MD_CTX_create EVP_MD_CTX_destroy                           EVP_MD_CTX_new    EVP_MD_CTX_free                              DH_set0_pqg DH_get0_pqg DH_get0_key                           ASN1_STRING_get0_data X509_NAME_ENTRY_get_object                           X509_NAME_ENTRY_get_data X509_get_signature_nid
+@@ -23291,7 +23335,7 @@ _ACEOF
+             LIBS="$netsnmp_save_LIBS"
+         fi
+         netsnmp_save_LIBS="$LIBS"
+-        LIBS="-lssl"
++        LIBS="-lssl $LIBCRYPTO"
+         for ac_func in TLS_method TLSv1_method DTLS_method DTLSv1_method                       SSL_library_init SSL_load_error_strings
+ do :
+   as_ac_var=`$as_echo "ac_cv_func_$ac_func" | $as_tr_sh`
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 4a1ad1551..75214cfff 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -306,13 +306,19 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
+         LIBS="$netsnmp_save_LIBS"
+ 
+         if test x$CRYPTO = x; then
+-            AC_CHECK_LIB([crypto], [EVP_md5], [CRYPTO="crypto"])
+-        fi
++            AC_CHECK_LIB([crypto], [EVP_md5],
++			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [
++		AC_CHECK_LIB([crypto], [EVP_md5],
++			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [],
++			     [-lz])
++	    ])
++	else
++	    LIBCRYPTO="-l${CRYPTO}"
++	fi
+ 
+         if test x$CRYPTO != x; then
+             AC_DEFINE(HAVE_LIBCRYPTO, 1,
+                 [Define to 1 if you have the OpenSSL library (-lcrypto or -leay32).])
+-            LIBCRYPTO="-l${CRYPTO}"
+             netsnmp_save_LIBS="$LIBS"
+             LIBS="$LIBCRYPTO"
+             AC_CHECK_FUNCS([AES_cfb128_encrypt]dnl
+@@ -342,7 +348,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
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
diff --git a/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch b/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch
new file mode 100644
index 0000000000..3ec0c2278f
--- /dev/null
+++ b/package/netsnmp/0002-configure-Fix-lcrypto-lz-test.patch
@@ -0,0 +1,41 @@
+From d8694929b12b47febb0f7f43f46041387874fe52 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Mon, 17 Sep 2018 07:33:34 -0700
+Subject: [PATCH 2/3] configure: Fix -lcrypto -lz test
+
+Avoid that the second crypto library test uses the cached result from
+the first test by explicitly clearing the cached test result.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ configure                   | 1 +
+ configure.d/config_os_libs2 | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index 1116cecaa..33b8c93e5 100755
+--- a/configure
++++ b/configure
+@@ -23231,6 +23231,7 @@ if test "x$ac_cv_lib_crypto_EVP_md5" = xyes; then :
+   CRYPTO="crypto"; LIBCRYPTO="-lcrypto"
+ else
+ 
++		unset ac_cv_lib_crypto_EVP_md5
+ 		{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for EVP_md5 in -lcrypto" >&5
+ $as_echo_n "checking for EVP_md5 in -lcrypto... " >&6; }
+ if ${ac_cv_lib_crypto_EVP_md5+:} false; then :
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 75214cfff..81788a209 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -308,6 +308,7 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
+         if test x$CRYPTO = x; then
+             AC_CHECK_LIB([crypto], [EVP_md5],
+ 			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [
++		unset ac_cv_lib_crypto_EVP_md5
+ 		AC_CHECK_LIB([crypto], [EVP_md5],
+ 			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [],
+ 			     [-lz])
+-- 
+2.17.1
+
diff --git a/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch b/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch
new file mode 100644
index 0000000000..5cbc35600f
--- /dev/null
+++ b/package/netsnmp/0003-configure-Invert-AC_CHECK_LIB-EVP_md5-.-without-lz-w.patch
@@ -0,0 +1,41 @@
+From 77062d4a76f5dbd8aee03a25e9eb514b7d924bcc Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Mon, 17 Sep 2018 21:44:20 +0200
+Subject: [PATCH 3/3] configure: Invert AC_CHECK_LIB(EVP_md5,..) without -lz
+ with -lz
+
+First AC_CHECK_LIB(EVP_md5,...) is going to succeed due to
+[other-libraries] fields, but in that case it won't add -lz to LIBCRYPTO
+resulting in failing AC_CHECH_FUNCS() with LIBS=LIBCRYPTO.
+
+Try AC_CHECK_LIB(EVP_md5,..) where LIBS can miss -lz
+and in action-if-not-found try AC_CHECK_LIB(EVP_md5,...) without -lz.
+In the first case append -lz to LIBCRYPTO, in the second don't.
+This is done to check if -lz is present and used in -lcrypto.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ configure.d/config_os_libs2 | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/configure.d/config_os_libs2 b/configure.d/config_os_libs2
+index 81788a209..bfd14c191 100644
+--- a/configure.d/config_os_libs2
++++ b/configure.d/config_os_libs2
+@@ -307,11 +307,10 @@ if test "x$tryopenssl" != "xno" -a "x$tryopenssl" != "xinternal"; then
+ 
+         if test x$CRYPTO = x; then
+             AC_CHECK_LIB([crypto], [EVP_md5],
+-			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [
++			 [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [
+ 		unset ac_cv_lib_crypto_EVP_md5
+ 		AC_CHECK_LIB([crypto], [EVP_md5],
+-			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto -lz"], [],
+-			     [-lz])
++			     [CRYPTO="crypto"; LIBCRYPTO="-lcrypto"], [])
+ 	    ])
+ 	else
+ 	    LIBCRYPTO="-l${CRYPTO}"
+-- 
+2.17.1
+
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 6c712ae075..65a3f16a4d 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -36,6 +36,7 @@ NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true inst
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
+NETSNMP_AUTORECONF = YES
 
 ifeq ($(BR2_ENDIAN),"BIG")
 NETSNMP_CONF_OPTS += --with-endianness=big
