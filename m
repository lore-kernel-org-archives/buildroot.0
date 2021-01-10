From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:22 +0100
Subject: [Buildroot] [RFC v2 01/12] package/mesa3d: add config option for
 DRI3 support
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add config option for DRI3 support and use it instead
of DRI3 enable/disable logic in *.mk file.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch
---
 package/mesa3d/Config.in |  8 ++++++++
 package/mesa3d/mesa3d.mk | 12 +++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 45eb62b701..347b1a2726 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -15,6 +15,11 @@ menuconfig BR2_PACKAGE_MESA3D
 
 if BR2_PACKAGE_MESA3D
 
+config BR2_PACKAGE_MESA3D_DRI3
+	bool "Enable DRI3 support"
+	help
+	  Enable DRI3 support.
+
 # Some Gallium driver needs libelf when built with LLVM support
 config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 	bool
@@ -64,6 +69,8 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
 		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
 		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
 		!BR2_PACKAGE_MESA3D_OSMESA_CLASSIC
+	select BR2_PACKAGE_MESA3D_DRI3 if \
+		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
 		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
 
@@ -396,6 +403,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_XORG7 # xorgproto
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_MESA3D_DRI3
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5eca1f0906..ea6265d723 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -36,6 +36,12 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
 MESA3D_CONF_OPTS += -Db_asneeded=false
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
+MESA3D_CONF_OPTS += -Ddri3=enabled
+else
+MESA3D_CONF_OPTS += -Ddri3=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
 MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
@@ -125,13 +131,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
-	-Ddri-drivers= -Ddri3=disabled
+	-Ddri-drivers=
 else
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence
-MESA3D_CONF_OPTS += -Ddri3=enabled
-else
-MESA3D_CONF_OPTS += -Ddri3=disabled
 endif
 MESA3D_CONF_OPTS += \
 	-Dshared-glapi=enabled \
@@ -145,7 +148,6 @@ MESA3D_CONF_OPTS += \
 else
 MESA3D_DEPENDENCIES += xlib_libxshmfence
 MESA3D_CONF_OPTS += \
-	-Ddri3=enabled \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
 
-- 
2.29.2
