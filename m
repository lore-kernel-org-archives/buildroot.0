From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 20:11:02 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libdrm: amdgpu
 needs MMU
Message-ID: <20190325191339.340F281511@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c16591d8962a439ea554c35c0e98727aff53dd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

amdgpu test uses fork() so disable amdgpu without MMU

Fixes:
 - http://autobuild.buildroot.org/results/8d6194982c1080e173fcef8212fb06e6dc275d58

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9972dc2e8295bbd0dba694bf970133ba99ad25f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/Config.in                          | 1 +
 package/mesa3d/Config.in                          | 2 ++
 package/x11r7/xdriver_xf86-video-amdgpu/Config.in | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 581f921968..3cb0e02a41 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -36,6 +36,7 @@ config BR2_PACKAGE_LIBDRM_RADEON
 
 config BR2_PACKAGE_LIBDRM_AMDGPU
 	bool "amdgpu"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 5019f2683b..fdd64b0337 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -125,6 +125,7 @@ comment "R600 driver needs a uClibc or glibc toolchain when llvm is enabled"
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	bool "Gallium Radeon SI driver"
+	depends on BR2_USE_MMU # libdrm
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
@@ -141,6 +142,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 # Radeon SI needs libelf
 # musl is not currently compatible with elfutils
 comment "Radeon SI driver needs a uClibc or glibc toolchain"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
index 43090c7559..c42255f55c 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	bool "xf86-video-amdgpu"
+	depends on BR2_USE_MMU # libdrm
 	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
 	select BR2_PACKAGE_LIBDRM
@@ -11,5 +12,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	  AMD GPU video driver
 
 comment "xf86-video-amdgpu needs egl/opengl support from mesa3d"
+	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
 		!BR2_PACKAGE_MESA3D_DRI_DRIVER
