From: Andi Shyti <andi.shyti@gmail.com>
Date: Sun, 26 Jun 2016 17:07:41 +0300
Subject: [Buildroot] [PATCH 1/2] package: add Odroid BL bootloader binaries
In-Reply-To: <1466950062-31783-1-git-send-email-andi@etezian.org>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
Message-ID: <1466950062-31783-2-git-send-email-andi@etezian.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The odroid boot process requires three stages of boot plus trust
zone:

	boot level 1

	    |
	    V

	boot level 2

	    |
	    V

	 u-boot

and they need to be raw copied to the SD card in the following
order:

	+----------------+----------------+
	| boot level 1   | 1 block        |
	+----------------+----------------+
	| boot level 2   | 31 block       |
	+----------------+----------------+
	| u-boot         | 63 block       |
	+----------------+----------------+
	| trust zone     | 2111 block     |
	+----------------+----------------+
	| boot partition | 4096 block     |
	+----------------+----------------+
	| rootfs         |                |
	+----------------+----------------+

The above files are provided by the hardkernel u-boot from

 https://github.com/hardkernel/u-boot/tree/odroidxu3-v2012.07

At the end of the compilation the files will be moved to the
output/image directory.

Signed-off-by: Andi Shyti <andi@etezian.org>
---
 package/Config.in                    |  1 +
 package/odroid-xu-bl/Config.in       |  6 ++++++
 package/odroid-xu-bl/odroid-xu-bl.mk | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/odroid-xu-bl/Config.in
 create mode 100644 package/odroid-xu-bl/odroid-xu-bl.mk

diff --git a/package/Config.in b/package/Config.in
index a2a02a8..a596b7e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -337,6 +337,7 @@ menu "Firmware"
 	source "package/am33x-cm3/Config.in"
 	source "package/b43-firmware/Config.in"
 	source "package/linux-firmware/Config.in"
+	source "package/odroid-xu-bl/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
 	source "package/ux500-firmware/Config.in"
diff --git a/package/odroid-xu-bl/Config.in b/package/odroid-xu-bl/Config.in
new file mode 100644
index 0000000..74d5fe2
--- /dev/null
+++ b/package/odroid-xu-bl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ODROID_XU_BL
+	bool "odroid-xu-bl"
+	help
+	  Odroid XU3/4 bootloader binaries
+
+	  https://github.com/hardkernel/u-boot/tree/odroidxu3-v2012.07
diff --git a/package/odroid-xu-bl/odroid-xu-bl.mk b/package/odroid-xu-bl/odroid-xu-bl.mk
new file mode 100644
index 0000000..68645e9
--- /dev/null
+++ b/package/odroid-xu-bl/odroid-xu-bl.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# odroid-xu-bl
+#
+################################################################################
+
+ODROID_XU_BL_VERSION = odroidxu3-v2012.07
+ODROID_XU_BL_SITE = $(call github,hardkernel,u-boot,$(ODROID_XU_BL_VERSION))
+ODROID_XU_BL_INSTALL_IMAGES = YES
+ODROID_XU_BL_INSTALL_TARGET = NO
+
+define ODROID_XU_BL_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/sd_fuse/hardkernel_1mb_uboot/bl1.bin.hardkernel $(BINARIES_DIR)/bl1.bin.hardkernel
+	$(INSTALL) -D -m 0644 $(@D)/sd_fuse/hardkernel_1mb_uboot/bl2.bin.hardkernel.1mb_uboot $(BINARIES_DIR)/bl2.bin.hardkernel.1mb_uboot
+	$(INSTALL) -D -m 0644 $(@D)/sd_fuse/hardkernel_1mb_uboot/tzsw.bin.hardkernel $(BINARIES_DIR)/tzsw.bin.hardkernel
+endef
+
+$(eval $(generic-package))
-- 
2.8.1
