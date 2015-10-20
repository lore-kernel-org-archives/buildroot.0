From: Alexandre Oliveira <alexandrenagy@gmail.com>
Date: Tue, 20 Oct 2015 00:33:37 +0000
Subject: [Buildroot] Kernel panic while trying to boot
 qemu_x86_64_defconfig on notebook with dual boot.
In-Reply-To: <CAAmaERM=kQUdtarFeq=MUAW-_rUwbequRBVp-Cr55ZFWvjVqLg@mail.gmail.com>
References: <CAAmaERMLtspQ2X-rSM_jaFGyqp_Gw1z6zOiPv=S9pZML=YjH-A@mail.gmail.com>
 <562093C7.9000501@mind.be>
 <CAAmaEROCOJc_LYXDoFtBJwidH-h531ogKDY0EQJeKKnX6752Hw@mail.gmail.com>
 <5620C977.8030101@mind.be>
 <CAAmaERM=kQUdtarFeq=MUAW-_rUwbequRBVp-Cr55ZFWvjVqLg@mail.gmail.com>
Message-ID: <CAAmaERN739zj0EUQLbfDTdxVy+rpoojS1wUeDeqxWyVEaKSVYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again,

It looks like I had some trash compiling code.

I just clean everything and build again, with your advices and it works.

There is no need to change fstab file.

I attached initramdisk to kernel and AHCI support.
Then, I run the following commands.

$ sudo umount /dev/sda7
$ sudo mount /dev/sda7 /mnt/btlinux/
$ sudo rm -rf /mnt/btlinux/*
$ sudo tar -C /mnt/btlinux/ -xf images/rootfs.tar
$ sudo mkdir /mnt/btlinux/boot
$ sudo cp /home/alexandre/x86_64output/images/bzImage /mnt/btlinux/boot/
$ sudo umount /dev/sda7

After that, I reboot and boot with GRUB like the e-mails before.

Thank you for the help.

Att.
Alexandre Oliveira.


Em sex, 16 de out de 2015 ?s 22:51, Alexandre Oliveira <
alexandrenagy@gmail.com> escreveu:

>
>  Hi Alexandre,
>>
>>  [Please don't top-post, but reply in-line with the quoted text as is done
>> below. Also remove redundant pieces of quoted text.]
>>
>
> I realized this right after sending the email. I am sorry.
>
>
>>  Normally, the kernel should also dump a list of block devices that it
>> found. If
>> it doesn't, then probably the drivers for your disk are not built into the
>> kernel. In "big" distroes like Debian/Ubuntu, there is an initramfs which
>> contains all possible drivers are modules and the correct one is loaded
>> at boot
>> time. The qemu defconfig in Buildroot is really minimal, it only contains
>> a PIIX
>> driver.
>>
>
> I attached init RAM disk into kernel with the option:
> [*] initial RAM  filesystem  linked into kernel. (Filesystem images menu).
> This avoid the need of calling a initramfs in the GRUB options. That's
> right?
>
>
>>
>>  To find the correct driver(s), do 'lsmod' in your ubuntu system. You'll
>> get a
>> long list of modules currently loaded, and you have to look for the ones
>> that
>> are related to the disk. Most likely, it's CONFIG_SATA_AHCI (module ahci)
>> that
>> you need. You'll probably also need CONFIG_MSDOS_PARTITION.
>
>  To enable these, run 'make linux-menuconfig', type / to search for the
>> options
>> you need, enable them (with y, not with m), and rebuild.
>>
>
> 'lsmod' command returns:
> ahci                   36864  2
> libahci                32768  1 ahci
>
> 'lspci' command returns:
> 00:1f.2 SATA controller: Intel Corporation 5 Series/3400 Series Chipset 6
> port SATA AHCI Controller (rev 05)
>
> The option CONFIG_SATA_AHCI  was not set.
> I just add it and re-make the buildroot linux system.
>
> After that, I run this script inside output directory:
>
> ========
> #!/bin/bash
> sudo umount /dev/sda7
> sudo mount /dev/sda7 /mnt/btlinux/
> sudo rm -rf /mnt/btlinux/*
> sudo tar -C /mnt/btlinux/ -xf images/rootfs.tar
> sudo cp fstab /mnt/btlinux/etc/
> ========
>
> the fstab has two new lines:
>
> ====
> /dev/sda7        / ext4         defaults 1 1
> /dev/sda5        none swap defaults 0 0
> ====
>
> Then, I reboot notebook an GRUB calls:
>
> =======
> menuentry 'Build root (em /dev/sda7)' --class gnu-linux --class gnu
> --class os $menuentry_id_option
> 'osprober-gnulinux-simple-96eafc8c-0063-417a-9c32-4ea96ee97b55' {
> insmod part_msdos
> insmod ext2
> set root='hd0,msdos7'
> if [ x$feature_platform_search_hint = xy ]; then
>  search --no-floppy --fs-uuid --set=root --hint-bios=hd0,msdos7
> --hint-efi=hd0,msdos7 --hint-baremetal=ahci0,msdos7
>  96eafc8c-0063-417a-9c32-4ea96ee97b55
> else
>  search --no-floppy --fs-uuid --set=root
> 96eafc8c-0063-417a-9c32-4ea96ee97b55
> fi
> linux /boot/bzImage root=/dev/sda7 console=tty1
>
> }
> =========
>
> But, after reboot, the same error is happening...
>
> ===========================
> VFS: Cannot open root device "sda7" or unknown-block(0,0)
> Please append a correct "root=" boot option; here are the available
> partitions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,0)  error -6
> ===========================
>
>
> I already learned a lot with your answers.
> I tried to add another Intel SATA drivers on Device Drivers menus from
> $make linux-menuconfig but the same error occurs...
>
> Do you have any new guess?
> Thank you in advance for the help.
>
>
> Best Regards,
> Alexandre Oliveira.
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151020/f1291ee1/attachment.html>
