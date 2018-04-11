From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed, 11 Apr 2018 14:57:01 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: add dependency on elfutils for
 R600 with LLVM
Message-ID: <20180411125701.8259-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gallium R600 needs libelf when mesa is built with llvm support.
Because of this, toolchain must use either uClibc or glibc, as
musl is not currently compatible with elfutils.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/mesa3d/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1476b39acc..bd3d050e29 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -97,13 +97,23 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 	bool "Gallium Radeon R600 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_MESA3D_LLVM || \
+		(BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
+			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
 
+# R600 needs libelf when Mesa3D is built with LLVM support
+# musl is not currently compatible with elfutils
+comment "R600 driver needs a uClibc or glibc toolchain when llvm is enabled"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
-- 
2.14.3
