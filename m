From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Feb 2015 21:11:34 +0100
Subject: [Buildroot] [PATCH 21/35] package/x11r7/xdriver_xf86-video-ati:
	bump version to 7.5.0
In-Reply-To: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
References: <1423339908-2960-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1423339908-2960-21-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../x11r7/xdriver_xf86-video-ati/0001-noxaa.patch  |   17 ----------
 .../xdriver_xf86-video-ati/0002-mibstore.patch     |   33 --------------------
 .../0003-DamageUnregister.patch                    |   28 -----------------
 .../xdriver_xf86-video-ati.mk                      |    2 +-
 4 files changed, 1 insertion(+), 79 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-ati/0001-noxaa.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-ati/0002-mibstore.patch
 delete mode 100644 package/x11r7/xdriver_xf86-video-ati/0003-DamageUnregister.patch

diff --git a/package/x11r7/xdriver_xf86-video-ati/0001-noxaa.patch b/package/x11r7/xdriver_xf86-video-ati/0001-noxaa.patch
deleted file mode 100644
index 4e53ea0..0000000
--- a/package/x11r7/xdriver_xf86-video-ati/0001-noxaa.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-XAA support was removed from xorg xserver
-http://cgit.freedesktop.org/xorg/xserver/commit/?id=e191e296e6e7861978ea4a0ae9aa7b780e52732b
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff -uNr xf86-video-ati-6.14.6.org/configure.ac xf86-video-ati-6.14.6/configure.ac
---- xf86-video-ati-6.14.6.org/configure.ac	2012-06-29 15:46:11.000000000 +0200
-+++ xf86-video-ati-6.14.6/configure.ac	2014-03-29 17:21:35.805208243 +0100
-@@ -163,8 +163,6 @@
- AM_CONDITIONAL(DRM_MODE, test x$DRM_MODE = xyes)
- AM_CONDITIONAL(LIBUDEV, test x$LIBUDEV = xyes)
- 
--AC_DEFINE(USE_XAA, 1, [Build support for XAA])
--
- # Properly handle EXA.
- AC_MSG_CHECKING([whether to enable EXA support])
- if test "x$EXA" = xyes; then
diff --git a/package/x11r7/xdriver_xf86-video-ati/0002-mibstore.patch b/package/x11r7/xdriver_xf86-video-ati/0002-mibstore.patch
deleted file mode 100644
index 28c72aa..0000000
--- a/package/x11r7/xdriver_xf86-video-ati/0002-mibstore.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-patch adapted from upstream:
-http://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/?id=e8cb0b721e6ea251f85c799ca0563bfa59a2d37c
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff -uNr xf86-video-ati-6.14.6.org/src/radeon_driver.c xf86-video-ati-6.14.6/src/radeon_driver.c
---- xf86-video-ati-6.14.6.org/src/radeon_driver.c	2012-06-25 10:19:41.000000000 +0200
-+++ xf86-video-ati-6.14.6/src/radeon_driver.c	2014-03-29 17:27:54.712440644 +0100
-@@ -3753,10 +3753,6 @@
-     RADEONInitMemMapRegisters(pScrn, info->ModeReg, info);
-     RADEONRestoreMemMapRegisters(pScrn, info->ModeReg);
- 
--    /* Backing store setup */
--    xf86DrvMsgVerb(pScrn->scrnIndex, X_INFO, RADEON_LOGLEVEL_DEBUG,
--		   "Initializing backing store\n");
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
- 
-     /* DRI finalisation */
-diff -uNr xf86-video-ati-6.14.6.org/src/radeon_kms.c xf86-video-ati-6.14.6/src/radeon_kms.c
---- xf86-video-ati-6.14.6.org/src/radeon_kms.c	2012-06-29 15:45:35.000000000 +0200
-+++ xf86-video-ati-6.14.6/src/radeon_kms.c	2014-03-29 17:28:02.328340925 +0100
-@@ -1036,10 +1036,6 @@
- #endif
- 
-     pScrn->vtSema = TRUE;
--    /* Backing store setup */
--    xf86DrvMsgVerb(pScrn->scrnIndex, X_INFO, RADEON_LOGLEVEL_DEBUG,
--		   "Initializing backing store\n");
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
- 
- 
diff --git a/package/x11r7/xdriver_xf86-video-ati/0003-DamageUnregister.patch b/package/x11r7/xdriver_xf86-video-ati/0003-DamageUnregister.patch
deleted file mode 100644
index e866cfd..0000000
--- a/package/x11r7/xdriver_xf86-video-ati/0003-DamageUnregister.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix compile error, inspired by
-http://cgit.freedesktop.org/xorg/driver/xf86-video-vmware/commit/?id=e26dec8f5278df74a102493bf6d2d8444dab5d6d
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff -uNr xf86-video-ati-6.14.6.org/src/radeon_driver.c xf86-video-ati-6.14.6/src/radeon_driver.c
---- xf86-video-ati-6.14.6.org/src/radeon_driver.c	2012-06-25 10:19:41.000000000 +0200
-+++ xf86-video-ati-6.14.6/src/radeon_driver.c	2014-03-29 18:03:47.401381113 +0100
-@@ -99,6 +99,7 @@
- #endif
- #include "xf86cmap.h"
- #include "vbe.h"
-+#include <xorgVersion.h>
- 
- #include "shadow.h"
- 				/* vgaHW definitions */
-@@ -6440,7 +6437,11 @@
-     if (info->dri && info->dri->pDamage) {
- 	PixmapPtr pPix = pScreen->GetScreenPixmap(pScreen);
- 
-+#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,14,99,2,0)
-+	DamageUnregister(info->dri->pDamage);
-+#else
- 	DamageUnregister(&pPix->drawable, info->dri->pDamage);
-+#endif
- 	DamageDestroy(info->dri->pDamage);
- 	info->dri->pDamage = NULL;
-     }
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 6d4baa0..db420ea 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 6.14.6
+XDRIVER_XF86_VIDEO_ATI_VERSION = 7.5.0
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
-- 
1.7.10.4
