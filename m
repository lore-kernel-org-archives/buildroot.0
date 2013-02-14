From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Thu, 14 Feb 2013 15:27:54 +0100
Subject: [Buildroot] [PATCH] linux: Install the device tree in /boot when
	installing the kernel
Message-ID: <1360852074-22050-1-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option BR2_LINUX_KERNEL_INSTALL_TARGET used to install the kernel in
/boot in the rootfs. The introduction of the device tree builds made it
possible to generate device tree blobs, and stored them in IMAGES_DIR
like the kernel, but didn't copy the dtb in /boot when _INSTALL_TARGET
was enabled.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
When having a DT-enabled kernel started from /boot, the current behaviour
is broken right now, so this patch should probably go into the next release. 

 linux/linux.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index fe5f738..12573ad 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -198,6 +198,13 @@ define LINUX_INSTALL_DTB
 		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
 		$(BINARIES_DIR)/
 endef
+define LINUX_INSTALL_DTB_TARGET
+	# dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
+	cp $(addprefix \
+		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
+		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
+		$(TARGET_DIR)/boot/
+endef
 endif
 endif
 
@@ -237,6 +244,7 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
 define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 	install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
+	$(LINUX_INSTALL_DTB_TARGET)
 endef
 endif
 
-- 
1.7.10.4
