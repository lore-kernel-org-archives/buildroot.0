From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:42:44 +0200
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfixes: bump version
	to 5.0.2
Message-ID: <20160611144303.26DFF81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=773f5fd52b8cc6f36bdbf67556f67f0e8e8aedd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://cgit.freedesktop.org/xorg/lib/libXfixes/commit/?id=1702cdfe45c9bdd7dacfc8f27a49f89fcd1d02c3

Also removed autoreconf, not necessary anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-remove-fallback-for-xeatdatawords.patch   | 63 ----------------------
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash   |  2 +-
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |  4 +-
 3 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/package/x11r7/xlib_libXfixes/0001-remove-fallback-for-xeatdatawords.patch b/package/x11r7/xlib_libXfixes/0001-remove-fallback-for-xeatdatawords.patch
deleted file mode 100644
index cb8c578..0000000
--- a/package/x11r7/xlib_libXfixes/0001-remove-fallback-for-xeatdatawords.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 1702cdfe45c9bdd7dacfc8f27a49f89fcd1d02c3 Mon Sep 17 00:00:00 2001
-From: Michael Joost <mehl@michael-joost.de>
-Date: Mon, 18 Nov 2013 16:11:26 +0100
-Subject: Remove fallback for _XEatDataWords, require libX11 1.6 for it
-
-_XEatDataWords was orignally introduced with the May 2013 security
-patches, and in order to ease the process of delivering those,
-fallback versions of _XEatDataWords were included in the X extension
-library patches so they could be applied to older versions that didn't
-have libX11 1.6 yet.   Now that we're past that hurdle, we can drop
-the fallbacks and just require libX11 1.6 for building new versions
-of the extension libraries.
-
-Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(downloaded from upstream commit:
- https://cgit.freedesktop.org/xorg/lib/libXfixes/commit/?id=1702cdfe45c9bdd7dacfc8f27a49f89fcd1d02c3)
-diff --git a/configure.ac b/configure.ac
-index f85bd72..2a59af8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -55,13 +55,7 @@ FIXESEXT_VERSION=[`echo $VERSION | sed 's/^\([0-9][0-9]*\.[0-9][0-9]*\).*$/\1/'`
- AC_SUBST(FIXESEXT_VERSION)
- 
- # Obtain compiler/linker options for depedencies
--PKG_CHECK_MODULES(FIXESEXT, xproto [fixesproto >= $FIXESEXT_VERSION] xextproto x11)
--
--# Check for _XEatDataWords function that may be patched into older Xlib releases
--SAVE_LIBS="$LIBS"
--LIBS="$FIXESEXT_LIBS"
--AC_CHECK_FUNCS([_XEatDataWords])
--LIBS="$SAVE_LIBS"
-+PKG_CHECK_MODULES(FIXESEXT, xproto [fixesproto >= $FIXESEXT_VERSION] xextproto [x11 >= 1.6])
- 
- 
- AC_CONFIG_FILES([Makefile
-diff --git a/src/Xfixesint.h b/src/Xfixesint.h
-index 7bf5bfd..8a4d5fd 100644
---- a/src/Xfixesint.h
-+++ b/src/Xfixesint.h
-@@ -60,18 +60,4 @@ XFixesFindDisplay (Display *dpy);
- #define XFixesSimpleCheckExtension(dpy,i) \
-   if (!XFixesHasExtension(i)) { return; }
- 
--#ifndef HAVE__XEATDATAWORDS
--#include <X11/Xmd.h>  /* for LONG64 on 64-bit platforms */
--#include <limits.h>
--
--static inline void _XEatDataWords(Display *dpy, unsigned long n)
--{
--# ifndef LONG64
--    if (n >= (ULONG_MAX >> 2))
--        _XIOError(dpy);
--# endif
--    _XEatData (dpy, n << 2);
--}
--#endif
--
- #endif /* _XFIXESINT_H_ */
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
index 291c4bd..00164cd 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -1,2 +1,2 @@
 # From http://lists.x.org/archives/xorg-announce/2013-May/002227.html
-sha256	63bec085084fa3caaee5180490dd871f1eb2020ba9e9b39a30f93693ffc34767	libXfixes-5.0.1.tar.bz2
+sha256	9bd20edfec084a1bed481d48dd4815dee88139fffad091418cdda081129a9aea	libXfixes-5.0.2.tar.bz2
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index aebc9c4..2a10d49 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-XLIB_LIBXFIXES_VERSION = 5.0.1
+XLIB_LIBXFIXES_VERSION = 5.0.2
 XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
 XLIB_LIBXFIXES_LICENSE_FILES = COPYING
-# 0001-remove-fallback-for-xeatdatawords.patch
-XLIB_LIBXFIXES_AUTORECONF = YES
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
