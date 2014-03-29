From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:44 +0100
Subject: [Buildroot] [PATCH 40/91] xdriver_xf86-video-ati: Version bump
	6.14.6
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP4543005DAD4B6D5CEA6850FD9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 .../xdriver_xf86-video-ati-0001-noxaa.patch        |   17 ++++++++++
 .../xdriver_xf86-video-ati-0002-mibstore.patch     |   33 ++++++++++++++++++++
 ...iver_xf86-video-ati-0003-DamageUnregister.patch |   28 +++++++++++++++++
 .../xdriver_xf86-video-ati.mk                      |    3 +-
 4 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0001-noxaa.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0002-mibstore.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0003-DamageUnregister.patch

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0001-noxaa.patch b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0001-noxaa.patch
new file mode 100644
index 0000000..4e53ea0
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0001-noxaa.patch
@@ -0,0 +1,17 @@
+XAA support was removed from xorg xserver
+http://cgit.freedesktop.org/xorg/xserver/commit/?id=e191e296e6e7861978ea4a0ae9aa7b780e52732b
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff -uNr xf86-video-ati-6.14.6.org/configure.ac xf86-video-ati-6.14.6/configure.ac
+--- xf86-video-ati-6.14.6.org/configure.ac	2012-06-29 15:46:11.000000000 +0200
++++ xf86-video-ati-6.14.6/configure.ac	2014-03-29 17:21:35.805208243 +0100
+@@ -163,8 +163,6 @@
+ AM_CONDITIONAL(DRM_MODE, test x$DRM_MODE = xyes)
+ AM_CONDITIONAL(LIBUDEV, test x$LIBUDEV = xyes)
+ 
+-AC_DEFINE(USE_XAA, 1, [Build support for XAA])
+-
+ # Properly handle EXA.
+ AC_MSG_CHECKING([whether to enable EXA support])
+ if test "x$EXA" = xyes; then
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0002-mibstore.patch b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0002-mibstore.patch
new file mode 100644
index 0000000..28c72aa
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0002-mibstore.patch
@@ -0,0 +1,33 @@
+patch adapted from upstream:
+http://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/?id=e8cb0b721e6ea251f85c799ca0563bfa59a2d37c
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff -uNr xf86-video-ati-6.14.6.org/src/radeon_driver.c xf86-video-ati-6.14.6/src/radeon_driver.c
+--- xf86-video-ati-6.14.6.org/src/radeon_driver.c	2012-06-25 10:19:41.000000000 +0200
++++ xf86-video-ati-6.14.6/src/radeon_driver.c	2014-03-29 17:27:54.712440644 +0100
+@@ -3753,10 +3753,6 @@
+     RADEONInitMemMapRegisters(pScrn, info->ModeReg, info);
+     RADEONRestoreMemMapRegisters(pScrn, info->ModeReg);
+ 
+-    /* Backing store setup */
+-    xf86DrvMsgVerb(pScrn->scrnIndex, X_INFO, RADEON_LOGLEVEL_DEBUG,
+-		   "Initializing backing store\n");
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+ 
+     /* DRI finalisation */
+diff -uNr xf86-video-ati-6.14.6.org/src/radeon_kms.c xf86-video-ati-6.14.6/src/radeon_kms.c
+--- xf86-video-ati-6.14.6.org/src/radeon_kms.c	2012-06-29 15:45:35.000000000 +0200
++++ xf86-video-ati-6.14.6/src/radeon_kms.c	2014-03-29 17:28:02.328340925 +0100
+@@ -1036,10 +1036,6 @@
+ #endif
+ 
+     pScrn->vtSema = TRUE;
+-    /* Backing store setup */
+-    xf86DrvMsgVerb(pScrn->scrnIndex, X_INFO, RADEON_LOGLEVEL_DEBUG,
+-		   "Initializing backing store\n");
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+ 
+ 
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0003-DamageUnregister.patch b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0003-DamageUnregister.patch
new file mode 100644
index 0000000..e866cfd
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-0003-DamageUnregister.patch
@@ -0,0 +1,28 @@
+Fix compile error, inspired by
+http://cgit.freedesktop.org/xorg/driver/xf86-video-vmware/commit/?id=e26dec8f5278df74a102493bf6d2d8444dab5d6d
+
+Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
+
+diff -uNr xf86-video-ati-6.14.6.org/src/radeon_driver.c xf86-video-ati-6.14.6/src/radeon_driver.c
+--- xf86-video-ati-6.14.6.org/src/radeon_driver.c	2012-06-25 10:19:41.000000000 +0200
++++ xf86-video-ati-6.14.6/src/radeon_driver.c	2014-03-29 18:03:47.401381113 +0100
+@@ -99,6 +99,7 @@
+ #endif
+ #include "xf86cmap.h"
+ #include "vbe.h"
++#include <xorgVersion.h>
+ 
+ #include "shadow.h"
+ 				/* vgaHW definitions */
+@@ -6440,7 +6437,11 @@
+     if (info->dri && info->dri->pDamage) {
+ 	PixmapPtr pPix = pScreen->GetScreenPixmap(pScreen);
+ 
++#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,14,99,2,0)
++	DamageUnregister(info->dri->pDamage);
++#else
+ 	DamageUnregister(&pPix->drawable, info->dri->pDamage);
++#endif
+ 	DamageDestroy(info->dri->pDamage);
+ 	info->dri->pDamage = NULL;
+     }
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index b90f10a..6d4baa0 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 6.14.4
+XDRIVER_XF86_VIDEO_ATI_VERSION = 6.14.6
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
+XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
 $(eval $(autotools-package))
-- 
1.7.10.4
