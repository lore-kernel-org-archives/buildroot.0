From: Arun Reddy <reddyac@gmail.com>
Date: Tue, 8 Apr 2008 16:50:55 -0700
Subject: [Buildroot] Creating a bootable filesystem image?
In-Reply-To: <47FBF3F3.4040001@arcor.de>
References: <326f33790804071158h125bc8c3n9701bf1774ce5611@mail.gmail.com>
	<47FB42D2.7040905@arcor.de>
	<326f33790804081325s680eb37bg9b8e73663277f4c2@mail.gmail.com>
	<47FBE4A8.9080104@arcor.de>
	<326f33790804081526m5d6fa19bi16dcd55c8e1c5cdf@mail.gmail.com>
	<47FBF3F3.4040001@arcor.de>
Message-ID: <326f33790804081650r61d9cac7m7cbbd70c9bb3adee@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks! There is certainly no hurry so please only try if you have free
time. I will attempt some of the suggestions you stated here in the
meantime.

Arun

On Tue, Apr 8, 2008 at 3:38 PM, Sebastian <bastisoft@arcor.de> wrote:

> Hello,
>
> just to make it short and to let you know I got your mail:
>
> I have no idea, but I'll look into it tomorrow (if I'm not forgetting it),
> but that'll be in about 16 hours.
>
> Some ideas: Adding a partition table to the image might make it larger
> than it was before and copying the data that exactly fit before might not
> fit afterwards. I have no idea why the error message contains your .iso
> file. Another thing is, that grub takes some space on any disk it is
> installed onto:
>
> The first 446 bytes of the MBR are overwritten (the remaining 64 bytes
> contain the partition table and a magic number), the following sectors are
> not allowed to contain a partition, so these are used for grub's boot code,
> and inside your /boot partition some files are copied inside (everything
> under /boot/grub). So this might be a reason, too. (Extlinux just installs
> the boot code into the partition and optionally needs a /boot/extlinux.conf
> file for configuration.)
>
> Try to make the image somewhat larger (you can select the size in make
> menuconfig).
>
> I'll look into it tomorrow, when I am through my university chores...
>
> Best regards,
> Sebastian
>
>
> Arun Reddy schrieb:
>
> > Sebastian,
> >
> > Thanks for the information, I do understand it much clearer now. I am
> > attempting to run the script and find out whether my input will result in
> > the bootable filesystem I want. When running build-ext-img, I input
> >
> > Enter the path to the image:
> >
> > I input "/root/buildroot/scripts/" since that is where the filesystem
> > image is located.
> >
> > Enter the name of the image file:
> >
> > I input "buildroot.img"
> >
> > Enter the path to the root filesystem that you want to install the image
> >
> > I input "/root/buildroot/binaries/uclibc/" since this is where my
> > filesystem image (rootfs.i386.ext2) is located.
> >
> > When the script runs, it looks like everything is ok at first, but
> > eventually I get the warning stating Device contains neither a valid DOS
> > partition table, nor Sun, SGI... etc. It builds a new DOS disklabel for me,
> > so I go ahead and continue. I also get a warning that there is an invalid
> > flag 0x0000 of partition table 4 that will be corrected by w(rite) which I
> > go ahead an accept. I then type q to quit and continue building the bootable
> > FS.
> >
> > I am finally left with
> >
> > cp: writing /root/buildroot/scripts/temp/rootfs.i386.iso: No space left
> > on device.
> >
> > I examined the script and noticed when installing software to the image,
> > ${IMAGE} is mounted to ${IMAGE_PATH}/temp, then ${ROOT_PATH}/* is copied to
> > that location, and then the temp folder is unmounted and removed. Am I
> > getting that there is no space on the device because it is trying to copy to
> > a folder where the image is mounted? Or did I not correctly interpret the
> > inputs correctly above? Thanks for answering these. I should point out I am
> > using Snapshot from 4-1-2008.
> >
> > On Tue, Apr 8, 2008 at 2:33 PM, Sebastian <bastisoft@arcor.de <mailto:
> > bastisoft at arcor.de>> wrote:
> >
> >    Hello Arun,
> >
> >    of course you can use a ext3 file system, if your kernel only uses
> >    ext2.
> >
> >    Ext3 is fully backwards-compatible to ext2, which means you can
> >    use any ext2 driver to access ext3 file systems. Grub uses an ext2
> >    file system driver, so it can read ext3, too. I don't know which
> >    kind of storage device you are using; ext3 is an ext2 file system
> >    with a journal. Journalling saves a lot of time when you need to
> >    fsck the device (and use a journal-capable [ext3]-driver for
> >    writing, of course), but the file system will write a lot more
> >    often onto the device, too - this matters if you use a flash
> >    device or something that wears out. If you read-only mount your
> >    file system, the journal isn't used at all.
> >
> >    I mean: You can use the ext3 file system as-is, but you waste some
> >    KB (or MB for larger disks) of space. It won't hurt, though, and
> >    grub can use ext2 and ext3.
> >    It's just that i personally dislike grub and wanted to say that
> >    there are alternatives (extlinux) around. ;-)
> >
> >    Best regards,
> >    Sebastian
> >
> >        Hi Sebastian,
> >
> >        Thank you for this email. Would you be willing to explain why
> >        I would need to change ext3 in order to use grub? Can grub not
> >        work on ext3 filesystem? I just picked ext2 in the kernel
> >        configuration as a test but I can really use any filesystem I
> >        want (ext2, ext3, etc). So if the script will create for me a
> >        bootable ext3 filesystem cannot I just use that as it is?
> >
> >        On Tue, Apr 8, 2008 at 3:02 AM, Sebastian <bastisoft@arcor.de
> >        <mailto:bastisoft@arcor.de> <mailto:bastisoft@arcor.de
> >
> >        <mailto:bastisoft@arcor.de>>> wrote:
> >
> >           Hello Arun,
> >
> >            > My question is, does anyone know if there is a way to
> >        configure
> >           buildroot to make rootfs.i386.ext2 bootable? Please note that
> > I
> >           disabled
> >           RAMDISK in the > kernel .config before compiling buildroot
> >        because I
> >           don't need to use one.
> >
> >           This is because rootfs.i386.ext2 is only a file system
> >        image, not
> >           a hard
> >           disk image. It is missing the boot sector of the disk,
> >        which contains
> >           the Master Boot Record and the partition table. The BIOS on
> >        i386 does
> >           only execute the first sector on the disk (the MBR code)
> >        which usually
> >           only boots from the active partition. So you need a
> >        bootloader, as the
> >           kernel itself is not able to be loaded this way.
> >
> >           Like John said, you can use GRUB. But if you only want to
> >        boot a ext2
> >           partition, you can easily get away with Extlinux. It is a
> >        syslinux
> >           derivate with support for ext2 (and ext3) instead of FAT.
> >        It installs
> >           only into the partition (not into the master boot record),
> >        which means
> >           you should be fine by creating and activating the partition
> >        containing
> >           your ext2 image.
> >
> >           The changes in scripts/build-ext3-img references ext3 only
> >        while
> >           creating the file system. So you only need to change that
> >        if you
> >           want to
> >           use grub.
> >
> >           Best regards,
> >           Sebastian
> >           _______________________________________________
> >           buildroot mailing list
> >           buildroot at uclibc.org <mailto:buildroot@uclibc.org>
> >        <mailto:buildroot at uclibc.org <mailto:buildroot@uclibc.org>>
> >
> >           http://busybox.net/mailman/listinfo/buildroot
> >
> >
> >
> >
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080408/258add91/attachment.htm 
