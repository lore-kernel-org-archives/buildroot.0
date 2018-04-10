From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Tue, 10 Apr 2018 17:19:59 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: add dependency on elfutils to
 r600 with llvm
Message-ID: <20180410151959.18713-1-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gallium R600 needs libelf when mesa is built with llvm support.

As elfutils must be selected only if BR2_PACKAGE_MESA3D_LLVM is set,
create a new option BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600_LLVM.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/mesa3d/Config.in | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1476b39acc..391a1cbaed 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -97,13 +97,28 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 	bool "Gallium Radeon R600 driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
-	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600_LLVM
+	bool "Gallium Radeon R600 driver with LLVM support"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
+		BR2_TOOLCHAIN_USES_GLIBC # elfutils
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_LLVM_AMDGPU
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs
+	  with LLVM support.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
-- 
2.14.3
