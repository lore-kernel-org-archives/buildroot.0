From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:25:12 +0200
Subject: [Buildroot] [PATCH 03/11] package/rpi-firmware: add option to
	install vcdbg
In-Reply-To: <cover.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <25be3e9b3870c3da9f16aa6bb24eedcfcf1c4892.1435529863.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vcdbg is a tool to help debug the communication with the GPU.
It comes as a binary-only, and in two flavours: one for the hard
floating point ABI, one for the software floating poitn ABI.

Unfortunately, we have no source code for that tool, only a binary
that was dynamically linked with glibc and libraries from rpi-userland.

So, just install that executable, and let's hope there is no symbol
issue at runtime.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc; Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 package/rpi-firmware/Config.in       | 9 +++++++++
 package/rpi-firmware/rpi-firmware.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index a060b4e..d1856f0 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -65,4 +65,13 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	  Say 'y' here if you need to load one or more of the DTB overlays,
 	  to support HATs (Hardware Attached on Top, add-on modules).
 
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG
+	bool "vcdbg"
+	depends on BR2_PACKAGE_RPI_USERLAND
+	help
+	  Install vcdbg, to help debug communication with the GPU.
+
+comment "vcdbg needs rpi-userland"
+	depends on !BR2_PACKAGE_RPI_USERLAND
+
 endif # BR2_PACKAGE_RPI_FIRMWARE
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 0533588..65ee6fb 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -29,6 +29,13 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
+define RPI_FIRMWARE_INSTALL_TARGET_CMDS
+	$(INSTALL) -d -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
+		$(TARGET_DIR)/usr/sbin/vcdbg
+endef
+endif # INSTRALL_VCDBG
+
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
 	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-- 
1.9.1
