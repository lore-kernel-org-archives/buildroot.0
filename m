From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  9 Feb 2012 15:51:48 +0100
Subject: [Buildroot] [PATCH 2/2] x-loader: add custom git and tarball support
In-Reply-To: <1328799108-19521-1-git-send-email-yegorslists@googlemail.com>
References: <1328799108-19521-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1328799108-19521-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 boot/xloader/Config.in  |   45 +++++++++++++++++++++++++++++++++++++++++++++
 boot/xloader/xloader.mk |   22 ++++++++++++++++++++--
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/boot/xloader/Config.in b/boot/xloader/Config.in
index c411be4..4a510c9 100644
--- a/boot/xloader/Config.in
+++ b/boot/xloader/Config.in
@@ -12,4 +12,49 @@ config BR2_TARGET_XLOADER_BOARDNAME
 	  One of x-loader supported boards to be built.
 	  This will be suffixed with _config to meet x-loader
 	  standard naming.
+
+choice
+	prompt "X-loader Version"
+	default BR2_TARGET_XLOADER_CUSTOM_GIT
+	help
+	  Select the specific X-loader version you want to use
+
+config BR2_TARGET_XLOADER_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_XLOADER_CUSTOM_GIT
+	bool "Custom Git repository"
+
+endchoice
+
+if BR2_TARGET_XLOADER_CUSTOM_GIT
+
+config BR2_TARGET_XLOADER_CUSTOM_GIT_REPO_URL
+	string "URL of custom Git repository"
+
+config BR2_TARGET_XLOADER_CUSTOM_GIT_VERSION
+	string "Custom Git version"
+
+endif
+
+if BR2_TARGET_XLOADER_CUSTOM_TARBALL
+
+config BR2_TARGET_XLOADER_CUSTOM_TARBALL_LOCATION
+	string "URL of custom X-loader tarball"
+
+endif
+
+config BR2_TARGET_XLOADER_VERSION
+	string
+	default "custom"	if BR2_TARGET_XLOADER_CUSTOM_TARBALL
+	default $BR2_TARGET_XLOADER_CUSTOM_GIT_VERSION if BR2_TARGET_XLOADER_CUSTOM_GIT
+
+config BR2_TARGET_XLOADER_CUSTOM_PATCH_DIR
+	string "Custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named xloader-<version>-<something>.patch.
+
+	  Most users may leave this empty
 endif
diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index e8dd380..6ba2920 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -3,10 +3,28 @@
 # x-loader
 #
 #############################################################
-XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
-XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
+XLOADER_VERSION    = $(call qstrip,$(BR2_TARGET_XLOADER_VERSION))
 XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
 
+ifeq ($(XLOADER_VERSION),custom)
+# Handle custom X-loader tarballs as specified by the configuration
+XLOADER_TARBALL = $(call qstrip,$(BR2_TARGET_XLOADER_CUSTOM_TARBALL_LOCATION))
+XLOADER_SITE    = $(dir $(XLOADER_TARBALL))
+XLOADER_SOURCE  = $(notdir $(XLOADER_TARBALL))
+else
+XLOADER_SITE        = $(call qstrip,$(BR2_TARGET_XLOADER_CUSTOM_GIT_REPO_URL))
+XLOADER_SITE_METHOD = git
+endif
+
+ifneq ($(call qstrip,$(BR2_TARGET_XLOADER_CUSTOM_PATCH_DIR)),)
+define XLOADER_APPLY_CUSTOM_PATCHES
+	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_XLOADER_CUSTOM_PATCH_DIR) \
+		xloader-$(XLOADER_VERSION)-\*.patch
+endef
+
+XLOADER_POST_PATCH_HOOKS += XLOADER_APPLY_CUSTOM_PATCHES
+endif
+
 XLOADER_INSTALL_IMAGES = YES
 
 define XLOADER_BUILD_CMDS
-- 
1.7.5.4
