From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:36 -0300
Subject: [Buildroot] [PATCH 11/36] linux/linux.mk: use namespace for
 internal variables
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-12-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These three symbols:
KERNEL_ARCH_PATH
KERNEL_DTBS
KERNEL_DTS_NAME
are defined and used only inside this file, so use the LINUX_ namespace
for them.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 linux/linux.mk | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 907ef2b315..e8f50e690a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -125,15 +125,15 @@ endif
 # going to be installed in the target filesystem.
 LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
 
-KERNEL_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
+LINUX_KERNEL_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 
 # We keep only the .dts files, so that the user can specify both .dts
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-KERNEL_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_KERNEL_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
 
-KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
+LINUX_KERNEL_DTBS = $(addsuffix .dtb,$(LINUX_KERNEL_DTS_NAME))
 
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
@@ -155,9 +155,9 @@ LINUX_IMAGE_NAME = zImage.epapr
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
 LINUX_IMAGE_NAME = zImage
 else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
-LINUX_IMAGE_NAME = cuImage.$(KERNEL_DTS_NAME)
+LINUX_IMAGE_NAME = cuImage.$(LINUX_KERNEL_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
-LINUX_IMAGE_NAME = simpleImage.$(KERNEL_DTS_NAME)
+LINUX_IMAGE_NAME = simpleImage.$(LINUX_KERNEL_DTS_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_IMAGE),y)
 LINUX_IMAGE_NAME = Image
 else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
@@ -187,11 +187,11 @@ endif
 # for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
 # defconfig file.
 ifeq ($(KERNEL_ARCH),i386)
-KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/x86
+LINUX_KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/x86
 else ifeq ($(KERNEL_ARCH),x86_64)
-KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/x86
+LINUX_KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/x86
 else
-KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
+LINUX_KERNEL_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
@@ -201,7 +201,7 @@ LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_BIN),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
-LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
+LINUX_IMAGE_PATH = $(LINUX_KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
 endif # BR2_LINUX_KERNEL_VMLINUX
 
 define LINUX_APPLY_LOCAL_PATCHES
@@ -323,14 +323,14 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
 ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_KERNEL_DTBS)
 endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
 define LINUX_INSTALL_DTB
 	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
 	cp $(addprefix \
-		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
-		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
+		$(LINUX_KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
+		$(addprefix $(LINUX_KERNEL_ARCH_PATH)/boot/dts/,$(LINUX_KERNEL_DTBS))),dts/),$(LINUX_KERNEL_DTBS)) \
 		$(1)
 endef
 endif # BR2_LINUX_KERNEL_APPENDED_DTB
@@ -340,8 +340,8 @@ endif # BR2_LINUX_KERNEL_DTS_SUPPORT
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 # dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
 define LINUX_APPEND_DTB
-	(cd $(KERNEL_ARCH_PATH)/boot; \
-		for dtb in $(KERNEL_DTS_NAME); do \
+	(cd $(LINUX_KERNEL_ARCH_PATH)/boot; \
+		for dtb in $(LINUX_KERNEL_DTS_NAME); do \
 			if test -e $${dtb}.dtb ; then \
 				dtbpath=$${dtb}.dtb ; \
 			else \
@@ -359,10 +359,10 @@ ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 LINUX_APPEND_DTB += ; \
 	MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
 	sed -n -e 's/Image Name:[ ]*\(.*\)/-n \1/p' -e 's/Load Address:/-a/p' -e 's/Entry Point:/-e/p'`; \
-	for dtb in $(KERNEL_DTS_NAME); do \
+	for dtb in $(LINUX_KERNEL_DTS_NAME); do \
 		$(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux \
 			-T kernel -C none $${MKIMAGE_ARGS} \
-			-d $(KERNEL_ARCH_PATH)/boot/zImage.$${dtb} $(LINUX_IMAGE_PATH).$${dtb}; \
+			-d $(LINUX_KERNEL_ARCH_PATH)/boot/zImage.$${dtb} $(LINUX_IMAGE_PATH).$${dtb}; \
 	done
 endif
 endif
@@ -371,7 +371,7 @@ endif
 # configuration has changed.
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
-		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
+		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(LINUX_KERNEL_ARCH_PATH)/boot/dts/)
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
 		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ; \
@@ -385,7 +385,7 @@ ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 # appended DTBs.
 define LINUX_INSTALL_IMAGE
 	mkdir -p $(1)
-	cp $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME).* $(1)
+	cp $(LINUX_KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME).* $(1)
 endef
 else
 # Otherwise, just install the unique image generated by the kernel
@@ -481,7 +481,7 @@ $(error No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUST
 endif
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
+ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(LINUX_KERNEL_DTS_NAME),y)
 $(error No kernel device tree source specified, check your \
 	BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings)
 endif
-- 
2.14.1
