From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  8 Feb 2020 00:42:50 -0700
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add support for gallium
 i915 driver
Message-ID: <20200208074250.38952-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/Config.in | 12 ++++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 13 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 94e3f2cb9e..3da5fd3737 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -113,6 +113,18 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	help
 	  Mesa driver for Freedreno GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
+	bool "Gallium i915 driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_INTEL
+	help
+	  Support for i915-based Intel GPUs.
+
+comment "Gallium i915: Only one i915 provider can be built"
+	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1a18cf3c58..7fb07ae05c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -74,6 +74,7 @@ endif
 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedreno
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
-- 
2.20.1
