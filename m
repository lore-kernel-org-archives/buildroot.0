From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 22:37:44 +0200
Subject: [Buildroot] Using buildroot images (iso/ext2) in real target
	device (flash drive)
In-Reply-To: <jnea4q$6a2$1@dough.gmane.org>
References: <jio6ql$25v$1@dough.gmane.org> <jn68cv$dcc$1@dough.gmane.org>
 <jnea4q$6a2$1@dough.gmane.org>
Message-ID: <201204272237.44841.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 27 April 2012 16:23:20 Willy wrote:
> So I've deleted the output/ folder, made some modifications and rebuilt 
> all obtaining a smaller kernel and a smaller fs.
> Now it boot, but always using the bzImage (I've only /boot/grub/* and 
> bzImage on my flash usb). 

 So where did the rest of your rootfs.ext2 go?  

> Every modifications does not survive to reboot.

 Maybe you changed the rootfs to an initramfs?


> So I've built the vmlinux image and tar fs, but I got
> "Grub Error 13: Invalid or unsupported executable format"

 vmlinux is not executable by grub, and a tar file is not readable
by the kernel.


 The proper approach is the following:

- Create a /boot/grub/menu.lst in your rootfs skeleton.

- Make sure you have the grub boot loader configured.

- Build kernel and rootfs.ext2.  Make sure BR2_LINUX_KERNEL_INSTALL_TARGET
is selected, so the kernel is inside the rootfs.ext2.  If you want extra
space in your rootfs to write files to it, set the 
BR2_TARGET_ROOTFS_EXT2_BLOCKS variable to the size of the root partition.
Note, though, that genext2fs creates that whole size in memory, so you
need to have enough RAM.

- Write rootfs.ext2 to the root partition: 'cat rootfs.ext2 > /dev/hdc1'

- Run 'grub --device-map=/dev/null --no-floppy' and give the following 
commands interactively:

device (hd0) /dev/hdc
root (hd0,0)
setup (hd0)
quit

This installs grub on /dev/hdc and makes it bootable.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
