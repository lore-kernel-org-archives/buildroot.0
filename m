From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2020 14:32:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xdriver_xf86-video-amdgpu:
 needs opengl
Message-ID: <20200410123207.3145145-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package needs dri.h
https://cgit.freedesktop.org/xorg/driver/xf86-video-amdgpu/tree/src/amdgpu_probe.c#n53
https://cgit.freedesktop.org/xorg/driver/xf86-video-amdgpu/tree/src/drmmode_display.c#n50

which is only provided by xserver_xorg-server when opengl is enabled:
https://git.buildroot.net/buildroot/tree/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk#n123

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
The build error was not recorded by the autobuilders because they fail
already during at configure stage due to wrong dependencies for glamor
support fixed in the second patch of this series.

 package/x11r7/xdriver_xf86-video-amdgpu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
index c42255f55c..fb18c0d812 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	bool "xf86-video-amdgpu"
 	depends on BR2_USE_MMU # libdrm
 	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on BR2_PACKAGE_MESA3D_OPENGL_GLX # dri.h
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_AMDGPU
@@ -14,4 +15,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 comment "xf86-video-amdgpu needs egl/opengl support from mesa3d"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		!BR2_PACKAGE_MESA3D_OPENGL_GLX || \
 		!BR2_PACKAGE_MESA3D_DRI_DRIVER
-- 
2.25.0
