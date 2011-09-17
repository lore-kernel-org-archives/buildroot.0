From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Sat, 17 Sep 2011 22:23:08 +0200
Subject: [Buildroot] [PATCH] barebox: add support for custom version, tarball,
	git and patch dir
Message-ID: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 boot/barebox/Config.in  |   53 +++++++++++++++++++++++++++++++++++++++++++++++
 boot/barebox/barebox.mk |   23 +++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index a821c45..c11c03d 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -6,6 +6,59 @@ menuconfig BR2_TARGET_BAREBOX
 	  http://www.barebox.org
 
 if BR2_TARGET_BAREBOX
+choice
+	prompt "Barebox Version"
+	default BR2_TARGET_BAREBOX_2011_09
+	help
+	  Select the specific Barebox version you want to use
+
+config BR2_TARGET_BAREBOX_2011_08
+	bool "2011.08"
+
+config BR2_TARGET_BAREBOX_2011_09
+	bool "2011.09"
+
+config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
+	bool "Custom tarball"
+
+config BR2_TARGET_BAREBOX_CUSTOM_GIT
+	bool "Custom Git repository"
+
+endchoice
+
+if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
+
+config BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION
+	string "URL of custom Barebox tarball"
+
+endif
+
+config BR2_TARGET_BAREBOX_VERSION
+	string
+	default "2011.08.0"	if BR2_TARGET_BAREBOX_2011_08
+	default "2011.09.0"	if BR2_TARGET_BAREBOX_2011_09
+	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
+	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
+
+config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
+	string "custom patch dir"
+	help
+	  If your board requires custom patches, add the path to the
+	  directory containing the patches here. The patches must be
+	  named barebox-<version>-<something>.patch.
+
+	  Most users may leave this empty
+
+if BR2_TARGET_BAREBOX_CUSTOM_GIT
+
+config BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL
+	string "URL of custom Git repository"
+
+config BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION
+	string "Custom Git version"
+
+endif
+
 config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
 	string "board defconfig"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 0dfcff3..8826ef9 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -4,9 +4,30 @@
 #
 #############################################################
 
-BAREBOX_VERSION = 2011.09.0
+BAREBOX_VERSION    = $(call qstrip,$(BR2_TARGET_BAREBOX_VERSION))
+
+ifeq ($(BAREBOX_VERSION),custom)
+# Handle custom Barebox tarballs as specified by the configuration
+BAREBOX_TARBALL = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
+BAREBOX_SITE    = $(dir $(BAREBOX_TARBALL))
+BAREBOX_SOURCE  = $(notdir $(BAREBOX_TARBALL))
+else ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
+BAREBOX_SITE        = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
+BAREBOX_SITE_METHOD = git
+else
+# Handle stable official Barebox versions
 BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download/
+endif
+
+ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
+define BAREBOX_APPLY_CUSTOM_PATCHES
+	toolchain/patch-kernel.sh $(@D) $(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \
+		barebox-$(BAREBOX_VERSION)-\*.patch
+endef
+
+BAREBOX_POST_PATCH_HOOKS += BAREBOX_APPLY_CUSTOM_PATCHES
+endif
 
 BAREBOX_INSTALL_IMAGES = YES
 ifneq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
-- 
1.7.5.4
