From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Nov 2018 19:22:48 +0100
Subject: [Buildroot] [PATCH 2/2] dante: fix --without-pam
In-Reply-To: <20181126182248.24817-1-fontaine.fabrice@gmail.com>
References: <20181126182248.24817-1-fontaine.fabrice@gmail.com>
Message-ID: <20181126182248.24817-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't call AC_CHECK_HEADERS(security/pam_appl.h) and
AC_SEARCH_LIBS(pam_start, pam) if pam is disabled through --without-pam
otherwise cross-compilation could fail if a pam library is found on host

Fixes:
 - http://autobuild.buildroot.org/results/e37e61bae1d81a7956e2843be70fea84b0bbb64b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../dante/0003-sharedopt.m4-fix-without-pam.patch  | 42 ++++++++++++++++++++++
 package/dante/dante.mk                             |  2 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 package/dante/0003-sharedopt.m4-fix-without-pam.patch

diff --git a/package/dante/0003-sharedopt.m4-fix-without-pam.patch b/package/dante/0003-sharedopt.m4-fix-without-pam.patch
new file mode 100644
index 0000000000..75ef07c134
--- /dev/null
+++ b/package/dante/0003-sharedopt.m4-fix-without-pam.patch
@@ -0,0 +1,42 @@
+From 0cb78bcb81664a6507b37252ae28818bd1b7de23 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 25 Nov 2018 19:07:39 +0100
+Subject: [PATCH] sharedopt.m4: fix --without-pam
+
+Don't call AC_CHECK_HEADERS(security/pam_appl.h) and
+AC_SEARCH_LIBS(pam_start, pam) if pam is disabled through --without-pam
+otherwise cross-compilation could fail if a pam library is found on host
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e37e61bae1d81a7956e2843be70fea84b0bbb64b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ sharedopt.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sharedopt.m4 b/sharedopt.m4
+index c0492a6..e8053d0 100644
+--- a/sharedopt.m4
++++ b/sharedopt.m4
+@@ -115,8 +115,6 @@ int deny_severity;
+ fi
+ 
+ unset NOPAM
+-AC_CHECK_HEADERS(security/pam_appl.h)
+-AC_SEARCH_LIBS(pam_start, pam)
+ AC_MSG_CHECKING([for pam])
+ AC_ARG_WITH(pam,
+ [  --without-pam           disable pam support @<:@default=detect@:>@],
+@@ -128,6 +126,8 @@ if test x"$NOPAM" != x; then
+     AC_MSG_RESULT([disabled])
+ else
+     #look for PAM header and lib
++    AC_CHECK_HEADERS(security/pam_appl.h)
++    AC_SEARCH_LIBS(pam_start, pam)
+     if test x"${ac_cv_header_security_pam_appl_h}" = xno; then
+ 	NOPAM="Disabled, security/pam_appl.h missing"
+ 	AC_MSG_RESULT([no, usable security/pam_appl.h not found])
+-- 
+2.17.1
+
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index ff42e7432b..2d448cfc0a 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -9,7 +9,7 @@ DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
 
-# We're patching compiler.m4
+# We're patching compiler.m4 and sharedopt.m4
 DANTE_AUTORECONF = YES
 
 DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
-- 
2.14.1
