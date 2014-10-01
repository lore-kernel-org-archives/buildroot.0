From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  1 Oct 2014 17:03:46 +0200
Subject: [Buildroot] [PATCH v2 3/3] imx-usb-loader: new package
In-Reply-To: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
References: <1412175826-9010-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1412175826-9010-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in.host                   |  1 +
 package/imx-usb-loader/Config.in.host    | 14 ++++++++++++++
 package/imx-usb-loader/imx-usb-loader.mk | 22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/imx-usb-loader/Config.in.host
 create mode 100644 package/imx-usb-loader/imx-usb-loader.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 2c88c0b..dce209f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -8,6 +8,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/imx-usb-loader/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mtd/Config.in.host"
 	source "package/mtools/Config.in.host"
diff --git a/package/imx-usb-loader/Config.in.host b/package/imx-usb-loader/Config.in.host
new file mode 100644
index 0000000..2540ea9
--- /dev/null
+++ b/package/imx-usb-loader/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_IMX_USB_LOADER
+	bool "host imx-usb-loader"
+	depends on BR2_arm || BR2_armeb
+	select BR2_PACKAGE_LIBUSB # libusb >= 1.0 is required
+	help
+	  This utility allows to download and execute code on Freescale
+	  i.MX5/i.MX6 and Vybrid SoCs through the Serial Download Protocol
+	  (SDP). Depending on the board, there is usually some kind of recovery
+	  button to bring the SoC into serial download boot mode, check
+	  documentation of your hardware.
+
+	  The utility support USB and UART as serial link.
+
+	  https://github.com/boundarydevices/imx_usb_loader
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
new file mode 100644
index 0000000..48ef35c
--- /dev/null
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# imx-uxb-loader
+#
+################################################################################
+
+IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
+IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
+IMX_USB_LOADER_LICENSE = LGPLv2.1+, LGPL (getopt.*)
+IMX_USB_LOADER_LICENSE_FILES = COPYING
+IMX_USB_LOADER_DEPENDENCIES = host-libusb
+
+define HOST_IMX_USB_LOADER_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define HOST_IMX_USB_LOADER_INSTALL_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/imx_usb $(HOST_DIR)/usr/bin
+    $(INSTALL) -D -m 0755 $(@D)/imx_uart $(HOST_DIR)/usr/bin
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
