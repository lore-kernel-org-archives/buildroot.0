From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jan 2021 12:04:50 +0100
Subject: [Buildroot] [RFC: 4/4] package/x11r7/xdriver_xf86-video-imx-viv:
 select dri swrast driver
In-Reply-To: <20210107110450.4031102-1-romain.naour@gmail.com>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
Message-ID: <20210107110450.4031102-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Curently, this package fail to build because
BR2_PACKAGE_MESA3D_DRI_DRIVER can't be used directly.
since it doesn't select any DRI driver in mesa, this option must
only be used by BR2_PACKAGE_MESA3D_DRI_DRIVER_*.

When this package was added [1] the commit log said:
"Yocto use Mesa3D/swraster to provide Desktop OpenGL API[1]."

It seems swrast dri driver was expected, so
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST should be selected.

About BR2_PACKAGE_MESA3D_OPENGL_GLX, this option should not
be selected when BR2_PACKAGE_IMX_GPU_VIV is set because
both are libGL provider. But xf86-video-imx-viv seems to
requires both... meta-freescale contain a hack to avoid
overriding the Vivante GPU libGL binary and headers [3].

[1] https://git.buildroot.net/buildroot/commit/?id=8fdf8ccd3bbb199f7ddda1d55996f8923dc19c61
[2] See recipes-graphics/xorg-driver/xf86-video-imxfb-vivante_3.10.17-1.0.1.bb
[3] https://github.com/Freescale/meta-freescale/blob/dunfell/recipes-graphics/mesa/mesa_%25.bbappend#L37

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: J?r?me Pouiller <jezz@sysmic.org>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/x11r7/xdriver_xf86-video-imx-viv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
index 13cee14deb..1dda5e39ea 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMX_VIV
 	depends on BR2_PACKAGE_IMX_GPU_G2D
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
 	select BR2_PACKAGE_MESA3D # Needed in order to compile xorg with glx/dri
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_XORGPROTO
 	help
-- 
2.25.4
