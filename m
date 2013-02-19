From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 23:30:10 +0100
Subject: [Buildroot] [git commit] linux: Install the device tree in /boot
	when installing the kernel
Message-ID: <20130220155358.C396F9ABEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88d350ca3ccdd91fd78ecf3e24e31e27726c5bc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option BR2_LINUX_KERNEL_INSTALL_TARGET used to install the kernel in
/boot in the rootfs. The introduction of the device tree builds made it
possible to generate device tree blobs, and stored them in IMAGES_DIR
like the kernel, but didn't copy the dtb in /boot when _INSTALL_TARGET
was enabled.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 91a9f50..0352acd 100644
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
 
@@ -234,6 +241,7 @@ endef
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
 define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 	install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
+	$(LINUX_INSTALL_DTB_TARGET)
 endef
 endif
 
