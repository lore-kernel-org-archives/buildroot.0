From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Fri,  1 May 2015 18:15:40 +0200
Subject: [Buildroot] [PATCH v2] imx-usb-loader: new host package
Message-ID: <1430496940-18003-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This host package allows to build tools to download and execute code on
Freescale i.MX5/i.MX6 and Vybrid SoCs through the Serial Download
Protocol.

The work behind this commit was funded by ECA Group
<http://www.ecagroup.com>. ECA Group is the copyright owner of the
contributed code.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---

Since v1:
	- fixed typos
	- moved configuration files to /etc

 package/Config.in.host                   |  1 +
 package/imx-usb-loader/Config.in.host    |  9 +++++++++
 package/imx-usb-loader/imx-usb-loader.mk | 22 ++++++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 package/imx-usb-loader/Config.in.host
 create mode 100644 package/imx-usb-loader/imx-usb-loader.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 6df627f1752f..744fd43128fa 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -11,6 +11,7 @@ menu "Host utilities"
 	source "package/genext2fs/Config.in.host"
 	source "package/genimage/Config.in.host"
 	source "package/genpart/Config.in.host"
+	source "package/imx-usb-loader/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/imx-usb-loader/Config.in.host b/package/imx-usb-loader/Config.in.host
new file mode 100644
index 000000000000..aefa01b2b43b
--- /dev/null
+++ b/package/imx-usb-loader/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_IMX_USB_LOADER
+	bool "host-imx-usb loader"
+	depends on BR2_arm
+	help
+	  This package contains tools to download and execute code
+	  on Freescale i.MX5/i.MX6 and Vybrid SoCs through the
+	  Serial Download Protocol.
+
+	  https://github.com/boundarydevices/imx_usb_loader
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
new file mode 100644
index 000000000000..225492cbb8d2
--- /dev/null
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# imx-usb-loader
+#
+################################################################################
+
+IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
+IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
+IMX_USB_LOADER_LICENSE = LGPLv2.1+
+IMX_USB_LOADER_LICENSE_FILES = COPYING
+IMX_USB_LOADER_DEPENDENCIES = host-libusb
+
+define HOST_IMX_USB_LOADER_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_IMX_USB_LOADER_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)	\
+		DESTDIR=$(HOST_DIR) sysconfdir=/etc install
+endef
+
+$(eval $(host-generic-package))
-- 
2.4.0
