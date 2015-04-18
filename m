From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 21:53:49 +0200
Subject: [Buildroot] [PATCH 04/35] package/x11r7/xdriver_xf86-video-geode:
	bump version to 2.11.16, add hash
In-Reply-To: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429386860-16631-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove 0001-include.patch, applied upstream
added another patch from upstream to fix compilation with xserver 1.17

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xdriver_xf86-video-geode/0001-include.patch    |   17 --
 .../0001-xserver_1_17.patch                        |  261 ++++++++++++++++++++
 package/x11r7/xdriver_xf86-video-geode/Config.in   |    1 -
 .../xdriver_xf86-video-geode.hash                  |    2 +
 .../xdriver_xf86-video-geode.mk                    |    2 +-
 5 files changed, 264 insertions(+), 19 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-geode/0001-include.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-geode/0001-xserver_1_17.patch
 create mode 100644 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash

diff --git a/package/x11r7/xdriver_xf86-video-geode/0001-include.patch b/package/x11r7/xdriver_xf86-video-geode/0001-include.patch
deleted file mode 100644
index e38424a..0000000
--- a/package/x11r7/xdriver_xf86-video-geode/0001-include.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-taken from upstream to fix FTBFS on xserver 1.15 and up
-http://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=9707a7a5eac25536a5150fc12d9ace52420b4d36
-http://cgit.freedesktop.org/xorg/driver/xf86-video-geode/commit/?id=70b131d09b7d21df1d1ffcf6a4e50d3086924228
-
-Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
-
-diff -uNr xf86-video-geode-2.11.15.org/src/geode_dcon.c xf86-video-geode-2.11.15/src/geode_dcon.c
---- xf86-video-geode-2.11.15.org/src/geode_dcon.c	2013-10-09 13:47:09.000000000 +0200
-+++ xf86-video-geode-2.11.15/src/geode_dcon.c	2014-03-29 12:33:46.718311451 +0100
-@@ -29,6 +29,7 @@
- 
- /* Includes that are used by all drivers */
- #include <xf86.h>
-+#include <xf86Modes.h>
- #include <xf86_OSproc.h>
- #include <compiler.h>
- 
diff --git a/package/x11r7/xdriver_xf86-video-geode/0001-xserver_1_17.patch b/package/x11r7/xdriver_xf86-video-geode/0001-xserver_1_17.patch
new file mode 100644
index 0000000..8c8ba52
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-geode/0001-xserver_1_17.patch
@@ -0,0 +1,261 @@
+Downloaded from upstream commit
+http://cgit.freedesktop.org/xorg/driver/xf86-video-geode/patch/?id=f98301ad73b84915358ce6f6d2522b36c4b603d9
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From f98301ad73b84915358ce6f6d2522b36c4b603d9 Mon Sep 17 00:00:00 2001
+From: Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
+Date: Thu, 12 Mar 2015 10:50:57 +0100
+Subject: Fix building Geode against xserver 1.17
+
+The xf86MapVidMem API is gone. Use pciaccess calls where applicable and mmap for XpressROMPtr.
+
+Signed-off-by: Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
+
+diff --git a/src/gx_driver.c b/src/gx_driver.c
+index 7f44e19..ab57df1 100644
+--- a/src/gx_driver.c
++++ b/src/gx_driver.c
+@@ -32,6 +32,9 @@
+ #endif
+ 
+ #include <stdio.h>
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/mman.h>
+ 
+ #include "xf86.h"
+ #include "xf86_OSproc.h"
+@@ -322,7 +325,6 @@ map_pci_mem(ScrnInfoPtr pScrni, int vram,
+             struct pci_device *dev, int bar, int size)
+ {
+     void *ptr;
+-    void **result = (void **) &ptr;
+     int map_size = size ? size : dev->regions[bar].size;
+ 
+     int err = pci_device_map_range(dev,
+@@ -330,12 +332,18 @@ map_pci_mem(ScrnInfoPtr pScrni, int vram,
+                                    map_size,
+                                    PCI_DEV_MAP_FLAG_WRITABLE |
+                                    (vram ? PCI_DEV_MAP_FLAG_WRITE_COMBINE : 0),
+-                                   result);
++                                   &ptr);
+ 
+     if (err)
+         return NULL;
+     return ptr;
+ }
++
++static inline int
++unmap_pci_mem(ScrnInfoPtr pScrni, struct pci_device *dev, void *ptr, int size)
++{
++    return pci_device_unmap_range(dev, ptr, size);
++}
+ #endif
+ 
+ extern unsigned long gfx_gx2_scratch_base;
+@@ -373,8 +381,19 @@ GXMapMem(ScrnInfoPtr pScrni)
+ 
+     gfx_gx2_scratch_base = pGeode->FBAvail - 0x4000;
+ 
++#ifndef XSERVER_LIBPCIACCESS
+     XpressROMPtr = xf86MapVidMem(index, VIDMEM_FRAMEBUFFER, 0xF0000, 0x10000);
+-
++#else
++    {
++        int fd = open("/dev/mem", O_RDWR);
++        if (fd < 0) {
++            xf86DrvMsg(index, X_ERROR, "Failed to open /dev/mem: %m\n");
++            return FALSE;
++        }
++        XpressROMPtr = mmap(NULL, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xF0000);
++        close(fd);
++    }
++#endif
+     pGeode->FBBase = gfx_virt_fbptr;
+ 
+     if ((!gfx_virt_regptr) || (!gfx_virt_gpptr) ||
+@@ -395,9 +414,9 @@ GXMapMem(ScrnInfoPtr pScrni)
+ */
+ 
+ static Bool
+-GXCheckVGA(ScrnInfoPtr pScrni)
++GXCheckVGA(ScrnInfoPtr pScrni, EntityInfoPtr pEnt)
+ {
+-
++#ifndef XSERVER_LIBPCIACCESS
+     unsigned char *ptr;
+     const char *vgasig = "IBM VGA Compatible";
+     int ret;
+@@ -413,6 +432,11 @@ GXCheckVGA(ScrnInfoPtr pScrni)
+     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) ptr, strlen(vgasig));
+ 
+     return ret ? FALSE : TRUE;
++#else
++    pciVideoPtr pci = xf86GetPciInfoForEntity(pEnt->index);
++
++    return pci_device_is_boot_vga(pci);
++#endif
+ }
+ 
+ static Bool
+@@ -443,7 +467,7 @@ GXPreInit(ScrnInfoPtr pScrni, int flags)
+     if (pGeode == NULL)
+         return FALSE;
+ 
+-    useVGA = GXCheckVGA(pScrni);
++    useVGA = GXCheckVGA(pScrni, pEnt);
+ 
+     if (flags & PROBE_DETECT) {
+         GeodeProbeDDC(pScrni, pEnt->index);
+@@ -591,12 +615,18 @@ GXPreInit(ScrnInfoPtr pScrni, int flags)
+     panelgeo = xf86GetOptValString(GeodeOptions, GX_OPTION_PANEL_GEOMETRY);
+ 
+     if ((s = xf86GetOptValString(GeodeOptions, GX_OPTION_ACCEL_METHOD))) {
++#if defined(XF86XAA) && defined(XF86EXA)
+         if (!xf86NameCmp(s, "XAA"))
+             pGeode->useEXA = FALSE;
+         else if (xf86NameCmp(s, "EXA"))
+             xf86DrvMsg(pScrni->scrnIndex, X_ERROR,
+                        "Unknown accleration method %s.  Defaulting to XAA.\n",
+                        s);
++#elif defined(XF86EXA)
++        pGeode->useEXA = TRUE;
++#else
++        pGeode->useEXA = FALSE;
++#endif
+     }
+ 
+     xf86DrvMsg(pScrni->scrnIndex, X_INFO,
+@@ -752,11 +782,21 @@ GXUnmapMem(ScrnInfoPtr pScrni)
+     GeodeRec *pGeode = GEODEPTR(pScrni);
+ 
+     /* unmap all the memory map's */
+-
++#ifndef XSERVER_LIBPCIACCESS
+     xf86UnMapVidMem(pScrni->scrnIndex, gfx_virt_regptr, GX_CPU_REG_SIZE);
+     xf86UnMapVidMem(pScrni->scrnIndex, gfx_virt_gpptr, GX_GP_REG_SIZE);
+     xf86UnMapVidMem(pScrni->scrnIndex, gfx_virt_vidptr, GX_VID_REG_SIZE);
+     xf86UnMapVidMem(pScrni->scrnIndex, gfx_virt_fbptr, pGeode->FBAvail);
++#else
++    pciVideoPtr pci = xf86GetPciInfoForEntity(pGeode->pEnt->index);
++
++    unmap_pci_mem(pScrni, pci, gfx_virt_regptr, GX_CPU_REG_SIZE);
++    unmap_pci_mem(pScrni, pci, gfx_virt_gpptr, GX_GP_REG_SIZE);
++    unmap_pci_mem(pScrni, pci, gfx_virt_vidptr, GX_VID_REG_SIZE);
++    unmap_pci_mem(pScrni, pci, gfx_virt_fbptr, pGeode->FBAvail);
++
++    munmap(XpressROMPtr, 0x10000);
++#endif
+     return TRUE;
+ }
+ 
+diff --git a/src/lx_driver.c b/src/lx_driver.c
+index 146578e..c68f715 100644
+--- a/src/lx_driver.c
++++ b/src/lx_driver.c
+@@ -33,6 +33,9 @@
+ 
+ #include <stdio.h>
+ #include <string.h>
++#include <fcntl.h>
++#include <unistd.h>
++#include <sys/mman.h>
+ 
+ #include "xf86.h"
+ #include "xf86_OSproc.h"
+@@ -155,7 +158,6 @@ map_pci_mem(ScrnInfoPtr pScrni, int vram,
+             struct pci_device *dev, int bar, int size)
+ {
+     void *ptr;
+-    void **result = (void **) &ptr;
+     int map_size = size ? size : dev->regions[bar].size;
+ 
+     int err = pci_device_map_range(dev,
+@@ -163,7 +165,7 @@ map_pci_mem(ScrnInfoPtr pScrni, int vram,
+                                    map_size,
+                                    PCI_DEV_MAP_FLAG_WRITABLE |
+                                    (vram ? PCI_DEV_MAP_FLAG_WRITE_COMBINE : 0),
+-                                   result);
++                                   &ptr);
+ 
+     if (err)
+         return NULL;
+@@ -235,7 +237,19 @@ LXMapMem(ScrnInfoPtr pScrni)
+                              pGeode->FBAvail);
+     gp_set_command_buffer_base(cmd_bfr_phys, 0, pGeode->CmdBfrSize);
+ 
++#ifndef XSERVER_LIBPCIACCESS
+     XpressROMPtr = xf86MapVidMem(index, VIDMEM_FRAMEBUFFER, 0xF0000, 0x10000);
++#else
++    {
++        int fd = open("/dev/mem", O_RDWR);
++        if (fd < 0) {
++            xf86DrvMsg(index, X_ERROR, "Failed to open /dev/mem: %m\n");
++            return FALSE;
++        }
++        XpressROMPtr = mmap(NULL, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xF0000);
++        close(fd);
++    }
++#endif
+ 
+     pGeode->FBBase = cim_fb_ptr;
+ 
+@@ -253,9 +267,9 @@ LXMapMem(ScrnInfoPtr pScrni)
+ */
+ 
+ static Bool
+-LXCheckVGA(ScrnInfoPtr pScrni)
++LXCheckVGA(ScrnInfoPtr pScrni, EntityInfoPtr pEnt)
+ {
+-
++#ifndef XSERVER_LIBPCIACCESS
+     unsigned char *ptr;
+     const char *vgasig = "IBM VGA Compatible";
+     int ret;
+@@ -271,6 +285,11 @@ LXCheckVGA(ScrnInfoPtr pScrni)
+     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) ptr, strlen(vgasig));
+ 
+     return ret ? FALSE : TRUE;
++#else
++    pciVideoPtr pci = xf86GetPciInfoForEntity(pEnt->index);
++
++    return pci_device_is_boot_vga(pci);
++#endif
+ }
+ 
+ static Bool
+@@ -310,7 +329,7 @@ LXPreInit(ScrnInfoPtr pScrni, int flags)
+     if (pGeode == NULL)
+         return FALSE;
+ 
+-    pGeode->useVGA = LXCheckVGA(pScrni);
++    pGeode->useVGA = LXCheckVGA(pScrni, pEnt);
+     pGeode->VGAActive = FALSE;
+     pGeode->pEnt = pEnt;
+ 
+@@ -611,6 +630,8 @@ LXUnmapMem(ScrnInfoPtr pScrni)
+     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) cim_vg_ptr, LX_VG_REG_SIZE);
+     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) cim_vid_ptr, LX_VID_REG_SIZE);
+     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) cim_vip_ptr, LX_VIP_REG_SIZE);
++
++    xf86UnMapVidMem(pScrni->scrnIndex, XpressROMPtr, 0x10000);
+ #else
+     GeodeRec *pGeode = GEODEPTR(pScrni);
+     pciVideoPtr pci = xf86GetPciInfoForEntity(pGeode->pEnt->index);
+@@ -620,9 +641,9 @@ LXUnmapMem(ScrnInfoPtr pScrni)
+     unmap_pci_mem(pScrni, pci, cim_vid_ptr, LX_VID_REG_SIZE);
+     unmap_pci_mem(pScrni, pci, cim_vip_ptr, LX_VIP_REG_SIZE);
+     unmap_pci_mem(pScrni, pci, cim_fb_ptr, pGeode->FBAvail + CIM_CMD_BFR_SZ);
+-#endif
+ 
+-    xf86UnMapVidMem(pScrni->scrnIndex, XpressROMPtr, 0x10000);
++    munmap(XpressROMPtr, 0x10000);
++#endif
+ 
+     return TRUE;
+ }
+-- 
+cgit v0.10.2
+
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index b70e344..0b45fb1 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -6,6 +6,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	depends on BR2_i386
-	depends on BROKEN # Fails to build with xorg xserver >= 1.17
 	help
 	  video driver for geode device
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
new file mode 100644
index 0000000..0c77a26
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2014-July/002459.html
+sha256	38fc1f55e29fb7985b90c9021a4b7e5295d42888bd669174f42f3b7f681fc1a7	xf86-video-geode-2.11.16.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index c2bff37..52e7358 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.15
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.16
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
-- 
1.7.10.4
