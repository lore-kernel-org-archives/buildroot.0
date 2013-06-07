From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri,  7 Jun 2013 15:21:43 +0200
Subject: [Buildroot] [PATCHv2] linux: Fix uImage with appended DTs generation
Message-ID: <1370611303-5054-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes bug #5516 - appended device tree blobs on uImage fails

Before version 3.7 of the kernel, building the zImage and then the
uImage will rewrite the zImage in the process, removing the device tree
we just appended.

Use mkimage to append the device tree to the uImage and rebuild the
headers directly.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 linux/linux.mk | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 57956dd..50fa943 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -106,12 +106,6 @@ ifneq ($(LINUX_KERNEL_UIMAGE_LOADADDR),)
 LINUX_MAKE_FLAGS+=LOADADDR="$(LINUX_KERNEL_UIMAGE_LOADADDR)"
 endif
 
-ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
-LINUX_IMAGE_TARGET=zImage
-else
-LINUX_IMAGE_TARGET=$(LINUX_IMAGE_NAME)
-endif
-
 # Compute the arch path, since i386 and x86_64 are in arch/x86 and not
 # in arch/$(KERNEL_ARCH). Even if the kernel creates symbolic links
 # for bzImage, arch/i386 and arch/x86_64 do not exist when copying the
@@ -229,9 +223,16 @@ define LINUX_APPEND_DTB
 	fi >> $(KERNEL_ARCH_PATH)/boot/zImage
 endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
-# We need to generate the uImage here after that so that the uImage is
-# generated with the right image size.
-LINUX_APPEND_DTB += $(sep)$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
+# We need to generate a new u-boot image that takes into
+# account the extra-size added by the device tree at the end
+# of the image. To do so, we first need to retrieve both load
+# address and entry point for the kernel from the already
+# generate uboot image before using mkimage -l.
+LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(HOST_DIR)/usr/bin/mkimage -l $(LINUX_IMAGE_PATH) |\
+        sed -n -e 's/Image Name:[ ]*\(.*\)/-n \1/p' -e 's/Load Address:/-a/p' -e 's/Entry Point:/-e/p'`; \
+        $(HOST_DIR)/usr/bin/mkimage -A $(KERNEL_ARCH) -O linux \
+        -T kernel -C none $${MKIMAGE_ARGS} \
+        -d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
 endif
 endif
 
@@ -240,7 +241,7 @@ endif
 define LINUX_BUILD_CMDS
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
-	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
 	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
 		$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
 	fi
-- 
1.8.3
