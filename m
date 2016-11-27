From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:33:14 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xdriver_xf86-video-qxl: Add patches for newer
	xserver_xorg-server releases
Message-ID: <20161127213919.7272A81908@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c55fb8ad22be6d95b8b521d208cad0cfa7d75d07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

0002-xserverfix.patch added xlib_libXfont as new dependency.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-systemincludes.patch                      | 39 +++++++++++++++++
 .../xdriver_xf86-video-qxl/0002-xserverfix.patch   | 51 ++++++++++++++++++++++
 package/x11r7/xdriver_xf86-video-qxl/Config.in     |  1 +
 .../xdriver_xf86-video-qxl.mk                      |  3 ++
 4 files changed, 94 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-qxl/0001-systemincludes.patch b/package/x11r7/xdriver_xf86-video-qxl/0001-systemincludes.patch
new file mode 100644
index 0000000..0c681f2
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-qxl/0001-systemincludes.patch
@@ -0,0 +1,39 @@
+From 83e00bb5f9b74c0d7059c189d747ec3c24c7798a Mon Sep 17 00:00:00 2001
+From: Christophe Fergeau <cfergeau@redhat.com>
+Date: Tue, 4 Aug 2015 17:36:12 +0200
+Subject: Use <> for system-includes
+
+These headers come from /usr/include/xorg/ so it's clearer if they are
+included using <>. While at it, I've reordered them alphabetically.
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-qxl/commit/?id=83e00bb5f9b74c0d7059c189d747ec3c24c7798a
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/src/uxa/uxa-damage.c b/src/uxa/uxa-damage.c
+index 3e4c075..6201712 100644
+--- a/src/uxa/uxa-damage.c
++++ b/src/uxa/uxa-damage.c
+@@ -27,12 +27,13 @@
+ #include <stdlib.h>
+ #include "uxa-priv.h"
+ 
++#include    <dixfontstr.h>
++#include    <gcstruct.h>
++#include    <picturestr.h>
++#include    <scrnintstr.h>
++#include    <windowstr.h>
+ #include    <X11/X.h>
+-#include    "scrnintstr.h"
+-#include    "windowstr.h"
+-#include    "dixfontstr.h"
+-#include    "gcstruct.h"
+-#include    "picturestr.h"
++
+ #include    "uxa-damage.h"
+ 
+ typedef struct _damageGCPriv {
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-qxl/0002-xserverfix.patch b/package/x11r7/xdriver_xf86-video-qxl/0002-xserverfix.patch
new file mode 100644
index 0000000..c38d42e
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-qxl/0002-xserverfix.patch
@@ -0,0 +1,51 @@
+From a184774ad161031cceed264d62d48ebd019ac800 Mon Sep 17 00:00:00 2001
+From: Christophe Fergeau <cfergeau@redhat.com>
+Date: Mon, 3 Aug 2015 20:12:05 +0200
+Subject: Fix compilation with newer Xorg versions
+
+Xorg 1.18 stopped exporting some xfont related symbols in its
+headers/shared libraries, which causes QXL to fail to build:
+
+uxa-damage.c:947:5: error: implicit declaration of function 'QueryGlyphExtents' [-Werror=implicit-function-declaration]
+     QueryGlyphExtents(font, charinfo, n, &extents);
+
+The missing definition can be found in xfont, so this commit addes the
+needed configure.ac checks and includes.
+Note that dixfontstr.h must be included before the xfont headers or this
+will cause compile-time warnings on older Xorg versions (eg 1.17)
+---
+Downloaded from
+https://cgit.freedesktop.org/xorg/driver/xf86-video-qxl/commit/?id=a184774ad161031cceed264d62d48ebd019ac800
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/configure.ac b/configure.ac
+index 6555a8d..7e95b01 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -61,7 +61,7 @@ XORG_DRIVER_CHECK_EXT(XV, videoproto)
+ XORG_DRIVER_CHECK_EXT(XFreeXDGA, xf86dgaproto)
+ 
+ # Obtain compiler/linker options for the driver dependencies
+-PKG_CHECK_MODULES(XORG, [xorg-server >= 1.0.99.901] xproto fontsproto $REQUIRED_MODULES)
++PKG_CHECK_MODULES(XORG, [xorg-server >= 1.0.99.901] xproto fontsproto xfont $REQUIRED_MODULES)
+ 
+ 
+ save_CFLAGS="$CFLAGS"
+diff --git a/src/uxa/uxa-damage.c b/src/uxa/uxa-damage.c
+index 6201712..a6d1ee3 100644
+--- a/src/uxa/uxa-damage.c
++++ b/src/uxa/uxa-damage.c
+@@ -33,6 +33,9 @@
+ #include    <scrnintstr.h>
+ #include    <windowstr.h>
+ #include    <X11/X.h>
++#include    <X11/fonts/font.h>
++#include    <X11/fonts/fontstruct.h>
++#include    <X11/fonts/fontutil.h>
+ 
+ #include    "uxa-damage.h"
+ 
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-qxl/Config.in b/package/x11r7/xdriver_xf86-video-qxl/Config.in
index 5f05f68..04bde0f 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/Config.in
+++ b/package/x11r7/xdriver_xf86-video-qxl/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_QXL
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_HAS_UDEV # for KMS
 	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_SPICE_PROTOCOL
+	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
index ddc4191..30cd7a2 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -7,6 +7,8 @@
 XDRIVER_XF86_VIDEO_QXL_VERSION = 0.1.4
 XDRIVER_XF86_VIDEO_QXL_SOURCE = xf86-video-qxl-$(XDRIVER_XF86_VIDEO_QXL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_QXL_SITE = http://xorg.freedesktop.org/releases/individual/driver
+# 0002-xserverfix.patch
+XDRIVER_XF86_VIDEO_QXL_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_QXL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_QXL_LICENSE_FILES = COPYING
 
@@ -16,6 +18,7 @@ XDRIVER_XF86_VIDEO_QXL_CONF_OPTS = \
 XDRIVER_XF86_VIDEO_QXL_DEPENDENCIES = \
 	libpciaccess \
 	spice-protocol \
+	xlib_libXfont \
 	xproto_fontsproto \
 	xproto_xproto \
 	xserver_xorg-server
