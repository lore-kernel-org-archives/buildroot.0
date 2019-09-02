From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  2 Sep 2019 15:34:41 -0700
Subject: [Buildroot] [PATCH v2] package/mender-grubenv: fix installation
 with genimage.sh script
Message-ID: <20190902223442.24880-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

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
---
 package/mender-grubenv/mender-grubenv.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index c947f2ff9d..6759e1379b 100644
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
@@ -50,4 +54,10 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
 	$(MENDER_GRUBENV_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 endef
 
+# Overwrite the default grub2 config files with the ones in this package.
+define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
+	mkdir -p $(dir $(GRUB2_IMAGE))
+	cp -dpfr $(TARGET_DIR)/boot/EFI $(BINARIES_DIR)/efi-part
+endef
+
 $(eval $(generic-package))
-- 
2.21.0
