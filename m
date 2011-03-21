From: Martin Hicks <mort@bork.org>
Date: Mon, 21 Mar 2011 13:39:43 -0400
Subject: [Buildroot] [PATCH] Add support to specify special Kernel Image
	make target
Message-ID: <1300729183-29401-1-git-send-email-mort@bork.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is useful for ARCHes like PowerPC that have a whole lot of
special targets for each different board.  The kernel image target
tells make which OpenFirmware machine description file is combined into
the kernel binary.

Signed-Off-By:  Martin Hicks <mort@bork.org>
---
 linux/Config.in |   15 +++++++++++++++
 linux/linux.mk  |    4 ++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 815d445..43d1047 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -146,8 +146,23 @@ config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
+	bool "custom target"
+	help
+	  For certain cases a board-specific target image must be used.  For example,
+	  on powerPC where the OpenFirmware description is attached in a board-specific
+	  kernel image target like 'cuImage.mpc8379_rdb'.
+
+	  Select this option and specify the make target in "Kernel image target name".
+
 endchoice
 
+config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
+	string "Kernel image target name"
+	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
+	help
+	  Specify the kernel make target to build the kernel that you need.
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
index d94a97a..1f21b71 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -38,6 +38,9 @@ LINUX26_MAKE_FLAGS = \
 # going to be installed in the target filesystem.
 LINUX26_VERSION_PROBED = $(shell $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease)
 
+ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
+LINUX26_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 ifeq ($(KERNEL_ARCH),blackfin)
 # a uImage, but with a different file name
@@ -55,6 +58,7 @@ LINUX26_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX26_IMAGE_NAME=vmlinux
 endif
+endif
 
 # Compute the arch path, since i386 and x86_64 are in arch/x86 and not
 # in arch/$(KERNEL_ARCH). Even if the kernel creates symbolic links
-- 
1.5.6.5
