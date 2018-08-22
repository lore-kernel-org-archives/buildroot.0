From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 13:17:31 +0200
Subject: [Buildroot] [git commit branch/next] sunxi-mali-mainline: add
 support for arm64 and r8p1 blob version
Message-ID: <20180822111251.F3E318E25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e07c200cdb65b10ba67f0a542e7e833a6ba799db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Blobs for arm64(aarch64) and r8p1 version are now available at Bootlin
Github.

So:
- Bump version to latest commit:
For arm64 architecture and r8p1 version.

git shortlog --no-merges cb3e8ece9b2c3a70cbeb3204cd6f30eceaa32023..
Giulio Benetti (1):
      Reorder folders splitting includes and libraries.

Maxime Ripard (6):
      Move binaries to an arch subfolder
      Make x11 binaries path consistent
      Add r6p2 arm wayland blobs
      Add r6p2 arm64 blobs
      Add r8p1 fbdev blobs
      Add r8p1 arm64 fbdev blobs

- Add support for them also under arm64(aarch64) architecture copying the
right blobs according to architecture(arm or arm64) checking if BR2_arm
or BR2_aarch64 is enabled.
Only BR2_arm needs to provide BR2_ARM_EABIHF, so check must be done only
in that case.
- Mali-blobs repository folder layout has been reordered, so modify path
when copying headers and libraries.
- When copying libraries copy only *.so* files to avoid useless files to
end into target folder.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline/Config.in              |  6 ++++--
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 15 ++++++++++-----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
index 759bed86ba..a889864465 100644
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
@@ -26,12 +25,15 @@ choice
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
 	bool "r6p2"
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
+	bool "r8p1"
 
 endchoice
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION
 	string
 	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
+	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
 
 endif
 
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
index 933e2beb0d..05b90f0bee 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -4,20 +4,25 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_VERSION = cb3e8ece9b2c3a70cbeb3204cd6f30eceaa32023
+SUNXI_MALI_MAINLINE_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
 SUNXI_MALI_MAINLINE_SITE = $(call github,free-electrons,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
 SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
 SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
 
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
 
