From: Alexandre Oliveira <alexandrenagy@gmail.com>
Date: Fri, 16 Oct 2015 02:41:09 +0000
Subject: [Buildroot] Kernel panic while trying to boot qemu_x86_64_defconfig
 on notebook with dual boot.
Message-ID: <CAAmaERMLtspQ2X-rSM_jaFGyqp_Gw1z6zOiPv=S9pZML=YjH-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone.

I am having a problem while trying to boot qemu_x86_64_defconfig on my
notebook. My configuration is really simple. The .config file is attached.

Following the manual, I first tried to boot and run my configuration with
QEMU, using the command:

============
$ qemu-system-x86_64 -M pc -kernel images/bzImage -drive
file=images/rootfs.ext2,if=ide -append root=/dev/sda -net nic,model=rtl8139
-net user
============

This command works properly and Linux boots normally. After that, I created
a ext4 partition on /dev/sda7, which I mapped on /mnt/btlinux/

==================
$ sudo tar -C /mnt/btlinux/ -xf images/rootfs.tar
==================


All files were correctly extracted to the partition. Then, I added one more
boot option on GRUB.cfg file.

My UBUNTU is booting with:


==================================
menuentry 'Ubuntu' --class ubuntu --class gnu-linux --class gnu --class os
$menuentry_id_option 'gnulinux-simple-339d246f-008b-4cdf-8bbc-5ed43ca2d4c6'
{
recordfail
load_video
gfxmode $linux_gfx_mode
insmod gzio
insmod part_msdos
insmod ext2
set root='hd0,msdos6'
if [ x$feature_platform_search_hint = xy ]; then
 search --no-floppy --fs-uuid --set=root --hint-bios=hd0,msdos6
--hint-efi=hd0,msdos6 --hint-baremetal=ahci0,msdos6
 339d246f-008b-4cdf-8bbc-5ed43ca2d4c6
else
 search --no-floppy --fs-uuid --set=root
339d246f-008b-4cdf-8bbc-5ed43ca2d4c6
fi
linux /boot/vmlinuz-3.19.0-30-generic
root=UUID=339d246f-008b-4cdf-8bbc-5ed43ca2d4c6 ro  quiet splash $vt_handoff
initrd /boot/initrd.img-3.19.0-30-generic
}
====================================

My new Linux is set with:



===================
menuentry 'BTLinux (em /dev/sda7)' --class gnu-linux --class gnu --class os
$menuentry_id_option
'osprober-gnulinux-simple-96eafc8c-0063-417a-9c32-4ea96ee97b55' {
insmod part_msdos
insmod ext2
set root='hd0,msdos7'
if [ x$feature_platform_search_hint = xy ]; then
 search --no-floppy --fs-uuid --set=root --hint-bios=hd0,msdos7
--hint-efi=hd0,msdos7 --hint-baremetal=ahci0,msdos7
 96eafc8c-0063-417a-9c32-4ea96ee97b55
else
 search --no-floppy --fs-uuid --set=root
96eafc8c-0063-417a-9c32-4ea96ee97b55
fi
linux /boot/bzImage root=/dev/sda7 console=tty1

}
===================


I add the following two lines for /etc/fstab from the new linux:


=================
/dev/sda7                 /          ext4                defaults 1 1
/dev/sda5                 swap  swap             defaults 0 0
=================


Ubuntu is on /dev/sda6 and BTLinux is on /dev/sda7.
After boot starts, i get the famous following error:


===========================
VFS: Cannot open root device "sda7" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available
partitions:
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)  error -6
===========================


1 - Why QEMU boot work properly and when I extract the same image to
/dev/sda7, the boot fails?
2 - What is QEMU doing that the 'normal boot' process are not doing?
3 - Why the file at /boot/bzImage can be found but the device /dev/sda7 can
not?
4 - Am I missing something?

Could someone please help?


Thanks in advance for the assistance.

Regards,
Alexandre Oliveira.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151016/2d5b920a/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 53014 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151016/2d5b920a/attachment.obj>
