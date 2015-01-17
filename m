From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jan 2015 18:03:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/mesa3d: Enable support for
	Radeon r600 gallium driver
In-Reply-To: <1421514235-27122-1-git-send-email-bernd.kuhls@t-online.de>
References: <1421514235-27122-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1421514235-27122-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--
v2: - rebased patch from micro1183: http://patchwork.ozlabs.org/patch/398858/
    - removed support for r300 & radeonsi because they need llvm support
      which is not provided by buildroot

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in |    9 +++++++++
 package/mesa3d/mesa3d.mk |    1 +
 2 files changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 6b3ccce..0d0501c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -47,6 +47,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	help
 	  Supports all Nvidia GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	bool "Gallium Radeon R600 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ef324b2..18255a7 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -56,6 +56,7 @@ endif
 
 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
 # DRI Drivers
-- 
1.7.10.4
