From: arnaud.miche at orange.com <arnaud.miche@orange.com>
Date: Tue, 28 Feb 2017 17:14:45 +0000
Subject: [Buildroot] fs/iso9660,
 grub2 : grub-eltorito.img not found during the generation of
 rootfs.iso9660
Message-ID: <23372_1488302086_58B5B006_23372_4885_1_1E64607C4DE75747B52CBCF583F1D21F0C7B4C3C@OPEXCNORM54.corporate.adroot.infra.ftgroup>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,

I am trying Buildroot_2016.11.2 and I have an issue during the generation of an iso rootfs.

My target is an "x86-64-efi" system.

The error is the following one :
===================

>>>   Generating root filesystem image rootfs.iso9660
/usr/bin/install -D -m 0644 fs/iso9660/grub.cfg /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/build/rootfs.iso9660.tmp/boot/grub/grub.cfg
/bin/sed -i -e "s%__KERNEL_PATH__%/boot/bzImage%" /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/build/rootfs.iso9660.tmp/boot/grub/grub.cfg
/usr/bin/install -D -m 0644 /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/images/grub-eltorito.img /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/build/rootfs.iso9660.tmp/boot/grub/grub-eltorito.img
/usr/bin/install: impossible d'?valuer ? /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/images/grub-eltorito.img ?: Aucun fichier ou dossier de ce type
fs/iso9660/iso9660.mk:160: recipe for target '/home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/images/rootfs.iso9660' failed
make: *** [/home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/images/rootfs.iso9660] Error 1

If I check the makefile for Grub2, I find that the grub-eltorito.img file is created for only i386_pc target. See boot/grub2.mk, lines 80 to 85.

ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
define GRUB2_IMAGE_INSTALL_ELTORITO
    cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
        $(BINARIES_DIR)/grub-eltorito.img
endef
endif

But in iso9660.mk, the only condition for installing grub-eltorito.img is the use of rootfs_iso9660_grub2 as seen lines 56 to 64 :

else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2),y)
ROOTFS_ISO9660_DEPENDENCIES += grub2
ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
    $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub.cfg
ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/grub-eltorito.img
define ROOTFS_ISO9660_INSTALL_BOOTLOADER
    $(INSTALL) -D -m 0644 $(BINARIES_DIR)/grub-eltorito.img \
        $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub-eltorito.img
endef

Is it a bug ? Or I misunderstood anything ?

If it is a bug, I lack some informations for patching my own installation with a convenient manner :

Is grub-eltorito.img still relevant when using Grub2 ?
If yes, should grub-eltorito.img be just built with i386_pc ? Must I have to add x86_64_efi target ?

Thank you a lot for your responses.

Arnaud


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170228/96df862e/attachment.html>
