From: Scott Ellis <scott@jumpnowtek.com>
Date: Wed, 18 Jan 2017 14:32:46 -0500 (EST)
Subject: [Buildroot] [Proposal] Build RPi dtbo overlays instead of just
	copying
Message-ID: <1484767966.594811027@apps.rackspace.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently RPi dtbo overlays come from the rpi-firmware package and are
just copies of the binaries built upstream.

The source for the dtbos are in the same github.com/raspberrypi/linux
tree that Buildroot is using for the kernel and the main board dtb.

I'm suggesting the overlay dtbos should be in sync with the kernel
and the main dtb we are using and get built at the same time.

The particular problem I want to solve is to allow my modifications 
to overlays or addition of new overlays both via standard kernel patches
get built and installed into the image.

I have a patch for this that I am already using.

I understand this is an RPi specific change to linux.mk, so I'm asking
first whether it is of interest and worthwhile submitting a patch.

It currently looks like this in my tree

diff --git a/linux/Config.in b/linux/Config.in
index f19dce1..7f0cb9d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -383,6 +383,13 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH

 endif

+config BR2_LINUX_KERNEL_DTS_OVERLAYS_SUPPORT
+       bool "Build Device Tree Overlays"
+       depends on BR2_LINUX_KERNEL_DTS_SUPPORT
+       help
+         Build in-tree device tree overlays.
+         Currently supports Raspberry Pi kernels.
+
 config BR2_LINUX_KERNEL_INSTALL_TARGET
        bool "Install kernel image to /boot in target"
        depends on !BR2_TARGET_ROOTFS_INITRAMFS
diff --git a/linux/linux.mk b/linux/linux.mk
index 7f4432e..f270e6e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -309,6 +309,13 @@ define LINUX_INSTALL_DTB
 endef
 endif # BR2_LINUX_KERNEL_APPENDED_DTB
 endif # BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
+
+ifeq ($(BR2_LINUX_KERNEL_DTS_OVERLAYS_SUPPORT),y)
+define LINUX_INSTALL_DTB_OVERLAYS
+       cp $(KERNEL_ARCH_PATH)/boot/dts/overlays/*.dtbo $(1)
+endef
+endif # BR2_LINUX_KERNEL_DTS_OVERLAYS
+
 endif # BR2_LINUX_KERNEL_DTS_SUPPORT

 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
@@ -350,6 +357,10 @@ define LINUX_BUILD_CMDS
        @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then      \
                $(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;        \
        fi
+       $(if $(BR2_LINUX_KERNEL_DTS_OVERLAYS_SUPPORT),
+               $(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) dtbs ;           \
+       )
+
        $(LINUX_BUILD_DTB)
        $(LINUX_APPEND_DTB)
 endef
@@ -373,6 +384,8 @@ ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
 define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
        $(call LINUX_INSTALL_IMAGE,$(TARGET_DIR)/boot)
        $(call LINUX_INSTALL_DTB,$(TARGET_DIR)/boot)
+       mkdir -p $(TARGET_DIR)/boot/overlays
+       $(call LINUX_INSTALL_DTB_OVERLAYS,$(TARGET_DIR)/boot/overlays)
 endef
 endif

@@ -390,6 +403,8 @@ endef
 define LINUX_INSTALL_IMAGES_CMDS
        $(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
        $(call LINUX_INSTALL_DTB,$(BINARIES_DIR))
+       mkdir -p $(BINARIES_DIR)/rpi-firmware/overlays
+       $(call LINUX_INSTALL_DTB_OVERLAYS,$(BINARIES_DIR)/rpi-firmware/overlays)
 endef

 ifeq ($(BR2_STRIP_strip),y)



And something like this to prevent the rpi-firmware package from clobbering
the dtbos just built


diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index f71991e..94ceb3b 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -21,6 +21,7 @@ define RPI_FIRMWARE_INSTALL_DTB
 endef
 endif

+ifneq ($(BR2_LINUX_KERNEL_DTS_OVERLAYS_SUPPORT),y)
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
 define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
        for ovldtb in  $(@D)/boot/overlays/*.dtbo; do \
@@ -28,6 +29,7 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
        done
 endef
 endif
+endif # BR2_LINUX_KERNEL_DTS_OVERLAYS_SUPPORT

 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
 define RPI_FIRMWARE_INSTALL_TARGET_CMDS


Probably better would be if the new BR2_LINUX_KERNEL_DTS_OVERLAYS_SUPPORT
and the existing BR2_PACKAGE_RPI_FIRMWARE_DTB_OVERLAYS vars were mutually
exclusive in the configuration. I can fix this.

At any rate, is this worth pursuing?

Best regards,
Scott
