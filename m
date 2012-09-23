From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 23 Sep 2012 15:08:30 +0100
Subject: [Buildroot] [PATCH] xapp_xkbcomp: fix cross compilation
Message-ID: <1348409310-13298-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

The configure step of the xapp_xkbcomp package fails as follows.

  checking for ./xkbparse.c... configure: error: cannot check for file existence when cross compiling

This problem has been fixed by the following upstream commit.

  http://cgit.freedesktop.org/xorg/app/xkbcomp/commit/?id=cc55d8f5ab021861308b071aab9c03016be15187

This patch backports the upstream patch.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...-cc55d8f5ab021861308b071aab9c03016be15187.patch |   36 ++++++++++++++++++++
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk         |    2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/x11r7/xapp_xkbcomp/xapp_xkbcomp-cc55d8f5ab021861308b071aab9c03016be15187.patch

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp-cc55d8f5ab021861308b071aab9c03016be15187.patch b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp-cc55d8f5ab021861308b071aab9c03016be15187.patch
new file mode 100644
index 0000000..e85ba81
--- /dev/null
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp-cc55d8f5ab021861308b071aab9c03016be15187.patch
@@ -0,0 +1,36 @@
+From cc55d8f5ab021861308b071aab9c03016be15187 Mon Sep 17 00:00:00 2001
+From: Gaetan Nadon <memsize@videotron.ca>
+Date: Mon, 01 Nov 2010 00:35:24 +0000
+Subject: config: replace AC_CHECK_FILE with test -f as it fails to cross-compile
+
+Testing for the presence of xkbparse.c is legitimate as this is a build
+file, but the Autoconf macro assumes it is testing on the host system
+and fails.
+
+Tested-by: Abdoulaye Walsimou Gaye <awg@embtoolkit.org>
+Signed-off-by: Gaetan Nadon <memsize@videotron.ca>
+---
+diff --git a/configure.ac b/configure.ac
+index c69230b..8e6bd6e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,11 +34,14 @@ XORG_DEFAULT_OPTIONS
+ 
+ AM_CONFIG_HEADER(config.h)
+ 
++# If both the C file and YACC are missing, the package cannot be build.
+ AC_PROG_YACC
+ AC_PATH_PROG([YACC_INST], $YACC)
+-AC_CHECK_FILE([$srcdir/xkbparse.c], [],
+-              [test -z "$YACC_INST" && AC_MSG_ERROR([yacc not found - unable to compile xkbparse.y])])
+-
++if test ! -f "$srcdir/xkbparse.c"; then
++   if test -z "$YACC_INST"; then
++      AC_MSG_ERROR([yacc not found - unable to compile xkbparse.y])
++   fi
++fi
+ 
+ AC_CHECK_FUNCS([strdup strcasecmp])
+ 
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index 5208f1d..ef25615 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -9,5 +9,7 @@ XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_DEPENDENCIES = xlib_libX11 xlib_libxkbfile
 
+XAPP_XKBCOMP_AUTORECONF = YES
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.9.5
