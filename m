From: Gary Coulbourne <bear@bears.org>
Date: Mon, 3 Dec 2012 16:43:08 -0500
Subject: [Buildroot] [PATCH] Add support for dtb file in /boot directory on
	target
Message-ID: <CAEnpE0x7wD8R4WSyt_Sk7fSFb8Z2vq2G+te1pdLe+=ihbi3rQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Howdy!

I'm using u-boot, and loading both the kernel image and the dtb from /boot
on my target.  I added support for this, and am
submitting the patch should it be useful to anyone else.

---
 linux/Config.in |    6 ++++++
 linux/linux.mk  |    7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index f408ad5..d5ffa57 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -283,6 +283,12 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
          /boot in the target root filesystem, as is typically done on
          x86/x86_64 systems.

+config BR2_LINUX_DEVICE_TREE_INSTALL_TARGET
+        bool "Install Device Tree to /boot in target"
+        depends on BR2_LINUX_KERNEL_DTS_SUPPORT
+       help
+         Select this option to have the device tree installed to
+          /boot in the target root filesystem.

 # Linux extensions
 source "linux/Config.ext.in"
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..8778c35 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -208,6 +208,12 @@ define LINUX_APPEND_DTB
 endef
 endif

+ifeq ($(BR2_LINUX_DEVICE_TREE_INSTALL_TARGET),y)
+define LINUX_DEVICE_TREE_INSTALL_TARGET
+       install -m 0644 -D $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb
$(TARGET_DIR)/boot/$(KERNEL_DTS_NAME).dtb
+endef
+endif
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
@@ -244,6 +250,7 @@ endef
 define LINUX_INSTALL_TARGET_CMDS
        $(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
        $(LINUX_INSTALL_DTB)
+       $(LINUX_DEVICE_TREE_INSTALL_TARGET)
        # Install modules and remove symbolic links pointing to build
        # directories, not relevant on the target
        @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then      \
-- 
1.7.10.4


Peace,
Gary
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121203/89b6ad10/attachment-0001.html>
