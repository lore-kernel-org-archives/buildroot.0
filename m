From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 18:30:23 +0100
Subject: [Buildroot] [git commit] gnutls: bump to version 3.4.8
Message-ID: <20160108173609.9839C827E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9bff092e2944a783dde5f108e28a7e13f0c5da03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch now upstream, so drop it along autoreconf and gettextize.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...onfigure-really-make-disable-crywrap-work.patch | 40 ----------------------
 package/gnutls/gnutls.hash                         |  2 +-
 package/gnutls/gnutls.mk                           |  5 +--
 3 files changed, 2 insertions(+), 45 deletions(-)

diff --git a/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch b/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
deleted file mode 100644
index 52d34f0..0000000
--- a/package/gnutls/0001-configure-really-make-disable-crywrap-work.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 996b3741e8c7a5d19ae6c554e062f20c259f52d7 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Mon, 14 Dec 2015 15:16:24 -0300
-Subject: [PATCH] configure: really make --disable-crywrap work
-
-The crywrap variable is set regardless of the state of enable_crywrap,
-hence --disable-crywrap never works.
-Just put the tests for crywrap deps inside the enable_crywrap
-conditional.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: applied upstream.
-
- configure.ac | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e1d1df0..efacc30 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -836,11 +836,10 @@ AC_ARG_ENABLE(crywrap,
- 
- 
-  if test "x$enable_crywrap" != "xno" ; then
--	AC_CHECK_FUNCS([argp_usage],[ac_argp=yes],[ac_argp=no])
-- fi
--
-- if test "$ac_cv_func_daemon" != "no" && test "$ac_argp" != "no" && test "$with_libidn" != "no";then
--  crywrap=yes
-+   AC_CHECK_FUNCS([argp_usage],[ac_argp=yes],[ac_argp=no])
-+   if test "$ac_cv_func_daemon" != "no" && test "$ac_argp" != "no" && test "$with_libidn" != "no";then
-+     crywrap=yes
-+   fi
-  fi
- 
- fi
--- 
-2.4.10
-
diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index f062041..38418a8 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	c1be9e4b30295d7b5f96fa332c6a908e6fa2254377b67811301fca92eb882e5a	gnutls-3.4.7.tar.xz
+sha256	e07c05dea525c6bf0dd8017fc5b89d886954f04fedf457ecd1ce488ac3b86ab7	gnutls-3.4.8.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 6c01c1b..78dfa5a 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,15 +5,12 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.4
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).7
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).8
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+, LGPLv2.1+
 GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf libtasn1 nettle pcre
-# For 0001-configure-really-make-disable-crywrap-work.patch
-GNUTLS_AUTORECONF = YES
-GNUTLS_GETTEXTIZE = YES
 GNUTLS_CONF_OPTS = \
 	--disable-doc \
 	--disable-guile \
