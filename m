From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jun 2021 10:07:56 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-fbturbo:
 fix driver loading
Message-ID: <20210606073757.D9DB4888AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dc2b4a4eee557d3d9e7df31e9d2e96f364a2f03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Port two xf86-video-fbdev upstream patches to xf86-video-fbturbo fixing
incompatibility with latest xorg release and add mandatory module loading
section to installed xorg.conf:

- patch 0002-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch, fixes:
  [    12.638] (II) LoadModule: "fbturbo"
  [    12.639] (II) Loading /usr/lib/xorg/modules/drivers/fbturbo_drv.so
  [    12.642] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbturbo_drv.so: /usr/lib/xorg/modules/drivers/fbturbo_drv.so: undefined symbol: shadowUpdatePackedWeak
  [    12.642] (EE) Failed to load module "fbturbo" (loader failed, 0)

- patch 0003-Update-for-1.20-ABI.patch, fixes:
  [    12.551] (II) LoadModule: "fbturbo"
  [    12.553] (II) Loading /usr/lib/xorg/modules/drivers/fbturbo_drv.so
  [    12.556] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbturbo_drv.so: /usr/lib/xorg/modules/drivers/fbturbo_drv.so: undefined symbol: xf86DisableRandR
  [    12.556] (EE) Failed to load module "fbturbo" (loader failed, 0)

- patch 0004-xorg.conf-add-mandatory-modules-fb-shadow-fbdevhw.patch, fixes:

  module fbdevhw:
  [   303.906] (II) LoadModule: "fbturbo"
  [   303.906] (II) Loading /usr/lib/xorg/modules/drivers/fbturbo_drv.so
  [   303.907] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbturbo_drv.so: /usr/lib/xorg/modules/drivers/fbturbo_drv.so: undefined symbol: fbdevHWSave
  [   303.907] (EE) Failed to load module "fbturbo" (loader failed, 0)
  [   303.907] (EE) No drivers available.

  module shadow:
  [   426.403] (II) LoadModule: "fbturbo"
  [   426.404] (II) Loading /usr/lib/xorg/modules/drivers/fbturbo_drv.so
  [   426.404] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbturbo_drv.so: /usr/lib/xorg/modules/drivers/fbturbo_drv.so: undefined symbol: shadowRemove
  [   426.404] (EE) Failed to load module "fbturbo" (loader failed, 0)
  [   426.404] (EE) No drivers available.

  module fb:
  [   471.912] (II) LoadModule: "shadow"
  [   471.913] (II) Loading /usr/lib/xorg/modules/libshadow.so
  [   471.913] (EE) Failed to load /usr/lib/xorg/modules/libshadow.so: /usr/lib/xorg/modules/libshadow.so: undefined symbol: fbGetScreenPrivateKey
  [   471.913] (EE) Failed to load module "shadow" (loader failed, 0)

Fixes:
  - https://bugs.busybox.net/show_bug.cgi?id=13816
  - http://lists.busybox.net/pipermail/buildroot/2021-June/311763.html

Reported-by: J??rgen Wack <juergen.wack@gmx.de>
Reported-by: Derek T <derek.tata1@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: fix check-package errors]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...n-thunk-functions-instead-of-fbdevHW-Weak.patch | 160 +++++++++++++++++++++
 .../0003-Update-for-1.20-ABI.patch                 |  30 ++++
 ...f-add-mandatory-modules-fb-shadow-fbdevhw.patch |  53 +++++++
 3 files changed, 243 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/0002-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch b/package/x11r7/xdriver_xf86-video-fbturbo/0002-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch
new file mode 100644
index 0000000000..709efba5ab
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/0002-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch
@@ -0,0 +1,160 @@
+From 2186a4e5ed6b8b8f24ebd4d2045df10d1f895999 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Wed, 21 May 2014 09:49:56 -0400
+Subject: [PATCH] Use own thunk functions instead of fbdevHW*Weak
+
+I plan to remove the Weak functions from a future server.
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+[Upstream https://gitlab.freedesktop.org/xorg/driver/xf86-video-fbdev/-/commit/2673e727063fe28310836f1e6e9eda552930218a
+ ported to xf86-video-fbturbo]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/fbdev.c | 86 +++++++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 71 insertions(+), 15 deletions(-)
+
+diff --git a/src/fbdev.c b/src/fbdev.c
+index 90d9f39..81bd1fb 100644
+--- a/src/fbdev.c
++++ b/src/fbdev.c
+@@ -269,6 +269,35 @@ FBDevIdentify(int flags)
+ 	xf86PrintChipsets(FBDEV_NAME, "driver for framebuffer", FBDevChipsets);
+ }
+ 
++static Bool
++fbdevSwitchMode(ScrnInfoPtr pScrn, DisplayModePtr mode)
++{
++    return fbdevHWSwitchMode(pScrn, mode);
++}
++
++static void
++fbdevAdjustFrame(ScrnInfoPtr pScrn, int x, int y)
++{
++    fbdevHWAdjustFrame(pScrn, x, y);
++}
++
++static Bool
++fbdevEnterVT(ScrnInfoPtr pScrn)
++{
++    return fbdevHWEnterVT(pScrn);
++}
++
++static void
++fbdevLeaveVT(ScrnInfoPtr pScrn)
++{
++    fbdevHWLeaveVT(pScrn);
++}
++
++static ModeStatus
++fbdevValidMode(ScrnInfoPtr pScrn, DisplayModePtr mode, Bool verbose, int flags)
++{
++    return fbdevHWValidMode(pScrn, mode, verbose, flags);
++}
+ 
+ #ifdef XSERVER_LIBPCIACCESS
+ static Bool FBDevPciProbe(DriverPtr drv, int entity_num,
+@@ -294,11 +323,11 @@ static Bool FBDevPciProbe(DriverPtr drv, int entity_num,
+ 	    pScrn->Probe         = FBDevProbe;
+ 	    pScrn->PreInit       = FBDevPreInit;
+ 	    pScrn->ScreenInit    = FBDevScreenInit;
+-	    pScrn->SwitchMode    = fbdevHWSwitchModeWeak();
+-	    pScrn->AdjustFrame   = fbdevHWAdjustFrameWeak();
+-	    pScrn->EnterVT       = fbdevHWEnterVTWeak();
+-	    pScrn->LeaveVT       = fbdevHWLeaveVTWeak();
+-	    pScrn->ValidMode     = fbdevHWValidModeWeak();
++	    pScrn->SwitchMode    = fbdevSwitchMode;
++	    pScrn->AdjustFrame   = fbdevAdjustFrame;
++	    pScrn->EnterVT       = fbdevEnterVT;
++	    pScrn->LeaveVT       = fbdevLeaveVT;
++	    pScrn->ValidMode     = fbdevValidMode;
+ 
+ 	    xf86DrvMsg(pScrn->scrnIndex, X_CONFIG,
+ 		       "claimed PCI slot %d@%d:%d:%d\n", 
+@@ -411,11 +440,11 @@ FBDevProbe(DriverPtr drv, int flags)
+ 		    pScrn->Probe         = FBDevProbe;
+ 		    pScrn->PreInit       = FBDevPreInit;
+ 		    pScrn->ScreenInit    = FBDevScreenInit;
+-		    pScrn->SwitchMode    = fbdevHWSwitchModeWeak();
+-		    pScrn->AdjustFrame   = fbdevHWAdjustFrameWeak();
+-		    pScrn->EnterVT       = fbdevHWEnterVTWeak();
+-		    pScrn->LeaveVT       = fbdevHWLeaveVTWeak();
+-		    pScrn->ValidMode     = fbdevHWValidModeWeak();
++		    pScrn->SwitchMode    = fbdevSwitchMode;
++		    pScrn->AdjustFrame   = fbdevAdjustFrame;
++		    pScrn->EnterVT       = fbdevEnterVT;
++		    pScrn->LeaveVT       = fbdevLeaveVT;
++		    pScrn->ValidMode     = fbdevValidMode;
+ 		    
+ 		    xf86DrvMsg(pScrn->scrnIndex, X_INFO,
+ 			       "using %s\n", dev ? dev : "default device");
+@@ -656,6 +685,17 @@ FBDevPreInit(ScrnInfoPtr pScrn, int flags)
+ 	return TRUE;
+ }
+ 
++static void
++fbdevUpdateRotatePacked(ScreenPtr pScreen, shadowBufPtr pBuf)
++{
++    shadowUpdateRotatePacked(pScreen, pBuf);
++}
++
++static void
++fbdevUpdatePacked(ScreenPtr pScreen, shadowBufPtr pBuf)
++{
++    shadowUpdatePacked(pScreen, pBuf);
++}
+ 
+ static Bool
+ FBDevCreateScreenResources(ScreenPtr pScreen)
+@@ -675,7 +715,7 @@ FBDevCreateScreenResources(ScreenPtr pScreen)
+     pPixmap = pScreen->GetScreenPixmap(pScreen);
+ 
+     if (!shadowAdd(pScreen, pPixmap, fPtr->rotate ?
+-		   shadowUpdateRotatePackedWeak() : shadowUpdatePackedWeak(),
++		   fbdevUpdateRotatePacked : fbdevUpdatePacked,
+ 		   FBDevWindowLinear, fPtr->rotate, NULL)) {
+ 	return FALSE;
+     }
+@@ -699,6 +739,23 @@ FBDevShadowInit(ScreenPtr pScreen)
+     return TRUE;
+ }
+ 
++static void
++fbdevLoadPalette(ScrnInfoPtr pScrn, int num, int *i, LOCO *col, VisualPtr pVis)
++{
++    fbdevHWLoadPalette(pScrn, num, i, col, pVis);
++}
++
++static void
++fbdevDPMSSet(ScrnInfoPtr pScrn, int mode, int flags)
++{
++    fbdevHWDPMSSet(pScrn, mode, flags);
++}
++
++static Bool
++fbdevSaveScreen(ScreenPtr pScreen, int mode)
++{
++    return fbdevHWSaveScreen(pScreen, mode);
++}
+ 
+ static Bool
+ FBDevScreenInit(SCREEN_INIT_ARGS_DECL)
+@@ -1025,13 +1082,12 @@ FBDevScreenInit(SCREEN_INIT_ARGS_DECL)
+ 		return FALSE;
+ 	}
+ 	flags = CMAP_PALETTED_TRUECOLOR;
+-	if(!xf86HandleColormaps(pScreen, 256, 8, fbdevHWLoadPaletteWeak(), 
+-				NULL, flags))
++	if(!xf86HandleColormaps(pScreen, 256, 8, fbdevLoadPalette, NULL, flags))
+ 		return FALSE;
+ 
+-	xf86DPMSInit(pScreen, fbdevHWDPMSSetWeak(), 0);
++	xf86DPMSInit(pScreen, fbdevDPMSSet, 0);
+ 
+-	pScreen->SaveScreen = fbdevHWSaveScreenWeak();
++	pScreen->SaveScreen = fbdevSaveScreen;
+ 
+ 	/* Wrap the current CloseScreen function */
+ 	fPtr->CloseScreen = pScreen->CloseScreen;
+-- 
+2.31.1
+
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/0003-Update-for-1.20-ABI.patch b/package/x11r7/xdriver_xf86-video-fbturbo/0003-Update-for-1.20-ABI.patch
new file mode 100644
index 0000000000..99ccc7a11f
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/0003-Update-for-1.20-ABI.patch
@@ -0,0 +1,30 @@
+From 5112829fe3f9f4776276800a175bf460061f83b1 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Wed, 30 May 2018 12:31:04 -0400
+Subject: [PATCH] Update for 1.20 ABI
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+[Upstream https://gitlab.freedesktop.org/xorg/driver/xf86-video-fbdev/-/commit/67525c485f3b32ce0c9bff250d905852f75dfc1c
+ ported to xf86-video-fbturbo]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/fbdev.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/fbdev.c b/src/fbdev.c
+index 81bd1fb..489a231 100644
+--- a/src/fbdev.c
++++ b/src/fbdev.c
+@@ -1036,7 +1036,9 @@ FBDevScreenInit(SCREEN_INIT_ARGS_DECL)
+ 	  xf86DrvMsg(pScrn->scrnIndex, X_INFO, "display rotated; disabling DGA\n");
+ 	  xf86DrvMsg(pScrn->scrnIndex, X_INFO, "using driver rotation; disabling "
+ 			                "XRandR\n");
++#if GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 24
+ 	  xf86DisableRandR();
++#endif
+ 	  if (pScrn->bitsPerPixel == 24)
+ 	    xf86DrvMsg(pScrn->scrnIndex, X_WARNING, "rotation might be broken at 24 "
+                                              "bits per pixel\n");
+-- 
+2.31.1
+
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/0004-xorg.conf-add-mandatory-modules-fb-shadow-fbdevhw.patch b/package/x11r7/xdriver_xf86-video-fbturbo/0004-xorg.conf-add-mandatory-modules-fb-shadow-fbdevhw.patch
new file mode 100644
index 0000000000..7da36a4472
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/0004-xorg.conf-add-mandatory-modules-fb-shadow-fbdevhw.patch
@@ -0,0 +1,53 @@
+From 04d1f756ac1204b8d5be1757499ac3a239bd93e1 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Wed, 2 Jun 2021 21:42:56 +0200
+Subject: [PATCH] xorg.conf: add mandatory modules (fb, shadow, fbdevhw)
+
+Xorg does not implement real dynamic linking and requires that its
+modules get loaded so add mandatory modules:
+
+- fbdevhw, fixes:
+  [   303.906] (II) LoadModule: "fbturbo"
+  [   303.906] (II) Loading /usr/lib/xorg/modules/drivers/fbturbo_drv.so
+  [   303.907] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbturbo_drv.so: /usr/lib/xorg/modules/drivers/fbturbo_drv.so: undefined symbol: fbdevHWSave
+  [   303.907] (EE) Failed to load module "fbturbo" (loader failed, 0)
+  [   303.907] (EE) No drivers available.
+
+- shadow, fixes:
+  [   426.403] (II) LoadModule: "fbturbo"
+  [   426.404] (II) Loading /usr/lib/xorg/modules/drivers/fbturbo_drv.so
+  [   426.404] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbturbo_drv.so: /usr/lib/xorg/modules/drivers/fbturbo_drv.so: undefined symbol: shadowRemove
+  [   426.404] (EE) Failed to load module "fbturbo" (loader failed, 0)
+  [   426.404] (EE) No drivers available.
+
+- fb, fixes:
+  [   471.912] (II) LoadModule: "shadow"
+  [   471.913] (II) Loading /usr/lib/xorg/modules/libshadow.so
+  [   471.913] (EE) Failed to load /usr/lib/xorg/modules/libshadow.so: /usr/lib/xorg/modules/libshadow.so: undefined symbol: fbGetScreenPrivateKey
+  [   471.913] (EE) Failed to load module "shadow" (loader failed, 0)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ xorg.conf | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xorg.conf b/xorg.conf
+index 6217d11..fda62e3 100644
+--- a/xorg.conf
++++ b/xorg.conf
+@@ -8,6 +8,12 @@
+ # Run "man fbturbo" to get additional information about the extra
+ # configuration options for tuning the driver.
+ 
++Section "Module"
++   Load "fb"
++   Load "shadow"
++   Load "fbdevhw"
++EndSection
++
+ Section "Device"
+         Identifier      "Allwinner A10/A13 FBDEV"
+         Driver          "fbturbo"
+-- 
+2.31.1
+
