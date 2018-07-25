From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 25 Jul 2018 12:07:01 +0200
Subject: [Buildroot] [PATCH 2/5] sunxi-mali-mainline: add support for
 arm64(aarch64) architecture.
In-Reply-To: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
References: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180725100704.71349-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Blobs for arm64(aarch64) are now available at Bootlin Github.

Add support for them also under arm64(aarch64) architecture copying the
right blobs according to architecture(arm or arm64).
Check if BR2_arm or BR2_aarch64 is enabled.
Only BR2_arm needs to provide BR2_ARM_EABIHF,
so check must be done only in that case.
Mali-blobs repository folder layout has been changed,
so modify path when copying for:
- headers
- libraries

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/sunxi-mali-mainline/Config.in              |  3 +--
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 13 +++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
index 759bed86ba..912f5d22c6 100644
--- a/package/sunxi-mali-mainline/Config.in
+++ b/package/sunxi-mali-mainline/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE
 	bool "sunxi-mali-mainline"
-	depends on BR2_arm
-	depends on BR2_ARM_EABIHF
+	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
index 5ec115bc4c..05b90f0bee 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -11,13 +11,18 @@ SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
 
 SUNXI_MALI_MAINLINE_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION))
 
+ifeq ($(BR2_arm),y)
+SUNXI_MALI_MAINLINE_ARCH=arm
+else ifeq ($(BR2_aarch64),y)
+SUNXI_MALI_MAINLINE_ARCH=arm64
+endif
+
 define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
 
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/fbdev/lib/lib_fb_dev/* \
+	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
 		$(STAGING_DIR)/usr/lib/
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/fbdev/include/* \
-		$(STAGING_DIR)/usr/include/
+	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
 
 	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
@@ -27,7 +32,7 @@ endef
 
 define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/fbdev/lib/lib_fb_dev/* \
+	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
 		$(TARGET_DIR)/usr/lib/
 endef
 
-- 
2.17.1
