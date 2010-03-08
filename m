From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump libX11 to 1.3.2
Message-ID: <20100308133616.DFAFD776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1d956c9190dafbe425e9e02255b540641e27f690
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xlib_libX11/Config.in                |    2 +-
 .../xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch  |   40 --------------------
 package/x11r7/xlib_libX11/xlib_libX11.mk           |    2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/x11r7/xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch

diff --git a/package/x11r7/xlib_libX11/Config.in b/package/x11r7/xlib_libX11/Config.in
index 42d55f8..5f2496c 100644
--- a/package/x11r7/xlib_libX11/Config.in
+++ b/package/x11r7/xlib_libX11/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_BIGREQSPROTO
 	select BR2_PACKAGE_XPROTO_XCMISCPROTO
 	help
-	  libX11 1.1.1
+	  libX11 1.3.2
 	  X.Org X11 library
diff --git a/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch b/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch
deleted file mode 100644
index 1ac9f9d..0000000
--- a/package/x11r7/xlib_libX11/xlib_libX11-1.1.5-keysymdef.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-[patch]: configure: add --with-keysymdef argument for cross compilation
-
-Based on a similar patch from Openembedded.
-
-The libX11 configure script hardcodes the location to keysymdef.h as
-<prefix>/include/X11/keysymdef.h, which is fine for native compilation,
-but breaks with cross compilation as that directory is a location on
-the target, not the build host.
-
-Fix it by providing an explicit --with-keysymdef=<full-path-to-file>.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>Index: libX11-1.1.5/configure.ac
-===================================================================
---- libX11-1.1.5.orig/configure.ac	2008-10-28 11:36:49.000000000 +0000
-+++ libX11-1.1.5/configure.ac	2008-10-28 11:40:05.000000000 +0000
-@@ -221,13 +221,21 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysymdef.h])
--dir=`pkg-config --variable=includedir xproto`
--KEYSYMDEF="$dir/X11/keysymdef.h"
-+AC_ARG_WITH(keysymdef,
-+	AC_HELP_STRING([--with-keysymdef=DIR/keysymdef.h], [The location of keysymdef.h]),
-+	KEYSYMDEF=$withval, KEYSYMDEF="")
-+
-+if test x$KEYSYMDEF = x; then
-+	dir=`pkg-config --variable=includedir xproto`
-+	KEYSYMDEF="$dir/X11/keysymdef.h"
-+fi
-+
- if test -f "$KEYSYMDEF"; then
--        AC_MSG_RESULT([$KEYSYMDEF])
-+	AC_MSG_RESULT([$KEYSYMDEF])
- else
- 	AC_MSG_ERROR([Cannot find keysymdef.h])
- fi
-+
- AC_SUBST(KEYSYMDEF)
- 
- AM_CONDITIONAL(UDC, test xfalse = xtrue)
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index e2f7e9a..805540b 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.1.5
+XLIB_LIBX11_VERSION = 1.3.2
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBX11_AUTORECONF = YES
-- 
1.6.3.3
