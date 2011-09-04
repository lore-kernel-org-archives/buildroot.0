From: Darius Augulis <augulis.darius@gmail.com>
Date: Sun, 04 Sep 2011 15:08:42 +0300
Subject: [Buildroot] [PATCH 3/3] libcurl: fix cross-compile
Message-ID: <20110904120842.3974.2458.stgit@darius-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix libcurl configure error.
It happens when cross-compiling.
The same error is reported here:
https://dev.openwrt.org/ticket/8380
Patch is taken from openWRT.

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
---
 package/libcurl/libcurl.100-cross_compile.patch |  132 +++++++++++++++++++++++
 1 files changed, 132 insertions(+), 0 deletions(-)
 create mode 100644 package/libcurl/libcurl.100-cross_compile.patch

diff --git a/package/libcurl/libcurl.100-cross_compile.patch b/package/libcurl/libcurl.100-cross_compile.patch
new file mode 100644
index 0000000..8443329
--- /dev/null
+++ b/package/libcurl/libcurl.100-cross_compile.patch
@@ -0,0 +1,132 @@
+diff -urp a/configure b/configure
+--- a/configure	2010-12-17 09:28:58.000000000 +0100
++++ b/configure	2010-12-17 09:27:24.000000000 +0100
+@@ -19786,16 +19786,16 @@ fi
+ rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
+   fi
+ 
+-  if test "$OPENSSL_ENABLED" = "1"; then
+-    if test -n "$LIB_OPENSSL"; then
+-
+-       LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIB_OPENSSL"
+-       export LD_LIBRARY_PATH
+-       { $as_echo "$as_me:${as_lineno-$LINENO}: Added $LIB_OPENSSL to LD_LIBRARY_PATH" >&5
+-$as_echo "$as_me: Added $LIB_OPENSSL to LD_LIBRARY_PATH" >&6;}
+-    fi
+-  fi
+-
++#  if test "$OPENSSL_ENABLED" = "1"; then
++#    if test -n "$LIB_OPENSSL"; then
++#
++#       LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIB_OPENSSL"
++#       export LD_LIBRARY_PATH
++#       { $as_echo "$as_me:${as_lineno-$LINENO}: Added $LIB_OPENSSL to LD_LIBRARY_PATH" >&5
++#$as_echo "$as_me: Added $LIB_OPENSSL to LD_LIBRARY_PATH" >&6;}
++#    fi
++#  fi
++#
+ fi
+ 
+ 
+@@ -20253,19 +20253,19 @@ else
+ fi
+ 
+ 
+-      if test "x$USE_GNUTLS" = "xyes"; then
+-        { $as_echo "$as_me:${as_lineno-$LINENO}: detected GnuTLS version $version" >&5
+-$as_echo "$as_me: detected GnuTLS version $version" >&6;}
+-
+-        if test -n "$gtlslib"; then
+-
+-          LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$gtlslib"
+-          export LD_LIBRARY_PATH
+-          { $as_echo "$as_me:${as_lineno-$LINENO}: Added $gtlslib to LD_LIBRARY_PATH" >&5
+-$as_echo "$as_me: Added $gtlslib to LD_LIBRARY_PATH" >&6;}
+-        fi
+-      fi
+-
++#      if test "x$USE_GNUTLS" = "xyes"; then
++#        { $as_echo "$as_me:${as_lineno-$LINENO}: detected GnuTLS version $version" >&5
++#$as_echo "$as_me: detected GnuTLS version $version" >&6;}
++#
++#        if test -n "$gtlslib"; then
++#
++#          LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$gtlslib"
++#          export LD_LIBRARY_PATH
++#          { $as_echo "$as_me:${as_lineno-$LINENO}: Added $gtlslib to LD_LIBRARY_PATH" >&5
++#$as_echo "$as_me: Added $gtlslib to LD_LIBRARY_PATH" >&6;}
++#        fi
++#      fi
++#
+     fi
+ 
+   fi
+diff -urp a/configure.ac b/configure.ac
+--- a/configure.ac	2010-12-17 09:33:22.000000000 +0100
++++ b/configure.ac	2010-12-17 09:27:24.000000000 +0100
+@@ -1495,17 +1495,17 @@ if test X"$OPT_SSL" != Xno; then
+     ])
+   fi
+ 
+-  if test "$OPENSSL_ENABLED" = "1"; then
+-    if test -n "$LIB_OPENSSL"; then
+-       dnl when the ssl shared libs were found in a path that the run-time
+-       dnl linker doesn't search through, we need to add it to LD_LIBRARY_PATH
+-       dnl to prevent further configure tests to fail due to this
+-
+-       LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIB_OPENSSL"
+-       export LD_LIBRARY_PATH
+-       AC_MSG_NOTICE([Added $LIB_OPENSSL to LD_LIBRARY_PATH])
+-    fi
+-  fi
++#  if test "$OPENSSL_ENABLED" = "1"; then
++#    if test -n "$LIB_OPENSSL"; then
++#       dnl when the ssl shared libs were found in a path that the run-time
++#       dnl linker doesn't search through, we need to add it to LD_LIBRARY_PATH
++#       dnl to prevent further configure tests to fail due to this###
++
++#       LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIB_OPENSSL"
++#       export LD_LIBRARY_PATH
++#       AC_MSG_NOTICE([Added $LIB_OPENSSL to LD_LIBRARY_PATH])
++#    fi
++#  fi
+ 
+ fi
+ 
+@@ -1715,21 +1715,21 @@ if test "$OPENSSL_ENABLED" != "1"; then
+          CPPFLAGS="$CLEANCPPFLAGS"
+        ])
+ 
+-      if test "x$USE_GNUTLS" = "xyes"; then
+-        AC_MSG_NOTICE([detected GnuTLS version $version])
+-
+-        if test -n "$gtlslib"; then
+-          dnl when shared libs were found in a path that the run-time
+-          dnl linker doesn't search through, we need to add it to
+-          dnl LD_LIBRARY_PATH to prevent further configure tests to fail
+-          dnl due to this
+-
+-          LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$gtlslib"
+-          export LD_LIBRARY_PATH
+-          AC_MSG_NOTICE([Added $gtlslib to LD_LIBRARY_PATH])
+-        fi
+-      fi
+-
++#      if test "x$USE_GNUTLS" = "xyes"; then
++#        AC_MSG_NOTICE([detected GnuTLS version $version])
++#
++#        if test -n "$gtlslib"; then
++#          dnl when shared libs were found in a path that the run-time
++#          dnl linker doesn't search through, we need to add it to
++#          dnl LD_LIBRARY_PATH to prevent further configure tests to fail
++#          dnl due to this
++#
++#          LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$gtlslib"
++#          export LD_LIBRARY_PATH
++#          AC_MSG_NOTICE([Added $gtlslib to LD_LIBRARY_PATH])
++#        fi
++#      fi
++#
+     fi
+ 
+   fi dnl GNUTLS not disabled
