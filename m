From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:58:06 +0200
Subject: [Buildroot] [git commit] ts4900-fpga: add ts4900-fpga package
Message-ID: <20160918145837.EAEF08030B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57cc20810a8ff6d40566a3527a0634cab44ad2b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is responsible from downloading and deploying bitstream for
TS-4900's FPGA. It implements clocks, UART MUX, and GPIOs. One of these
GPIOs is used to enable the wifi module.

It is loaded by U-Boot during the boot sequence, the default U-boot
script expects to find it in the /boot folder.

Signed-off-by: Mathieu Audat <mathieu.audat@savoirfairelinux.com>
[Thomas:
 - Use "config" instead of "menuconfig" since there's a single option
   and no sub-options.
 - Add BR2_arm dependency, since it's only used on a specific i.MX6
   platform.
 - Implement TS4900_FPGA_EXTRACT_CMDS that copy the file to the package
   build directory $(@D)
 - Change the install command to copy from $(@D) instead of from
   $(DL_DIR)
 - Change the install command to remove the 'mkdir -p
   $(TARGET_DIR)/boot' and instead just use the -D option of the install
   program that creates the destination directory if it doesn't exist.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/ts4900-fpga/Config.in        | 12 ++++++++++++
 package/ts4900-fpga/ts4900-fpga.hash |  5 +++++
 package/ts4900-fpga/ts4900-fpga.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d571b89..e30ce22 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -333,6 +333,7 @@ menu "Firmware"
 	source "package/linux-firmware/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
+	source "package/ts4900-fpga/Config.in"
 	source "package/ux500-firmware/Config.in"
 	source "package/wilc1000-firmware/Config.in"
 	source "package/zd1211-firmware/Config.in"
diff --git a/package/ts4900-fpga/Config.in b/package/ts4900-fpga/Config.in
new file mode 100644
index 0000000..7910631
--- /dev/null
+++ b/package/ts4900-fpga/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TS4900_FPGA
+	bool "ts4900-fpga"
+	depends on BR2_arm
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
index 0000000..2147aeb
--- /dev/null
+++ b/package/ts4900-fpga/ts4900-fpga.hash
@@ -0,0 +1,5 @@
+# From ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4900-linux/fpga/ts4900-fpga-20150930.bin.md5
+md5 bf93c03ef914cf008287c8cd60781cc8  ts4900-fpga-20150930.bin
+
+# Locally calculated
+sha256 242ac6a90bea9a95c937ea8952cdc9b02f543cea24a0359bed66a408a6dd8bf9 ts4900-fpga-20150930.bin
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
new file mode 100644
index 0000000..e0d351f
--- /dev/null
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -0,0 +1,24 @@
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
+
+define TS4900_FPGA_EXTRACT_CMDS
+	cp $(DL_DIR)/$(TS4900_FPGA_SOURCE) $(@D)
+endef
+
+define TS4900_FPGA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/$(TS4900_FPGA_SOURCE) $(TARGET_DIR)/boot/ts4900-fpga.bin
+endef
+
+$(eval $(generic-package))
