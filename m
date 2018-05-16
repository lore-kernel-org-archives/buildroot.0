From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 16 May 2018 11:16:05 +0200
Subject: [Buildroot] [PATCH] imx_usb_loader: Allow target build
Message-ID: <1526462165-1544-1-git-send-email-vincent.prince.fr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 package/Config.in                        |  1 +
 package/imx-usb-loader/Config.in         | 10 ++++++++++
 package/imx-usb-loader/imx-usb-loader.mk |  8 ++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/imx-usb-loader/Config.in

diff --git a/package/Config.in b/package/Config.in
index 2be6c64..3cf53ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -186,6 +186,7 @@ menu "Filesystem and flash utilities"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
+	source "package/imx-usb-loader/Config.in"
 	source "package/mfgtools/Config.in"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
diff --git a/package/imx-usb-loader/Config.in b/package/imx-usb-loader/Config.in
new file mode 100644
index 0000000..41585e2
--- /dev/null
+++ b/package/imx-usb-loader/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_IMX_USB_LOADER
+	bool "imx-usb-loader"
+	depends on BR2_arm
+    select BR2_PACKAGE_LIBUSB
+	help
+	  This package contains tools to download and execute code
+	  on Freescale i.MX5/i.MX6 and Vybrid SoCs through the
+	  Serial Download Protocol.
+
+	  https://github.com/boundarydevices/imx_usb_loader
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 946a1f3..22698dd 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -8,14 +8,22 @@ IMX_USB_LOADER_VERSION = 7e77787c83288a421080a9bf2f67063931f561be
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPL-2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
+IMX_USB_LOADER_DEPENDENCIES = libusb 
 HOST_IMX_USB_LOADER_DEPENDENCIES = host-libusb host-pkgconf
 
+define IMX_USB_LOADER_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
 define HOST_IMX_USB_LOADER_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
+define IMX_USB_LOADER_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(TARGET_DIR) install
+endef
 define HOST_IMX_USB_LOADER_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
-- 
2.7.4
