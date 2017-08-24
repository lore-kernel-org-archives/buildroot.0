From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Aug 2017 01:22:43 +0200
Subject: [Buildroot] [RFC-next 0/2] Add genimage logic in fs/genimage
In-Reply-To: <20170823204547.16672-1-thomas.petazzoni@free-electrons.com>
References: <20170823204547.16672-1-thomas.petazzoni@free-electrons.com>
Message-ID: <44ccde2e-bbcb-9052-fbe3-6d5d34686841@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-08-17 22:45, Thomas Petazzoni wrote:
> This has been discussed in the past, so here is a first attempt at
> adding some logic to generate genimage images from Buildroot. It's
> sent as an RFC to really point out that it's an initial attempt, meant
> to start the discussion.

 I'm still not very convinced this is an improvement. The only thing it brings,
really, is that the option to select the packages required for VFAT right next
to the genimage option. But we can get a similar result by reorganizing the
Config.in.host menu with some sections so all the filesystem generation bits are
next to each other, and in the host-genimage help text explain that VFAT needs
both mtools and dosfstools.

 That said, I would agree if the longer-term vision is to:
* do genimage under fakeroot, so it can generate the ext4fs directly instead of
requiring support from Buildroot;
* add support to generate simple genimage.cfg files from Buildroot config options;
* make sure that genimage supports all the filesystem types that we do (just
talking about actual filesystems here, so not cpio, tar, initramfs);
* eventually deprecate our filesystem support and delegate all of it to genimage.

 That's a five-year vision, of course, not something that needs to be fully
implemented right away.


> The aspects I'm not entirely sure:
> 
>  - fs/genimage/ is not ideal, because it's not a filesystem format
>    per-se. But I'm not sure where to put it.

 I think it is. As mentioned above, cpio, initramfs and tar are not filesystem
formats either.


>  - the "Filesystem images" menu in menuconfig is also not the ideal
>    location, for the same reason, but I'm also not sure where this
>    would fit.

 It would make more sense close to the post-build options. However, that would
put it in a not very logical place as well. Except if we move the filesystems
menu as a submenu of system configuration. Oh well, not so important.


>  - the direct call from target-post-image to GENIMAGE_GENERATE_CMDS is
>    also probably not ideal.

 We could introduce something like TARGET_FINALIZE_HOOKS, but with just one such
thing I don't think it's worth it.

 However, IMO, the genimage step should be done *after* the post-image scripts.
If you look at our existing defconfigs, almost all of them do some preparatory
work before calling genimage. There's only one script that does something
afterwards: board/hardkernel/odroidc2/post-image.sh writes u-boot into the image
using dd, because it needs a gap in the middle. But even that one could be done
before genimage, splitting u-boot.bin into two files and using the genimage.cfg
files to add them to the image.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
