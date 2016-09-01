From: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
Date: Wed, 31 Aug 2016 20:58:49 -0400
Subject: [Buildroot] [PATCH 1/2] ts4900-fpga: add ts4900-fpga package
In-Reply-To: <1472691530-17643-1-git-send-email-mathieu.audat@savoirfairelinux.com>
References: <1472691530-17643-1-git-send-email-mathieu.audat@savoirfairelinux.com>
Message-ID: <1472691530-17643-2-git-send-email-mathieu.audat@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is responsible from downloading and deploying bitstream for
TS-4900's FPGA. It implements clocks, UART MUX, and GPIOs. One of these
GPIOs is used to enable the wifi module.

It is loaded by U-Boot during the boot sequence, which expects to find
it in the /boot folder.

Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
---
 package/Config.in                    |  1 +
 package/ts4900-fpga/Config.in        |  6 ++++++
 package/ts4900-fpga/ts4900-fpga.hash |  2 ++
 package/ts4900-fpga/ts4900-fpga.mk   | 18 ++++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/ts4900-fpga/Config.in
 create mode 100644 package/ts4900-fpga/ts4900-fpga.hash
 create mode 100644 package/ts4900-fpga/ts4900-fpga.mk

diff --git a/package/Config.in b/package/Config.in
index 1e51a45..a20a84c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -334,6 +334,7 @@ menu "Firmware"
 	source "package/linux-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
+	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc1000-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/ts4900-fpga/Config.in b/package/ts4900-fpga/Config.in
new file mode 100644
index 0000000..05d458f
--- /dev/null
+++ b/package/ts4900-fpga/Config.in
@@ -0,0 +1,6 @@
+menuconfig BR2_PACKAGE_TS4900_FPGA
+	bool "ts4900-fpga"
+	help
+	  TS4900 board needs a .bin file to use the fpga.
+	  Download it and install it in /boot
+
diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
new file mode 100644
index 0000000..6e7c812
--- /dev/null
+++ b/package/ts4900-fpga/ts4900-fpga.hash
@@ -0,0 +1,2 @@
+# From ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga/ts4900-fpga-20150326.bin.md5
+md5 630a108d8c1af527101ee6559949b761  ts4900-fpga-20150326.bin
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
new file mode 100644
index 0000000..d487dd2
--- /dev/null
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ts4900-fpga
+#
+################################################################################
+
+TS4900_FPGA_VERSION = 20150326
+TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
+TS4900_FPGA_SITE = ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga/
+
+TS4900_FPGA_INSTALL_IMAGES = YES
+TS4900_FPGA_EXTRACT_CMDS =
+
+define TS4900_FPGA_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0644 $(DL_DIR)/$(TS4900_FPGA_SOURCE) $(TARGET_DIR)/boot/ts4900-fpga.bin
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
