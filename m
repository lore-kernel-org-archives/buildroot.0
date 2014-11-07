From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 16:57:54 +0100
Subject: [Buildroot] [PATCH 4/4] xdriver_xf86-video-imx: new package
In-Reply-To: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
References: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
Message-ID: <1415375874-17331-5-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

X.Org driver for iMX5 GPU. Most of patches come from Yocto project.

Tested using:
    mx5loco_defconfig +
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
    BR2_PACKAGE_QT5=y
    BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
    BR2_PACKAGE_QT5BASE_EXAMPLES=y
    BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
    BR2_PACKAGE_QT5BASE_XCB=y
    BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
    BR2_PACKAGE_QT5BASE_GIF=y
    BR2_PACKAGE_QT5BASE_JPEG=y
    BR2_PACKAGE_QT5BASE_PNG=y
    BR2_PACKAGE_QT5QUICKCONTROLS=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XSERVER_XORG_SERVER=y
    BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
    BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
    BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX=y
    BR2_PACKAGE_FREESCALE_IMX=y
    BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53=y
    BR2_PACKAGE_GPU_AMD_BIN_MX51=y
    BR2_PACKAGE_GPU_AMD_BIN_MX51_EXAMPLES=y

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/Config.in                            |   1 +
 package/x11r7/xdriver_xf86-video-imx/Config.in     |  35 +
 ...ideo-imx-0001-Update-to-newer-swap-macros.patch |  65 ++
 ...imx-0002-Fix-error-unknown-type-name-uint.patch |  33 +
 ...er_xf86-video-imx-0003-support-glibc-2.20.patch |  57 ++
 ...video-API-forward-and-backward-compatible.patch | 787 +++++++++++++++++++++
 ...-xf86-video-imxfb-fix-m4-hardcodded-paths.patch |  53 ++
 ...r_xf86-video-imx-0006-xserver-1.14-compat.patch |  34 +
 .../xdriver_xf86-video-imx.mk                      |  16 +
 9 files changed, 1081 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/Config.in
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0001-Update-to-newer-swap-macros.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0002-Fix-error-unknown-type-name-uint.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0003-support-glibc-2.20.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0004-Make-video-API-forward-and-backward-compatible.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0006-xserver-1.14-compat.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 987f979..9e75de2 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -162,6 +162,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xdriver_xf86-video-i128/Config.in
 		source package/x11r7/xdriver_xf86-video-imx-viv/Config.in
 		source package/x11r7/xdriver_xf86-video-intel/Config.in
+		source package/x11r7/xdriver_xf86-video-imx/Config.in
 		source package/x11r7/xdriver_xf86-video-mach64/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
 		source package/x11r7/xdriver_xf86-video-neomagic/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-imx/Config.in b/package/x11r7/xdriver_xf86-video-imx/Config.in
new file mode 100644
index 0000000..8b794cc
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx/Config.in
@@ -0,0 +1,35 @@
+if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
+
+config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX
+	bool "xf86-video-imx"
+	depends on BR2_arm
+	depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-amd-bin-mx51
+	depends on BR2_INSTALL_LIBSTDCPP # gpu-amd-bin-mx51
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11
+	select BR2_PACKAGE_LIBZ160
+	select BR2_PACKAGE_XPROTO_FONTSPROTO
+	select BR2_PACKAGE_XPROTO_RANDRPROTO
+	select BR2_PACKAGE_XPROTO_RENDERPROTO
+	select BR2_PACKAGE_XPROTO_VIDEOPROTO
+	select BR2_PACKAGE_XPROTO_XF86DGAPROTO
+	select BR2_PACKAGE_XPROTO_XPROTO
+	help
+	  X.Org driver for iMX5 GPU
+
+	  To use this driver, add correct configuration to your
+	  /etc/X11/xorg.conf:
+
+	  Section "Device"
+	    [...]
+	    Driver "imx"
+	    Option "fbdev" "/dev/fb0"
+	  EndSection
+
+comment "xf86-video-imx needs an (e)glibc toolchain w/ C++ gpu-amd-bin-mx51 with X11 output and a Linux kernel to be built"
+	depends on BR2_arm
+	depends on (!BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_LINUX_KERNEL || !BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11)
+
+endif
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0001-Update-to-newer-swap-macros.patch b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0001-Update-to-newer-swap-macros.patch
new file mode 100644
index 0000000..05be6b3
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0001-Update-to-newer-swap-macros.patch
@@ -0,0 +1,65 @@
+From fc7f191a1a0f290a4e808dd8f9bd58ba1dbd2be4 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Sat, 29 Dec 2012 18:00:36 -0200
+Subject: [PATCH 1/2] ext: Update to newer swap macros
+
+The swap macros now use an internal temporary variable so we need to
+adapt the code according.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ src/imx_ext.c |   16 ++++++----------
+ 1 file changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/src/imx_ext.c b/src/imx_ext.c
+index f12469a..710cba4 100644
+--- a/src/imx_ext.c
++++ b/src/imx_ext.c
+@@ -57,8 +57,6 @@ void imxExtInit()
+ static int
+ Proc_IMX_EXT_GetPixmapPhysAddr(ClientPtr client)
+ {
+-	int n;
+-
+ 	REQUEST(xIMX_EXT_GetPixmapPhysAddrReq);
+ 	REQUEST_SIZE_MATCH(xIMX_EXT_GetPixmapPhysAddrReq);
+ 
+@@ -96,10 +94,10 @@ Proc_IMX_EXT_GetPixmapPhysAddr(ClientPtr client)
+ 	/* Check if any reply values need byte swapping */
+ 	if (client->swapped) {
+ 
+-		swaps(&rep.sequenceNumber, n);
+-		swapl(&rep.length, n);
+-		swapl(&rep.pixmapPhysAddr, n);
+-		swapl(&rep.pixmapPitch, n);
++		swaps(&rep.sequenceNumber);
++		swapl(&rep.length);
++		swapl(&rep.pixmapPhysAddr);
++		swapl(&rep.pixmapPitch);
+ 	}
+ 
+ 	/* Reply to client */
+@@ -123,16 +121,14 @@ Proc_IMX_EXT_Dispatch(ClientPtr client)
+ static int
+ SProc_IMX_EXT_GetPixmapPhysAddr(ClientPtr client)
+ {
+-	int n;
+-
+ 	REQUEST(xIMX_EXT_GetPixmapPhysAddrReq);
+ 
+ 	/* Swap request message length and verify it is correct. */
+-	swaps(&stuff->length, n);
++	swaps(&stuff->length);
+ 	REQUEST_SIZE_MATCH(xIMX_EXT_GetPixmapPhysAddrReq);
+ 
+ 	/* Swap remaining request message parameters. */
+-	swapl(&stuff->pixmap, n);
++	swapl(&stuff->pixmap);
+ 
+ 	return Proc_IMX_EXT_GetPixmapPhysAddr(client);
+ }
+-- 
+1.7.10.4
+
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0002-Fix-error-unknown-type-name-uint.patch b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0002-Fix-error-unknown-type-name-uint.patch
new file mode 100644
index 0000000..6a2fcdf
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0002-Fix-error-unknown-type-name-uint.patch
@@ -0,0 +1,33 @@
+From ccdfce5e75ba707deacdd5808a8f3de8744848d0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Tue, 5 Feb 2013 10:57:47 +0100
+Subject: [PATCH] Fix "error: unknown type name 'uint'"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In file included from imx_driver.c:33:0:
+.../sysroots/imx53qsb/usr/src/kernel/include/linux/mxcfb.h:107:2: error: unknown type name 'uint'
+
+Upstream-Status: Pending
+
+Signed-off-by: Eric B?nard <eric@eukrea.com>
+---
+ src/imx_driver.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/imx_driver.c b/src/imx_driver.c
+index f4b3e38..4cf662d 100644
+--- a/src/imx_driver.c
++++ b/src/imx_driver.c
+@@ -29,6 +29,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <string.h>
++#include <sys/types.h>
+ #include <linux/fb.h>
+ #include <linux/mxcfb.h>
+ 
+-- 
+1.7.10.4
+
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0003-support-glibc-2.20.patch b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0003-support-glibc-2.20.patch
new file mode 100644
index 0000000..3b1b84d
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0003-support-glibc-2.20.patch
@@ -0,0 +1,57 @@
+Fix build errors seen with glibc 2.20
+
+/home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/imx53qsb/usr/include/xorg/os.h:579:1: error: expected identifier or '(' before '__extension__'
+ strndup(const char *str, size_t n);
+ ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: xserver-xorg-video-imx-11.09.01/src/imx_accel.c
+===================================================================
+--- xserver-xorg-video-imx-11.09.01.orig/src/imx_accel.c	2011-07-26 14:22:47.000000000 -0700
++++ xserver-xorg-video-imx-11.09.01/src/imx_accel.c	2014-08-29 15:54:43.648070587 -0700
+@@ -21,6 +21,7 @@
+  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
+  * SOFTWARE.
+  */
++#include <xorg-server.h>
+ 
+ #include <stdint.h>
+ #include "xf86.h"
+Index: xserver-xorg-video-imx-11.09.01/src/imx_exa_offscreen.c
+===================================================================
+--- xserver-xorg-video-imx-11.09.01.orig/src/imx_exa_offscreen.c	2014-08-29 15:26:31.992070587 -0700
++++ xserver-xorg-video-imx-11.09.01/src/imx_exa_offscreen.c	2014-08-29 15:54:54.632070587 -0700
+@@ -53,7 +53,7 @@
+  * When allocating, the contiguous block of areas with the minimum eviction
+  * cost is found and evicted in order to make room for the new allocation.
+  */
+-
++#include <xorg-server.h>
+ 
+ #include "xf86.h"
+ #include "exa.h"
+Index: xserver-xorg-video-imx-11.09.01/src/imx_exa_z160.c
+===================================================================
+--- xserver-xorg-video-imx-11.09.01.orig/src/imx_exa_z160.c	2014-08-29 15:26:31.992070587 -0700
++++ xserver-xorg-video-imx-11.09.01/src/imx_exa_z160.c	2014-08-29 15:54:36.056070587 -0700
+@@ -21,6 +21,7 @@
+  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
+  * SOFTWARE.
+  */
++#include <xorg-server.h>
+ 
+ #include "xf86.h"
+ #include "xf86_OSproc.h"
+Index: xserver-xorg-video-imx-11.09.01/src/imx_ext.c
+===================================================================
+--- xserver-xorg-video-imx-11.09.01.orig/src/imx_ext.c	2014-08-29 15:26:32.064070587 -0700
++++ xserver-xorg-video-imx-11.09.01/src/imx_ext.c	2014-08-29 15:55:18.048070587 -0700
+@@ -21,6 +21,7 @@
+  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
+  * SOFTWARE.
+  */
++#include <xorg-server.h>
+ 
+ #include <X11/X.h>
+ #include <X11/Xproto.h>
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0004-Make-video-API-forward-and-backward-compatible.patch b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0004-Make-video-API-forward-and-backward-compatible.patch
new file mode 100644
index 0000000..2ac6311
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0004-Make-video-API-forward-and-backward-compatible.patch
@@ -0,0 +1,787 @@
+From 5216cb0f14414b5451f58df48a36c1c62c035276 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Sat, 29 Dec 2012 18:02:11 -0200
+Subject: [PATCH] Make video API forward and backward compatible
+
+This updates the video API in a forward and backward compatible way
+using the "compat-api.h" as used in Xorg maintained drivers.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ src/compat-api.h        |  106 +++++++++++++++++++++++++++++++++++++++++++++++
+ src/imx_display.c       |   22 +++++-----
+ src/imx_display.h       |    8 ++--
+ src/imx_driver.c        |   60 ++++++++++++++-------------
+ src/imx_exa_offscreen.c |   12 +++---
+ src/imx_exa_z160.c      |   53 ++++++++++++------------
+ src/imx_xv_ipu.c        |    4 +-
+ 7 files changed, 188 insertions(+), 77 deletions(-)
+ create mode 100644 src/compat-api.h
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+new file mode 100644
+index 0000000..73ac8a2
+--- /dev/null
++++ b/src/compat-api.h
+@@ -0,0 +1,106 @@
++/*
++ * Copyright 2012 Red Hat, Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ *
++ * Author: Dave Airlie <airlied@redhat.com>
++ */
++
++/* this file provides API compat between server post 1.13 and pre it,
++   it should be reused inside as many drivers as possible */
++#ifndef COMPAT_API_H
++#define COMPAT_API_H
++
++#ifndef GLYPH_HAS_GLYPH_PICTURE_ACCESSOR
++#define GetGlyphPicture(g, s) GlyphPicture((g))[(s)->myNum]
++#define SetGlyphPicture(g, s, p) GlyphPicture((g))[(s)->myNum] = p
++#endif
++
++#ifndef XF86_HAS_SCRN_CONV
++#define xf86ScreenToScrn(s) xf86Screens[(s)->myNum]
++#define xf86ScrnToScreen(s) screenInfo.screens[(s)->scrnIndex]
++#endif
++
++#ifndef XF86_SCRN_INTERFACE
++
++#define SCRN_ARG_TYPE int
++#define SCRN_INFO_PTR(arg1) ScrnInfoPtr pScrn = xf86Screens[(arg1)]
++
++#define SCREEN_ARG_TYPE int
++#define SCREEN_PTR(arg1) ScreenPtr pScreen = screenInfo.screens[(arg1)]
++
++#define SCREEN_INIT_ARGS_DECL int index, ScreenPtr pScreen, int argc, char **argv
++
++#define BLOCKHANDLER_ARGS_DECL int arg, pointer blockData, pointer pTimeout, pointer pReadmask
++#define BLOCKHANDLER_ARGS arg, blockData, pTimeout, pReadmask
++
++#define CLOSE_SCREEN_ARGS_DECL int scrnIndex, ScreenPtr pScreen
++#define CLOSE_SCREEN_ARGS scrnIndex, pScreen
++#define CLOSE_SCREEN_DECL_ScrnInfoPtr ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++
++#define FBDEVHWADJUSTFRAME_ARGS(x, y) scrnIndex, (x), (y), 0
++
++#define ADJUST_FRAME_ARGS_DECL int arg, int x, int y, int flags
++
++#define SWITCH_MODE_ARGS_DECL int arg, DisplayModePtr mode, int flags
++
++#define FREE_SCREEN_ARGS_DECL int arg, int flags
++#define FREE_SCREEN_ARGS(x) (x)->scrnIndex, 0
++
++#define VT_FUNC_ARGS_DECL int arg, int flags
++#define VT_FUNC_ARGS(flags) pScrn->scrnIndex, (flags)
++
++#define ENABLE_DISABLE_FB_ACCESS_ARGS(pScrn, b) pScrn->scrnIndex, b
++
++#define XF86_ENABLEDISABLEFB_ARG(x) ((x)->scrnIndex)
++#else
++#define SCRN_ARG_TYPE ScrnInfoPtr
++#define SCRN_INFO_PTR(arg1) ScrnInfoPtr pScrn = (arg1)
++
++#define SCREEN_ARG_TYPE ScreenPtr
++#define SCREEN_PTR(arg1) ScreenPtr pScreen = (arg1)
++
++#define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
++
++#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
++#define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
++
++#define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
++#define CLOSE_SCREEN_ARGS pScreen
++#define CLOSE_SCREEN_DECL_ScrnInfoPtr ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++
++#define FBDEVHWADJUSTFRAME_ARGS(x, y) pScrn, (x), (y)
++
++#define ADJUST_FRAME_ARGS_DECL ScrnInfoPtr arg, int x, int y
++#define SWITCH_MODE_ARGS_DECL ScrnInfoPtr arg, DisplayModePtr mode
++
++#define FREE_SCREEN_ARGS_DECL ScrnInfoPtr arg
++#define FREE_SCREEN_ARGS(x) (x)
++
++#define VT_FUNC_ARGS_DECL ScrnInfoPtr arg
++#define VT_FUNC_ARGS(flags) pScrn
++
++#define ENABLE_DISABLE_FB_ACCESS_ARGS(pScrn, b) pScrn, b
++
++#define XF86_ENABLEDISABLEFB_ARG(x) (x)
++
++#endif
++
++#endif
+diff --git a/src/imx_display.c b/src/imx_display.c
+index fcb8195..e2dc36a 100644
+--- a/src/imx_display.c
++++ b/src/imx_display.c
+@@ -42,6 +42,8 @@
+ #include "imx.h"
+ #include "imx_display.h"
+ 
++#include "compat-api.h"
++
+ #include <X11/Xatom.h>
+ 
+ #if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,7,6,0,0)
+@@ -1373,19 +1375,19 @@ imxDisplayPreInit(ScrnInfoPtr pScrn)
+ Bool
+ imxDisplayStartScreenInit(int scrnIndex, ScreenPtr pScreen)
+ {
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 	ImxPtr fPtr = IMXPTR(pScrn);
+ 
+ 	if (!xf86SetDesiredModes(pScrn)) {
+ 
+-		xf86DrvMsg(scrnIndex, X_ERROR, "mode initialization failed\n");
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "mode initialization failed\n");
+ 		return FALSE;
+ 	}
+ 
+ #if 0
+ 	if (!fbdevHWModeInit(pScrn, pScrn->currentMode)) {
+ 
+-		xf86DrvMsg(scrnIndex, X_ERROR, "mode initialization failed\n");
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "mode initialization failed\n");
+ 		return FALSE;
+ 	}
+ 	pScrn->displayWidth =
+@@ -1463,29 +1465,29 @@ imxDisplayFinishScreenInit(int scrnIndex, ScreenPtr pScreen)
+ /* -------------------------------------------------------------------- */
+ 
+ Bool
+-imxDisplaySwitchMode(int scrnIndex, DisplayModePtr mode, int flags)
++imxDisplaySwitchMode(SWITCH_MODE_ARGS_DECL)
+ {
+-	ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++	SCRN_INFO_PTR(arg);
+ 
+ 	return xf86SetSingleMode(pScrn, mode, RR_Rotate_0);
+ }
+ 
+ void
+-imxDisplayAdjustFrame(int scrnIndex, int x, int y, int flags)
++imxDisplayAdjustFrame(ADJUST_FRAME_ARGS_DECL)
+ {
+-//	fbdevHWAdjustFrame(scrnIndex, x, y, flags);
++//	fbdevHWAdjustFrame(pScrn->scrnIndex, x, y, flags);
+ }
+ 
+ Bool
+-imxDisplayEnterVT(int scrnIndex, int flags)
++imxDisplayEnterVT(VT_FUNC_ARGS_DECL)
+ {
+-	ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++	SCRN_INFO_PTR(arg);
+ 
+ 	return xf86SetDesiredModes(pScrn);
+ }
+ 
+ void
+-imxDisplayLeaveVT(int scrnIndex, int flags)
++imxDisplayLeaveVT(VT_FUNC_ARGS_DECL)
+ {
+ }
+ 
+diff --git a/src/imx_display.h b/src/imx_display.h
+index 4a5d5aa..3a3d43a 100644
+--- a/src/imx_display.h
++++ b/src/imx_display.h
+@@ -59,16 +59,16 @@ imxDisplayValidMode(int scrnIndex, DisplayModePtr mode,
+ 			Bool verbose, int flags);
+ 
+ extern Bool
+-imxDisplaySwitchMode(int scrnIndex, DisplayModePtr mode, int flags);
++imxDisplaySwitchMode(SWITCH_MODE_ARGS_DECL);
+ 
+ extern void
+-imxDisplayAdjustFrame(int scrnIndex, int x, int y, int flags);
++imxDisplayAdjustFrame(ADJUST_FRAME_ARGS_DECL);
+ 
+ extern Bool
+-imxDisplayEnterVT(int scrnIndex, int flags);
++imxDisplayEnterVT(VT_FUNC_ARGS_DECL);
+ 
+ extern void
+-imxDisplayLeaveVT(int scrnIndex, int flags);
++imxDisplayLeaveVT(VT_FUNC_ARGS_DECL);
+ 
+ extern Bool
+ imxDisplayChangeFrameBufferRotateEPDC(int scrnIndex, int fbRotate);
+diff --git a/src/imx_driver.c b/src/imx_driver.c
+index 178e36e..f4b3e38 100644
+--- a/src/imx_driver.c
++++ b/src/imx_driver.c
+@@ -46,6 +46,8 @@
+ #include "fb.h"
+ #include "fbdevhw.h"
+ 
++#include "compat-api.h"
++
+ #if GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 6
+ #include "xf86Resources.h"
+ #include "xf86RAC.h"
+@@ -435,17 +437,17 @@ errorPreInit:
+ }
+ 
+ static void
+-imxFreeScreen(int scrnIndex, int flags)
++imxFreeScreen(FREE_SCREEN_ARGS_DECL)
+ {
+-	ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++	SCRN_INFO_PTR(arg);
+ 
+ 	imxFreeRec(pScrn);
+ }
+ 
+ static Bool
+-imxCloseScreen(int scrnIndex, ScreenPtr pScreen)
++imxCloseScreen(CLOSE_SCREEN_ARGS_DECL)
+ {
+-	ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++	CLOSE_SCREEN_DECL_ScrnInfoPtr;
+ 	ImxPtr fPtr = IMXPTR(pScrn);
+ 
+ 	fbdevHWRestore(pScrn);
+@@ -453,7 +455,7 @@ imxCloseScreen(int scrnIndex, ScreenPtr pScreen)
+ 	pScrn->vtSema = FALSE;
+ 
+ 	pScreen->CloseScreen = fPtr->saveCloseScreen;
+-	return (*pScreen->CloseScreen)(scrnIndex, pScreen);
++	return (*pScreen->CloseScreen)(CLOSE_SCREEN_ARGS);
+ }
+ 
+ static int
+@@ -488,9 +490,9 @@ LCM(a, b)
+ }
+ 
+ static Bool
+-imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
++imxScreenInit(SCREEN_INIT_ARGS_DECL)
+ {
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 	ImxPtr fPtr = IMXPTR(pScrn);
+ 	VisualPtr visual;
+ 	int init_picture = 0;
+@@ -514,7 +516,7 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	/* Map frame buffer memory */
+ 	fPtr->fbMemoryBase = fbdevHWMapVidmem(pScrn);
+ 	if (NULL == fPtr->fbMemoryBase) {
+-	        xf86DrvMsg(scrnIndex,X_ERROR,"mapping of video memory"
++	        xf86DrvMsg(pScrn->scrnIndex,X_ERROR,"mapping of video memory"
+ 			   " failed\n");
+ 		return FALSE;
+ 	}
+@@ -558,7 +560,7 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	const int fbOffsetScreen2 =
+ 		IMX_ALIGN(fbMaxScreenSize, fbMaxAlignOffset);
+ 	fPtr->fbMemoryScreenReserve = fbMaxScreenSize;
+-	xf86DrvMsg(scrnIndex, X_INFO,
++	xf86DrvMsg(pScrn->scrnIndex, X_INFO,
+ 		"reserve %d bytes of frame buffer for screen\n",
+ 		fPtr->fbMemoryScreenReserve);
+ 	fPtr->fbMemoryStart2 = NULL;
+@@ -568,12 +570,12 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 
+ 		fPtr->fbMemoryScreenReserve += fbOffsetScreen2;
+ 
+-		xf86DrvMsg(scrnIndex, X_INFO,
++		xf86DrvMsg(pScrn->scrnIndex, X_INFO,
+ 			"reserve same number of bytes for XRandR rotated screen at offset %d\n",
+ 			fbOffsetScreen2);
+ 	}
+ 
+-	if (!imxDisplayStartScreenInit(scrnIndex, pScreen)) {
++	if (!imxDisplayStartScreenInit(pScrn->scrnIndex, pScreen)) {
+ 
+ 		return FALSE;
+ 	}
+@@ -582,7 +584,7 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	miClearVisualTypes();
+ 	if (pScrn->bitsPerPixel > 8) {
+ 		if (!miSetVisualTypes(pScrn->depth, TrueColorMask, pScrn->rgbBits, TrueColor)) {
+-			xf86DrvMsg(scrnIndex,X_ERROR,"visual type setup failed"
++			xf86DrvMsg(pScrn->scrnIndex,X_ERROR,"visual type setup failed"
+ 				   " for %d bits per pixel [1]\n",
+ 				   pScrn->bitsPerPixel);
+ 			return FALSE;
+@@ -591,14 +593,14 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 		if (!miSetVisualTypes(pScrn->depth,
+ 				      miGetDefaultVisualMask(pScrn->depth),
+ 				      pScrn->rgbBits, pScrn->defaultVisual)) {
+-			xf86DrvMsg(scrnIndex,X_ERROR,"visual type setup failed"
++			xf86DrvMsg(pScrn->scrnIndex,X_ERROR,"visual type setup failed"
+ 				   " for %d bits per pixel [2]\n",
+ 				   pScrn->bitsPerPixel);
+ 			return FALSE;
+ 		}
+ 	}
+ 	if (!miSetPixmapDepths()) {
+-	  xf86DrvMsg(scrnIndex,X_ERROR,"pixmap depth setup failed\n");
++	  xf86DrvMsg(pScrn->scrnIndex,X_ERROR,"pixmap depth setup failed\n");
+ 	  return FALSE;
+ 	}
+ 
+@@ -607,10 +609,10 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 		has a padding which is independent from the depth (controlfb) */
+ 	pScrn->displayWidth = fbdevHWGetLineLength(pScrn) /
+ 			      (pScrn->bitsPerPixel / 8);
+-	xf86DrvMsg(scrnIndex, X_INFO, "displayWidth = %d\n", pScrn->displayWidth);
++	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "displayWidth = %d\n", pScrn->displayWidth);
+ 
+ 	if (pScrn->displayWidth != pScrn->virtualX) {
+-		xf86DrvMsg(scrnIndex, X_INFO,
++		xf86DrvMsg(pScrn->scrnIndex, X_INFO,
+ 			   "Pitch updated to %d after ModeInit\n",
+ 			   pScrn->displayWidth);
+ 	}
+@@ -633,7 +635,7 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 			init_picture = 1;
+ 			break;
+ 	 	default:
+-			xf86DrvMsg(scrnIndex, X_ERROR,
++			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 				   "internal error: invalid number of bits per"
+ 				   " pixel (%d) encountered in"
+ 				   " imxScreenInit()\n", pScrn->bitsPerPixel);
+@@ -644,7 +646,7 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	case FBDEVHW_INTERLEAVED_PLANES:
+ 		/* This should never happen ...
+ 		* we should check for this much much earlier ... */
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "internal error: interleaved planes are not yet "
+ 			   "supported by the imx driver\n");
+ 		ret = FALSE;
+@@ -652,20 +654,20 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	case FBDEVHW_TEXT:
+ 		/* This should never happen ...
+ 		* we should check for this much much earlier ... */
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "internal error: text mode is not supported by the "
+ 			   "imx driver\n");
+ 		ret = FALSE;
+ 		break;
+ 	case FBDEVHW_VGA_PLANES:
+ 		/* Not supported yet */
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "internal error: EGA/VGA Planes are not yet "
+ 			   "supported by the imx driver\n");
+ 		ret = FALSE;
+ 		break;
+ 	default:
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "internal error: unrecognised hardware type (%d) "
+ 			   "encountered in imxScreenInit()\n", type);
+ 		ret = FALSE;
+@@ -699,7 +701,7 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	/* INIT ACCELERATION BEFORE INIT FOR BACKING STORE & SOFTWARE CURSOR */ 
+ 	if (fPtr->useAccel) {
+ 
+-		if (!imxExaZ160Setup(scrnIndex, pScreen)) {
++		if (!imxExaZ160Setup(pScrn->scrnIndex, pScreen)) {
+ 
+ 			fPtr->useAccel = FALSE;
+ 		}
+@@ -731,29 +733,29 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	/* XXX It would be simpler to use miCreateDefColormap() in all cases. */
+ 	case FBDEVHW_PACKED_PIXELS:
+ 		if (!miCreateDefColormap(pScreen)) {
+-			xf86DrvMsg(scrnIndex, X_ERROR,
++			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+                                    "internal error: miCreateDefColormap failed "
+ 				   "in imxScreenInit()\n");
+ 			return FALSE;
+ 		}
+ 		break;
+ 	case FBDEVHW_INTERLEAVED_PLANES:
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "internal error: interleaved planes are not yet "
+ 			   "supported by the imx driver\n");
+ 		return FALSE;
+ 	case FBDEVHW_TEXT:
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "internal error: text mode is not supported by "
+ 			   "the imx driver\n");
+ 		return FALSE;
+ 	case FBDEVHW_VGA_PLANES:
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "internal error: EGA/VGA planes are not yet "
+ 			   "supported by the imx driver\n");
+ 		return FALSE;
+ 	default:
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "internal error: unrecognised imx hardware type "
+ 			   "(%d) encountered in imxScreenInit()\n", type);
+ 		return FALSE;
+@@ -782,7 +784,7 @@ imxScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	}
+ #endif
+ 
+-	if (!imxDisplayFinishScreenInit(scrnIndex, pScreen)) {
++	if (!imxDisplayFinishScreenInit(pScrn->scrnIndex, pScreen)) {
+ 		return FALSE;
+ 	}
+ 
+@@ -810,7 +812,7 @@ IMXGetPixmapProperties(
+ 	}
+ 
+ 	/* Access screen associated with this pixmap. */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmap->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmap->drawable.pScreen);
+ 
+ 	/* Check if the screen associated with this pixmap has IMX driver. */
+ 	if (0 != strcmp(IMX_DRIVER_NAME, pScrn->driverName)) {
+diff --git a/src/imx_exa_offscreen.c b/src/imx_exa_offscreen.c
+index 3a5c24d..0fbe2fc 100644
+--- a/src/imx_exa_offscreen.c
++++ b/src/imx_exa_offscreen.c
+@@ -79,7 +79,7 @@ static void
+ imxExaOffscreenValidate (ScreenPtr pScreen)
+ {
+     /* Access the driver specific data. */
+-    ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++    ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+     ImxPtr imxPtr = IMXPTR(pScrn);
+     ImxExaPtr imxExaPtr = IMXEXAPTR(imxPtr);
+     ExaOffscreenArea *prev = 0, *area;
+@@ -135,7 +135,7 @@ imxExaOffscreenMerge (ImxExaPtr imxExaPtr, ExaOffscreenArea *area)
+ ExaOffscreenArea *
+ imxExaOffscreenFree (ScreenPtr pScreen, ExaOffscreenArea *area)
+ {
+-    ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++    ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+     ImxPtr imxPtr = IMXPTR(pScrn);
+     ImxExaPtr imxExaPtr = IMXEXAPTR(imxPtr);
+     ExaOffscreenArea	*next = area->next;
+@@ -281,7 +281,7 @@ imxExaOffscreenAlloc (ScreenPtr pScreen, int size, int align,
+                    pointer privData)
+ {
+     ExaOffscreenArea *area;
+-    ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++    ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+     ImxPtr imxPtr = IMXPTR(pScrn);
+     ImxExaPtr imxExaPtr = IMXEXAPTR(imxPtr);
+     int real_size = 0, largest_avail = 0;
+@@ -418,7 +418,7 @@ imxExaOffscreenSwapIn (ScreenPtr pScreen)
+ Bool
+ imxExaOffscreenInit (ScreenPtr pScreen)
+ {
+-    ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++    ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+     ImxPtr imxPtr = IMXPTR(pScrn);
+     ImxExaPtr imxExaPtr = IMXEXAPTR(imxPtr);
+     ExaOffscreenArea *area;
+@@ -453,7 +453,7 @@ imxExaOffscreenInit (ScreenPtr pScreen)
+ void
+ imxExaOffscreenFini (ScreenPtr pScreen)
+ {
+-    ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++    ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+     ImxPtr imxPtr = IMXPTR(pScrn);
+     ImxExaPtr imxExaPtr = IMXEXAPTR(imxPtr);
+     ExaOffscreenArea *area;
+@@ -472,7 +472,7 @@ imxExaOffscreenFini (ScreenPtr pScreen)
+ void
+ imxExaOffscreenSwapOut (ScreenPtr pScreen)
+ {
+-    ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++    ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+     ImxPtr imxPtr = IMXPTR(pScrn);
+     ImxExaPtr imxExaPtr = IMXEXAPTR(imxPtr);
+ 
+diff --git a/src/imx_exa_z160.c b/src/imx_exa_z160.c
+index fb718e0..3d0bc96 100644
+--- a/src/imx_exa_z160.c
++++ b/src/imx_exa_z160.c
+@@ -32,6 +32,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ 
++#include "compat-api.h"
+ 
+ /* Set if handles pixmap allocation and migration, i.e, EXA_HANDLES_PIXMAPS */
+ #define	IMX_EXA_ENABLE_HANDLES_PIXMAPS	\
+@@ -299,7 +300,7 @@ imxExaZ160GetPixmapAddress(PixmapPtr pPixmap)
+ 	return fPixmapPtr->ptr;
+ #else
+ 	/* Access screen associated with this pixmap. */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmap->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmap->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -344,7 +345,7 @@ imxExaZ160GetPixmapProperties(
+ #else
+ 
+ 	/* Access screen associated with this pixmap. */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmap->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmap->drawable.pScreen);
+ 
+ 	/* Make sure pixmap is in framebuffer */
+ 	if (!exaDrawableIsOffscreen(&(pPixmap->drawable))) {
+@@ -856,7 +857,7 @@ imxExaZ160SyncIfBusyPixmap(PixmapPtr pPixmap)
+ {
+ 	/* Access screen associated with this pixmap. */
+ 	ScreenPtr pScreen = pPixmap->drawable.pScreen;
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 
+ 	/* Access driver specific data for screen. */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -924,7 +925,7 @@ imxExaZ160CreatePixmap2(ScreenPtr pScreen, int width, int height,
+ 	}
+ 
+ 	/* Access the driver specific data. */
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+ 	ImxExaZ160Ptr fPtr = IMXEXAZ160PTR(imxPtr);
+ 	
+@@ -1028,7 +1029,7 @@ imxExaZ160DestroyPixmap(ScreenPtr pScreen, void *driverPriv)
+ 	ImxExaPixmapPtr fPixmapPtr = (ImxExaPixmapPtr)driverPriv;
+ 
+ 	/* Access the driver specific data. */
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+ 	ImxExaZ160Ptr fPtr = IMXEXAZ160PTR(imxPtr);
+ 
+@@ -1068,7 +1069,7 @@ imxExaZ160ModifyPixmapHeader(PixmapPtr pPixmap, int width, int height,
+ 	}
+ 
+ 	/* Access screen associated with this pixmap */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmap->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmap->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -1194,7 +1195,7 @@ imxExaZ160TrackBusyPixmap(ImxExaZ160Ptr fPtr, PixmapPtr pPixmap)
+ static void
+ imxExaZ160WaitMarker(ScreenPtr pScreen, int marker)
+ {
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 
+ 	/* Access driver specific data associated with the screen. */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -1249,7 +1250,7 @@ imxExaZ160PrepareSolid(PixmapPtr pPixmap, int alu, Pixel planemask, Pixel fg)
+ 	}
+ 
+ 	/* Access screen associated with this pixmap */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmap->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmap->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -1352,7 +1353,7 @@ static void
+ imxExaZ160Solid(PixmapPtr pPixmap, int x1, int y1, int x2, int y2)
+ {
+ 	/* Access screen associated with this pixmap */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmap->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmap->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -1423,7 +1424,7 @@ static void
+ imxExaZ160DoneSolid(PixmapPtr pPixmap)
+ {
+ 	/* Access screen associated with this pixmap */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmap->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmap->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -1485,7 +1486,7 @@ imxExaZ160PrepareCopy(
+ 	}
+ 
+ 	/* Access the screen associated with this pixmap. */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmapDst->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmapDst->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -1599,7 +1600,7 @@ static void
+ imxExaZ160Copy(PixmapPtr pPixmapDst, int srcX, int srcY, int dstX, int dstY, int width, int height)
+ {
+ 	/* Access screen associated with dst pixmap */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmapDst->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmapDst->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -1661,7 +1662,7 @@ static void
+ imxExaZ160DoneCopy(PixmapPtr pPixmapDst)
+ {
+ 	/* Access screen associated with this pixmap */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmapDst->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmapDst->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -1770,7 +1771,7 @@ imxExaZ160CheckComposite(int op, PicturePtr pPictureSrc, PicturePtr pPictureMask
+ 	}
+ 
+ 	/* Access screen associated with dst pixmap (same screen as for src pixmap). */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmapDst->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmapDst->drawable.pScreen);
+ 
+ 	/* Check the number of entities, and fail if it isn't one. */
+ 	if (pScrn->numEntities != 1) {
+@@ -1987,7 +1988,7 @@ imxExaZ160PrepareComposite(
+ {
+ 	/* Access screen associated with dst pixmap. */
+ 	/* Should be same screen as for src pixmap. */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmapDst->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmapDst->drawable.pScreen);
+ 
+ 	/* NOTE - many preconditions already verified in CheckComposite. */
+ 
+@@ -2196,7 +2197,7 @@ imxExaZ160Composite(
+ 	int height)
+ {
+ 	/* Access screen associated with dst pixmap */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmapDst->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmapDst->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -2275,7 +2276,7 @@ static void
+ imxExaZ160DoneComposite(PixmapPtr pPixmapDst)
+ {
+ 	/* Access screen associated with this pixmap */
+-	ScrnInfoPtr pScrn = xf86Screens[pPixmapDst->drawable.pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pPixmapDst->drawable.pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -2323,7 +2324,7 @@ imxExaZ160UploadToScreen(
+ 
+ 	/* Access screen associated with this pixmap */
+ 	ScreenPtr pScreen = pPixmapDst->drawable.pScreen;
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -2381,7 +2382,7 @@ imxExaZ160DownloadFromScreen(
+ 
+ 	/* Access screen associated with this pixmap */
+ 	ScreenPtr pScreen = pPixmapSrc->drawable.pScreen;
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 
+ 	/* Access driver specific data */
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+@@ -2412,9 +2413,9 @@ imxExaZ160DownloadFromScreen(
+ }
+ 
+ Bool
+-imxExaZ160CloseScreen(int scrnIndex, ScreenPtr pScreen)
++imxExaZ160CloseScreen(CLOSE_SCREEN_ARGS_DECL)
+ {
+-	ScrnInfoPtr pScrn = xf86Screens[scrnIndex];
++	CLOSE_SCREEN_DECL_ScrnInfoPtr;
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+ 
+ 	ImxExaZ160Ptr fPtr = IMXEXAZ160PTR(imxPtr);
+@@ -2504,7 +2505,7 @@ imxExaZ160CloseScreen(int scrnIndex, ScreenPtr pScreen)
+ 	/* Install our CloseScreen function so that it gets called. */
+ 	if (NULL != pScreen->CloseScreen) {
+ 
+-		return (*pScreen->CloseScreen)(scrnIndex, pScreen);
++		return (*pScreen->CloseScreen)(CLOSE_SCREEN_ARGS);
+ 	}
+ 
+ 	return TRUE;
+@@ -2514,7 +2515,7 @@ Bool
+ imxExaZ160Setup(int scrnIndex, ScreenPtr pScreen)
+ {
+ 	/* Access the screen info and then private data structures. */
+-	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
++	ScrnInfoPtr pScrn = xf86ScreenToScrn(pScreen);
+ 	ImxPtr imxPtr = IMXPTR(pScrn);
+ 
+ 	/* Private data structure must not already be in use. */
+@@ -2582,7 +2583,7 @@ imxExaZ160Setup(int scrnIndex, ScreenPtr pScreen)
+ 
+ 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 			"Initialize Z160 interfaces failed.\n");
+-		imxExaZ160CloseScreen(scrnIndex, pScreen);
++		imxExaZ160CloseScreen(CLOSE_SCREEN_ARGS);
+ 		return FALSE;
+ 	}
+ 
+@@ -2592,7 +2593,7 @@ imxExaZ160Setup(int scrnIndex, ScreenPtr pScreen)
+ 
+ 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 			"Allocate EXA driver structure.\n");
+-		imxExaZ160CloseScreen(scrnIndex, pScreen);
++		imxExaZ160CloseScreen(CLOSE_SCREEN_ARGS);
+ 		return FALSE;
+ 	}
+ 
+@@ -2657,7 +2658,7 @@ imxExaZ160Setup(int scrnIndex, ScreenPtr pScreen)
+ 	if (!exaDriverInit(pScreen, exaDriverPtr)) {
+ 
+ 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "EXA initialization failed.\n");
+-		imxExaZ160CloseScreen(scrnIndex, pScreen);
++		imxExaZ160CloseScreen(CLOSE_SCREEN_ARGS);
+ 		return FALSE;
+ 	}
+ 	fPtr->imxExaRec.exaDriverPtr = exaDriverPtr;
+diff --git a/src/imx_xv_ipu.c b/src/imx_xv_ipu.c
+index a517742..fc8a827 100644
+--- a/src/imx_xv_ipu.c
++++ b/src/imx_xv_ipu.c
+@@ -398,7 +398,7 @@ xf86XVFillKeyHelper1 (ScreenPtr pScreen, CARD32 key, RegionPtr clipboxes)
+ 	xRectangle *rects;
+ 	GCPtr gc;
+ 
+-	if(!xf86Screens[pScreen->myNum]->vtSema) return;
++	if(!xf86ScreenToScrn(pScreen)->vtSema) return;
+ 
+ 	gc = GetScratchGC(root->depth, pScreen);
+ 	pval[0] = key;
+@@ -771,7 +771,7 @@ MXXVInitializeAdaptor
+ 	XF86VideoAdaptorPtr **pppAdaptor
+ )
+ {
+-	ScreenPtr           pScreen    = screenInfo.screens[pScreenInfo->scrnIndex];
++	ScreenPtr           pScreen    = xf86ScrnToScreen(pScreenInfo);
+ 	XF86VideoAdaptorPtr *ppAdaptor = NULL;
+ 	IMXPtr fPtr = IMXPTR(pScreenInfo);
+ 	int                 nAdaptor;
+-- 
+1.7.10.4
+
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch
new file mode 100644
index 0000000..64af773
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch
@@ -0,0 +1,53 @@
+From 5b348e7be67957f4be6fcfa4942128c04f6db905 Mon Sep 17 00:00:00 2001
+From: Adrian Alonso <b38018@freescale.com>
+Date: Thu, 4 Aug 2011 14:24:26 -0500
+Subject: [PATCH] xf86-video-imxfb: fix m4 hardcodded paths
+
+* Fix m4 macros lookup location; remove /usr/share/aclocal path
+
+Signed-off-by: Adrian Alonso <b38018@freescale.com>
+---
+ Makefile.am  |    2 +-
+ Makefile.in  |    2 +-
+ configure.ac |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6752256..e205657 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,4 +20,4 @@
+ 
+ AUTOMAKE_OPTIONS = foreign
+ SUBDIRS = src
+-ACLOCAL_AMFLAGS = -I /usr/share/aclocal
++ACLOCAL_AMFLAGS = -I m4
+diff --git a/Makefile.in b/Makefile.in
+index 5c0ba0e..f829db7 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -243,7 +243,7 @@ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+ AUTOMAKE_OPTIONS = foreign
+ SUBDIRS = src
+-ACLOCAL_AMFLAGS = -I /usr/share/aclocal
++ACLOCAL_AMFLAGS = -I m4
+ all: config.h
+ 	$(MAKE) $(AM_MAKEFLAGS) all-recursive
+ 
+diff --git a/configure.ac b/configure.ac
+index a1ac73b..0078b86 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -29,7 +29,7 @@ AC_INIT([xf86-video-imx],
+ AC_CONFIG_SRCDIR([Makefile.am])
+ AM_CONFIG_HEADER([config.h])
+ AC_CONFIG_AUX_DIR(.)
+-AC_CONFIG_MACRO_DIR([/usr/share/aclocal])
++AC_CONFIG_MACRO_DIR([m4])
+ 
+ AM_INIT_AUTOMAKE([dist-bzip2])
+ 
+-- 
+1.7.4.1
+
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0006-xserver-1.14-compat.patch b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0006-xserver-1.14-compat.patch
new file mode 100644
index 0000000..14ccbbf
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx-0006-xserver-1.14-compat.patch
@@ -0,0 +1,34 @@
+Fix building using new Xorg 1.14
+
+mibstore functions are no longer supported. This patch removes them
+from this driver, following the pattern in
+http://patches.openembedded.org/patch/46133/
+
+This checkin shows when/where the changes to the X server were made
+that deleted the header mibstore.h and mentions the reasons.
+http://lists.x.org/archives/xorg-devel/2012-September/033575.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+Index: xserver-xorg-video-imx-11.09.01/src/imx_driver.c
+===================================================================
+--- xserver-xorg-video-imx-11.09.01.orig/src/imx_driver.c
++++ xserver-xorg-video-imx-11.09.01/src/imx_driver.c
+@@ -37,7 +37,6 @@
+ #include "xf86_OSproc.h"
+ 
+ #include "mipointer.h"
+-#include "mibstore.h"
+ #include "micmap.h"
+ #include "colormapst.h"
+ #include "xf86cmap.h"
+@@ -722,7 +721,6 @@ imxScreenInit(SCREEN_INIT_ARGS_DECL)
+ 	/* Initialize for X extensions. */
+ 	imxExtInit();
+ 
+-	miInitializeBackingStore(pScreen);
+ 	xf86SetBackingStore(pScreen);
+ 
+ 	/* software cursor */
diff --git a/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
new file mode 100644
index 0000000..39d5169
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-imx/xdriver_xf86-video-imx.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xdriver_xf86-video-imx
+#
+################################################################################
+
+XDRIVER_XF86_VIDEO_IMX_VERSION = 11.09.01
+XDRIVER_XF86_VIDEO_IMX_SOURCE = xserver-xorg-video-imx-$(XDRIVER_XF86_VIDEO_IMX_VERSION).tar.gz
+XDRIVER_XF86_VIDEO_IMX_SITE = $(FREESCALE_IMX_SITE)
+# Test without libz160
+XDRIVER_XF86_VIDEO_IMX_DEPENDENCIES = linux libz160 xserver_xorg-server xproto_fontsproto \
+	xproto_randrproto xproto_renderproto xproto_videoproto                      \
+	xproto_xf86dgaproto xproto_xproto
+XDRIVER_XF86_VIDEO_IMX_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_DIR)/include"
+
+$(eval $(autotools-package))
-- 
1.9.1
