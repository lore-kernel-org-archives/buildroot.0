From: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
Date: Sat, 17 Sep 2016 16:23:23 -0400
Subject: [Buildroot] [PATCH v2 1/2] ts4900-fpga: add ts4900-fpga package
In-Reply-To: <1474143804-19181-1-git-send-email-mathieu.audat@savoirfairelinux.com>
References: <1474143804-19181-1-git-send-email-mathieu.audat@savoirfairelinux.com>
Message-ID: <1474143804-19181-2-git-send-email-mathieu.audat@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is responsible from downloading and deploying bitstream for
TS-4900's FPGA. It implements clocks, UART MUX, and GPIOs. One of these
GPIOs is used to enable the wifi module.

It is loaded by U-Boot during the boot sequence, the default U-boot
script expects to find it in the /boot folder.

Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
---
 package/Config.in                    |  1 +
 package/ts4900-fpga/Config.in        | 11 +++++++++++
 package/ts4900-fpga/ts4900-fpga.hash |  5 +++++
 package/ts4900-fpga/ts4900-fpga.mk   | 22 ++++++++++++++++++++++
 4 files changed, 39 insertions(+)
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
index 0000000..8711718
--- /dev/null
+++ b/package/ts4900-fpga/Config.in
@@ -0,0 +1,11 @@
+menuconfig BR2_PACKAGE_TS4900_FPGA
+	bool "ts4900-fpga"
+	help
+	  TS-4900's FPGA implements clocks, UART MUX, and GPIOs. One of these
+	  GPIOs is used to enable the wifi module.
+
+	  It is loaded by U-Boot during the boot sequence, the default U-boot
+	  script expects to find it in the /boot folder.
+
+	  http://wiki.embeddedarm.com/wiki/TS-4900#FPGA_Changelog
+
diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
new file mode 100644
index 0000000..513d569
--- /dev/null
+++ b/package/ts4900-fpga/ts4900-fpga.hash
@@ -0,0 +1,5 @@
+# From ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga/ts4900-fpga-20150930.bin.md5
+md5 bf93c03ef914cf008287c8cd60781cc8  ts4900-fpga-20150930.bin
+
+# Locally calculated
+sha256 242ac6a90bea9a95c937ea8952cdc9b02f543cea24a0359bed66a408a6dd8bf9 ts4900-fpga-20150930.bin
\ No newline at end of file
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
new file mode 100644
index 0000000..c2b5215
--- /dev/null
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# ts4900-fpga
+#
+################################################################################
+
+TS4900_FPGA_VERSION = 20150930
+TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
+TS4900_FPGA_SITE = ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
+# No license file provided, Yocto recipe from the vendor claims MIT.
+# https://github.com/embeddedarm/meta-ts/blob/f31860f1204b64f765a5380d3b93a2cf18234f90/recipes-extras/ts4900-fpga/ts4900-fpga.bb#L6
+
+TS4900_FPGA_INSTALL_IMAGES = NO
+TS4900_FPGA_INSTALL_TARGET = YES
+TS4900_FPGA_EXTRACT_CMDS =
+
+define TS4900_FPGA_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/boot
+	$(INSTALL) -m 0644 $(DL_DIR)/$(TS4900_FPGA_SOURCE) $(TARGET_DIR)/boot/ts4900-fpga.bin
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
