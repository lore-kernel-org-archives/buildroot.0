From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:41:21 +0200
Subject: [Buildroot] [git commit branch/next] imx-usb-loader: allow building
 the target variant
Message-ID: <20180519204049.6060B8B894@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=430ac895487dda261e6f68a066fd27847165d545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Having imx-usb-loader on the target might be useful when you're
building a system that itself will be responsible for booting/flashing
i.MX based devices.

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
[Thomas:
 - improve commit log
 - fix indentation
 - drop BR2_arm dependency
 - add missing host-pkgconf dependency
 - fix prefix variable to install in $(TARGET_DIR)/usr]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                        |  1 +
 package/imx-usb-loader/Config.in         |  9 +++++++++
 package/imx-usb-loader/imx-usb-loader.mk | 10 ++++++++++
 3 files changed, 20 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1d6ddee8ec..61210cea36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -188,6 +188,7 @@ menu "Filesystem and flash utilities"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
 	source "package/genromfs/Config.in"
+	source "package/imx-usb-loader/Config.in"
 	source "package/mmc-utils/Config.in"
 	source "package/mtd/Config.in"
 	source "package/mtools/Config.in"
diff --git a/package/imx-usb-loader/Config.in b/package/imx-usb-loader/Config.in
new file mode 100644
index 0000000000..6f083f34d1
--- /dev/null
+++ b/package/imx-usb-loader/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_IMX_USB_LOADER
+	bool "imx-usb-loader"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  This package contains tools to download and execute code
+	  on Freescale i.MX5/i.MX6 and Vybrid SoCs through the
+	  Serial Download Protocol.
+
+	  https://github.com/boundarydevices/imx_usb_loader
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 946a1f3d55..01a654e6cf 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -8,14 +8,24 @@ IMX_USB_LOADER_VERSION = 7e77787c83288a421080a9bf2f67063931f561be
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPL-2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
+IMX_USB_LOADER_DEPENDENCIES = libusb host-pkgconf
 HOST_IMX_USB_LOADER_DEPENDENCIES = host-libusb host-pkgconf
 
+define IMX_USB_LOADER_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
 define HOST_IMX_USB_LOADER_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
+define IMX_USB_LOADER_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(TARGET_DIR)/usr install
+endef
+
 define HOST_IMX_USB_LOADER_INSTALL_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
 endef
 
+$(eval $(generic-package))
 $(eval $(host-generic-package))
