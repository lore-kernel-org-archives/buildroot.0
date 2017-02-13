From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Feb 2017 13:29:22 -0200
Subject: [Buildroot] [PATCH v2 2/2] mesa3d: Add support for Etnaviv gallium
	driver
In-Reply-To: <1486999762-4118-1-git-send-email-festevam@gmail.com>
References: <1486999762-4118-1-git-send-email-festevam@gmail.com>
Message-ID: <1486999762-4118-2-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for Etnaviv gallium driver.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Also select BR2_PACKAGE_MESA3D_OPENGL_EGL

 package/mesa3d/Config.in | 10 ++++++++++
 package/mesa3d/mesa3d.mk |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bbab953..aba17fb 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -45,6 +45,16 @@ config BR2_PACKAGE_MESA3D_NEEDS_XA
 
 comment "Gallium drivers"
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
+	bool "Etnaviv driver"
+	depends on BR2_arm
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_ETNAVIV
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Mesa driver for Vivante GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3bfb005..eca1f53 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -67,6 +67,8 @@ endif
 # Drivers
 
 #Gallium Drivers
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += imx
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
@@ -151,6 +153,8 @@ ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
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
