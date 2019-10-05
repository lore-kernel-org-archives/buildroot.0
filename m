From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  5 Oct 2019 11:48:16 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/mesa3d: enable llvm RTTI when
 needed
In-Reply-To: <20191005094818.1956334-1-romain.naour@gmail.com>
References: <20191005094818.1956334-1-romain.naour@gmail.com>
Message-ID: <20191005094818.1956334-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LLVM must be built with rtti (runtime type information) support
to build the Gallium Nouveau driver or the Clover OpenCL state
tracker when llvm support is enabled in mesa3d.

Fixes the build when BR2_PACKAGE_MESA3D_OPENCL is set:
"The Clover OpenCL state tracker requires rtti, you need to turn off clover or use an LLVM built with LLVM_ENABLE_RTTI."

This check was added by mesa3d 19.1:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=29912f2ea486fb8ffbc98db347679cf542422efe

Fixes the build when BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU and BR2_PACKAGE_MESA3D_LLVM are set
"The Nouveau driver requires rtti. You either need to turn off nouveau or use an LLVM built with LLVM_ENABLE_RTTI."

This check was added by mesa3d 19.0:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=a2596450ac7330c8965c819491038fb1ad454333

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/mesa3d/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d9a705f991..5bec4405b7 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_MESA3D_OPENCL
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
 		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	select BR2_PACKAGE_LLVM_RTTI
 	select BR2_PACKAGE_CLANG
 	select BR2_PACKAGE_LIBCLC
 	select BR2_PACKAGE_HAS_LIBOPENCL
@@ -122,6 +123,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
 	help
 	  Supports all Nvidia GPUs.
 
-- 
2.23.0
