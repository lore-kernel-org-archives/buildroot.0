From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 09:35:01 +0100
Subject: [Buildroot] [git commit] gnutls: fix --disable-crywrap
Message-ID: <20151216083517.E9DB48012E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb2334b92645c8244c875446195d9237063e4c78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to really enable the --disable-crywrap option in gnutls.
Fixes:
http://autobuild.buildroot.org/results/d86/d8604fe448bb11395e8443726d09b041eb34c6d5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure-really-make-disable-crywrap-work.patch | 40 ++++++++++++++++++++++
 package/gnutls/gnutls.mk                           |  3 ++
 2 files changed, 43 insertions(+)

diff --git a/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch b/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
new file mode 100644
index 0000000..52d34f0
--- /dev/null
+++ b/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
@@ -0,0 +1,40 @@
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
+Status: applied upstream.
+
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
index 452d382..6c01c1b 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -11,6 +11,9 @@ GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
+# For 0001-configure-really-make-disable-crywrap-work.patch
+GNUTLS_AUTORECONF = YES
+GNUTLS_GETTEXTIZE = YES
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-guile \
