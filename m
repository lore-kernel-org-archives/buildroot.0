From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Mar 2017 20:59:06 +0100
Subject: [Buildroot] fs/iso9660,
 grub2 : grub-eltorito.img not found during the generation of
 rootfs.iso9660
In-Reply-To: <23372_1488302086_58B5B006_23372_4885_1_1E64607C4DE75747B52CBCF583F1D21F0C7B4C3C@OPEXCNORM54.corporate.adroot.infra.ftgroup>
References: <23372_1488302086_58B5B006_23372_4885_1_1E64607C4DE75747B52CBCF583F1D21F0C7B4C3C@OPEXCNORM54.corporate.adroot.infra.ftgroup>
Message-ID: <73760f82-95af-ba23-7f23-3e2e79136ca4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Arnaud,

On 28-02-17 18:14, arnaud.miche at orange.com wrote:
> Hi everybody,
> 
> I am trying Buildroot_2016.11.2 and I have an issue during the generation of an
> iso rootfs.
> 
> My target is an "x86-64-efi" system.
> 
> The error is the following one :
> ===================
> 
> *>>>   Generating root filesystem image rootfs.iso9660
> /usr/bin/install -D -m 0644 fs/iso9660/grub.cfg
> /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/build/rootfs.iso9660.tmp/boot/grub/grub.cfg
> /bin/sed -i -e "s%__KERNEL_PATH__%/boot/bzImage%"
> /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/build/rootfs.iso9660.tmp/boot/grub/grub.cfg
> /usr/bin/install -D -m 0644
> /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/images/grub-eltorito.img
> /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/build/rootfs.iso9660.tmp/boot/grub/grub-eltorito.img
> /usr/bin/install: impossible d'?valuer
> ? /home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/images/grub-eltorito.img ?:
> Aucun fichier ou dossier de ce type
> fs/iso9660/iso9660.mk:160: recipe for target
> '/home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/images/rootfs.iso9660'
> failed
> make: ***
> [/home/arnaud/Developments/Projects/Linux_Firmware/Buildroot_2016.11.2/buildroot-2016.11.2/output/images/rootfs.iso9660]
> Error 1*
> 
> If I check the makefile for Grub2, I find that the grub-eltorito.img file is
> created for only i386_pc target. See boot/grub2.mk, lines 80 to 85.
> 
> *ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
> define GRUB2_IMAGE_INSTALL_ELTORITO
>     cat $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE)/cdboot.img $(GRUB2_IMAGE) > \
>         $(BINARIES_DIR)/grub-eltorito.img
> endef
> endif*
> 
> But in iso9660.mk, the only condition for installing grub-eltorito.img is the
> use of rootfs_iso9660_grub2 as seen lines 56 to 64 :
> 
> *else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_GRUB2),y)
> ROOTFS_ISO9660_DEPENDENCIES += grub2
> ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
>     $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub.cfg
> ROOTFS_ISO9660_BOOT_IMAGE = boot/grub/grub-eltorito.img
> define ROOTFS_ISO9660_INSTALL_BOOTLOADER
>     $(INSTALL) -D -m 0644 $(BINARIES_DIR)/grub-eltorito.img \
>         $(ROOTFS_ISO9660_TARGET_DIR)/boot/grub/grub-eltorito.img
> endef
> 
> *Is it a bug ? Or I misunderstood anything ?

 Yes, this is a bug. iso9660 support in Buildroot is not used a lot so it tends
to be brittle.


> If it is a bug, I lack some informations for patching my own installation with a
> convenient manner :
> 
> Is grub-eltorito.img still relevant when using Grub2 ?

 It certainly is.

> If yes, should grub-eltorito.img be just built with i386_pc ? Must I have to add
> x86_64_efi target ?

 As I understand it, the eltorito-style bootable CDROM only makes sense with
legacy BIOS (i.e. i386-pc). For EFI, I think you need to add an addition (FAT?)
filesystem track to the iso image. You can read up on it on [1].

 The simplest solution is to limit the iso9660 grub2 support to i386-pc.

 The proper solution is to add EFI support to iso9660.mk. But that requires more
investigation.

 I'll send a patch implementing the first solution.

 Regards,
 Arnout


[1] http://wiki.osdev.org/El-Torito

> 
> Thank you a lot for your responses.
> 
> Arnaud
> 
> _________________________________________________________________________________________________________________________
> 
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
