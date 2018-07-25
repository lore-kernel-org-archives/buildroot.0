From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 25 Jul 2018 12:07:04 +0200
Subject: [Buildroot] [PATCH 5/5] sunxi-mali-mainline-driver: add support for
 building on arm64(aarch64) architecture.
In-Reply-To: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
References: <20180725100704.71349-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180725100704.71349-6-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Blobs for arm64(aarch64) are available at Bootlin Github and
sunxi-mali-mainline has been updated to support them, add support for
building on arm64(aarch64).

Check if BR2_arm or BR2_aarch64 is enabled and only in BR2_arm case
expect BR2_ARM_EABIHF to be enabled.
Add ARCH=arm or ARCH=arm64 to SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS
to build for the right architecture with build.sh script provided on
Maxime Ripard sunxi-mali repository.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../sunxi-mali-mainline-driver.mk                           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index fcaeb81efe..e7a5ed2079 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -13,6 +13,12 @@ SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	INSTALL_MOD_PATH=$(TARGET_DIR)
 
+ifeq ($(BR2_arm),y)
+SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS += ARCH=arm
+else ifeq ($(BR2_aarch64),y)
+SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS += ARCH=arm64
+endif
+
 define SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
 	ln -sf $(SUNXI_MALI_MAINLINE_REV)/series $(@D)/patches
 	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
-- 
2.17.1
