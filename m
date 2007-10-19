From: Jorge S. <jorgesolla@gmail.com>
Date: Fri, 19 Oct 2007 18:18:21 +0200
Subject: [Buildroot] (AT91RM9200/DATAFLASH) Unable to create a *working*
	jffs2 rootfs.
In-Reply-To: <6090c5eb0710190430n48ccfbb0r19444de776a6f92@mail.gmail.com>
References: <750006.56257.qm@web26205.mail.ukl.yahoo.com>
	<6090c5eb0710190134w575a787cy6ff6bc98516815d9@mail.gmail.com>
	<6090c5eb0710190136j2fb3f6f6xe4ce96058593021a@mail.gmail.com>
	<6090c5eb0710190430n48ccfbb0r19444de776a6f92@mail.gmail.com>
Message-ID: <6090c5eb0710190918r25696fcdrad0b93db2a58636c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, you where right! the problem was the "flash_erase" step missing in
my procedure.

I ended up mounting the jffs2 fs image on my Host system and discovered that
the "/dev" is missing!

So, when the kernel says: "Warning: unable to open an initial console" is
not a problem mounting the FS, indeed, the FS is perfectly mounted now, but
lacks of /dev directory!!

So, i think there's a buildroot bug here... it creates a JFFS but forgets to
create the /dev directory...


PD: Michael,Ulf consider yourself "free beer" awarded if you ever come to
spain! :)



2007/10/19, Jorge S. <jorgesolla@gmail.com>:
>
> Hi Michael,Ulf and all:
>
> I did what you sugested:
>
> I'm using an EXT2 initrd with all the flash_tools.
>
>
> # ./flash_erase /dev/mtd2
> Erasing 1 Kibyte @ 6067e0 -- 99 % complete.
> # mkdir /mnt/flash
> # mount -t jffs2 /dev/mtdblock2 /mnt/flash
> JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
> JFFS2 notice: (298) jffs2_build_xattr_subsystem: complete building xattr
> subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0
> orphan) found.
> # cd /mnt/flash/
> # ls -la
> drwxr-xr-x    3 root     root            0 Dec 31  1969 .
> drwxr-xr-x    4 root     root         1024 Dec 31 17:05 ..
> # cd ..
> # mount
> rootfs on / type rootfs (rw)
> /dev/root on / type ext2 (rw)
> proc on /proc type proc (rw)
> devpts on /dev/pts type devpts (rw)
> tmpfs on /tmp type tmpfs (rw)
> /dev/sda1 on /mnt/usb type msdos (rw,fmask=0022,dmask=0022,codepage=cp850)
> /dev/mtdblock2 on /mnt/flash type jffs2 (rw)
>
> # /mnt/usb/armtool/flash_info /dev/mtd2
> Device /dev/mtd2 has 0 erase regions
>
> The procedure looks working fine, i also issued a "flash_info" just for
> testing and enabled the debug messages for jffs2 on my kernel.
>
> After the flash_erase procedure using the initrd, i reboot the system,
> then using u-boot "loadb" command, i dump the JFFS2 rootfs to the DataFlash
> and set the kernel bootargs to boot from /dev/mtdblock2.
>
> Now i have a different behavior while booting but *still* no success, this
> is what the kernel says when booting:
>
> JFFS2 write-buffering enabled buffer (1056) erasesize (8448)
> JFFS2 notice: (1) jffs2_build_xattr_subsystem: complete building xattr
> subsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0
> orphan) found.
> VFS: Mounted root (jffs2 filesystem).
> Freeing init memory: 132K
> Warning: unable to open an initial console.
>
> ... and stays here forever. (I know this warning comes from the kernel not
> seeing the /dev/console device...so i assume its unable to properly mount
> the rootfs)
>
>
>  As Ulf is suggesting, i think there's something wrong when using
> mkfs.jffs2 to create the jffs2 filesystem.
>
> Questions:
>
> 1)  Do you guys have a ready-made jffs2 image proben to work that i can
> use to check my system? If your image works, then i can discard my
> kernel/u-boot configuration and focus on a possible problem when the
> mkfs.jffs2 process is being done.
>
> 2) Are there any "must have" options enabled on the kernel configuration
> to deal with MTD rootfs? Maybe i'm missing something.
>
> 3) Any other ideas? I'm getting crazy on this :(
>
>
> As usual, BIG thanks helping and sorry about my poor english.
>
>
>
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071019/219888e2/attachment-0001.htm 
