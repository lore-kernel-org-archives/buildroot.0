From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 21 Mar 2016 12:05:29 +0100
Subject: [Buildroot] [PATCH] linux: Introduce DTB's bootargs fixup feature
Message-ID: <1458558329-19210-1-git-send-email-mcoquelin.stm32@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The goal of this patch is to make Kernel command line
modifications in DTB without having to add patches on top
of the Kernel tree.

This is done from Buildroot's config, user can:
 - Overwrite the full bootargs property's value
 - Append a string to the bootargs property's value

For example, the first option is usefull when the user want
to change the root parameter, while the second option can
be used to add debug parameters.

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
---
 linux/Config.in | 21 +++++++++++++++++++++
 linux/linux.mk  | 38 +++++++++++++++++++++++++++++++++-----
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 93968cdf2984..f8e3c0f6d53d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -381,6 +381,27 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	  provide a list of dts paths to copy and build,
 	  separated by spaces.
 
+config BR2_LINUX_KERNEL_DTB_BOOTARGS_FIXUP
+	bool "Modify bootargs in DT blob"
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  Use fdtput tool from libfdt to fixup the Kernel
+	  command line defined in the DT blob.
+	  It avoids patching the DTS file.
+
+config BR2_LINUX_KERNEL_DTB_BOOTARGS_OVERWRITE_STRING
+	string "Overwrite bootargs string in DT blob"
+	depends on BR2_LINUX_KERNEL_DTB_BOOTARGS_FIXUP
+	help
+	  String which overwrites the bootargs defined
+	  in the DT blob.
+
+config BR2_LINUX_KERNEL_DTB_BOOTARGS_APPEND_STRING
+	string "Append bootargs string in DT blob"
+	depends on BR2_LINUX_KERNEL_DTB_BOOTARGS_FIXUP
+	help
+	  String to append to the bootargs defined in
+	  the DT blob.
 endif
 
 config BR2_LINUX_KERNEL_INSTALL_TARGET
diff --git a/linux/linux.mk b/linux/linux.mk
index 7e202559564f..7d71e59f5685 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -87,6 +87,13 @@ LINUX_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	BR_BINARIES_DIR=$(BINARIES_DIR)
 
+ifeq ($(BR2_LINUX_KERNEL_DTB_BOOTARGS_FIXUP),y)
+LINUX_DEPENDENCIES += host-dtc
+# Reserve some padding for fixup
+LINUX_MAKE_ENV += \
+	DTC_FLAGS="-p 1024"
+endif
+
 # Get the real Linux version, which tells us where kernel modules are
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
@@ -102,6 +109,9 @@ KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_K
 endif
 
 KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
+# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
+KERNEL_DTBS_PATH = $(addprefix  $(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
+		   $(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
@@ -267,13 +277,30 @@ ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
 endef
+ifeq ($(BR2_LINUX_KERNEL_DTB_BOOTARGS_FIXUP),y)
+define LINUX_FIXUP_DTB
+	$(LINUX_DTB_OVERWRITE_BOOTARGS)
+	$(LINUX_DTB_APPEND_BOOTARGS)
+endef
+ifneq ($(BR2_LINUX_KERNEL_DTB_BOOTARGS_OVERWRITE_STRING),"")
+define LINUX_DTB_OVERWRITE_BOOTARGS
+	# Overwriting DTB's bootargs
+	$(HOST_DIR)/usr/bin/fdtput -ts $(KERNEL_DTBS_PATH) "/chosen" "bootargs" \
+		$(call qstrip,$(BR2_LINUX_KERNEL_DTB_BOOTARGS_OVERWRITE_STRING))
+endef
+endif # BR2_LINUX_KERNEL_DTB_BOOTARGS_OVERWRITE_STRING
+ifneq ($(BR2_LINUX_KERNEL_DTB_BOOTARGS_APPEND_STRING),"")
+define LINUX_DTB_APPEND_BOOTARGS
+	# Appending DTB's bootargs
+	$(HOST_DIR)/usr/bin/fdtput -ts $(KERNEL_DTBS_PATH) "/chosen" "bootargs" \
+		"`$(HOST_DIR)/usr/bin/fdtget -ts $(KERNEL_DTBS_PATH) \
+		"/chosen" "bootargs"` $(call qstrip,$(BR2_LINUX_KERNEL_DTB_BOOTARGS_APPEND_STRING))"
+endef
+endif # BR2_LINUX_KERNEL_DTB_BOOTARGS_APPEND_STRING
+endif # BR2_LINUX_KERNEL_DTB_BOOTARGS_FIXUP
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
 define LINUX_INSTALL_DTB
-	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
-	cp $(addprefix \
-		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
-		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
-		$(1)
+	cp $(KERNEL_DTBS_PATH) $(1)
 endef
 endif # BR2_LINUX_KERNEL_APPENDED_DTB
 endif # BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
@@ -319,6 +346,7 @@ define LINUX_BUILD_CMDS
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
 	$(LINUX_BUILD_DTB)
+	$(LINUX_FIXUP_DTB)
 	$(LINUX_APPEND_DTB)
 endef
 
-- 
1.9.1
