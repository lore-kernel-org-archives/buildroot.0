From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:33:21 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add Radeon SI support
Message-ID: <20180428133338.61C4188FCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80f34339bd431e4fe252b89e8298651d60ee8eef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Micha?? Kalbarczyk <fazibear@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 20 ++++++++++++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 21 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bd3d050e29..1984e4f11c 100644
--- a/package/mesa3d/Config.in
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
+	select BR2_PACKAGE_LIBDRM_AMDGPU
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
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e93490c042..9857b597cf 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -80,6 +80,7 @@ endif
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv imx
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
