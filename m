From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 30 Dec 2014 20:30:25 +0100
Subject: [Buildroot] [RFC] linux: add fbtft kernel extension
In-Reply-To: <1419967825-8411-1-git-send-email-ps.report@gmx.net>
References: <1419967825-8411-1-git-send-email-ps.report@gmx.net>
Message-ID: <1419967825-8411-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 linux/Config.ext.in     | 10 ++++++++++
 linux/linux.mk          |  9 +++++++++
 package/Config.in       |  1 +
 package/fbtft/Config.in | 13 +++++++++++++
 package/fbtft/fbtft.mk  | 11 +++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/fbtft/Config.in
 create mode 100644 package/fbtft/fbtft.mk

diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 40c4684..583c250 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -42,4 +42,14 @@ config BR2_LINUX_KERNEL_EXT_RTAI_PATCH
 	help
 	  Optionally, explicitly specify the RTAI patch to use.
 
+# fbtft
+config BR2_LINUX_KERNEL_EXT_FBTFT
+	bool "fbtft patch"
+	select BR2_PACKAGE_FBTFT
+	help
+	  Linux Framebuffer drivers for small TFT LCD display modules,
+	  e.g. Adafruit PiTFT displays for Raspberry Pi.
+
+	  https://github.com/notro/fbtft
+
 endmenu
diff --git a/linux/linux.mk b/linux/linux.mk
index 8256641..1fc0159 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -196,6 +196,15 @@ define LINUX_CONFIGURE_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
+	$(if $(BR2_LINUX_KERNEL_EXT_FBTFT),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_FB,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_FB_TFT,m,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_FB_TFT_ILI9340,m,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_FB_TFT_ILI9341,m,$(@D)/.config)
+		$(call KCONFIG_SET_OPT,CONFIG_FB_TFT_FBTFT_DEVICE,m,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SPI,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SPI_BCM2708,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_GPIOLIB,$(@D)/.config))
 	$(if $(BR2_PACKAGE_KTAP),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_DEBUG_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_EVENT_TRACING,$(@D)/.config)
diff --git a/package/Config.in b/package/Config.in
index 3b37bb2..c658a28 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -311,6 +311,7 @@ endif
 	source "package/evemu/Config.in"
 	source "package/evtest/Config.in"
 	source "package/fan-ctrl/Config.in"
+	source "package/fbtft/Config.in"
 	source "package/fconfig/Config.in"
 	source "package/fis/Config.in"
 	source "package/flashrom/Config.in"
diff --git a/package/fbtft/Config.in b/package/fbtft/Config.in
new file mode 100644
index 0000000..eceea85
--- /dev/null
+++ b/package/fbtft/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FBTFT
+	bool "fbtft"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Linux Framebuffer drivers for small TFT LCD display modules,
+	  e.g. Adafruit PiTFT displays for Raspberry Pi.
+
+	  This is only the download helper for the kernel patch.
+
+	  https://github.com/notro/fbtft
+
+comment "fbtft needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/fbtft/fbtft.mk b/package/fbtft/fbtft.mk
new file mode 100644
index 0000000..9f46bdb
--- /dev/null
+++ b/package/fbtft/fbtft.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# fbtft
+#
+################################################################################
+
+FBTFT_VERSION = 274035404701245e7491c0c6471c5b72ade4d491
+FBTFT_SITE = $(call github,notro,fbtft,$(FBTFT_VERSION))
+FBTFT_LICENSE = GPLv2+
+
+$(eval $(generic-package))
-- 
2.1.2
