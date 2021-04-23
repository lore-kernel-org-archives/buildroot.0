From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Fri, 23 Apr 2021 13:58:42 -0500
Subject: [Buildroot] [PATCH v3 1/1] linux: allow firmware to be included in
 kernel
Message-ID: <20210423185842.50143-1-sam.voss@rockwellcollins.com>
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

v2->v3:
  Rebase onto master, take master's dependency of linux-firmware in all
  cases where enabled.

v1->v2:
  Add warning for GPL implications of building a blog into kernel.

 linux/Config.in | 20 ++++++++++++++++++++
 linux/linux.mk  |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index cf790963dd..d6ad91db1a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -470,6 +470,26 @@ config BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF
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
index 1457228eb9..59f876c41e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -372,6 +372,10 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FB)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_LOGO_LINUX_CLUT224))
+	$(if $(BR2_LINUX_KERNEL_EXTRA_FIRMWARE),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_FIRMWARE_IN_KERNEL)
+		$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE,$(BR2_LINUX_KERNEL_EXTRA_FIRMWARE_BINARIES))
+		$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$(TARGET_DIR)/lib/firmware"))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
 	$(PACKAGES_LINUX_CONFIG_FIXUPS)
 endef
-- 
2.17.1
