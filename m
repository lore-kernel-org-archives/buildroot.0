From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 09:40:55 +0200
Subject: [Buildroot] [PATCH/next 2/3]
	package/x11r7/xdriver_xf86-video-geode: bump version to 2.11.17
In-Reply-To: <1432194056-10250-1-git-send-email-bernd.kuhls@t-online.de>
References: <1432194056-10250-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1432194056-10250-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-xserver_1_17.patch                        |  261 --------------------
 .../xdriver_xf86-video-geode.hash                  |    4 +-
 .../xdriver_xf86-video-geode.mk                    |    2 +-
 3 files changed, 3 insertions(+), 264 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-geode/0001-xserver_1_17.patch

diff --git a/package/x11r7/xdriver_xf86-video-geode/0001-xserver_1_17.patch b/package/x11r7/xdriver_xf86-video-geode/0001-xserver_1_17.patch
deleted file mode 100644
index 8c8ba52..0000000
--- a/package/x11r7/xdriver_xf86-video-geode/0001-xserver_1_17.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-Downloaded from upstream commit
-http://cgit.freedesktop.org/xorg/driver/xf86-video-geode/patch/?id=f98301ad73b84915358ce6f6d2522b36c4b603d9
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From f98301ad73b84915358ce6f6d2522b36c4b603d9 Mon Sep 17 00:00:00 2001
-From: Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
-Date: Thu, 12 Mar 2015 10:50:57 +0100
-Subject: Fix building Geode against xserver 1.17
-
-The xf86MapVidMem API is gone. Use pciaccess calls where applicable and mmap for XpressROMPtr.
-
-Signed-off-by: Maarten Lankhorst <maarten.lankhorst@ubuntu.com>
-
-diff --git a/src/gx_driver.c b/src/gx_driver.c
-index 7f44e19..ab57df1 100644
---- a/src/gx_driver.c
-+++ b/src/gx_driver.c
-@@ -32,6 +32,9 @@
- #endif
- 
- #include <stdio.h>
-+#include <fcntl.h>
-+#include <unistd.h>
-+#include <sys/mman.h>
- 
- #include "xf86.h"
- #include "xf86_OSproc.h"
-@@ -322,7 +325,6 @@ map_pci_mem(ScrnInfoPtr pScrni, int vram,
-             struct pci_device *dev, int bar, int size)
- {
-     void *ptr;
--    void **result = (void **) &ptr;
-     int map_size = size ? size : dev->regions[bar].size;
- 
-     int err = pci_device_map_range(dev,
-@@ -330,12 +332,18 @@ map_pci_mem(ScrnInfoPtr pScrni, int vram,
-                                    map_size,
-                                    PCI_DEV_MAP_FLAG_WRITABLE |
-                                    (vram ? PCI_DEV_MAP_FLAG_WRITE_COMBINE : 0),
--                                   result);
-+                                   &ptr);
- 
-     if (err)
-         return NULL;
-     return ptr;
- }
-+
-+static inline int
-+unmap_pci_mem(ScrnInfoPtr pScrni, struct pci_device *dev, void *ptr, int size)
-+{
-+    return pci_device_unmap_range(dev, ptr, size);
-+}
- #endif
- 
- extern unsigned long gfx_gx2_scratch_base;
-@@ -373,8 +381,19 @@ GXMapMem(ScrnInfoPtr pScrni)
- 
-     gfx_gx2_scratch_base = pGeode->FBAvail - 0x4000;
- 
-+#ifndef XSERVER_LIBPCIACCESS
-     XpressROMPtr = xf86MapVidMem(index, VIDMEM_FRAMEBUFFER, 0xF0000, 0x10000);
--
-+#else
-+    {
-+        int fd = open("/dev/mem", O_RDWR);
-+        if (fd < 0) {
-+            xf86DrvMsg(index, X_ERROR, "Failed to open /dev/mem: %m\n");
-+            return FALSE;
-+        }
-+        XpressROMPtr = mmap(NULL, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xF0000);
-+        close(fd);
-+    }
-+#endif
-     pGeode->FBBase = gfx_virt_fbptr;
- 
-     if ((!gfx_virt_regptr) || (!gfx_virt_gpptr) ||
-@@ -395,9 +414,9 @@ GXMapMem(ScrnInfoPtr pScrni)
- */
- 
- static Bool
--GXCheckVGA(ScrnInfoPtr pScrni)
-+GXCheckVGA(ScrnInfoPtr pScrni, EntityInfoPtr pEnt)
- {
--
-+#ifndef XSERVER_LIBPCIACCESS
-     unsigned char *ptr;
-     const char *vgasig = "IBM VGA Compatible";
-     int ret;
-@@ -413,6 +432,11 @@ GXCheckVGA(ScrnInfoPtr pScrni)
-     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) ptr, strlen(vgasig));
- 
-     return ret ? FALSE : TRUE;
-+#else
-+    pciVideoPtr pci = xf86GetPciInfoForEntity(pEnt->index);
-+
-+    return pci_device_is_boot_vga(pci);
-+#endif
- }
- 
- static Bool
-@@ -443,7 +467,7 @@ GXPreInit(ScrnInfoPtr pScrni, int flags)
-     if (pGeode == NULL)
-         return FALSE;
- 
--    useVGA = GXCheckVGA(pScrni);
-+    useVGA = GXCheckVGA(pScrni, pEnt);
- 
-     if (flags & PROBE_DETECT) {
-         GeodeProbeDDC(pScrni, pEnt->index);
-@@ -591,12 +615,18 @@ GXPreInit(ScrnInfoPtr pScrni, int flags)
-     panelgeo = xf86GetOptValString(GeodeOptions, GX_OPTION_PANEL_GEOMETRY);
- 
-     if ((s = xf86GetOptValString(GeodeOptions, GX_OPTION_ACCEL_METHOD))) {
-+#if defined(XF86XAA) && defined(XF86EXA)
-         if (!xf86NameCmp(s, "XAA"))
-             pGeode->useEXA = FALSE;
-         else if (xf86NameCmp(s, "EXA"))
-             xf86DrvMsg(pScrni->scrnIndex, X_ERROR,
-                        "Unknown accleration method %s.  Defaulting to XAA.\n",
-                        s);
-+#elif defined(XF86EXA)
-+        pGeode->useEXA = TRUE;
-+#else
-+        pGeode->useEXA = FALSE;
-+#endif
-     }
- 
-     xf86DrvMsg(pScrni->scrnIndex, X_INFO,
-@@ -752,11 +782,21 @@ GXUnmapMem(ScrnInfoPtr pScrni)
-     GeodeRec *pGeode = GEODEPTR(pScrni);
- 
-     /* unmap all the memory map's */
--
-+#ifndef XSERVER_LIBPCIACCESS
-     xf86UnMapVidMem(pScrni->scrnIndex, gfx_virt_regptr, GX_CPU_REG_SIZE);
-     xf86UnMapVidMem(pScrni->scrnIndex, gfx_virt_gpptr, GX_GP_REG_SIZE);
-     xf86UnMapVidMem(pScrni->scrnIndex, gfx_virt_vidptr, GX_VID_REG_SIZE);
-     xf86UnMapVidMem(pScrni->scrnIndex, gfx_virt_fbptr, pGeode->FBAvail);
-+#else
-+    pciVideoPtr pci = xf86GetPciInfoForEntity(pGeode->pEnt->index);
-+
-+    unmap_pci_mem(pScrni, pci, gfx_virt_regptr, GX_CPU_REG_SIZE);
-+    unmap_pci_mem(pScrni, pci, gfx_virt_gpptr, GX_GP_REG_SIZE);
-+    unmap_pci_mem(pScrni, pci, gfx_virt_vidptr, GX_VID_REG_SIZE);
-+    unmap_pci_mem(pScrni, pci, gfx_virt_fbptr, pGeode->FBAvail);
-+
-+    munmap(XpressROMPtr, 0x10000);
-+#endif
-     return TRUE;
- }
- 
-diff --git a/src/lx_driver.c b/src/lx_driver.c
-index 146578e..c68f715 100644
---- a/src/lx_driver.c
-+++ b/src/lx_driver.c
-@@ -33,6 +33,9 @@
- 
- #include <stdio.h>
- #include <string.h>
-+#include <fcntl.h>
-+#include <unistd.h>
-+#include <sys/mman.h>
- 
- #include "xf86.h"
- #include "xf86_OSproc.h"
-@@ -155,7 +158,6 @@ map_pci_mem(ScrnInfoPtr pScrni, int vram,
-             struct pci_device *dev, int bar, int size)
- {
-     void *ptr;
--    void **result = (void **) &ptr;
-     int map_size = size ? size : dev->regions[bar].size;
- 
-     int err = pci_device_map_range(dev,
-@@ -163,7 +165,7 @@ map_pci_mem(ScrnInfoPtr pScrni, int vram,
-                                    map_size,
-                                    PCI_DEV_MAP_FLAG_WRITABLE |
-                                    (vram ? PCI_DEV_MAP_FLAG_WRITE_COMBINE : 0),
--                                   result);
-+                                   &ptr);
- 
-     if (err)
-         return NULL;
-@@ -235,7 +237,19 @@ LXMapMem(ScrnInfoPtr pScrni)
-                              pGeode->FBAvail);
-     gp_set_command_buffer_base(cmd_bfr_phys, 0, pGeode->CmdBfrSize);
- 
-+#ifndef XSERVER_LIBPCIACCESS
-     XpressROMPtr = xf86MapVidMem(index, VIDMEM_FRAMEBUFFER, 0xF0000, 0x10000);
-+#else
-+    {
-+        int fd = open("/dev/mem", O_RDWR);
-+        if (fd < 0) {
-+            xf86DrvMsg(index, X_ERROR, "Failed to open /dev/mem: %m\n");
-+            return FALSE;
-+        }
-+        XpressROMPtr = mmap(NULL, 0x10000, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0xF0000);
-+        close(fd);
-+    }
-+#endif
- 
-     pGeode->FBBase = cim_fb_ptr;
- 
-@@ -253,9 +267,9 @@ LXMapMem(ScrnInfoPtr pScrni)
- */
- 
- static Bool
--LXCheckVGA(ScrnInfoPtr pScrni)
-+LXCheckVGA(ScrnInfoPtr pScrni, EntityInfoPtr pEnt)
- {
--
-+#ifndef XSERVER_LIBPCIACCESS
-     unsigned char *ptr;
-     const char *vgasig = "IBM VGA Compatible";
-     int ret;
-@@ -271,6 +285,11 @@ LXCheckVGA(ScrnInfoPtr pScrni)
-     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) ptr, strlen(vgasig));
- 
-     return ret ? FALSE : TRUE;
-+#else
-+    pciVideoPtr pci = xf86GetPciInfoForEntity(pEnt->index);
-+
-+    return pci_device_is_boot_vga(pci);
-+#endif
- }
- 
- static Bool
-@@ -310,7 +329,7 @@ LXPreInit(ScrnInfoPtr pScrni, int flags)
-     if (pGeode == NULL)
-         return FALSE;
- 
--    pGeode->useVGA = LXCheckVGA(pScrni);
-+    pGeode->useVGA = LXCheckVGA(pScrni, pEnt);
-     pGeode->VGAActive = FALSE;
-     pGeode->pEnt = pEnt;
- 
-@@ -611,6 +630,8 @@ LXUnmapMem(ScrnInfoPtr pScrni)
-     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) cim_vg_ptr, LX_VG_REG_SIZE);
-     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) cim_vid_ptr, LX_VID_REG_SIZE);
-     xf86UnMapVidMem(pScrni->scrnIndex, (pointer) cim_vip_ptr, LX_VIP_REG_SIZE);
-+
-+    xf86UnMapVidMem(pScrni->scrnIndex, XpressROMPtr, 0x10000);
- #else
-     GeodeRec *pGeode = GEODEPTR(pScrni);
-     pciVideoPtr pci = xf86GetPciInfoForEntity(pGeode->pEnt->index);
-@@ -620,9 +641,9 @@ LXUnmapMem(ScrnInfoPtr pScrni)
-     unmap_pci_mem(pScrni, pci, cim_vid_ptr, LX_VID_REG_SIZE);
-     unmap_pci_mem(pScrni, pci, cim_vip_ptr, LX_VIP_REG_SIZE);
-     unmap_pci_mem(pScrni, pci, cim_fb_ptr, pGeode->FBAvail + CIM_CMD_BFR_SZ);
--#endif
- 
--    xf86UnMapVidMem(pScrni->scrnIndex, XpressROMPtr, 0x10000);
-+    munmap(XpressROMPtr, 0x10000);
-+#endif
- 
-     return TRUE;
- }
--- 
-cgit v0.10.2
-
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
index 0c77a26..991cf6b 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
@@ -1,2 +1,2 @@
-# From http://lists.x.org/archives/xorg-announce/2014-July/002459.html
-sha256	38fc1f55e29fb7985b90c9021a4b7e5295d42888bd669174f42f3b7f681fc1a7	xf86-video-geode-2.11.16.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-May/002607.html
+sha256	07b4d42623e71e592b77c52a75cf230f8e711c8a0c1b26cecb06e9231d333c41	xf86-video-geode-2.11.17.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
index 52e7358..ae5bc0b 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.16
+XDRIVER_XF86_VIDEO_GEODE_VERSION = 2.11.17
 XDRIVER_XF86_VIDEO_GEODE_SOURCE = xf86-video-geode-$(XDRIVER_XF86_VIDEO_GEODE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GEODE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GEODE_LICENSE = MIT
-- 
1.7.10.4
