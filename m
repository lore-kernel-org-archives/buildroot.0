From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Sep 2016 00:47:50 +0200
Subject: [Buildroot] ISO format improvements
In-Reply-To: <20160907094239.64e13e29@armant.core.local.os.greenbone.net>
References: <20160907094239.64e13e29@armant.core.local.os.greenbone.net>
Message-ID: <592b988d-8020-b6d3-1fec-60833052f14f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07-09-16 09:42, Beno?t Allard wrote:
> Hi guys,
> 
> We are building a custom ISO image as part of our build process, and
> I'd like to contribute our 'improvements' upstream.

 Our ISO images, though much improved already about a year ago, are still not
that great, so this is indeed very welcome.

> 
> Major features of our ISO image:
> 
> - both EFI and BIOS boot system

 Yeah, EFI is currently broken. Cfr. [1].

> - bootable as 'iso' (CD), or when dd'd to a usb stick

 Well, we do already have isohybrid support.

> - has some data on the ISO itself (outside of the initramfs)
> 
> xorriso (as opposed to the currently used genisoimage) has builtin
> support for all this.

 No problem switching to xorriso.

> 
> About the EFI part, one need to build a FAT image with the necessary
> stuff.
> 
> I'm sending this mail in order to plan together the various steps
> necessary to achieve the upstream integration.
> 
> I see multiple tracks:
> 
> 1. build a FAT EFI bootable image format (to be used as dependency later
>    on)
> 
>    At the moment, we achieve that with the mkfs.vfat, mmd and mcopy. the
>    image only contains syslinux.efi (+ ldlinux.e64 + config), the
>    kernel, and the cpio image.

 I guess the idea is that a FAT partition will always be needed for EFI boot,
right? However, it's a bit difficult to do this in a generic (user-configurable)
way, because you have to decide which things to store in the FAT and under what
name, and I don't think this is always the same. Well, maybe it is for EFI.

 For other boards, which often have a ROMboot that will look for a FAT partition
on an SD card, we have custom genimage config files for each board.

 Oh, for sure, you'll want to use genimage rather than explicitly coding mmd
etc. commands.


> 2. the switch to xorriso.
> 
>    I remember some time ago that it was a wished step anyway that
>    would allow to get rid of cmake on the host-system (very slow to
>    build).

 Well, there's a patch to avoid building cmake that is about to be committed :-)
But as I already said, switching to xorriso is probably a good thing. Best make
that the first patch in the series.

> 
> 3. some modification to the iso9660.mk to allow initramfs + 'read-only
>    data' on the disc.
> 
>    Either call a script that copy the right data, or use an overlay
>    directory, maybe a combination of both ?

 In general, the idea is that the buildroot filesystem support is just the
simple thing, and more complicated setups would use a custom genimage
configuration. Because if it goes beyond a simple bootable rootfs, there are so
many possibilities that we're most likely not going cover after all.

 The ISO support is a bit special in that, because the genimage support is a bit
limited (e.g. no hybrid) and, well, ISO is rather special. So maybe, yes.

> 
> What do you guys think ? Is that something that is wished at all ? Did
> I missed some obvious ways to generate what I wish with the current
> setup ? What's the best way to move on ?

 Post patches :-)

 A word of warning, though: this is the type of patch that often lingers a long
time before someone looks at it. Try to post it end of September, then we're
likely to go over them during the BR developer meeting.

 Regards,
 Arnout


[1]
http://stackoverflow.com/questions/38098317/no-such-file-or-directory-grub-eltorito-img/38100762



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
