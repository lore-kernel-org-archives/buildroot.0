From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:29:57 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/rpi-firmware: fix
 startup file names
Message-ID: <20200716163651.75B527F8DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d92af490a51a27578aee441b8cad9169d2695b4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

When booting, a Raspberry Pi will load the appropriate start files,
depending on the provided configuration. For example, if the config.txt
file contains ???gpu_mem=16??? the board will automatically load the
cut-down startup files (start_cd.elf and fixup_cd.dat on non-Rpi4).

Unfortunately, even when the appropriate version is selected in the
configuration menu, if the rpi-firmware makefile takes the good files,
it renames them to non-qualified, i.e. start.elf and fixup.dat. But as
these are not the files searched by the Raspberry Pi, the board will not
start.

This patch will set the names of the files to load as constant in the
config.txt file. This guarantees that the rpi firmware blobs do not take
any other corner-case decision based on any other as-yet unknown
conditions.

This eases the maintenance, as only the names of the source files
matter; the destination filenames are constants, and so are the
filenames in config.txt.

Fixes: #13026

Signed-off-by: St??phane Veyret <sveyret@gmail.com>
[yann.morin.1998 at free.fr:
  - very minor fix in commit title
  - drop the non-conditional macro and move its content into
    RPI_FIRMWARE_INSTALL_IMAGES_CMDS
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1bdc0334ff6273761b2e7fda730cdcc7e1f46862)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-firmware/Config.in       |  7 ++++---
 package/rpi-firmware/config.txt      |  5 +++++
 package/rpi-firmware/rpi-firmware.mk | 15 +++++----------
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index cced53f017..f5a25c5680 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -62,11 +62,12 @@ endchoice
 
 config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 	string
-	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
+	default "4"     if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
 	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "x"     if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	default "4x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
 	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "cd"    if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	default "4cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
diff --git a/package/rpi-firmware/config.txt b/package/rpi-firmware/config.txt
index 58cc966a87..4a92a4dd95 100644
--- a/package/rpi-firmware/config.txt
+++ b/package/rpi-firmware/config.txt
@@ -4,6 +4,11 @@
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
+# We always use the same names, the real used variant is selected by
+# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
+start_file=start.elf
+fixup_file=fixup.dat
+
 kernel=zImage
 
 # To use an external initramfs file
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 6fee60b08c..4da687caec 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -41,24 +41,19 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 endef
 endif # INSTALL_VCDBG
 
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
 # bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
-define RPI_FIRMWARE_INSTALL_BOOT
-	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start4.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup4.dat
-endef
-else
-define RPI_FIRMWARE_INSTALL_BOOT
+define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
 	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
 endef
 endif
 
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
-	$(RPI_FIRMWARE_INSTALL_BOOT)
+	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
+	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
+	$(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
