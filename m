From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 23 Dec 2020 23:45:51 +0100
Subject: [Buildroot] [RFC v1 4/6] package/mesa3d: add vulkan broadcom driver
 support
In-Reply-To: <20201223224553.8570-1-ps.report@gmx.net>
References: <20201223224553.8570-1-ps.report@gmx.net>
Message-ID: <20201223224553.8570-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - compiles, but is not only functional in case
    v3d simulator or X11/XCB is enabled (see
    e.g. physical_device_init() in file
    src/broadcom/vulkan/v3dv_device.c)
---
 package/mesa3d/Config.in | 8 ++++++++
 package/mesa3d/mesa3d.mk | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 45eb62b701..73e7199e8c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -388,6 +388,14 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 
 comment "Vulkan drivers"
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
+	bool "Vulkan broadcom driver"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	help
+	  Vulkan broadcom driver.
+
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d754cb8796..d9ea752d3e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -110,6 +110,7 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
 # Vulkan Drivers
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM) += broadcom
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
@@ -143,9 +144,11 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=
 else
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence
+MESA3D_CONF_OPTS += -Ddri3=enabled
+endif
 MESA3D_CONF_OPTS += \
-	-Ddri3=enabled \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
 
-- 
2.29.2
