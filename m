From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Sep 2019 14:37:01 +0200
Subject: [Buildroot] [PATCH v11 07/13] package/mesa3d: Gallium vdpau state
 tracker is only available for r300, r600, radeonsi and nouveau drivers
In-Reply-To: <20190901123707.19342-1-bernd.kuhls@t-online.de>
References: <20190901123707.19342-1-bernd.kuhls@t-online.de>
Message-ID: <20190901123707.19342-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 9 +++++++++
 package/mesa3d/mesa3d.mk | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8f44a4b5d4..08a8f1ed20 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -86,6 +86,12 @@ config BR2_PACKAGE_MESA3D_DRIVER
 config BR2_PACKAGE_MESA3D_NEEDS_XA
 	bool
 
+# Gallium vdpau state tracker.
+# Quote from mesa3d meson.build: "VDPAU state tracker requires at least
+# one of the following gallium drivers: r300, r600, radeonsi, nouveau."
+config BR2_PACKAGE_MESA3D_GALLIUM_VDPAU
+	bool
+
 # Quote from mesa3d meson.build: "kmsro driver requires one or more
 # renderonly drivers (vc4, etnaviv, freedreno)". But only vc4 support
 # is available by using the (deprecated) autotools build system.
@@ -116,6 +122,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VDPAU
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
@@ -128,6 +135,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 		(BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
 			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VDPAU
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
@@ -148,6 +156,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_VDPAU
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index caa38771e6..7576a5954f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -233,7 +233,7 @@ else
 MESA3D_CONF_OPTS += --disable-libunwind
 endif
 
-ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
+ifeq ($(BR2_PACKAGE_LIBVDPAU)$(BR2_PACKAGE_MESA3D_GALLIUM_VDPAU),yy)
 MESA3D_DEPENDENCIES += libvdpau
 MESA3D_CONF_OPTS += --enable-vdpau
 else
-- 
2.20.1
