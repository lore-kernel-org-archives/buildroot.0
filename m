From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Fri, 30 Nov 2018 13:01:22 +0100
Subject: [Buildroot] [PATCH 4/5] package/sunxi-mali-mainline: Fix QT5 build
 for EGLFS
In-Reply-To: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
References: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <1543579283-20496-5-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added BR2_PACKAGE_HAS_LIBEGL_WAYLAND, but to avoid a circular
dependency, BR2_PACKAGE_WAYLAND is selected instead of being
a dependency.
Also add -D__GBM__ in order to build EGL.

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
----
I can't test this on HW, but without -D__GBM__, the QT config will
not build EGLFS and give up on feature.egl failure.
With it, we get:
  EGLFS .................................. yes
    EGLFS EGLDevice ...................... yes
    EGLFS GBM ............................ yes
    EGLFS Mali ........................... no  (?)

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 configs/libgbm_sunxi_mali_defconfig                | 1 -
 package/sunxi-mali-mainline/Config.in              | 3 ++-
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 5 +++++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/configs/libgbm_sunxi_mali_defconfig b/configs/libgbm_sunxi_mali_defconfig
index 422d1db..c89a781 100644
--- a/configs/libgbm_sunxi_mali_defconfig
+++ b/configs/libgbm_sunxi_mali_defconfig
@@ -8,5 +8,4 @@ BR2_SYSTEM_BIN_SH_NONE=y
 BR2_PACKAGE_KMSCUBE=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND=y
-BR2_PACKAGE_WAYLAND=y
 # BR2_TARGET_ROOTFS_TAR is not set
diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
index 837bf19..911e9d1 100644
--- a/package/sunxi-mali-mainline/Config.in
+++ b/package/sunxi-mali-mainline/Config.in
@@ -28,8 +28,9 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
 	bool "wayland"
-	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
 	bool "x11 dma-buf"
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
index 8a76b46..3cddcdf 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -39,6 +39,10 @@ endif
 ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND),y)
 SUNXI_MALI_MAINLINE_DEPENDENCIES += wayland
 SUNXI_MALI_MAINLINE_PROVIDES += libgbm
+define SUNXI_MALI_MAINLINE_GBM_FIXUP_EGL_PC
+	$(SED) "s/Cflags: /Cflags: -D__GBM__ /" \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+endef
 endif
 
 # FIXME: install gbm.pc conditionally
@@ -56,6 +60,7 @@ define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
 		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
 	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/gbm.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gbm.pc
+	$(SUNXI_MALI_MAINLINE_GBM_FIXUP_EGL_PC)
 	$(SUNXI_MALI_MAINLINE_FIXUP_EGL_PC)
 endef
 
-- 
2.7.4
