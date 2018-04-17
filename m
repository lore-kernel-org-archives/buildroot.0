From: =?utf-8?Q?Micha=C5=82_Kalbarczyk?= <michal@gamecodehq.com>
Date: Tue, 17 Apr 2018 22:55:32 +0200
Subject: [Buildroot] [PATCH] add Radeon SI driver to mesa3d package
Message-ID: <9C4B57AF-E8C0-4BC6-80C7-C72006371825@gamecodehq.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, after lates changes in mesa3d package, there is easy way to add radeonsi driver. 

This is a diff:

diff --git a/var/folders/f0/4ht96w1s5rd7gqvlml56p71c0000gn/T//WhRTic_Config.in b/package/mesa3d/Config.in
index bd3d050e29..3670ee455c 100644
--- a/var/folders/f0/4ht96w1s5rd7gqvlml56p71c0000gn/T//WhRTic_Config.in
+++ b/package/mesa3d/Config.in
@@ -114,6 +114,26 @@ comment "R600 driver needs a uClibc or glibc toolchain when llvm is enabled"
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)

+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	bool "Gallium Radeon SI driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_MESA3D_LLVM || \
+		(BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
+			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
+
+# Radeon SI needs libelf when Mesa3D is built with LLVM support
+# musl is not currently compatible with elfutils
+comment "Radeon SI driver needs a uClibc or glibc toolchain when llvm is enabled"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/var/folders/f0/4ht96w1s5rd7gqvlml56p71c0000gn/T//OPIX1a_mesa3d.mk b/package/mesa3d/mesa3d.mk
index 506f84274f..e89b895c18 100644
--- a/var/folders/f0/4ht96w1s5rd7gqvlml56p71c0000gn/T//OPIX1a_mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -80,6 +80,7 @@ endif
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv imx
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
