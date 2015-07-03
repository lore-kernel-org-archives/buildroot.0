From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Sat, 4 Jul 2015 01:44:32 +0200
Subject: [Buildroot] [PATCH v3 1/2] host-zynq-boot-bin: new package
In-Reply-To: <20150703215104.GH3652@free.fr>
References: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <20150703173306.GA3652@free.fr> <5596E9E3.2020909@mind.be>
 <20150703215104.GH3652@free.fr>
Message-ID: <20150704014432.6f8541ff@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, Yann,

I am glad you are interested in this little feature. My original
goal was to deliver a simple out-of-the-box mechanism to easily
create a bootable system for Zedboard without any additional
steps and with the ability to turn it off easily if necessary.

I do not understand, how should this script be treated as
a bootloader stuff. I see it just as a helper host tool like the
uboot-tools are (a common host package). However, uboot-tools
is integrated quite deeply, it creates uImage (done by Kernel
build-system) and especially root file-system (done by Buildroot).
I would expect that zynq-boot-bin.py works in a similar way.

I have no clue about the TARGET_FINALIZE_HOOKS but it sounds
promising.

What I find quite a good idea is to use a post-<something>
script. But for that purpose, I thinks a working script in
the boards/avnet/zedboard exactly for this purpose should be
provided together with a preset inside the zedboard_defconfig
to use it as default. This creates an out-of-the-box working
configuration that is easily customizable. But what about other
Zynq-based boards (well, there is no one there at the moment,
but...)? Could they share the same script?

Another point that was omitted here (but it is described in the
readme.txt) is that the SPL searchs for uboot-dtb.img while booting.
This file is however not installed in the images directory. Instead,
user gets the u-boot.img that does not work together with the SPL
(at least for me). This is confusing... First, I do not get the working
SPL automatically, second, I do not get the right U-Boot image. From
this point of view, I'd like the original patch-based implementation :).
Is this also an issue for other boards?

I am about to:

* remove the _INSTALL_STAGING, _INSTALL_IMAGES settings,
* specify the license,
* put there the EXTRACT_CMDS to avoid failure when trying to extract
  the zynq-boot-bin.py as an tar archive (is this correct assumption?)
* put there the INSTALL_CMDS to install the zynq-boot-bin.py into
  HOST_DIR

The last step is not clear to me. I also found a kind of inspiration in
fs/cpio:

 34 $(BINARIES_DIR)/rootfs.cpio.uboot: $(BINARIES_DIR)/rootfs.cpio host-uboot-tools
 35         $(MKIMAGE) -A $(MKIMAGE_ARCH) -T ramdisk \
 36                 -C none -d $<$(ROOTFS_CPIO_COMPRESS_EXT) $@

Would it be possible to define similar rules in uboot.mk?

 $(BINARIES_DIR)/boot.bin: host-zynq-boot-bin
     python2 $(HOST_DIR)/usr/bin/zynq-boot-bin.py \
         -u $(@D)/spl/u-boot-spl.bin -o $@

Regards,
Jan

On Fri, 3 Jul 2015 23:51:04 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Arnout, Jan, All,
> 
> On 2015-07-03 22:00 +0200, Arnout Vandecappelle spake thusly:
> > On 07/03/15 19:33, Yann E. MORIN wrote:
> > > On 2015-06-23 14:49 +0200, Jan Viktorin spake thusly:
> [--SNIP--]
> > > Since this is a host-only package, you need not specify either;
> > >   - install_staging already defaults to no,
> > >   - both are anyway only valid for target packages.
> > 
> >  But actually, it's not a host package, it's a target package. Took
> > me some time to realize that however :-) See below.
> 
> Still, I am not sure, see below. ;-)
> 
> [--SNIP--]
> > > That mught be an indication that it should depend on host-python,
> > > no?
> > 
> >  Actually, no, we actually require a system-python to exist. I
> > think it also needs to be python2 though we don't check for that.
> > And to be honest, I have no idea why we require it...
> 
> I don't know why we require it for packages, but we at least need it
> for the manual.
> 
> I was added way back in 2010 byy Thomas P. to fix #1531.
> 
> >  But I certainly wouldn't like to have to build a host-python just
> > to be able to build the boot loader... So I'm glad there's no
> > dependency on host-python.
> 
> Agreed.
> 
> > > Here's what I think should be done:
> [--SNIP--]
> 
> >  That's what Jan originally had, but I told him to do it this
> > way :-)
> > 
> >  You can view zynq-boot-bin as something which really should be
> > part of uboot. The only point of this "program" is to create the
> > bootloader. It will never be applied on anything except the
> > bootloader. It doesn't need any additional configuration or command
> > line arguments. So it would be quite pointless to burde the user
> > with writing that stuff in a post-build script.
> > 
> >  Perhaps, however, it should go into the boot/ directory instead of
> > packages. It is, after all, a pre-bootloader, like at91bootstrap.
> 
> Right, that would be a better location.
> 
> Still, I believe we should handle this tool as a host tool, to support
> users that build their bootloader outside of Buildroot (we already
> install similar tools for this reason).
> 
> > > Note: that's what we do for the Raspberry Pi, for example, where
> > > we install the 'mkknlimg' utility in $(HOST_DIR) and tell the
> > > user how to use it in the board readme file:
> > 
> >  I think the same approach could be taken there.
> 
> I respectfully disagree. ;-)
> 
> rpi-firmware installs a utility to add a header (really, a trailler)
> to the kernel image. Since the user can build his kernel outside
> Buildroot, we still want to leave him/her the possibility to tag the
> kernel properly; hence we install this utility in $(HOST_DIR), either
> when doing the SDcard manually, or from a post-image script.
> 
> I believe we are here in a similar situation with host-zynq-boot-bin.
> 
> However, we might be a bit more helpful here, so we have a way to
> automatically run those commands in a sane, generic way, like we have
> with TARGET_FINALIZE_HOOKS for target-finalize, but this time for
> images.
> 
> Note: we might _technically_ be able tore-use TARGET_FINALIZE_HOOKS,
> but I'm a bit uneasy to hijack it to deal with images, when it was
> meant to deal with the content of $(TARGET_DIR).
> 
> > Though I can't say I understand
> > much of all the hoops you have to jump through to boot an RPi.
> 
> Well, it's pretty similar to the zedboard case (from what I see in the
> zedboard readme):
>   - a first partition, FAT16 or FAT32, with a bunch of files in there:
>     - the GPU blob, its config file, the CPU init blob
>     - the kernel, its command line (in a text file)
>   - a second partition with the rootfs
> 
> Regards,
> Yann E. MORIN.
> 



-- 
  Jan Viktorin, PhD student   E-mail: iviktorin at fit.vutbr.cz
  DCS FIT VUT Brno, L310      Web: http://www.fit.vutbr.cz/~iviktorin
  Bozetechova 1, 612 66       Phone: +420 54114-1357
  Brno, Czech Republic
