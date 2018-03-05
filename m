From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Mar 2018 20:07:19 -0000
Subject: [Buildroot] [git commit] sunxi-mali-mainline-driver: bump version
Message-ID: <20180305200716.7051080FAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d339809d61aeed2911291830581f643596a2e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For 4.15 support and various fixes.  This version now uses quilt to apply
patches, which is not a required dependency of Buildroot - So add a
POST_PATCH hook to change it to use apply-patches.sh instead.

git shortlog --invert-grep --grep travis --no-merges 42c7c139c14103a83bb2ad7e7a1f0ed491f96500..
Giulio Benetti (7):
      Fix bulding driver twice.
      Fix 0014-mali-Make-devfreq-optional.patch
      Add unapply_patches function in build.sh
      Fix 0013-mali-support-building-against-4.15.patch
      Add clean option to build.sh
      Add parallel building by default and -j option to override jobs number.
      Add 0015 parallel build patch to quilt series

Jonathan Liu (2):
      Add note about FRONTBUFFER_LOCKING environment variable
      Fix Qt capitalization and add link to website

Maxime Ripard (12):
      mali: Fix build in 4.15
      mali: Make reserved memory optional as it should be
      mali: sunxi: Set platform bus type right after device allocation
      mali: Make devfreq optional
      mali: Actually fix the build
      build: Treat patch and make failures as errors
      build: Make patch return immediately on error
      build: Make sure that we're building a supported release
      README: fix the casing of sunXi
      README: Talk about triple buffering
      build: Switch to quilt
      patches: Move version-specific patches to their directory

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index e4871c0bf0..9123c42947 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 42c7c139c14103a83bb2ad7e7a1f0ed491f96500
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = e752ddc8c4b9f2b9b9c6d193e2ba354caf8707f5
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
@@ -13,6 +13,14 @@ SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
 	CROSS_COMPILE=$(TARGET_CROSS) \
 	INSTALL_MOD_PATH=$(TARGET_DIR)
 
+define SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
+	ln -sf $(SUNXI_MALI_MAINLINE_REV)/series $(@D)/patches
+	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
+		$(@D)/build.sh
+endef
+
+SUNXI_MALI_MAINLINE_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
+
 define SUNXI_MALI_MAINLINE_DRIVER_BUILD_CMDS
 	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
 		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -b
