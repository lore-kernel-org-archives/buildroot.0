From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 27 Oct 2020 18:12:45 +0100
Subject: [Buildroot] [PATCH] package/freescale-imx/imx-gpu-viv: remove fb
 headers fixup
Message-ID: <20201027171245.1823252-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it doesn't seem to be needed any longer. Also it was agreed to fix
packages not using pkgconfig properly instead of doing this sed.

Tested on i.MX6 platform with Qt5, no more issues.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index b6b070e4f6..fca8a4d447 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -58,15 +58,6 @@ define IMX_GPU_VIV_BUILD_CMDS
 	ln -sf libVDK-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVDK.so
 endef
 
-ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
-define IMX_GPU_VIV_FIXUP_FB_HEADERS
-	$(SED) '39i\
-		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
-		#define EGL_API_FB \n\
-		#endif' $(STAGING_DIR)/usr/include/EGL/eglplatform.h
-endef
-endif
-
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
 define IMX_GPU_VIV_FIXUP_PKGCONFIG
 	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
@@ -89,7 +80,6 @@ endif
 
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
-	$(IMX_GPU_VIV_FIXUP_FB_HEADERS)
 	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
 	for lib in egl gbm glesv1_cm glesv2 vg; do \
 		$(INSTALL) -m 0644 -D \
-- 
2.28.0
