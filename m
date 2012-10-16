From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Oct 2012 21:18:42 +0200
Subject: [Buildroot] [PATCH RFC] grub2: new boot loader
In-Reply-To: <20121016194003.27ba31f7@skate>
References: <1350400302-19752-1-git-send-email-arnout@mind.be>
 <20121016194003.27ba31f7@skate>
Message-ID: <507DB312.2030906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/10/12 19:40, Thomas Petazzoni wrote:
> Hello Arnout,
>
> On Tue, 16 Oct 2012 17:11:42 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
[snip]
>> One major controversial item is that there is a host and a target
>> version.  The host version creates the bootloader binaries for the
>> target, but the grub installer binaries for the host.  The target
>> version also creates the bootloader binaries for the target, and the
>> grub installer binaries for the target as well.  This makes it
>> possible to re-run grub-setup on the target.
>
> This looks ok, but isn't possible to make it more similar to what we
> have for U-Boot, i.e:
>
>   * A host package that only builds the host utilities (and not the
>     target images)
>
>   * A target package that builds the target utilities and the target
>     images?

  But the target images are pretty much useless without an installer
(at least for BIOS): the stage1 has to be embedded in the MBR, and
IIRC stage1.5 also has to be installed somewhere outside of the
filesystem.  Maybe with uefi you can do something with the .img
files, but I doubt it.

  Also, if you build the installer, you don't necessarily want the
grub modules in the target filesystem.  For instance, for an
initramfs, they're useless.  Or the grub stuff could be in a
different partition from the rootfs (my use case).

  It would be possible to split it in three parts: host installer,
target installer, and modules.  At this moment, the modules are
built twice.  However, I don't think the build time that is saved
by building the modules only once warrants the additional complexity
of splitting it into three separate parts.


>> Because the pkg-infra doesn't really support host/target split for
>> boot loaders, I created it as a normal package instead of a bootloader.
>> The Config.in is still included from the bootloader menu, though.
>
> Well, the pkg-infra perfectly support host/target split for boot
> loaders. See package/syslinux/syslinux.mk for example.

  D'oh, stupid me, I added the host-syslinux myself :-)

> So I would suggest to move your package in boot/grub2/, and then have
> boot/grub2/Config.in sourced by boot/Config.in, and
> boot/grub2/Config.in.host sourced by package/Config.in.host.

  It would be boot/grub2/Config.in.host sourced by boot/Config.in, and
boot/grub2/Config.in sourced by package/Config.in.

  Note that neither would install anything in $(IMAGES_DIR).  Or maybe
I should put the modules dir in $(IMAGES_DIR)/grub ?


> Or alternatively, do it like we do for U-Boot and have two completely
> separate things (boot/grub2 for the target images only,
> package/grub2-tools for the tools only), but that will duplicate some
> code between the two .mk file.

  *That* I want to avoid.  I actually would like to un-split
uboot-tools...  Now you can specify a u-boot from git, and uboot-tools
will be a completely different version.  Not so nice if you make
modifications to mkimage...


>> The grub2-0001-grub-setup-make-it-possible-to-specify-the-root-devi
>> patch isn't strictly required to build grub, but it is to make it
>> useful in the typical buildroot use case.  Without it, you need root
>> privileges to be able to install grub, even when writing to an image
>> file.
>
> Ok, sounds good. Any chance of getting things merged upstream, at some
> point?

  I'll try again.  The comment I got on the mailing list was:
"use grub-mkrescue".


>> +# --with-platform=$(BR2_TARGET_GRUB2_PLATFORM)
>> +#   i386-efi) ;;
>> +#   x86_64-efi) ;;
>> +#   i386-pc) ;;
>> +#   i386-multiboot) ;;
>> +#   i386-coreboot) ;;
>> +#   i386-ieee1275) ;;
>> +#   i386-qemu) ;;			  Requires unifont in /usr!
>
> Just curious, what does "requires unifont in /usr" means?

  It's a reminder to look at potential issues with unifont when
building that backend.  (I.e., I don't remember :-)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
