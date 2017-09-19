From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Sep 2017 13:03:52 +0200
Subject: [Buildroot] [PATCH 2/4] linux: add custom linux logo
In-Reply-To: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1505819034-29610-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a simple way to change the linux bootup logo.
The patch was kept purposely simple to support only the use cause
where a user needs a colour linux boot up logo.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 linux/Config.in | 27 +++++++++++++++++++++++++++
 linux/linux.mk  | 19 +++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 62a4f1e..38c42c9 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -160,6 +160,33 @@ config BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG
 
 endchoice
 
+#
+# Custom logo
+#
+
+config BR2_LINUX_KERNEL_CUSTOMLOGO
+	bool "Kernel custom logo"
+	select BR2_PACKAGE_CUSTOMLOGO
+	help
+	  Change the linux boot logo with your own graphics.
+	  It can be used as an early bootsplash.
+	  The file should be in kernel ppm format if the
+	  option BR2_LINUX_KERNEL_CUSTOMLOGO_CONVERT is not
+	  selected.
+
+config BR2_LINUX_KERNEL_CUSTOMLOGO_PATH
+	string "Image file path"
+	depends on BR2_LINUX_KERNEL_CUSTOMLOGO
+	help
+	  This image will be used as custom logo.
+
+config BR2_LINUX_KERNEL_CUSTOMLOGO_CONVERT
+	bool "Convert custom logo to kernel format"
+	depends on BR2_LINUX_KERNEL_CUSTOMLOGO
+	help
+	  If checked, the convert command will be run on the source
+	  image file to obtain a kernel compatible ppm image file.
+
 config BR2_LINUX_KERNEL_DEFCONFIG
 	string "Defconfig name"
 	depends on BR2_LINUX_KERNEL_USE_DEFCONFIG
diff --git a/linux/linux.mk b/linux/linux.mk
index c7bf83a..002a0c0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -221,6 +221,21 @@ define LINUX_TRY_PATCH_TIMECONST
 endef
 LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST
 
+ifeq ($(BR2_LINUX_KERNEL_CUSTOMLOGO),y)
+ifeq ($(BR2_LINUX_KERNEL_CUSTOMLOGO_CONVERT),y)
+LINUX_DEPENDENCIES += host-imagemagick
+define LINUX_KERNEL_CUSTOMLOGO_PREPARE
+	$(HOST_DIR)/usr/bin/convert $(BR2_LINUX_KERNEL_CUSTOMLOGO_PATH) \
+		-dither None -colors 224 -compress none \
+		$(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+endef
+else
+define LINUX_KERNEL_CUSTOMLOGO_PREPARE
+	cp $(BR2_LINUX_KERNEL_CUSTOMLOGO_PATH) $(LINUX_DIR)/drivers/video/logo/logo_linux_clut224.ppm
+endef
+endif
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 LINUX_KCONFIG_DEFCONFIG = $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG),y)
@@ -304,6 +319,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
 		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
+	$(if $(BR2_LINUX_KERNEL_CUSTOMLOGO),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224,$(@D)/.config))
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
@@ -356,6 +374,7 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
+	$(LINUX_KERNEL_CUSTOMLOGO_PREPARE)
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-- 
2.7.4
