From: Willy <willy@willygroup.org>
Date: Tue, 24 Apr 2012 15:04:30 +0200
Subject: [Buildroot] Using buildroot images (iso/ext2) in real target
 device (flash drive)
In-Reply-To: <jio6ql$25v$1@dough.gmane.org>
References: <jio6ql$25v$1@dough.gmane.org>
Message-ID: <jn68cv$dcc$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 01/03/2012 17:06, Willy ha scritto:
> I "think" I've installed grub on my buildroot image
> ( package BR2_TARGET_GRUB [=y] ).
> How can I test if grub is properly installed and how can I setup it?
> Thanks,

I've still that problem :-(

Here what I do:
1. make buildroot with grub selected and iso/etx2/tar image
2. create an ext2 partition (with boot flag) in my usb key with gparted
3. use dd to put the ext2 fs in my key: dd if=rootfs.ext2 of=/dev/sdc1
	this put the fs in my key, but It say that only 11MB are
	avaiable, so I use gparted again to resize the partition and
	magically the dimension is correct!
4. put bzImage in the buildroot fs folder /boot
5. using qemu with -hda option to load buildroot and install grub in 
/dev/sdc1

When in grub (image booted with qemu) give the command setup (hd0) I got 
a segmentation fault.
Somewhere I found that there is a problem with a patch for grub (sorry, 
I don't remember exactly the name ...inode...ext2...) but I can't find 
this patch.

So I've downloaded grub sources and put them into my filesystem.
Then I've compiled grub into qemu virtualization (modifying arguments 
for the ar command in Makefiles from cru to cr) and then I've installed 
grub on the device hd0.
I've created a menu.lst file manually:
#########################################
default		0
timeout		10
color light-green/brown blink-red/blue

title		BuildRoot ISO9660 image
kernel		/boot/bzImage root=/dev/hda1
#########################################

Now when I try to boot with this key usb, briefly read "Grub loading..." 
then there is a reboot.

-- 
Willy
