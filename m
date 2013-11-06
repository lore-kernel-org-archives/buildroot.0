From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Nov 2013 00:12:34 +0100
Subject: [Buildroot] [PATCH 6/7] rootfs-cpio: add U-Boot image support
In-Reply-To: <1383779555-9222-1-git-send-email-arnout@mind.be>
References: <1383779555-9222-1-git-send-email-arnout@mind.be>
Message-ID: <1383779555-9222-7-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds U-Boot image support for cpio root filesystems. This allows you to
use the bootm command in U-Boot to load the rootfs. It makes it possible to
verify the CRC of the initramfs before booting the kernel.

[Spenser: wrote first version of the patch.]
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: patch taken over by Arnout
 - Rewrote help text.
 - Moved implementation to cpio.mk, because it will be the only one
   to ever use it.
 - Implement as a post-target instead of post-hook.
 - Removed compression type flag. It is not very useful to let U-Boot
   do decompression, especially because not all U-Boot configs
   support all possible decompression methods.
 - Reordered the Config.in options.
 - use correct -A flag

Since almost no lines are still the same as in the original patch,
I've claimed full authorship - sorry Spenser :-)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/cpio/Config.in | 13 ++++++++++++-
 fs/cpio/cpio.mk   | 21 +++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index fd85d29..206baca 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -5,10 +5,11 @@ config BR2_TARGET_ROOTFS_CPIO
 	  used for an initial RAM filesystem that is passed to the kernel
 	  by the bootloader.
 
+if BR2_TARGET_ROOTFS_CPIO
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_CPIO_NONE
-	depends on BR2_TARGET_ROOTFS_CPIO
 	help
 	  Select compressor for cpio filesystem of the root filesystem.
 	  If you use the cpio archive as an initial RAM filesystem, make
@@ -47,3 +48,13 @@ config BR2_TARGET_ROOTFS_CPIO_XZ
 
 endchoice
 
+config BR2_TARGET_ROOTFS_CPIO_UIMAGE
+	bool "Create U-Boot image of the root filesystem"
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Add a U-Boot header to the cpio root filesystem. This allows
+	  the initramfs to be loaded with the bootm command in U-Boot.
+
+	  The U-Boot image will be called rootfs.cpio.uboot
+
+endif # BR2_TARGET_ROOTFS_CPIO
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 0df2378..e39e215 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -31,4 +31,25 @@ define ROOTFS_CPIO_CMD
 	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
 endef
 
+# mkimage supports arm avr32 blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
+# KERNEL_ARCH can be arm64 arc arm avr32 blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
+# For arm64, arc, xtensa we'll just keep KERNEL_ARCH
+# For mips64, we'll just keep mips
+# For i386 and x86_64, we need to convert
+ifeq ($(KERNEL_ARCH),x86_64)
+UIMAGE_ARCH = x86
+else ifeq ($(KERNEL_ARCH),i386)
+UIMAGE_ARCH = x86
+else
+UIMAGE_ARCH = $(KERNEL_ARCH)
+endif
+
+$(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
+	$(HOST_DIR)/usr/bin/mkimage -A $(UIMAGE_ARCH) -T ramdisk \
+		-C none -d $<$(ROOTFS_CPIO_COMPRESS_EXT) $@
+
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
+ROOTFS_CPIO_POST_TARGETS += $(BINARIES_DIR)/rootfs.cpio.uboot
+endif
+
 $(eval $(call ROOTFS_TARGET,cpio))
-- 
1.8.4.rc3
