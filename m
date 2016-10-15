From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 12:35:28 +0200
Subject: [Buildroot] [git commit] vexpress-firmware: new package
Message-ID: <20161015103554.BFF7C81E70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82e84a4f358c9dd2a527015d923d7b355f3a7fa5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a new package for the SCP (System Control Processor)
firmware for the ARM reference platforms. There will most likely be
other SCP firmware provided by other vendors, but they might be provided
in a different form, so we for now create a vendor-specific package
named vexpress-firmware.

Since this firmware is used for booting, we create the package in boot/
and not in package/.

The package simply installs a single pre-built binary file into the
images directory.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
[Thomas:
 - Rename the package from scpfirmware to vexpress-firmware.
 - Add a Config.in prompt for the package.
 - Remove the prompt-less Config.in options to select the Git repo and
   version. Since we only support the Vexpress firmware, there's no need
   for configurability here, so we just use the right Git repo/version
   in the .mk file.
 - Use $(INSTALL) -D to install the firmware file.
 - Add license information.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: add hash file, as suggested by Yann.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/Config.in                                |  1 +
 boot/vexpress-firmware/Config.in              |  6 ++++++
 boot/vexpress-firmware/vexpress-firmware.hash |  2 ++
 boot/vexpress-firmware/vexpress-firmware.mk   | 20 ++++++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/boot/Config.in b/boot/Config.in
index 677e5f0..6ffacc6 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -15,6 +15,7 @@ source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
+source "boot/vexpress-firmware/Config.in"
 source "boot/xloader/Config.in"
 
 endmenu
diff --git a/boot/vexpress-firmware/Config.in b/boot/vexpress-firmware/Config.in
new file mode 100644
index 0000000..8479df3
--- /dev/null
+++ b/boot/vexpress-firmware/Config.in
@@ -0,0 +1,6 @@
+config BR2_TARGET_VEXPRESS_FIRMWARE
+	bool "vexpress-firmware"
+	depends on BR2_aarch64
+	help
+	  Versatile Express firmware from ARM, with Linaro mods last
+	  change.
diff --git a/boot/vexpress-firmware/vexpress-firmware.hash b/boot/vexpress-firmware/vexpress-firmware.hash
new file mode 100644
index 0000000..40f64c7
--- /dev/null
+++ b/boot/vexpress-firmware/vexpress-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 def599c86ab3606f7f67c0190e9b237fbc0cf934a951ffb1c5fb0c47d8a8f3d2	vexpress-firmware-901f81977c3b367a2e0bf3d6444be302822d97a3.tar.gz
diff --git a/boot/vexpress-firmware/vexpress-firmware.mk b/boot/vexpress-firmware/vexpress-firmware.mk
new file mode 100644
index 0000000..693a9cb
--- /dev/null
+++ b/boot/vexpress-firmware/vexpress-firmware.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# vexpress-firmware
+#
+################################################################################
+
+VEXPRESS_FIRMWARE_VERSION = 901f81977c3b367a2e0bf3d6444be302822d97a3
+VEXPRESS_FIRMWARE_SITE = https://git.linaro.org/arm/vexpress-firmware.git
+VEXPRESS_FIRMWARE_SITE_METHOD = git
+# The only available license files are in PDF and RTF formats, and we
+# support only plain text.
+VEXPRESS_FIRMWARE_LICENSE = ARM EULA
+
+VEXPRESS_FIRMWARE_INSTALL_IMAGES = YES
+
+define VEXPRESS_FIRMWARE_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/SOFTWARE/bl30.bin $(BINARIES_DIR)/scp-fw.bin
+endef
+
+$(eval $(generic-package))
