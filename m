From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 23 Dec 2020 23:45:52 +0100
Subject: [Buildroot] [RFC v1 5/6] package/mesa3d: add vulkan swrast driver
 support
In-Reply-To: <20201223224553.8570-1-ps.report@gmx.net>
References: <20201223224553.8570-1-ps.report@gmx.net>
Message-ID: <20201223224553.8570-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - link failure when selected stand alone, fine in case
    vulkan-broadcom is selected too
---
 package/mesa3d/Config.in | 13 +++++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 14 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 73e7199e8c..0bd904c270 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -416,6 +416,19 @@ comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >=
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
+	bool "Vulkan swrast driver"
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan swrast driver.
+
+comment "Vulkan swrast: Only one swrast provider can be built"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
+
 comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d9ea752d3e..f8eeb797a1 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -112,6 +112,7 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST) += swrast
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
 MESA3D_CONF_OPTS += \
-- 
2.29.2
