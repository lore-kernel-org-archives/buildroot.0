From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jun 2015 22:14:46 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: add option to
	install DTB overlays
Message-ID: <20150629202339.D8E9680F63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c22744542a23299732078c12641a17597e6127da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, Buildroot does not support building the overlays that are
bundled in the Linux kernel, so all we can do is install the ones
pre-built in rpi-firmware.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-firmware/Config.in       |    8 ++++++++
 package/rpi-firmware/rpi-firmware.mk |    6 ++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 179fb47..a060b4e 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -56,5 +56,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	  and enable BR2_LINUX_KERNEL_DTS_SUPPORT to let the kernel build
 	  the DTB.
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
+	bool "Install DTB overlays"
+	depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS \
+		|| BR2_LINUX_KERNEL_DTS_SUPPORT
+	default y
+	help
+	  Say 'y' here if you need to load one or more of the DTB overlays,
+	  to support HATs (Hardware Attached on Top, add-on modules).
 
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 9cccb38..0533588 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -18,6 +18,11 @@ define RPI_FIRMWARE_INSTALL_DTB
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b-plus.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b-plus.dtb
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2709-rpi-2-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2709-rpi-2-b.dtb
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS),y)
+define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	for ovldtb in  $(@D)/boot/overlays/*.dtb; do \
 		$(INSTALL) -D -m 0644 $${ovldtb} $(BINARIES_DIR)/rpi-firmware/overlays/$${ovldtb##*/} || exit 1; \
 	done
@@ -31,6 +36,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 	$(RPI_FIRMWARE_INSTALL_DTB)
+	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
 
 # We have no host sources to get, since we already
