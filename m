From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Oct 2012 14:06:55 +0200
Subject: [Buildroot] [PATCH 5/7] xapp_xgc: fix build against Xmu by bumping
	version
In-Reply-To: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1350907617-14368-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1350907617-14368-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a build issue similar to the one encountered on xapp_listres at
http://autobuild.buildroot.org/results/06d0ef38165769df38047c1f64d4cfae835e9e54/.

Note that this new version requires a minor cross-compilation fix in
configure.ac, which has already been committed upstream but is not yet
part of a release tarball.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xapp_xgc/xapp_xgc-replace-ac-check-file.patch  |   29 ++++++++++++++++++++
 package/x11r7/xapp_xgc/xapp_xgc.mk                 |    3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch

diff --git a/package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch b/package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch
new file mode 100644
index 0000000..97cbcda
--- /dev/null
+++ b/package/x11r7/xapp_xgc/xapp_xgc-replace-ac-check-file.patch
@@ -0,0 +1,29 @@
+From ff668395fc408f540604bd534e323b483f52a4ea Mon Sep 17 00:00:00 2001
+From: Gaetan Nadon <memsize@videotron.ca>
+Date: Mon, 01 Nov 2010 17:19:23 +0000
+Subject: config: replace AC_CHECK_FILE with test -f
+
+* AC_CHECK_FILE doesn't work for cross compilation
+
+Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
+---
+diff --git a/configure.ac b/configure.ac
+index 667a3e7..0644050 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -36,8 +36,11 @@ XORG_DEFAULT_OPTIONS
+ AC_PROG_LEX
+ AC_PROG_YACC
+ AC_PATH_PROG([YACC_INST], $YACC)
+-AC_CHECK_FILE([$srcdir/gram.c], [],
+-              [test -z "$YACC_INST" && AC_MSG_ERROR([yacc not found - unable to compile gram.y])])
++if test ! -f "gram.c"; then
++   if test -z "$YACC_INST"; then
++      AC_MSG_ERROR([yacc not found - unable to compile gram.y])
++   fi
++fi
+ 
+ PKG_CHECK_MODULES(XGC, xaw7 xt)
+ xt_appdefaultdir=`$PKG_CONFIG --variable=appdefaultdir xt`
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index 8d02a53..cfb3164 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.1
+XAPP_XGC_VERSION = 1.0.3
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.bz2
 XAPP_XGC_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGC_DEPENDENCIES = xlib_libXaw
+XAPP_XGC_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.7.9.5
