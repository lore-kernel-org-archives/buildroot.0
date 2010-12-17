From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] linux: add support for ELF
	vmlinux image
Message-ID: <20101217160205.E288F8E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=71c05023d7439658e5ba919025ab1c9ca4321d14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ELF vmlinux image found at the root of the kernel source tree is
the format that Qemu needs when emulating mips(el) or ppc targets, so
add support for it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    4 ++++
 linux/linux.mk  |    6 ++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4ded38b..5e28b44 100644
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
index 40109ac..86d7e26 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -39,13 +39,19 @@ else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
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
1.7.2.2
