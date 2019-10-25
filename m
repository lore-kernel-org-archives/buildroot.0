From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 23:27:36 +0200
Subject: [Buildroot] [git commit] package/mesa3d: enable llvm RTTI when
 needed
Message-ID: <20191025212112.111338816F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df78534bc248f935e9aa8a0947f00ce9f262c77c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 4cb2608e15..8b3e9a4582 100644
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
 
