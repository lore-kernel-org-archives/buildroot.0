From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Apr 2016 00:22:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfixes: fix compile
	error by backporting upstream commit
Message-ID: <1461622934-16581-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes an error not yet caught by autobuilders:

In file included from SaveSet.c:27:0:
Xfixesint.h:67:20: error: static declaration of '_XEatDataWords' follows non-static declaration
 static inline void _XEatDataWords(Display *dpy, unsigned long n)
                    ^

To reproduce use this defconfig:

BR2_powerpc64le=y
BR2_powerpc_power8=y
BR2_OPTIMIZE_3=y
BR2_GLIBC_VERSION_2_23=y
BR2_BINUTILS_VERSION_2_26_X=y
BR2_GCC_VERSION_5_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XLIB_LIBXFIXES=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-remove-fallback-for-xeatdatawords.patch   | 63 ++++++++++++++++++++++
 package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 package/x11r7/xlib_libXfixes/0001-remove-fallback-for-xeatdatawords.patch

diff --git a/package/x11r7/xlib_libXfixes/0001-remove-fallback-for-xeatdatawords.patch b/package/x11r7/xlib_libXfixes/0001-remove-fallback-for-xeatdatawords.patch
new file mode 100644
index 0000000..cb8c578
--- /dev/null
+++ b/package/x11r7/xlib_libXfixes/0001-remove-fallback-for-xeatdatawords.patch
@@ -0,0 +1,63 @@
+From 1702cdfe45c9bdd7dacfc8f27a49f89fcd1d02c3 Mon Sep 17 00:00:00 2001
+From: Michael Joost <mehl@michael-joost.de>
+Date: Mon, 18 Nov 2013 16:11:26 +0100
+Subject: Remove fallback for _XEatDataWords, require libX11 1.6 for it
+
+_XEatDataWords was orignally introduced with the May 2013 security
+patches, and in order to ease the process of delivering those,
+fallback versions of _XEatDataWords were included in the X extension
+library patches so they could be applied to older versions that didn't
+have libX11 1.6 yet.   Now that we're past that hurdle, we can drop
+the fallbacks and just require libX11 1.6 for building new versions
+of the extension libraries.
+
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(downloaded from upstream commit:
+ https://cgit.freedesktop.org/xorg/lib/libXfixes/commit/?id=1702cdfe45c9bdd7dacfc8f27a49f89fcd1d02c3)
+diff --git a/configure.ac b/configure.ac
+index f85bd72..2a59af8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,13 +55,7 @@ FIXESEXT_VERSION=[`echo $VERSION | sed 's/^\([0-9][0-9]*\.[0-9][0-9]*\).*$/\1/'`
+ AC_SUBST(FIXESEXT_VERSION)
+ 
+ # Obtain compiler/linker options for depedencies
+-PKG_CHECK_MODULES(FIXESEXT, xproto [fixesproto >= $FIXESEXT_VERSION] xextproto x11)
+-
+-# Check for _XEatDataWords function that may be patched into older Xlib releases
+-SAVE_LIBS="$LIBS"
+-LIBS="$FIXESEXT_LIBS"
+-AC_CHECK_FUNCS([_XEatDataWords])
+-LIBS="$SAVE_LIBS"
++PKG_CHECK_MODULES(FIXESEXT, xproto [fixesproto >= $FIXESEXT_VERSION] xextproto [x11 >= 1.6])
+ 
+ 
+ AC_CONFIG_FILES([Makefile
+diff --git a/src/Xfixesint.h b/src/Xfixesint.h
+index 7bf5bfd..8a4d5fd 100644
+--- a/src/Xfixesint.h
++++ b/src/Xfixesint.h
+@@ -60,18 +60,4 @@ XFixesFindDisplay (Display *dpy);
+ #define XFixesSimpleCheckExtension(dpy,i) \
+   if (!XFixesHasExtension(i)) { return; }
+ 
+-#ifndef HAVE__XEATDATAWORDS
+-#include <X11/Xmd.h>  /* for LONG64 on 64-bit platforms */
+-#include <limits.h>
+-
+-static inline void _XEatDataWords(Display *dpy, unsigned long n)
+-{
+-# ifndef LONG64
+-    if (n >= (ULONG_MAX >> 2))
+-        _XIOError(dpy);
+-# endif
+-    _XEatData (dpy, n << 2);
+-}
+-#endif
+-
+ #endif /* _XFIXESINT_H_ */
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
index b94cd0f..aebc9c4 100644
--- a/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.mk
@@ -9,6 +9,8 @@ XLIB_LIBXFIXES_SOURCE = libXfixes-$(XLIB_LIBXFIXES_VERSION).tar.bz2
 XLIB_LIBXFIXES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFIXES_LICENSE = MIT
 XLIB_LIBXFIXES_LICENSE_FILES = COPYING
+# 0001-remove-fallback-for-xeatdatawords.patch
+XLIB_LIBXFIXES_AUTORECONF = YES
 XLIB_LIBXFIXES_INSTALL_STAGING = YES
 XLIB_LIBXFIXES_DEPENDENCIES = xproto_fixesproto xlib_libX11 xproto_xextproto xproto_xproto
 
-- 
2.8.0.rc3
