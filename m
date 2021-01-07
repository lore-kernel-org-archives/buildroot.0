From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jan 2021 12:04:48 +0100
Subject: [Buildroot] [RFC: 2/4] package/freescale-imx/imx-gpu-viv: avoid
 removing openGL headers when mesa3d is also selected
In-Reply-To: <20210107110450.4031102-1-romain.naour@gmail.com>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
Message-ID: <20210107110450.4031102-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If selected, mesa3d package will remove openGL headers from staging
directory when GLX support (libGL provider) is not selected.
Add mesa3d in imx-gpu-viv dependencies to avoid removing openGL
headers provivded by this package.

xdriver_xf86-video-imx-viv package depends on imx-gpu-viv but
also select mesa3d package for DRI swrast driver.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index f03415b336..96195f0723 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -33,6 +33,14 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
 IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
 endif
 
+# If selected, mesa3d package will remove openGL headers from staging
+# directory when GLX support (libGL provider) is not selected.
+# Add mesa3d in imx-gpu-viv dependencies to avoid to remove openGL
+# headers provivded by this package.
+ifeq ($(BR2_PACKAGE_MESA3D):$(BR2_PACKAGE_MESA3D_OPENGL_GLX),y:)
+IMX_GPU_VIV_DEPENDENCIES += mesa3d
+endif
+
 define IMX_GPU_VIV_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_GPU_VIV_DL_DIR)/$(IMX_GPU_VIV_SOURCE))
 endef
-- 
2.25.4
