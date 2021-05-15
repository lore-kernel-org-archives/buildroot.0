From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 14:53:09 +0200
Subject: [Buildroot] [git commit] package/mender-grubenv: fix installing on
 non-efi platforms
Message-ID: <20210515122502.7AAA0815A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcff1166d43a4cfef135edd91992558eb1044d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, mender-grubenv unconditionally installs files from the
$(TARGET_DIR)/boot/EFI directory to the $(BINARIES_DIR)/efi-part.
This fails on systems that are not building grub against EFI.

Add a check in mender-grubenv.mk to ensure the files are copied to the correct
location if EFI is not selected.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender-grubenv/mender-grubenv.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mender-grubenv/mender-grubenv.mk b/package/mender-grubenv/mender-grubenv.mk
index ade0f4c0ed..f06dbbe35c 100644
--- a/package/mender-grubenv/mender-grubenv.mk
+++ b/package/mender-grubenv/mender-grubenv.mk
@@ -55,11 +55,20 @@ define MENDER_GRUBENV_INSTALL_TARGET_CMDS
 endef
 
 # Overwrite the default grub2 config files with the ones in this package.
+ifeq ($(BR2_TARGET_GRUB2_I386_PC)$(BR2_TARGET_GRUB2_ARM_UBOOT),y)
+define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
+	mkdir -p $(BINARIES_DIR)/boot-part/grub
+	cp -dpfr $(TARGET_DIR)/boot/grub/grub.cfg \
+		$(TARGET_DIR)/boot/grub/mender_grubenv* \
+		$(BINARIES_DIR)/boot-part/grub
+endef
+else
 define MENDER_GRUBENV_INSTALL_IMAGES_CMDS
 	mkdir -p $(BINARIES_DIR)/efi-part/EFI/BOOT
 	cp -dpfr $(TARGET_DIR)/boot/EFI/BOOT/grub.cfg \
 		$(TARGET_DIR)/boot/EFI/BOOT/mender_grubenv* \
 		$(BINARIES_DIR)/efi-part/EFI/BOOT
 endef
+endif
 
 $(eval $(generic-package))
