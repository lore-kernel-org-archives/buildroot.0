From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Thu, 22 Apr 2021 16:40:30 -0500
Subject: [Buildroot] [PATCH v2] linux: allow firmware to be included in
 kernel
Message-ID: <20210422214030.70343-1-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add functionality to use the kernel's built-in options to allow binary
blobs to be included with the kernel. This is equivalent to the blobs
existing in /lib/firmware, however are available earlier in the boot
process. This may be useful in situations where a device probes before
the rootfs is fully available (such as a squashfs not being loaded
before a usb device probing).

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
---
 linux/Config.in | 20 ++++++++++++++++++++
 linux/linux.mk  |  7 ++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2460c3f124..570f42e87d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -479,6 +479,26 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
 	  CONFIG_UNWINDER_ORC=y, please install libelf-dev,
 	  libelf-devel or elfutils-libelf-devel".
 
+config BR2_LINUX_KERNEL_EXTRA_FIRMWARE
+	bool "Build firmware binaries into the kernel"
+	help
+	  Include the firmware from linux-firmware into the kernel
+	  using the CONFIG_EXTRA_FIRMWARE option.
+
+	  WARNING: If you include additional firmware files into your
+	  binary kernel image that are not available under the terms
+	  of the GPL, then it may be a violation of the GPL to
+	  distribute the resulting image since it combines both GPL
+	  and non-GPL work. You should consult a lawyer of your own
+	  before distributing such an image.
+
+config BR2_LINUX_KERNEL_EXTRA_FIRMWARE_BINARIES
+	string "External firmware blobs to build into the kernel binary"
+	depends on BR2_LINUX_KERNEL_EXTRA_FIRMWARE
+	help
+	  Space delimited list of firmware to be built into the kernel.
+	  These files must exist in the target's /lib/firmware.
+
 # Linux extensions
 source "linux/Config.ext.in"
 
diff --git a/linux/linux.mk b/linux/linux.mk
index b67f739ca0..d581dd7f5d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -78,7 +78,8 @@ LINUX_MAKE_ENV = \
 
 LINUX_INSTALL_IMAGES = YES
 LINUX_DEPENDENCIES += host-kmod \
-	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode)
+	$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
+	$(if $(BR2_LINUX_KERNEL_EXTRA_FIRMWARE),linux-firmware)
 
 # Starting with 4.16, the generated kconfig paser code is no longer
 # shipped with the kernel sources, so we need flex and bison, but
@@ -384,6 +385,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
+	$(if $(BR2_LINUX_KERNEL_EXTRA_FIRMWARE),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_FIRMWARE_IN_KERNEL)
+		$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE,$(BR2_LINUX_KERNEL_EXTRA_FIRMWARE_BINARIES))
+		$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$(TARGET_DIR)/lib/firmware"))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 
-- 
2.17.1
