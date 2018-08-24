From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 24 Aug 2018 15:44:58 +0200
Subject: [Buildroot] [PATCH v4 2/4] linux: add custom linux logo
In-Reply-To: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
References: <1535118300-26815-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1535118300-26815-2-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch adds a simple way to change the linux bootup logo.
The patch was kept purposely simple to support only the use cause
where a user needs a color linux boot up logo.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 linux/Config.in | 10 ++++++++++
 linux/linux.mk  | 15 +++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index b7bee99..9a410b1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -188,6 +188,16 @@ config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
 	  A space-separated list of kernel configuration fragment files,
 	  that will be merged to the main kernel configuration file.
 
+config BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH
+	string "Custom logo file path"
+	help
+	  Change the linux boot logo with your own graphics,
+	  it can be used as an early bootsplash, framebuffer support
+	  should be enabled to have this feature working.
+	  Custom logo should be in png or jpg, it will be
+	  converted to the linux kernel format (224 colors only)
+	  and copied over the original logo file.
+
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 675e790..e38c7de 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -248,6 +248,18 @@ define LINUX_TRY_PATCH_TIMECONST
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
+LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH))
+ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
+LINUX_DEPENDENCIES += host-imagemagick
+LINUX_KERNEL_CUSTOM_LOGO = y
+define LINUX_KERNEL_CUSTOM_LOGO_CONVERT
+	$(HOST_DIR)/usr/bin/convert $(LINUX_KERNEL_CUSTOM_LOGO_PATH) \
+		-dither None -colors 224 -compress none \
+		$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+endef
+LINUX_PRE_BUILD_HOOKS += LINUX_KERNEL_CUSTOM_LOGO_CONVERT
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
@@ -349,6 +361,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
+	$(if $(LINUX_KERNEL_CUSTOM_LOGO),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224,$(@D)/.config))
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
-- 
2.7.4
