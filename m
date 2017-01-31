From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 31 Jan 2017 19:37:44 +0100
Subject: [Buildroot] [PATCH 10/16] package/x11r7/xdriver_xf86-video-qxl:
	bump version to 0.1.5
In-Reply-To: <20170131183750.15481-1-bernd.kuhls@t-online.de>
References: <20170131183750.15481-1-bernd.kuhls@t-online.de>
Message-ID: <20170131183750.15481-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed all patches, applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-systemincludes.patch                      | 39 ------------
 .../xdriver_xf86-video-qxl/0002-xserverfix.patch   | 51 ----------------
 .../x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch | 69 ----------------------
 .../xdriver_xf86-video-qxl.hash                    |  4 +-
 .../xdriver_xf86-video-qxl.mk                      |  4 +-
 5 files changed, 3 insertions(+), 164 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-qxl/0001-systemincludes.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-qxl/0002-xserverfix.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch

diff --git a/package/x11r7/xdriver_xf86-video-qxl/0001-systemincludes.patch b/package/x11r7/xdriver_xf86-video-qxl/0001-systemincludes.patch
deleted file mode 100644
index 0c681f289..000000000
--- a/package/x11r7/xdriver_xf86-video-qxl/0001-systemincludes.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 83e00bb5f9b74c0d7059c189d747ec3c24c7798a Mon Sep 17 00:00:00 2001
-From: Christophe Fergeau <cfergeau@redhat.com>
-Date: Tue, 4 Aug 2015 17:36:12 +0200
-Subject: Use <> for system-includes
-
-These headers come from /usr/include/xorg/ so it's clearer if they are
-included using <>. While at it, I've reordered them alphabetically.
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-qxl/commit/?id=83e00bb5f9b74c0d7059c189d747ec3c24c7798a
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/src/uxa/uxa-damage.c b/src/uxa/uxa-damage.c
-index 3e4c075..6201712 100644
---- a/src/uxa/uxa-damage.c
-+++ b/src/uxa/uxa-damage.c
-@@ -27,12 +27,13 @@
- #include <stdlib.h>
- #include "uxa-priv.h"
- 
-+#include    <dixfontstr.h>
-+#include    <gcstruct.h>
-+#include    <picturestr.h>
-+#include    <scrnintstr.h>
-+#include    <windowstr.h>
- #include    <X11/X.h>
--#include    "scrnintstr.h"
--#include    "windowstr.h"
--#include    "dixfontstr.h"
--#include    "gcstruct.h"
--#include    "picturestr.h"
-+
- #include    "uxa-damage.h"
- 
- typedef struct _damageGCPriv {
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-qxl/0002-xserverfix.patch b/package/x11r7/xdriver_xf86-video-qxl/0002-xserverfix.patch
deleted file mode 100644
index c38d42e95..000000000
--- a/package/x11r7/xdriver_xf86-video-qxl/0002-xserverfix.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From a184774ad161031cceed264d62d48ebd019ac800 Mon Sep 17 00:00:00 2001
-From: Christophe Fergeau <cfergeau@redhat.com>
-Date: Mon, 3 Aug 2015 20:12:05 +0200
-Subject: Fix compilation with newer Xorg versions
-
-Xorg 1.18 stopped exporting some xfont related symbols in its
-headers/shared libraries, which causes QXL to fail to build:
-
-uxa-damage.c:947:5: error: implicit declaration of function 'QueryGlyphExtents' [-Werror=implicit-function-declaration]
-     QueryGlyphExtents(font, charinfo, n, &extents);
-
-The missing definition can be found in xfont, so this commit addes the
-needed configure.ac checks and includes.
-Note that dixfontstr.h must be included before the xfont headers or this
-will cause compile-time warnings on older Xorg versions (eg 1.17)
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-qxl/commit/?id=a184774ad161031cceed264d62d48ebd019ac800
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/configure.ac b/configure.ac
-index 6555a8d..7e95b01 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -61,7 +61,7 @@ XORG_DRIVER_CHECK_EXT(XV, videoproto)
- XORG_DRIVER_CHECK_EXT(XFreeXDGA, xf86dgaproto)
- 
- # Obtain compiler/linker options for the driver dependencies
--PKG_CHECK_MODULES(XORG, [xorg-server >= 1.0.99.901] xproto fontsproto $REQUIRED_MODULES)
-+PKG_CHECK_MODULES(XORG, [xorg-server >= 1.0.99.901] xproto fontsproto xfont $REQUIRED_MODULES)
- 
- 
- save_CFLAGS="$CFLAGS"
-diff --git a/src/uxa/uxa-damage.c b/src/uxa/uxa-damage.c
-index 6201712..a6d1ee3 100644
---- a/src/uxa/uxa-damage.c
-+++ b/src/uxa/uxa-damage.c
-@@ -33,6 +33,9 @@
- #include    <scrnintstr.h>
- #include    <windowstr.h>
- #include    <X11/X.h>
-+#include    <X11/fonts/font.h>
-+#include    <X11/fonts/fontstruct.h>
-+#include    <X11/fonts/fontutil.h>
- 
- #include    "uxa-damage.h"
- 
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch b/package/x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch
deleted file mode 100644
index e93b746f5..000000000
--- a/package/x11r7/xdriver_xf86-video-qxl/0003-xfont2.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From e13d28ee5d8724fc4b22f26bce01a7d36355f272 Mon Sep 17 00:00:00 2001
-From: "Owen W. Taylor" <otaylor@fishsoup.net>
-Date: Fri, 26 Aug 2016 11:44:55 -0400
-Subject: Check for either xfont.pc or xfont2.pc
-
-More recent versions of Xfont have a different API (with namespacing
-for libXfont functions.) Check for xfont2.pc and if found, use that, and
-use the new API. The rational for preferring libXfont2 is that as a recent
-change the xserver module looks for and requires libXfont2, and it's better
-not to have both versions of the library in process.
----
-Downloaded from
-https://cgit.freedesktop.org/xorg/driver/xf86-video-qxl/commit/?id=e13d28ee5d8724fc4b22f26bce01a7d36355f272
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff --git a/configure.ac b/configure.ac
-index 7e95b01..451d42a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -60,8 +60,14 @@ XORG_DRIVER_CHECK_EXT(RENDER, renderproto)
- XORG_DRIVER_CHECK_EXT(XV, videoproto)
- XORG_DRIVER_CHECK_EXT(XFreeXDGA, xf86dgaproto)
- 
-+# We can use either version 1 or version 2 of libXfont
-+PKG_CHECK_EXISTS(xfont2,
-+                 [xfont_pc=xfont2
-+                  AC_DEFINE(HAVE_XFONT2,1,[Version 2 of the libXfont library])],
-+                 [xfont_pc=xfont])
-+
- # Obtain compiler/linker options for the driver dependencies
--PKG_CHECK_MODULES(XORG, [xorg-server >= 1.0.99.901] xproto fontsproto xfont $REQUIRED_MODULES)
-+PKG_CHECK_MODULES(XORG, [xorg-server >= 1.0.99.901] xproto fontsproto $xfont_pc $REQUIRED_MODULES)
- 
- 
- save_CFLAGS="$CFLAGS"
-diff --git a/src/uxa/uxa-damage.c b/src/uxa/uxa-damage.c
-index a6d1ee3..6afb346 100644
---- a/src/uxa/uxa-damage.c
-+++ b/src/uxa/uxa-damage.c
-@@ -35,7 +35,11 @@
- #include    <X11/X.h>
- #include    <X11/fonts/font.h>
- #include    <X11/fonts/fontstruct.h>
-+#ifdef HAVE_XFONT2
-+#include    <X11/fonts/libxfont2.h>
-+#else
- #include    <X11/fonts/fontutil.h>
-+#endif
- 
- #include    "uxa-damage.h"
- 
-@@ -947,8 +951,12 @@ uxa_damage_chars (RegionPtr	region,
- {
-     ExtentInfoRec   extents;
-     BoxRec	    box;
--    
-+
-+#ifdef HAVE_XFONT2
-+    xfont2_query_glyph_extents(font, charinfo, n, &extents);
-+#else
-     QueryGlyphExtents(font, charinfo, n, &extents);
-+#endif
-     if (imageblt)
-     {
- 	if (extents.overallWidth > extents.overallRight)
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
index 1648c29c6..7a0982108 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
@@ -1,2 +1,2 @@
-# From http://lists.freedesktop.org/archives/spice-devel/2015-April/019356.html
-sha256	e57ad22f0b1daf8979e722be0cc38d351bfcc2e41568edc566d2bade5a621105	xf86-video-qxl-0.1.4.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2016-December/002753.html
+sha256 b18682e04503c6326f7bf7190f3ee50a3d4d69758a2a3cc9af102a6b3f114c92  xf86-video-qxl-0.1.5.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
index ac43b9505..f410f8e95 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_QXL_VERSION = 0.1.4
+XDRIVER_XF86_VIDEO_QXL_VERSION = 0.1.5
 XDRIVER_XF86_VIDEO_QXL_SOURCE = xf86-video-qxl-$(XDRIVER_XF86_VIDEO_QXL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_QXL_SITE = http://xorg.freedesktop.org/releases/individual/driver
-# 0002-xserverfix.patch
-XDRIVER_XF86_VIDEO_QXL_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_QXL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_QXL_LICENSE_FILES = COPYING
 
-- 
2.11.0
