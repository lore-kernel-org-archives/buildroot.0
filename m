From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:29 +0100
Subject: [Buildroot] [RFC v2 08/12] package/mesa3d: add vulkan broadcom
 driver support
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-9-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - no changes

Notes:
  - compiles, but is not only functional in case
    v3d simulator or X11/XCB is enabled (see
    e.g. physical_device_init() in file
    src/broadcom/vulkan/v3dv_device.c)
---
 package/mesa3d/Config.in | 10 ++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 11 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8a01fa95e2..5da9bfe08a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -397,6 +397,16 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 
 comment "Vulkan drivers"
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
+	bool "Vulkan broadcom driver"
+	depends on BR2_arm || BR2_aarch64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # dri3/libxshmfence
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_MESA3D_OPENGL_GLX
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan broadcom driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 31f1c12d63..62dc7db91d 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -119,6 +119,7 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
 # Vulkan Drivers
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
-- 
2.29.2
