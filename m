From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Apr 2011 14:53:46 +0200
Subject: [Buildroot] [git commit master 1/1] linux: Add support to specify
	special Kernel Image make target
Message-ID: <20110401125622.1014981903@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e2ed6c8e77fb810915a0f45d5f711d678469511f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is useful for ARCHes like PowerPC that have a whole lot of
special targets for each different board.  The kernel image target
tells make which OpenFirmware machine description file is combined into
the kernel binary.

[Peter: fix long lines]
Signed-Off-By:  Martin Hicks <mort@bork.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |   18 ++++++++++++++++++
 linux/linux.mk  |    4 ++++
 2 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 75e574f..f7d7f88 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -133,8 +133,26 @@ config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
+	bool "custom target"
+	help
+	  For certain cases a board-specific target image must be
+	  used.  For example, on powerPC where the OpenFirmware
+	  description is attached in a board-specific kernel image
+	  target like 'cuImage.mpc8379_rdb'.
+
+	  Select this option and specify the make target in "Kernel
+	  image target name".
+
 endchoice
 
+config BR2_LINUX_KERNEL_IMAGE_TARGET_NAME
+	string "Kernel image target name"
+	depends on BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
+	help
+	  Specify the kernel make target to build the kernel that you
+	  need.
+
 endif # BR2_LINUX_KERNEL
 
 endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
index 9076fb9..90dc1dc 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -30,6 +30,9 @@ LINUX26_MAKE_FLAGS = \
 # going to be installed in the target filesystem.
 LINUX26_VERSION_PROBED = $(shell $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease)
 
+ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
+LINUX26_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 ifeq ($(KERNEL_ARCH),blackfin)
 # a uImage, but with a different file name
@@ -47,6 +50,7 @@ LINUX26_IMAGE_NAME=vmlinux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX26_IMAGE_NAME=vmlinux
 endif
+endif
 
 # Compute the arch path, since i386 and x86_64 are in arch/x86 and not
 # in arch/$(KERNEL_ARCH). Even if the kernel creates symbolic links
-- 
1.7.3.4
