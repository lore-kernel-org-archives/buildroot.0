From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Nov 2013 00:12:35 +0100
Subject: [Buildroot] [PATCH 7/7] uboot-tools: factor out common mkimage
	infrastructure
In-Reply-To: <1383779555-9222-1-git-send-email-arnout@mind.be>
References: <1383779555-9222-1-git-send-email-arnout@mind.be>
Message-ID: <1383779555-9222-8-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2:
- Initial revision. This patch was introduced as cleanup of the patch that
  introduced the U-Boot image of the cpio rootfs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 fs/cpio/cpio.mk                    | 15 +--------------
 linux/linux.mk                     |  4 ++--
 package/uboot-tools/uboot-tools.mk | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index e39e215..771306c 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -31,21 +31,8 @@ define ROOTFS_CPIO_CMD
 	cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $@
 endef
 
-# mkimage supports arm avr32 blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
-# KERNEL_ARCH can be arm64 arc arm avr32 blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
-# For arm64, arc, xtensa we'll just keep KERNEL_ARCH
-# For mips64, we'll just keep mips
-# For i386 and x86_64, we need to convert
-ifeq ($(KERNEL_ARCH),x86_64)
-UIMAGE_ARCH = x86
-else ifeq ($(KERNEL_ARCH),i386)
-UIMAGE_ARCH = x86
-else
-UIMAGE_ARCH = $(KERNEL_ARCH)
-endif
-
 $(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
-	$(HOST_DIR)/usr/bin/mkimage -A $(UIMAGE_ARCH) -T ramdisk \
+	$(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk \
 		-C none -d $<$(ROOTFS_CPIO_COMPRESS_EXT) $@
 
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
diff --git a/linux/linux.mk b/linux/linux.mk
index 5df934c..cee52ce 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -231,9 +231,9 @@ ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 # of the image. To do so, we first need to retrieve both load
 # address and entry point for the kernel from the already
 # generate uboot image before using mkimage -l.
-LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(HOST_DIR)/usr/bin/mkimage -l $(LINUX_IMAGE_PATH) |\
+LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) |\
         sed -n -e 's/Image Name:[ ]*\(.*\)/-n \1/p' -e 's/Load Address:/-a/p' -e 's/Entry Point:/-e/p'`; \
-        $(HOST_DIR)/usr/bin/mkimage -A $(KERNEL_ARCH) -O linux \
+        $(MKIMAGE) -A $(MKIMAGE_ARCH) -O linux \
         -T kernel -C none $${MKIMAGE_ARGS} \
         -d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
 endif
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 73e1d32..7687814 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -64,3 +64,21 @@ endef
 
 $(eval $(generic-package))
 $(eval $(host-generic-package))
+
+# Convenience variables for other mk files that make use of mkimage
+
+MKIMAGE = $(HOST_DIR)/usr/bin/mkimage
+
+# mkimage supports arm avr32 blackfin m68k microblaze mips mips64 nios2 powerpc ppc sh sparc sparc64 x86
+# KERNEL_ARCH can be arm64 arc arm avr32 blackfin m68k microblaze mips nios2 powerpc sh sparc i386 x86_64 xtensa
+# For arm64, arc, xtensa we'll just keep KERNEL_ARCH
+# For mips64, we'll just keep mips
+# For i386 and x86_64, we need to convert
+ifeq ($(KERNEL_ARCH),x86_64)
+MKIMAGE_ARCH = x86
+else ifeq ($(KERNEL_ARCH),i386)
+MKIMAGE_ARCH = x86
+else
+MKIMAGE_ARCH = $(KERNEL_ARCH)
+endif
+
-- 
1.8.4.rc3
