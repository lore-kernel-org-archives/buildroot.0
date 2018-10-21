From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 18:16:29 +0200
Subject: [Buildroot] [git commit] linux: add custom linux boot logo option
Message-ID: <20181021161455.7913688396@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=551e48a812c3bd3bc287e164391d8caad3697ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a simple way to change the linux bootup logo.
The patch was kept purposely simple to support only the use cause
where a user needs a color linux boot up logo.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Peter: clarify/reword option/help text, automatically enable framebuffer
	support, fix convert path]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in |  8 ++++++++
 linux/linux.mk  | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index d372c2c1f8..ecb12d0b16 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -188,6 +188,14 @@ config BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES
 	  A space-separated list of kernel configuration fragment files,
 	  that will be merged to the main kernel configuration file.
 
+config BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH
+	string "Custom boot logo file path"
+	help
+	  Use a custom Linux framebuffer boot logo.
+	  Custom logo should be in PNG or JPEG format, it will be
+	  converted to the linux kernel format (224 colors only)
+	  and copied over the original logo file.
+
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 675e7906a8..e9c75153b2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -248,6 +248,17 @@ define LINUX_TRY_PATCH_TIMECONST
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
+LINUX_KERNEL_CUSTOM_LOGO_PATH = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH))
+ifneq ($(LINUX_KERNEL_CUSTOM_LOGO_PATH),)
+LINUX_DEPENDENCIES += host-imagemagick
+define LINUX_KERNEL_CUSTOM_LOGO_CONVERT
+	$(HOST_DIR)/bin/convert $(LINUX_KERNEL_CUSTOM_LOGO_PATH) \
+		-dither None -colors 224 -compress none \
+		$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+endef
+LINUX_PRE_BUILD_HOOKS += LINUX_KERNEL_CUSTOM_LOGO_CONVERT
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
@@ -349,6 +360,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
+	$(if $(LINUX_KERNEL_CUSTOM_LOGO_PATH),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_FB,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224,$(@D)/.config))
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
