From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 05 Feb 2014 14:50:53 +0100
Subject: [Buildroot] [PATCH 1 of 8 v2] xstroke: remove deprecated package
In-Reply-To: <patchbomb.1391608252@argentina>
References: <patchbomb.1391608252@argentina>
Message-ID: <e5521567f35916bb7501.1391608253@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xstroke has been deprecated since 2013.02 and thus can be removed in
2014.02.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: no changes

 Config.in.legacy                              |   7 ++++
 package/Config.in                             |   1 -
 package/xstroke/Config.in                     |  14 ---------
 package/xstroke/xstroke-fix-link-issues.patch |  35 -----------------------
 package/xstroke/xstroke.mk                    |  13 --------
 5 files changed, 7 insertions(+), 63 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_PACKAGE_XSTROKE
+	bool "xstroke has been removed"
+	select BR2_LEGACY
+	help
+	  The 'xstroke' package has been removed since it has been
+	  deprecated for more than four buildroot releases.
+
 config BR2_PACKAGE_LZMA
 	bool "lzma target package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -235,7 +235,6 @@ source "package/torsmo/Config.in"
 source "package/wmctrl/Config.in"
 source "package/x11vnc/Config.in"
 source "package/xscreensaver/Config.in"
-source "package/xstroke/Config.in"
 source "package/xterm/Config.in"
 source "package/xvkbd/Config.in"
 
diff --git a/package/xstroke/Config.in b/package/xstroke/Config.in
deleted file mode 100644
--- a/package/xstroke/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_XSTROKE
-	bool "xstroke"
-	depends on BR2_PACKAGE_XORG7
-	# dead upstream, probably not many users
-	depends on BR2_DEPRECATED_SINCE_2013_02
-	select BR2_PACKAGE_XLIB_LIBXFT
-	select BR2_PACKAGE_XLIB_LIBXTST
-	select BR2_PACKAGE_XLIB_LIBXPM
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	help
-	  Handwriting recognition for X
-
-	  http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/XStroke
diff --git a/package/xstroke/xstroke-fix-link-issues.patch b/package/xstroke/xstroke-fix-link-issues.patch
deleted file mode 100644
--- a/package/xstroke/xstroke-fix-link-issues.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Fix link issues by linking against all needed libraries
-
-Since gcc 4.6, all libraries that are directly used must be explicitly
-passed on the command line. In the case of xstroke, linking against
-Xrender, Xext and dl was missing. For the first two, they are added
-through addition PKG_CHECK_MODULES() checks, for the latter, it is
-added next to -lm and -lpthread in Makefile.am.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Index: b/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -40,7 +40,7 @@
- BUILT_SOURCES = rec_parse.h rec_lex.h rec_lex.c
- AM_YFLAGS = -d
- 
--xstroke_LDADD = @XSTROKE_LIBS@ -lm -lpthread $(X_LIBS) -lXpm -lXtst
-+xstroke_LDADD = @XSTROKE_LIBS@ -ldl -lm -lpthread $(X_LIBS) -lXpm -lXtst
- AM_CFLAGS = @XSTROKE_CFLAGS@ -DXSTROKE_CONF_DIR='"$(sysconfdir)/xstroke"' $(X_CFLAGS)
- 
- EXTRA_DIST = xstroke_active.xpm xstroke_inactive.xpm etc/alphabet
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -26,7 +26,7 @@
- AC_CHECK_FUNCS([gettimeofday localtime_r])
- 
- AC_PATH_XTRA
--PKG_CHECK_MODULES(XSTROKE, xft)
-+PKG_CHECK_MODULES(XSTROKE, [xft xrender xext])
- 
- AC_CONFIG_FILES([Makefile])
- AC_OUTPUT
diff --git a/package/xstroke/xstroke.mk b/package/xstroke/xstroke.mk
deleted file mode 100644
--- a/package/xstroke/xstroke.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# xstroke
-#
-################################################################################
-
-XSTROKE_VERSION = 0.6
-XSTROKE_SITE = http://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/XStroke
-
-XSTROKE_DEPENDENCIES = xlib_libXft xlib_libXtst xlib_libXpm xlib_libXrender xlib_libXext
-XSTROKE_AUTORECONF = YES
-
-$(eval $(autotools-package))
