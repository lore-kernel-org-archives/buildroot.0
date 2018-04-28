From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 28 Apr 2018 19:28:02 +0200
Subject: [Buildroot] [PATCH 3/4] package/mesa3d: RadeonSI needs llvm support
In-Reply-To: <20180428172803.11179-1-romain.naour@gmail.com>
References: <20180428172803.11179-1-romain.naour@gmail.com>
Message-ID: <20180428172803.11179-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
checking for AMDGPU... yes
configure: error: --enable-llvm is required when building radeonsi

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Micha? Kalbarczyk <michal@gamecodehq.com>
---
 package/mesa3d/Config.in | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 32337a36a4..d620c0ab52 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -117,21 +117,20 @@ comment "R600 driver needs a uClibc or glibc toolchain when llvm is enabled"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	bool "Gallium Radeon SI driver"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_MESA3D_LLVM || \
-		(BR2_PACKAGE_MESA3D_LLVM && (BR2_TOOLCHAIN_USES_UCLIBC || \
-			BR2_TOOLCHAIN_USES_GLIBC)) # elfutils
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBDRM_RADEON
-	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
-	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
+	select BR2_PACKAGE_LLVM_AMDGPU
+	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
 
-# Radeon SI needs libelf when Mesa3D is built with LLVM support
+# Radeon SI needs libelf
 # musl is not currently compatible with elfutils
-comment "Radeon SI driver needs a uClibc or glibc toolchain when llvm is enabled"
+comment "Radeon SI driver needs a uClibc or glibc toolchain"
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 
-- 
2.14.3
