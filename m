From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] linux: add KERNEL_ARCH_PATH to
	fix x86-specific issue
Message-ID: <20101217160206.C94338E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=84c4a10a75fda9e00b551789d77fdb2791924aad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both i386 and x86_64 architectures are supported by the arch/x86
directory in the kernel. So, when we copy the kernel configuration
file to arch/$(KERNEL_ARCH)/configs/, it does not work because
arch/i386 and arch/x86_64 do not exist.

So, we introduce KERNEL_ARCH_PATH, which is the path to the
architecture specific directory in the kernel source tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |   20 ++++++++++++++++----
 1 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 86d7e26..23b89cf 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -43,13 +43,25 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX26_IMAGE_NAME=vmlinux
 endif
 
+# Compute the arch path, since i386 and x86_64 are in arch/x86 and not
+# in arch/$(KERNEL_ARCH). Even if the kernel creates symbolic links
+# for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
+# defconfig file.
+ifeq ($(KERNEL_ARCH),i386)
+KERNEL_ARCH_PATH=$(LINUX26_DIR)/arch/x86
+else ifeq ($(KERNEL_ARCH),x86_64)
+KERNEL_ARCH_PATH=$(LINUX26_DIR)/arch/x86
+else
+KERNEL_ARCH_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)
+endif
+
 ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX26_IMAGE_PATH=$(LINUX26_DIR)/$(LINUX26_IMAGE_NAME)
 else
 ifeq ($(KERNEL_ARCH),avr32)
-LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
+LINUX26_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX26_IMAGE_NAME)
 else
-LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
+LINUX26_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX26_IMAGE_NAME)
 endif
 endif # BR2_LINUX_KERNEL_VMLINUX
 
@@ -91,9 +103,9 @@ $(LINUX26_DIR)/.stamp_configured: $(LINUX26_DIR)/.stamp_patched
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) $(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(@D)/arch/$(KERNEL_ARCH)/configs/buildroot_defconfig
+	cp $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) buildroot_defconfig
-	rm $(@D)/arch/$(KERNEL_ARCH)/configs/buildroot_defconfig
+	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 endif
 ifeq ($(BR2_ARM_EABI),y)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
-- 
1.7.2.2
