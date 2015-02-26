From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 26 Feb 2015 22:11:07 +0100
Subject: [Buildroot] [PATCH] package/libsrtp: fix static build with openssl
Message-ID: <1424985067-6640-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsrp forget to link with zlib for static build when openssl
support is requested.

The issue was reported upstream by Vicente Olivert Riera:
https://github.com/cisco/libsrtp/issues/97

Backport upstream patch for the upcoming libsrtp 1.5.2.

Fixes:
http://autobuild.buildroot.net/results/a71/a71d85a5bb9af2ee82a8e61054025bceb03dbdeb/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...checks-for-libz-and-libdl-when-OpenSSL-is.patch | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch

diff --git a/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
new file mode 100644
index 0000000..5075762
--- /dev/null
+++ b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
@@ -0,0 +1,140 @@
+From cfbf3609d62201c6de9b1a075a2ce6f1edd580b6 Mon Sep 17 00:00:00 2001
+From: jfigus <foleyj@cisco.com>
+Date: Thu, 26 Feb 2015 12:25:08 -0500
+Subject: [PATCH] A autoconf checks for libz and libdl when OpenSSL is enabled
+ to allow for static linking of OpenSSL (via CFLAGS=-static).
+
+---
+ configure    | 100 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ configure.in |   4 +++
+ 2 files changed, 104 insertions(+)
+
+diff --git a/configure b/configure
+index fdef142..0870dff 100755
+--- a/configure
++++ b/configure
+@@ -4843,6 +4843,106 @@ if test "$enable_openssl" = "yes"; then
+    LDFLAGS="$LDFLAGS $(pkg-config --libs openssl)";
+    CFLAGS="$CFLAGS $(pkg-config --cflags openssl)";
+ 
++   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for dlopen in -ldl" >&5
++$as_echo_n "checking for dlopen in -ldl... " >&6; }
++if ${ac_cv_lib_dl_dlopen+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  ac_check_lib_save_LIBS=$LIBS
++LIBS="-ldl  $LIBS"
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++/* Override any GCC internal prototype to avoid an error.
++   Use char because int might match the return type of a GCC
++   builtin and then its argument prototype would still apply.  */
++#ifdef __cplusplus
++extern "C"
++#endif
++char dlopen ();
++int
++main ()
++{
++return dlopen ();
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_link "$LINENO"; then :
++  ac_cv_lib_dl_dlopen=yes
++else
++  ac_cv_lib_dl_dlopen=no
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
++LIBS=$ac_check_lib_save_LIBS
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_dl_dlopen" >&5
++$as_echo "$ac_cv_lib_dl_dlopen" >&6; }
++if test "x$ac_cv_lib_dl_dlopen" = xyes; then :
++  cat >>confdefs.h <<_ACEOF
++#define HAVE_LIBDL 1
++_ACEOF
++
++  LIBS="-ldl $LIBS"
++
++else
++  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
++$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
++as_fn_error $? "can't find libdl
++See \`config.log' for more details" "$LINENO" 5; }
++fi
++
++   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for inflate in -lz" >&5
++$as_echo_n "checking for inflate in -lz... " >&6; }
++if ${ac_cv_lib_z_inflate+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  ac_check_lib_save_LIBS=$LIBS
++LIBS="-lz  $LIBS"
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++/* Override any GCC internal prototype to avoid an error.
++   Use char because int might match the return type of a GCC
++   builtin and then its argument prototype would still apply.  */
++#ifdef __cplusplus
++extern "C"
++#endif
++char inflate ();
++int
++main ()
++{
++return inflate ();
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_link "$LINENO"; then :
++  ac_cv_lib_z_inflate=yes
++else
++  ac_cv_lib_z_inflate=no
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
++LIBS=$ac_check_lib_save_LIBS
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_z_inflate" >&5
++$as_echo "$ac_cv_lib_z_inflate" >&6; }
++if test "x$ac_cv_lib_z_inflate" = xyes; then :
++  cat >>confdefs.h <<_ACEOF
++#define HAVE_LIBZ 1
++_ACEOF
++
++  LIBS="-lz $LIBS"
++
++else
++  { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
++$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
++as_fn_error $? "can't find libz
++See \`config.log' for more details" "$LINENO" 5; }
++fi
++
+    { $as_echo "$as_me:${as_lineno-$LINENO}: checking for EVP_EncryptInit in -lcrypto" >&5
+ $as_echo_n "checking for EVP_EncryptInit in -lcrypto... " >&6; }
+ if ${ac_cv_lib_crypto_EVP_EncryptInit+:} false; then :
+diff --git a/configure.in b/configure.in
+index ee30daf..71df46b 100644
+--- a/configure.in
++++ b/configure.in
+@@ -147,6 +147,10 @@ if test "$enable_openssl" = "yes"; then
+    LDFLAGS="$LDFLAGS $(pkg-config --libs openssl)";
+    CFLAGS="$CFLAGS $(pkg-config --cflags openssl)";
+ 
++   AC_CHECK_LIB([dl], [dlopen], [],
++             [AC_MSG_FAILURE([can't find libdl])])
++   AC_CHECK_LIB([z], [inflate], [],
++             [AC_MSG_FAILURE([can't find libz])])
+    AC_CHECK_LIB([crypto], [EVP_EncryptInit], [],
+              [AC_MSG_FAILURE([can't find openssl >1.0.1 crypto lib])])
+    AC_CHECK_LIB([crypto], [EVP_aes_128_ctr], [],
+-- 
+1.9.3
+
-- 
1.9.3
