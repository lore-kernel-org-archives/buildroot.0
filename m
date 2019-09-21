From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 17:04:37 +0200
Subject: [Buildroot] [git commit] package/mesa3d: Gallium xa state tracker
 is only available for nouveau and svga Gallium drivers
Message-ID: <20190921150533.023838EE71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7934a2dd9e63ece69e40d8ddb25f8709bf5a5669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

i915 and freedreno Gallium drivers are not currently supported by mesa3d package.

https://cgit.freedesktop.org/mesa/mesa/commit/?id=0ba909f0f111824223bc38563d1a6bc73e69c2cc

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 6 +++---
 package/mesa3d/mesa3d.mk | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 1f5f221337..fa17734a03 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -80,6 +80,9 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 
+# Gallium xa state tracker.
+# Quote from mesa3d meson.build: "XA state tracker requires at least
+# one of the following gallium drivers: nouveau, freedreno, i915, svga.
 config BR2_PACKAGE_MESA3D_NEEDS_XA
 	bool
 
@@ -129,7 +132,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS if BR2_PACKAGE_MESA3D_LLVM
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
 
@@ -151,7 +153,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	select BR2_PACKAGE_LLVM_AMDGPU
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Driver for ATI/AMD Radeon HD7000/HD8000/Rx200 GPUs.
 
@@ -188,7 +189,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
-	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Driver for Broadcom VC4 (rpi2/3) GPUs.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 81736c83d3..24df2a1ccc 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -83,7 +83,6 @@ MESA3D_DEPENDENCIES += \
 	xorgproto \
 	libxcb
 MESA3D_CONF_OPTS += --enable-glx --disable-mangling
-# quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
 MESA3D_CONF_OPTS += --enable-xa
 else
