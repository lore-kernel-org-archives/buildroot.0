From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 29 May 2013 10:36:45 +0200
Subject: [Buildroot] [PATCH] linux: Fix uImage with appended DTs generation
Message-ID: <1369816605-6268-1-git-send-email-maxime.ripard@free-electrons.com>
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
 linux/linux.mk | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 3877c35..a1166e5 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -228,9 +228,17 @@ define LINUX_APPEND_DTB
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
+LINUX_APPEND_DTB += $(sep) LOAD=`$(HOST_DIR)/usr/bin/mkimage -l $(LINUX_IMAGE_PATH) |\
+                    sed -n 's/Load Address: \([0-9]*\)/\1/p'`; \
+                    ENTRY=`$(HOST_DIR)/usr/bin/mkimage -l $(LINUX_IMAGE_PATH) |\
+                    sed -n 's/Entry Point: \([0-9]*\)/\1/p'`; \
+                    $(HOST_DIR)/usr/bin/mkimage -A $(KERNEL_ARCH) -O linux -T kernel -C none -a $${LOAD} -e $${ENTRY} \
+                    -n 'Linux Buildroot' -d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
 endif
 endif
 
-- 
1.8.2.3
