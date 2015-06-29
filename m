From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:13:56 +0200
Subject: [Buildroot] [git commit] rpi-firmware: allow disabling installation
	of binary DTBs
Message-ID: <20150629202339.CFE0D80F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c1c78adf119a6ff537b78d49f8d31d36a46c4f01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The binary .dtb files are not suitable for everyone as they are
kernel-version specific.

Reintroduce BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS option.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
[yann.morin.1998 at free.fr: don't install DTBs if kernel builds
 its own; fix default; rephrase help text]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/Config.in       |   12 ++++++++++++
 package/rpi-firmware/rpi-firmware.mk |    2 ++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index cd45be4..179fb47 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -45,4 +45,16 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X
 	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
+	bool "Install Device Tree Blobs (DTBs)"
+	depends on !BR2_LINUX_KERNEL_DTS_SUPPORT
+	default y
+	help
+	  If you are using a Linux kernel <= 3.18, you should say 'y' here.
+
+	  If you are using a Linux kernel >= 3.19, you should say 'n' here,
+	  and enable BR2_LINUX_KERNEL_DTS_SUPPORT to let the kernel build
+	  the DTB.
+
+
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index cbcf790..9cccb38 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -13,6 +13,7 @@ RPI_FIRMWARE_INSTALL_IMAGES = YES
 
 RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
@@ -21,6 +22,7 @@ define RPI_FIRMWARE_INSTALL_DTB
 		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
 	done
 endef
+endif
 
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
