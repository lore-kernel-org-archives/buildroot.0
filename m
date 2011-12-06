From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Dec 2011 21:29:36 +0100
Subject: [Buildroot] buildroot with SquashFS root file system
In-Reply-To: <4EDE32C3.7020400@neotion.com> (Emmanuel BOUAZIZ's message of
 "Tue, 06 Dec 2011 16:20:35 +0100")
References: <4EDE32C3.7020400@neotion.com>
Message-ID: <878vmpqw9b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Emmanuel" == Emmanuel BOUAZIZ <ebouaziz@neotion.com> writes:

 Emmanuel> Hi,

 Emmanuel> I'm trying to run buildroot 2011.11 on an atom based board,
 Emmanuel> booting via PXE.

 Emmanuel> I've selected the SquashFS 4.x root filesystem (xz
 Emmanuel> compressed), bzImage as the Kernel binary format, and
 Emmanuel> syslinux/pxelinux as the bootloader.

 Emmanuel> In the system configuration, I checked "remount root
 Emmanuel> filesystem read-write during boot"

That doesn't make much sense for a readonly file system like squashfs.

 Emmanuel> In the kernel configuration, I checked Initial RAM filesystem
 Emmanuel> and RAM disk support+XZ, and SquashFS/XZ filesystem support.

 Emmanuel> On the PXE server, I put these kernel parameters: append
 Emmanuel> vga=0x305 fbcon=scrollback:4096k initrd=rootfs.squashfs

An initramfs would be a better option than initrd, but OK. Did you build
the kernel with buildroot or manually?


 Emmanuel> Here is what I get during the boot sequence:

 Emmanuel> (...)
 Emmanuel> RAMDISK: squashfs filesystem found at block 0
 Emmanuel> RAMDISK: Loading 14133KiB [1 disk] into ram disk.../
 Emmanuel> usb 1-7: new high speed USB device number 3 using ehci_hcd
 Emmanuel> VFS: Mounted root (squashfs filesystem) readonly on device 1:0
 Emmanuel> usb 2-2: new full speed USB device number 2 using uhci_hcd
 Emmanuel> can't open /dev/null: No such file or directory
 Emmanuel> can't open /dev/null: No such file or directory
 Emmanuel> can't open /dev/null: No such file or directory
 Emmanuel> can't open /dev/null: No such file or directory
 Emmanuel> can't open /dev/null: No such file or directory
 Emmanuel> can't open /dev/null: No such file or directory

Do you have CONFIG_DEVTMPFS enabled in your kernel? From a quick look at
the kernel sources (init/do_mounts_initrd.c) I see that the kernel
doesn't mount devtmpfs automatically when an initrd is used, so you'll
need to add a wrapper script as /linuxrc which mounts it and execs
/sbin/init, similar to how we do it for initramfs (fs/cpio/init):

# devtmpfs does not get automounted for initramfs
/bin/mount -t devtmpfs devtmpfs /dev
exec 0</dev/console
exec 1>/dev/console
exec 2>/dev/console
exec /sbin/init $*

-- 
Bye, Peter Korsgaard
