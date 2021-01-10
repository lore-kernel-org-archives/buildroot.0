From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:25 +0100
Subject: [Buildroot] [RFC v2 04/12] package/mesa3d: DRI3 with GLX needs
 xshmfence
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes for the following defconfig:

  BR2_arm=y
  BR2_cortex_a72=y
  BR2_ARM_FPU_NEON_VFPV4=y
  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_PACKAGE_MESA3D=y
  BR2_PACKAGE_MESA3D_DRI3=y
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
  BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
  BR2_PACKAGE_MESA3D_OPENGL_GLX=y

this configure error:

  .../build/mesa3d-20.3.2/meson.build:1772:6: ERROR: Dependency "xshmfence" not found, tried pkgconfig and cmake

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch
---
 package/mesa3d/Config.in | 5 +++--
 package/mesa3d/mesa3d.mk | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 7a976f4b2c..8a01fa95e2 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -17,6 +17,8 @@ if BR2_PACKAGE_MESA3D
 
 config BR2_PACKAGE_MESA3D_DRI3
 	bool "Enable DRI3 support"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_MESA3D_OPENGL_GLX
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_MESA3D_OPENGL_GLX
 	help
 	  Enable DRI3 support.
 
@@ -398,7 +400,7 @@ comment "Vulkan drivers"
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
-	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 because of libxshmfence only
+	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 because of dri3/libxshmfence only
 	# in case GLX is enabled but the following results in 'recursive
 	# dependency detected!', so simple depend always on BR2_TOOLCHAIN_HAS_SYNC_4
 	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_MESA3D_OPENGL_GLX # libxshmfence in case GLX is enabled
@@ -408,7 +410,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_MESA3D_OPENGL_GLX
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_MESA3D_OPENGL_GLX
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 967b86810f..31f1c12d63 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -38,6 +38,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
 MESA3D_CONF_OPTS += -Ddri3=enabled
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
+MESA3D_DEPENDENCIES += xlib_libxshmfence
+endif
 else
 MESA3D_CONF_OPTS += -Ddri3=disabled
 endif
@@ -146,9 +149,6 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=
 else
-ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)$(BR2_PACKAGE_MESA3D_OPENGL_GLX),yy)
-MESA3D_DEPENDENCIES += xlib_libxshmfence
-endif
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
-- 
2.29.2
