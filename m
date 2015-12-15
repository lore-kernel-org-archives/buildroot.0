From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:42:06 +0100
Subject: [Buildroot] [git commit] linux: add support for vmlinuz.bin kernel
	image format
Message-ID: <20151215204244.6EEF781DBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9d2d02402ee0737739fc878f0bb30a587c37c09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Linux for MIPS supports raw binary zboot image (vmlinuz.bin).
Add it to the "Kernel binary format" list.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 4 ++++
 linux/linux.mk  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 2704ab6..8faf1c8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -249,6 +249,10 @@ config BR2_LINUX_KERNEL_VMLINUZ
 	bool "vmlinuz"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_VMLINUZ_BIN
+	bool "vmlinuz.bin"
+	depends on BR2_mips || BR2_mipsel
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index dd2cc49..f95bc58 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -139,6 +139,8 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_NAME = vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME = vmlinuz
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_BIN),y)
+LINUX_IMAGE_NAME = vmlinuz.bin
 endif
 # The if-else blocks above are all the image types we know of, and all
 # come from a Kconfig choice, so we know we have LINUX_IMAGE_NAME set
@@ -167,6 +169,8 @@ ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_BIN),y)
+LINUX_IMAGE_PATH = $(LINUX_DIR)/$(LINUX_IMAGE_NAME)
 else
 LINUX_IMAGE_PATH = $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
 endif # BR2_LINUX_KERNEL_VMLINUX
