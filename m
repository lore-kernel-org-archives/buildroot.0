From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Thu, 29 Apr 2021 20:51:38 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/freescale-imx/imx-gpu-viv:
 select libdrm
Message-ID: <20210429185138.4460-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some libraries (libGL.so, vivante_dri.so, libEGL.so, libgbm_viv.so) are
linked against libdrm so select libdrm package.

Fixes: 8283e838f040 ("package/freescale-imx/imx-gpu-viv: bump to version 6.4.3.p1.2")
Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---

Changes for v2:
 - libdrm is not needed on ARM with framebuffer output.

 package/freescale-imx/imx-gpu-viv/Config.in      | 5 +++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 7 ++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index cca2689905..6668ee8bb5 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -12,6 +12,9 @@ config BR2_PACKAGE_IMX_GPU_VIV
 	depends on (BR2_arm && BR2_ARM_EABIHF) || BR2_aarch64
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# Library binaries are linked against libdrm.so.2, except framebuffer
+	# output on ARM
+	select BR2_PACKAGE_LIBDRM if !(BR2_arm && BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB)
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_LIBOPENCL
@@ -56,8 +59,6 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
-	# libdrm needed by gbm_viv.so
-	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 
diff --git a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
index 802ac26c1c..103c0341e3 100644
--- a/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
+++ b/package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk
@@ -29,8 +29,13 @@ ifeq ($(IMX_GPU_VIV_LIB_TARGET),x11)
 IMX_GPU_VIV_DEPENDENCIES += xlib_libXdamage xlib_libXext xlib_libXfixes
 endif
 
+# Libraries are linked against libdrm, except framebuffer output on ARM
+ifneq ($(IMX_GPU_VIV_LIB_TARGET)$(BR2_arm),fby)
+IMX_GPU_VIV_DEPENDENCIES += libdrm
+endif
+
 ifeq ($(IMX_GPU_VIV_LIB_TARGET),wayland)
-IMX_GPU_VIV_DEPENDENCIES += libdrm wayland
+IMX_GPU_VIV_DEPENDENCIES += wayland
 endif
 
 define IMX_GPU_VIV_EXTRACT_CMDS
-- 
2.26.3
