From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:39 +0100
Subject: [Buildroot] [PATCH 35/91] xdriver_xf86-video-sis: Bump version to
	0.10.7
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP3647B2443ECDEC42C55D9F0D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 ...tch => xdriver_xf86-video-sis-0001-cross.patch} |    0
 .../xdriver_xf86-video-sis-0002-mibstore.patch     |   34 ++++++++
 ...river_xf86-video-sis-0003-xf86UnMapVidMem.patch |   86 ++++++++++++++++++++
 .../xdriver_xf86-video-sis-0004-xf86Priv.patch     |   43 ++++++++++
 .../xdriver_xf86-video-sis-0005-hvdisplay.patch    |   46 +++++++++++
 .../xdriver_xf86-video-sis-0006-fixwarnings.patch  |   67 +++++++++++++++
 .../xdriver_xf86-video-sis-0007-xi.patch           |   24 ++++++
 .../xdriver_xf86-video-sis.mk                      |    2 +-
 8 files changed, 301 insertions(+), 1 deletion(-)
 rename package/x11r7/xdriver_xf86-video-sis/{xdriver_xf86-video-sis-0.10.0.patch => xdriver_xf86-video-sis-0001-cross.patch} (100%)
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0002-mibstore.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0004-xf86Priv.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0005-hvdisplay.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0006-fixwarnings.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0007-xi.patch

diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0001-cross.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0.10.0.patch
rename to package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0001-cross.patch
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0002-mibstore.patch b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0002-mibstore.patch
new file mode 100644
index 0000000..436e437
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0002-mibstore.patch
@@ -0,0 +1,34 @@
+From 926d4f655c8491b68a338f50c810f6729686ec9f Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 25 Sep 2012 12:54:51 +0000
+Subject: Remove mibstore.h
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=926d4f655c8491b68a338f50c810f6729686ec9f
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/sis_driver.c b/src/sis_driver.c
+index 4c9b9cb..46cfefd 100644
+--- a/src/sis_driver.c
++++ b/src/sis_driver.c
+@@ -57,7 +57,6 @@
+ #include "fb.h"
+ #include "micmap.h"
+ #include "mipointer.h"
+-#include "mibstore.h"
+ #include "edid.h"
+ 
+ #define SIS_NEED_inSISREG
+@@ -8883,7 +8882,6 @@ SISScreenInit(SCREEN_INIT_ARGS_DECL)
+     }
+     pSiS->SiSFastVidCopyDone = TRUE;
+ 
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+ 
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch
new file mode 100644
index 0000000..6082fb9
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0003-xf86UnMapVidMem.patch
@@ -0,0 +1,86 @@
+From 339fb3bc032b9f35b07b90480ae82a0fd352e078 Mon Sep 17 00:00:00 2001
+From: Jan Lindemann <jan@jannet.de>
+Date: Thu, 30 Aug 2012 18:09:10 +0000
+Subject: Replace xf86UnMapVidMem with pci_device_unmap_range
+
+Mixing pci_device_map_range with xf86UnMapVidMem doesn't work too well.
+
+X.Org bug#18028 <https://bugs.freedesktop.org/show_bug.cgi?id=18028>
+
+Bug found by Bryan Henderson <bryanh@giraffe-data.com>
+
+Signed-off-by: Julien Cristau <jcristau@debian.org>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=339fb3bc032b9f35b07b90480ae82a0fd352e078
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/sis_driver.c b/src/sis_driver.c
+index 61e8075..4c9b9cb 100644
+--- a/src/sis_driver.c
++++ b/src/sis_driver.c
+@@ -7344,7 +7344,11 @@ SISUnmapMem(ScrnInfoPtr pScrn)
+         if(pSiSEnt->MapCountIOBase) {
+ 	    pSiSEnt->MapCountIOBase--;
+ 	    if((pSiSEnt->MapCountIOBase == 0) || (pSiSEnt->forceUnmapIOBase)) {
++#ifndef XSERVER_LIBPCIACCESS
+ 		xf86UnMapVidMem(pScrn->scrnIndex, (pointer)pSiSEnt->IOBase, (pSiS->mmioSize * 1024));
++#else
++	        pci_device_unmap_range(pSiS->PciInfo, pSiSEnt->IOBase, (pSiS->mmioSize * 1024));
++#endif
+ 		pSiSEnt->IOBase = NULL;
+ 		pSiSEnt->MapCountIOBase = 0;
+ 		pSiSEnt->forceUnmapIOBase = FALSE;
+@@ -7355,7 +7359,11 @@ SISUnmapMem(ScrnInfoPtr pScrn)
+ 	if(pSiSEnt->MapCountIOBaseDense) {
+ 	    pSiSEnt->MapCountIOBaseDense--;
+ 	    if((pSiSEnt->MapCountIOBaseDense == 0) || (pSiSEnt->forceUnmapIOBaseDense)) {
++#ifndef XSERVER_LIBPCIACCESS
+ 		xf86UnMapVidMem(pScrn->scrnIndex, (pointer)pSiSEnt->IOBaseDense, (pSiS->mmioSize * 1024));
++#else
++		pci_device_unmap_range(pSiS->PciInfo, (pointer)pSiSEnt->IOBaseDense, (pSiS->mmioSize * 1024));
++#endif
+ 		pSiSEnt->IOBaseDense = NULL;
+ 		pSiSEnt->MapCountIOBaseDense = 0;
+ 		pSiSEnt->forceUnmapIOBaseDense = FALSE;
+@@ -7366,7 +7374,11 @@ SISUnmapMem(ScrnInfoPtr pScrn)
+ 	if(pSiSEnt->MapCountFbBase) {
+ 	    pSiSEnt->MapCountFbBase--;
+ 	    if((pSiSEnt->MapCountFbBase == 0) || (pSiSEnt->forceUnmapFbBase)) {
++#ifndef XSERVER_LIBPCIACCESS
+ 		xf86UnMapVidMem(pScrn->scrnIndex, (pointer)pSiSEnt->RealFbBase, pSiS->FbMapSize);
++#else
++		pci_device_unmap_range(pSiS->PciInfo, (pointer)pSiSEnt->RealFbBase, pSiS->FbMapSize);
++#endif
+ 		pSiSEnt->FbBase = pSiSEnt->RealFbBase = NULL;
+ 		pSiSEnt->MapCountFbBase = 0;
+ 		pSiSEnt->forceUnmapFbBase = FALSE;
+@@ -7376,13 +7388,25 @@ SISUnmapMem(ScrnInfoPtr pScrn)
+ 	}
+     } else {
+ #endif
++#ifndef XSERVER_LIBPCIACCESS
+ 	xf86UnMapVidMem(pScrn->scrnIndex, (pointer)pSiS->IOBase, (pSiS->mmioSize * 1024));
++#else
++	pci_device_unmap_range(pSiS->PciInfo, (pointer)pSiS->IOBase, (pSiS->mmioSize * 1024));
++#endif
+ 	pSiS->IOBase = NULL;
+ #ifdef __alpha__
++#ifndef XSERVER_LIBPCIACCESS
+ 	xf86UnMapVidMem(pScrn->scrnIndex, (pointer)pSiS->IOBaseDense, (pSiS->mmioSize * 1024));
++#else
++	pci_device_unmap_range(pSiS->PciInfo, (pointer)pSiS->IOBaseDense, (pSiS->mmioSize * 1024));
++#endif
+ 	pSiS->IOBaseDense = NULL;
+ #endif
++#ifndef XSERVER_LIBPCIACCESS
+ 	xf86UnMapVidMem(pScrn->scrnIndex, (pointer)pSiS->RealFbBase, pSiS->FbMapSize);
++#else
++	pci_device_unmap_range(pSiS->PciInfo, (pointer)pSiS->RealFbBase, pSiS->FbMapSize);
++#endif
+ 	pSiS->FbBase = pSiS->RealFbBase = NULL;
+ #ifdef SISDUALHEAD
+     }
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0004-xf86Priv.patch b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0004-xf86Priv.patch
new file mode 100644
index 0000000..bf36b0d
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0004-xf86Priv.patch
@@ -0,0 +1,43 @@
+From 7d4402786b758de3e6ce2641e15a39d612d5c518 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Mon, 15 Oct 2012 23:11:30 +0000
+Subject: Stop including xf86Priv.h
+
+As the name might suggest, it's server-private.
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=7d4402786b758de3e6ce2641e15a39d612d5c518
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/sis.h b/src/sis.h
+index 46fca2a..20e6134 100644
+--- a/src/sis.h
++++ b/src/sis.h
+@@ -75,7 +75,6 @@
+ 
+ #include "compiler.h"
+ #include "xf86Pci.h"
+-#include "xf86Priv.h"
+ #include "xf86_OSproc.h"
+ #if GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) < 6
+ #include "xf86Resources.h"
+diff --git a/src/sis_driver.c b/src/sis_driver.c
+index 46cfefd..cefe503 100644
+--- a/src/sis_driver.c
++++ b/src/sis_driver.c
+@@ -93,6 +93,10 @@
+ #include "dri.h"
+ #endif
+ 
++#ifndef DEFAULT_DPI
++#define DEFAULT_DPI 96
++#endif
++
+ /*
+  * LookupWindow was removed with video abi 11.
+  */
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0005-hvdisplay.patch b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0005-hvdisplay.patch
new file mode 100644
index 0000000..584d3f4
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0005-hvdisplay.patch
@@ -0,0 +1,46 @@
+From 0a4336efaafac4c34d4287b5df586bbb418f7f76 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Sat, 26 Oct 2013 21:27:17 +0000
+Subject: Fix HDisplay/VDisplay typos
+
+Found by gcc -Wlogicalops:
+
+sis_driver.c: In function 'SiS_CheckModeCRT2':
+sis_driver.c:13754:5: warning: logical 'and' of mutually exclusive tests is always false [-Wlogical-op]
+sis_driver.c:13755:6: warning: logical 'and' of mutually exclusive tests is always false [-Wlogical-op]
+sis_driver.c:13756:6: warning: logical 'and' of mutually exclusive tests is always false [-Wlogical-op]
+sis_driver.c:13758:5: warning: logical 'and' of mutually exclusive tests is always false [-Wlogical-op]
+sis_driver.c:13759:6: warning: logical 'and' of mutually exclusive tests is always false [-Wlogical-op]
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Gaetan Nadon <memsize@videotron.ca>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=0a4336efaafac4c34d4287b5df586bbb418f7f76
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/sis_driver.c b/src/sis_driver.c
+index cefe503..80b8d51 100644
+--- a/src/sis_driver.c
++++ b/src/sis_driver.c
+@@ -13751,12 +13751,12 @@ SiS_CheckModeCRT2(ScrnInfoPtr pScrn, DisplayModePtr mode, unsigned int VBFlags,
+       if( ((mode->HDisplay <= pSiS->LCDwidth) &&
+            (mode->VDisplay <= pSiS->LCDheight)) ||
+ 	  ((pSiS->SiS_Pr->SiS_CustomT == CUT_PANEL848) &&
+-	   (((mode->HDisplay == 1360) && (mode->HDisplay == 768)) ||
+-	    ((mode->HDisplay == 1024) && (mode->HDisplay == 768)) ||
+-	    ((mode->HDisplay ==  800) && (mode->HDisplay == 600)))) ||
++	   (((mode->HDisplay == 1360) && (mode->VDisplay == 768)) ||
++	    ((mode->HDisplay == 1024) && (mode->VDisplay == 768)) ||
++	    ((mode->HDisplay ==  800) && (mode->VDisplay == 600)))) ||
+ 	  ((pSiS->SiS_Pr->SiS_CustomT == CUT_PANEL856) &&
+-	   (((mode->HDisplay == 1024) && (mode->HDisplay == 768)) ||
+-	    ((mode->HDisplay ==  800) && (mode->HDisplay == 600)))) ) {
++	   (((mode->HDisplay == 1024) && (mode->VDisplay == 768)) ||
++	    ((mode->HDisplay ==  800) && (mode->VDisplay == 600)))) ) {
+ 
+ 	 ModeIndex = SiS_GetModeID_LCD(pSiS->VGAEngine, VBFlags, mode->HDisplay, mode->VDisplay, i,
+ 				pSiS->FSTN, pSiS->SiS_Pr->SiS_CustomT, pSiS->LCDwidth, pSiS->LCDheight,
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0006-fixwarnings.patch b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0006-fixwarnings.patch
new file mode 100644
index 0000000..3598c9e
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0006-fixwarnings.patch
@@ -0,0 +1,67 @@
+From 49796d6a3274adc0250ee07faa6bc63e41c98740 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Thu, 21 Nov 2013 22:21:18 +0000
+Subject: Fix format-security warnings
+
+sis_driver.c: In function 'SISErrorLog':
+sis_driver.c:432:5: error: format not a string literal and no format arguments [-Werror=format-security]
+     xf86DrvMsg(pScrn->scrnIndex, X_ERROR, str);
+     ^
+sis_driver.c:439:5: error: format not a string literal and no format arguments [-Werror=format-security]
+     xf86DrvMsg(pScrn->scrnIndex, X_ERROR, str);
+     ^
+sis_driver.c: In function 'SiSUpdateXineramaScreenInfo':
+sis_driver.c:1917:4: error: format not a string literal and no format arguments [-Werror=format-security]
+    xf86DrvMsg(pScrn1->scrnIndex, X_INFO, rectxine);
+    ^
+sis_driver.c:1924:8: error: format not a string literal and no format arguments [-Werror=format-security]
+        xf86DrvMsg(pScrn1->scrnIndex, X_INFO, rectxine);
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+---
+Fetch from:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-sis/commit/?id=49796d6a3274adc0250ee07faa6bc63e41c98740
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff --git a/src/sis_driver.c b/src/sis_driver.c
+index 80b8d51..bd9c4e1 100644
+--- a/src/sis_driver.c
++++ b/src/sis_driver.c
+@@ -429,14 +429,14 @@ SISErrorLog(ScrnInfoPtr pScrn, const char *format, ...)
+     static const char *str = "**************************************************\n";
+ 
+     va_start(ap, format);
+-    xf86DrvMsg(pScrn->scrnIndex, X_ERROR, str);
++    xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "%s", str);
+     xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 	"                      ERROR:\n");
+     xf86VDrvMsgVerb(pScrn->scrnIndex, X_ERROR, 1, format, ap);
+     va_end(ap);
+     xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 	"                  END OF MESSAGE\n");
+-    xf86DrvMsg(pScrn->scrnIndex, X_ERROR, str);
++    xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "%s", str);
+ }
+ 
+ static void
+@@ -1914,14 +1914,14 @@ SiSUpdateXineramaScreenInfo(ScrnInfoPtr pScrn1)
+        if(infochanged && !usenonrect) {
+ 	  xf86DrvMsg(pScrn1->scrnIndex, X_INFO,
+ 			"Virtual screen size does not match maximum display modes...\n");
+-	  xf86DrvMsg(pScrn1->scrnIndex, X_INFO, rectxine);
++	  xf86DrvMsg(pScrn1->scrnIndex, X_INFO, "%s", rectxine);
+ 
+        }
+     } else if(infochanged && usenonrect) {
+        usenonrect = FALSE;
+        xf86DrvMsg(pScrn1->scrnIndex, X_INFO,
+ 		"Only clone modes available for this virtual screen size...\n");
+-       xf86DrvMsg(pScrn1->scrnIndex, X_INFO, rectxine);
++       xf86DrvMsg(pScrn1->scrnIndex, X_INFO, "%s", rectxine);
+     }
+ 
+     if(pSiS->maxCRT1_X1) {		/* Means we have at least one non-clone mode */
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0007-xi.patch b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0007-xi.patch
new file mode 100644
index 0000000..7905248
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis-0007-xi.patch
@@ -0,0 +1,24 @@
+Fetch from:
+https://projects.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/xf86-video-sis&id=7aaa7a9786ce5654df877311909244e0a6c42fd1
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+--- xf86-video-sis-0.10.7/src/sis_driver.c	2013-03-10 13:57:50.000000000 +0100
++++ xf86-video-sis-0.10.7/src/sis_driver.c.new	2013-03-10 13:54:48.645203559 +0100
+@@ -9378,7 +9378,15 @@
+      }
+      if(doit) {
+ 	sigstate = xf86BlockSIGIO();
+-#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 15
++#if GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 18
++        {
++            double dx = x, dy = y;
++            miPointerSetPosition(inputInfo.pointer, Absolute, &dx, &dy,
++                NULL, NULL);
++            x = (int)dx;
++            y = (int)dy;
++        }
++#elif GET_ABI_MAJOR(ABI_XINPUT_VERSION) >= 15
+         {
+             double dx = x, dy = y;
+             miPointerSetPosition(inputInfo.pointer, Absolute, &dx, &dy);
diff --git a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
index 03276bb..1937c45 100644
--- a/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
+++ b/package/x11r7/xdriver_xf86-video-sis/xdriver_xf86-video-sis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.4
+XDRIVER_XF86_VIDEO_SIS_VERSION = 0.10.7
 XDRIVER_XF86_VIDEO_SIS_SOURCE = xf86-video-sis-$(XDRIVER_XF86_VIDEO_SIS_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SIS_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_SIS_LICENSE = MIT
-- 
1.7.10.4
