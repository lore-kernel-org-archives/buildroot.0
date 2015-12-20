From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Dec 2015 18:00:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: virgl driver needs egl & drm
Message-ID: <1450630809-17381-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/7b3/7b38131ebb6b20daec1a6d2c49b25c5300f319fe/
http://autobuild.buildroot.net/results/61b/61b8b87f0460751257f480ef478e753635cab798/
http://autobuild.buildroot.net/results/971/97154ea0e780623d23b20b6b9fcc5df6190875c9/
http://autobuild.buildroot.net/results/dcf/dcf4e31e6b6eeadc7a2d7c87697f57d699673b9e/
http://autobuild.buildroot.net/results/399/399cca80ada5798decc87bff69a3acc432e8f3d0/
http://autobuild.buildroot.net/results/60f/60f63958b2310e00937c498ddf2a0295ff77683a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 1 +
 package/mesa3d/mesa3d.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 40af2ef..dd6a8c6 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -79,6 +79,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
 	bool "Gallium virgl driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  virgl is the 3D acceleration backend for the virtio-gpu
 	  shipping with qemu.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 195ccff..be11724 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -131,6 +131,10 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 MESA3D_EGL_PLATFORMS = drm
+else
+ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
+MESA3D_EGL_PLATFORMS = drm
+endif
 endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland
-- 
2.6.4
