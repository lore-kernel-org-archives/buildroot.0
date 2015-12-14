From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 15:23:51 -0300
Subject: [Buildroot] [PATCH] gnutls: fix --disable-crywrap
Message-ID: <1450117431-4067-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to really enable the --disable-crywrap option in gnutls.
Fixes:
http://autobuild.buildroot.org/results/d86/d8604fe448bb11395e8443726d09b041eb34c6d5/

Status: sent upstream (mailing list).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...onfigure-really-make-disable-crywrap-work.patch | 38 ++++++++++++++++++++++
 package/gnutls/gnutls.mk                           |  2 ++
 2 files changed, 40 insertions(+)
 create mode 100644 package/gnutls/0001-configure-really-make-disable-crywrap-work.patch

diff --git a/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch b/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
new file mode 100644
index 0000000..01ed6bf
--- /dev/null
+++ b/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
@@ -0,0 +1,38 @@
+From 996b3741e8c7a5d19ae6c554e062f20c259f52d7 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 14 Dec 2015 15:16:24 -0300
+Subject: [PATCH] configure: really make --disable-crywrap work
+
+The crywrap variable is set regardless of the state of enable_crywrap,
+hence --disable-crywrap never works.
+Just put the tests for crywrap deps inside the enable_crywrap
+conditional.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ configure.ac | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e1d1df0..efacc30 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -836,11 +836,10 @@ AC_ARG_ENABLE(crywrap,
+ 
+ 
+  if test "x$enable_crywrap" != "xno" ; then
+-	AC_CHECK_FUNCS([argp_usage],[ac_argp=yes],[ac_argp=no])
+- fi
+-
+- if test "$ac_cv_func_daemon" != "no" && test "$ac_argp" != "no" && test "$with_libidn" != "no";then
+-  crywrap=yes
++   AC_CHECK_FUNCS([argp_usage],[ac_argp=yes],[ac_argp=no])
++   if test "$ac_cv_func_daemon" != "no" && test "$ac_argp" != "no" && test "$with_libidn" != "no";then
++     crywrap=yes
++   fi
+  fi
+ 
+ fi
+-- 
+2.4.10
+
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index d681c10..737e4b1 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -11,6 +11,8 @@ GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
+# For 0001-configure-really-make-disable-crywrap-work.patch
+GNUTLS_AUTORECONF = YES
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-guile \
-- 
2.4.10
