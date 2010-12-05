From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:23 +0100
Subject: [Buildroot] [PATCH 52/55] linux: add support for ELF vmlinux image
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a85c092d9b4fe5b0bdd7363e7391883d4bc60e1a.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ELF vmlinux image found at the root of the kernel source tree is
the format that Qemu needs when emulating mips(el) or ppc targets, so
add support for it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    4 ++++
 linux/linux.mk  |    6 ++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 066723f..0fa5088 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -129,6 +129,10 @@ config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
 
+config BR2_LINUX_KERNEL_VMLINUX
+	bool "vmlinux"
+	depends on BR2_mips || BR2_mipsel
+
 endchoice
 
 endif # BR2_LINUX_KERNEL
diff --git a/linux/linux.mk b/linux/linux.mk
index ca4b21c..fe2ec37 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -40,13 +40,19 @@ else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
 LINUX26_IMAGE_NAME=zImage
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX26_IMAGE_NAME=vmlinux.bin
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
+LINUX26_IMAGE_NAME=vmlinux
 endif
 
+ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/$(LINUX26_IMAGE_NAME)
+else
 ifeq ($(KERNEL_ARCH),avr32)
 LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
 else
 LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
 endif
+endif # BR2_LINUX_KERNEL_VMLINUX
 
 # Download
 $(LINUX26_DIR)/.stamp_downloaded:
-- 
1.7.0.4
