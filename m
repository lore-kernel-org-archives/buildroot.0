From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 7 Aug 2012 17:09:37 +0800
Subject: [Buildroot] [PATCH 5/5] buildroot: initramfs: Generate vmImage
	without builtin initramfs rootfs.
In-Reply-To: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
References: <1344330577-25159-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <1344330577-25159-5-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

This is for developer's convenience when debugging via initramfs uImage.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 linux/linux.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 4ad8b49..49545b8 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -223,6 +223,11 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
+	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
+	# Remove the any previously generated initramfs if do recompilation.
+		$(RM) -f $(BINARIES_DIR)/rootfs.initramfs
+		$(RM) -f $(@D)/usr/initramfs_data.cpio*
+		touch $(BINARIES_DIR)/rootfs.initramfs)
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_SOURCE_DIR) $(LINUX_IMAGE_TARGET)
@@ -231,6 +236,8 @@ define LINUX_BUILD_CMDS
 	fi
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
+	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
+		cp $(LINUX_IMAGE_PATH) $(KERNEL_ARCH_PATH)/boot/vmImage)
 endef
 
 
@@ -251,6 +258,8 @@ endef
 
 define LINUX_INSTALL_IMAGES_CMDS
 	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
+	$(if $(BR2_TARGET_ROOTFS_INITRAMFS),
+		cp $(KERNEL_ARCH_PATH)/boot/vmImage $(BINARIES_DIR))
 endef
 
 define LINUX_INSTALL_TARGET_CMDS
-- 
1.7.0.4
