From: Jorge S. <jorgesolla@gmail.com>
Date: Mon, 15 Oct 2007 23:44:47 +0200
Subject: [Buildroot] Writable EXT2 fs on dataflash (using MTD)
In-Reply-To: <d83696340710150756q56f0b824nb877c16cb0c7be59@mail.gmail.com>
References: <6090c5eb0710141024k3eb26ccp39c7a87845719abb@mail.gmail.com>
	<d83696340710150756q56f0b824nb877c16cb0c7be59@mail.gmail.com>
Message-ID: <6090c5eb0710151444h75869f37odb1767a42294cd80@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm planning to use jffs2 on the final system, but now, just for testing,
i'm using EXT2 because buildroot failed when building the jffs rootfs.

My questions now are:

Is there any way to unlock the dataflash without using the "flash_unlock"
command?  Maybe something from U-BOOT? Maybe some option on the Kernel?

If not... Wich is the "usual" way of doing things? Unprotect the flash and
remount writable the rootfs at boot time on some boot script?

As i understand, the dataflash will be still "locked" even if i use jffs2,
so this is not a FS type matter, is a "lock" matter. isn't it?

I think i'm going a little off-topic here, please accept my apologies, and
thanks in advance for your help.


2007/10/15, Jonathan Nalley <buildroot@bluebot.org>:
>
> You can make sure that the flash is unlocked by running:
>
> flash_unlock /dev/mtd/x
>
> (Where /dev/mtd/x is the character device corresponding to the mtd in
> question).
>
> "flash_unlock" is part of the mtd tools and can be selected under package
> selection in the buildroot.
>
> You might have better luck using jffs2 instead of ext2.  The jffs2 file
> system is intended for MTD devices, and uses "wear-leveling" to distribute
> writes over the entire flash part.
>
> Regards,
>
> Jon Nalley
>
> On 10/14/07, Jorge S. <jorgesolla@gmail.com> wrote:
>
> > Hi all,
> >
> > I've created a rootfs for my AT91RM9200 based custom board and i'm
> > unable to mount the ext2 fs on a writable way.
> >
> > I'm using an AT45DB64 spi dataflash as an MTD device and i've defined 3
> > partitions using this kernel bootargs:
> >
> > console=/dev/ttyS0,115200 root=/dev/mtdblock2 mtdparts=AT45DB642.spi0:168960(boot)ro,2162688(kernel),-(rootfs)rw
> > rootfstype=ext2 mem=32M
> >
> > After booting the kernel always says:
> >
> > VFS: Mounted root (ext2 filesystem) readonly.
> >
> > Even if i try a "mount -o remount,rw /" from the busybox shell, i get
> > this message:
> >
> > mount: /dev/root is write-protected, mounting read-only
> >
> > The "rootfs" partition is defined "writable" at the u-boot code, so i
> > think i can assume the flash is Unlocked.
> >
> >
> > Any ideas? Did i miss something when building the Rootfs? any option?
> >
> > Thanks in advance.
> >
> >
> >
> >
> >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071015/d3aa5ed4/attachment-0001.htm 
