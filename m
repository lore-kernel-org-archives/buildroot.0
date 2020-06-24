From: =?UTF-8?q?St=C3=A9phane=20Veyret?= <sveyret@gmail.com>
Date: Wed, 24 Jun 2020 21:35:31 +0200
Subject: [Buildroot] [PATCH v2] rpi-firmware: do not rename startup files
Message-ID: <20200624193531.27761-1-sveyret@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bug: 13026

When booting, a Raspberry Pi will load the appropriate start files,
depending on the provided configuration. For example, if the config.txt
file contains:
gpu_mem=16
the board will automatically load the cut-down startup files
(start_cd.elf and fixup_cd.dat on non-Rpi4).

Unfortunately, even when the appropriate version is selected in the
configuration menu (in this example,
BR2_PACKAGE_RPI_FIRMWARE_BOOT="_cd") if the rpi-firmware makefile takes
the good files, it renames them to non-qualified, i.e. start.elf and
fixup.dat. But as these are not the files searched by the Raspberry Pi,
the board will not start.

Signed-off-by: St?phane Veyret <sveyret@gmail.com>

---
Changes v1 -> v2:
  - update config.txt instead of keeping firmware name, as suggested by
    Yann E. MORIN. Note that this requires to update the name anyway
    for RPi 4.
---
 package/rpi-firmware/config.txt      | 5 +++++
 package/rpi-firmware/rpi-firmware.mk | 4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
index 58cc966a87..8121624a78 100644
--- a/package/rpi-firmware/config.txt
+++ b/package/rpi-firmware/config.txt
@@ -18,3 +18,8 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# We always use the same name, the real used variant is selected by
+# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD}
+start_file=start.elf
+fixup_file=fixup.dat
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 6ad67ab0e5..b412b08cff 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -44,8 +44,8 @@ endif # INSTALL_VCDBG
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
 # bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
 define RPI_FIRMWARE_INSTALL_BOOT
-	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start4.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup4.dat
+	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
 endef
 else
 define RPI_FIRMWARE_INSTALL_BOOT
-- 
2.26.2
