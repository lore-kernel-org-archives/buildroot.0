From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 22:42:47 +0100
Subject: [Buildroot] [git commit] package/mender-grubenv: fix installation
 with genimage.sh script
Message-ID: <20200106214147.3FD9982983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=425f79087a02ec2fd53c76bb155efb41708aef68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mender-grubenv currently has 3 problems that prevent an x86_64-efi image from
successfully being made with the genimage.sh script.

- mender-grubenv does not currently depend on Grub2.
  While Grub2 is not needed to build the mender-grubenv package, Grub2 needs
  to be built first for mender-grubenv to overwrite the default Grub2 files
  reliably.

- The MENDER_GRUBENV_ENV_DIR variable points to /boot/efi/EFI/BOOT instead of
  /boot/EFI/BOOT, which is where the Grub2 package installs the default files.
  This variable now points to the correct location.

- The Grub2 package installs images to $(BINARIES_DIR)/efi-part, which the
  mender-grubenv package currently does not do. As such; the default Grub2
  configuration file is used instead of the one provided by mender-grubenv.
  Adding a MENDER_GRUBENV_INSTALL_IMAGES_CMDS define in mender-grubenv.mk which
  copies the installed files from $(TARGET_DIR)/boot/EFI to
  $(BINARIES_DIR)/efi-part fixes this issue.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
[Thomas:
 - drop "runtime" on the depends on BR2_TARGET_GRUB2 since we now have
   a build-time dependency on it
 - explicitly copy the files installed by mender-grubenv in
   MENDER_GRUBENV_INSTALL_IMAGES_CMDS instead of blindly copying
   everything that is in $(TARGET_DIR)/boot/EFI]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-grubenv/Config.in         |  2 +-
 package/mender-grubenv/mender-grubenv.mk | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/package/mender-grubenv/Config.in b/package/mender-grubenv/Config.in
index e1c785fb44..28b4bb7074 100644
--- a/package/mender-grubenv/Config.in
+++ b/package/mender-grubenv/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_MENDER_GRUBENV
 	depends on BR2_PACKAGE_MENDER # runtime
 	# grubenv provides it's own fw_printenv.
 	depends on !BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
-	depends on BR2_TARGET_GRUB2 # runtime
+	depends on BR2_TARGET_GRUB2
 	help
 	  Contains the boot scripts and tools used by Mender to
 	  integrate with the GRUB bootloader.
diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index c947f2ff9d..6e38557eb3 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -8,11 +8,15 @@ MENDER_GRUBENV_VERSION = 1.3.0
 MENDER_GRUBENV_SITE = $(call github,mendersoftware,grub-mender-grubenv,$(MENDER_GRUBENV_VERSION))
 MENDER_GRUBENV_LICENSE = Apache-2.0
 MENDER_GRUBENV_LICENSE_FILES = LICENSE
+# Grub2 must be built first so this package can overwrite the config files
+# provided by grub.
+MENDER_GRUBENV_DEPENDENCIES = grub2
+MENDER_GRUBENV_INSTALL_IMAGES = YES
 
 ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
 MENDER_GRUBENV_ENV_DIR = /boot/grub
 else
-MENDER_GRUBENV_ENV_DIR = /boot/efi/EFI/BOOT
+MENDER_GRUBENV_ENV_DIR = /boot/EFI/BOOT
 endif
 
 MENDER_GRUBENV_MAKE_ENV = \
@@ -50,4 +54,12 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
 	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
+# Overwrite the default grub2 config files with the ones in this package.
+define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
+	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
+	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
+		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
+		$(BINARIES_DIR)/efi-part/EFI/BOOT
+endef
+
 $(eval $(generic-package))
