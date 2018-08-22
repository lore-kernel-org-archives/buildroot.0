From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 Aug 2018 02:06:48 +0200
Subject: [Buildroot] [PATCH v2 2/2] sunxi-mali-mainline-driver: bump version
 and add support for building on arm64(aarch64).
In-Reply-To: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
References: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180822000648.23314-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Blobs for arm64(aarch64) are available at Bootlin Github and
sunxi-mali-mainline package has been updated to support them.

Add support for building on arm64(aarch64):
- Bump version to latest commit:
For support H3 and H5 SoCs and r8p1 driver version.

git shortlog --invert-grep --grep travis --no-merges 52ef1c5e133cc5fd791ca636239dc5e7b19c26d5..
Maxime Ripard (6):
      Add r8p1 release
      sunxi: Move the reset test to a function
      sunxi: Add H3 support
      sunxi: Add H5 support
      sunxi: Remove generic compatible
      sunxi: Set clock rate in the driver

- Add ARCH=arm or ARCH=arm64 to SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS
to build for the right architecture according to BR2_arm or BR2_aarch64.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../sunxi-mali-mainline-driver.mk                         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 24817b07c7..e7a5ed2079 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 52ef1c5e133cc5fd791ca636239dc5e7b19c26d5
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = 8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
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
