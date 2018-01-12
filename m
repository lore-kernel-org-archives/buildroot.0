From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:22:27 +0100
Subject: [Buildroot] [git commit] imx-gpu-viv: fix compiling issues with
 EGL_API_FB
Message-ID: <20180112212234.4C1347FA1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cd1908292cdf65453f1aa93b4941b6911cae211
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like the previous commit did:
c9ecdd2b96 gpu-viv-bin-mx6q: fix compiling issues with EGL_API_FB

Difference is that in latest package, eglvivante.h is included after
a EGL_API_FB check in eglplatform.h, giving the following error:
/.../sysroot/usr/include/EGL/eglplatform.h:146:10:
 fatal error: X11/Xlib.h: No such file or directory
 #include <X11/Xlib.h>

Also, this patch introduce IMX_GPU_VIV_FIXUP_PKGCONFIG which fixes
the pkgconfig files (for some reason default egl.pc file isn't the
same as the one for fb target).

Finally, this patch removes references to libVIVANTE which is now
replaced by libVDK.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 5d3d9c6..a9f8b9d 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -43,7 +43,6 @@ define IMX_GPU_VIV_BUILD_CMDS
 	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so
 	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2
 	ln -sf libGLESv2-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGLESv2.so.2.0.0
-	ln -sf libVIVANTE-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVIVANTE.so
 	ln -sf libGAL-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libGAL.so
 	ln -sf libVDK-$(IMX_GPU_VIV_LIB_TARGET).so $(@D)/gpu-core/usr/lib/libVDK.so
 endef
@@ -53,14 +52,29 @@ define IMX_GPU_VIV_FIXUP_FB_HEADERS
 	$(SED) '39i\
 		#if !defined(EGL_API_X11) && !defined(EGL_API_DFB) && !defined(EGL_API_FB) \n\
 		#define EGL_API_FB \n\
-		#endif' $(STAGING_DIR)/usr/include/EGL/eglvivante.h
+		#endif' $(STAGING_DIR)/usr/include/EGL/eglplatform.h
+endef
+endif
+
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),fb)
+define IMX_GPU_VIV_FIXUP_PKGCONFIG
+	ln -sf egl_linuxfb.pc $(@D)/gpu-core/usr/lib/pkgconfig/egl.pc
+endef
+endif
+
+ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
+define IMX_GPU_VIV_FIXUP_PKGCONFIG
+	for lib in egl gbm glesv1_cm glesv2 vg; do \
+		ln -sf $${lib}_x11.pc $(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc
+	done
 endef
 endif
 
 define IMX_GPU_VIV_INSTALL_STAGING_CMDS
 	cp -r $(@D)/gpu-core/usr/* $(STAGING_DIR)/usr
 	$(IMX_GPU_VIV_FIXUP_FB_HEADERS)
-	for lib in egl glesv2 vg; do \
+	$(IMX_GPU_VIV_FIXUP_PKGCONFIG)
+	for lib in egl gbm glesv1_cm glesv2 vg; do \
 		$(INSTALL) -m 0644 -D \
 			$(@D)/gpu-core/usr/lib/pkgconfig/$${lib}.pc \
 			$(STAGING_DIR)/usr/lib/pkgconfig/$${lib}.pc; \
@@ -87,7 +101,7 @@ define IMX_GPU_VIV_INSTALL_TARGET_CMDS
 	$(IMX_GPU_VIV_INSTALL_EXAMPLES)
 	$(IMX_GPU_VIV_INSTALL_GMEM_INFO)
 	cp -a $(@D)/gpu-core/usr/lib $(TARGET_DIR)/usr
-	for lib in EGL GAL VIVANTE GLESv2 VDK; do \
+	for lib in EGL GAL GLESv2 VDK; do \
 		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
 			case $$f in \
 				*-$(IMX_GPU_VIV_LIB_TARGET).so) : ;; \
