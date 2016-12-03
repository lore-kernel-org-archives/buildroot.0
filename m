From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Dec 2016 12:58:07 +0100
Subject: [Buildroot] [PATCH v2 3/5] package/x11r7/xdriver_xf86-video-qxl:
	add support for xlib_libXfont2
In-Reply-To: <20161203115809.25297-1-bernd.kuhls@t-online.de>
References: <20161203115809.25297-1-bernd.kuhls@t-online.de>
Message-ID: <20161203115809.25297-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: initial version

 .../x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch | 69 ++++++++++++++++++++++
 package/x11r7/xdriver_xf86-video-qxl/Config.in     |  2 +-
 .../xdriver_xf86-video-qxl.mk                      |  7 ++-
 3 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch

diff --git a/package/x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch b/package/x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch
new file mode 100644
index 0000000..e93b746
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch
@@ -0,0 +1,69 @@
+From e13d28ee5d8724fc4b22f26bce01a7d36355f272 Mon Sep 17 00:00:00 2001
+From: "Owen W. Taylor" <otaylor@fishsoup.net>
+Date: Fri, 26 Aug 2016 11:44:55 -0400
+Subject: Check for either xfont.pc or xfont2.pc
+
+More recent versions of Xfont have a different API (with namespacing
+for libXfont functions.) Check for xfont2.pc and if found, use that, and
+use the new API. The rational for preferring libXfont2 is that as a recent
+change the xserver module looks for and requires libXfont2, and it's better
+not to have both versions of the library in process.
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-qxl/commit/?id=e13d28ee5d8724fc4b22f26bce01a7d36355f272
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/configure.ac b/configure.ac
+index 7e95b01..451d42a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,8 +60,14 @@ XORG_DRIVER_CHECK_EXT(RENDER, renderproto)
+ XORG_DRIVER_CHECK_EXT(XV, videoproto)
+ XORG_DRIVER_CHECK_EXT(XFreeXDGA, xf86dgaproto)
+ 
++# We can use either version 1 or version 2 of libXfont
++PKG_CHECK_EXISTS(xfont2,
++                 [xfont_pc=xfont2
++                  AC_DEFINE(HAVE_XFONT2,1,[Version 2 of the libXfont library])],
++                 [xfont_pc=xfont])
++
+ # Obtain compiler/linker options for the driver dependencies
+-PKG_CHECK_MODULES(XORG, [xorg-server >= 1.0.99.901] xproto fontsproto xfont $REQUIRED_MODULES)
++PKG_CHECK_MODULES(XORG, [xorg-server >= 1.0.99.901] xproto fontsproto $xfont_pc $REQUIRED_MODULES)
+ 
+ 
+ save_CFLAGS="$CFLAGS"
+diff --git a/src/uxa/uxa-damage.c b/src/uxa/uxa-damage.c
+index a6d1ee3..6afb346 100644
+--- a/src/uxa/uxa-damage.c
++++ b/src/uxa/uxa-damage.c
+@@ -35,7 +35,11 @@
+ #include    <X11/X.h>
+ #include    <X11/fonts/font.h>
+ #include    <X11/fonts/fontstruct.h>
++#ifdef HAVE_XFONT2
++#include    <X11/fonts/libxfont2.h>
++#else
+ #include    <X11/fonts/fontutil.h>
++#endif
+ 
+ #include    "uxa-damage.h"
+ 
+@@ -947,8 +951,12 @@ uxa_damage_chars (RegionPtr	region,
+ {
+     ExtentInfoRec   extents;
+     BoxRec	    box;
+-    
++
++#ifdef HAVE_XFONT2
++    xfont2_query_glyph_extents(font, charinfo, n, &extents);
++#else
+     QueryGlyphExtents(font, charinfo, n, &extents);
++#endif
+     if (imageblt)
+     {
+ 	if (extents.overallWidth > extents.overallRight)
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-qxl/Config.in b/package/x11r7/xdriver_xf86-video-qxl/Config.in
index 04bde0f..967ecaf 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/Config.in
+++ b/package/x11r7/xdriver_xf86-video-qxl/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_UDEV # for KMS
 	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_SPICE_PROTOCOL
-	select BR2_PACKAGE_XLIB_LIBXFONT
+	select BR2_PACKAGE_XLIB_LIBXFONT2 if !BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
index 30cd7a2..ac43b95 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -18,7 +18,6 @@ XDRIVER_XF86_VIDEO_QXL_CONF_OPTS = \
 XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES = \
 	libpciaccess \
 	spice-protocol \
-	xlib_libXfont \
 	xproto_fontsproto \
 	xproto_xproto \
 	xserver_xorg-server
@@ -32,4 +31,10 @@ else
 XDRIVER_XF86_VIDEO_QXL_CONF_OPTS += --disable-kms
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXFONT2),y)
+XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES += xlib_libXfont2
+else
+XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES += xlib_libXfont
+endif
+
 $(eval $(autotools-package))
-- 
2.10.2
