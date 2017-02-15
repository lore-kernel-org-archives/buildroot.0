From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 Feb 2017 22:13:52 -0200
Subject: [Buildroot] [PATCH v3 2/2] mesa3d: Add support for the Etnaviv
	gallium driver
In-Reply-To: <1487117632-32365-1-git-send-email-festevam@gmail.com>
References: <1487117632-32365-1-git-send-email-festevam@gmail.com>
Message-ID: <1487117632-32365-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the Etnaviv gallium driver.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
---
Changes since v2:
- Improve the Kconfig text menu
- Pass '+= etnaviv imx' on a single line
- Remove the unneeded BR2_PACKAGE_MESA3D_NEEDS_XA option

 package/mesa3d/Config.in | 9 +++++++++
 package/mesa3d/mesa3d.mk | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bbab953..2b085ab 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -45,6 +45,15 @@ config BR2_PACKAGE_MESA3D_NEEDS_XA
 
 comment "Gallium drivers"
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
+	bool "Gallium Etnaviv driver"
+	depends on BR2_arm
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_ETNAVIV
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
+	help
+	  Mesa driver for Vivante GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3bfb005..e174868 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -67,6 +67,7 @@ endif
 # Drivers
 
 #Gallium Drivers
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv imx
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
@@ -151,6 +152,8 @@ ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
 MESA3D_EGL_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
 MESA3D_EGL_PLATFORMS = drm
+else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
+MESA3D_EGL_PLATFORMS = drm
 else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
 MESA3D_EGL_PLATFORMS = drm
 endif
-- 
2.7.4
