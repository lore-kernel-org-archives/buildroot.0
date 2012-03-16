From: =?iso-8859-1?Q?Mikael_=C5sberg?= <mikael.asberg@mdh.se>
Date: Fri, 16 Mar 2012 18:44:51 +0100
Subject: [Buildroot] Create a bootable SD Card
In-Reply-To: <CAAbSJMVHwjaJTFdS51gLf81kN6qDBMmGPZJUZZatUWd2X2cz1A@mail.gmail.com>
References: <63D6870D443E63419AC4A0C97B86C0920428BC3017@MBXCLUSTER.mdh.local>,
 <CAAbSJMVHwjaJTFdS51gLf81kN6qDBMmGPZJUZZatUWd2X2cz1A@mail.gmail.com>
Message-ID: <63D6870D443E63419AC4A0C97B86C0920428BC3018@MBXCLUSTER.mdh.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I followed the following steps:

sudo dd if=/dev/zero of=/dev/mmcblk0 bs=1024 count=1024
sudo sfdisk --force -D -uS -H 128 -S 63 -C 960 /dev/mmcblk0
sudo mkfs.vfat -F 32 /dev/mmcblk0p1 -n boot
sudo mke2fs -j -L rootfs /dev/mmcblk0p2
sudo mkdir /media/{boot,rootfs}
sudo mount -t vfat /dev/mmcblk0p1 /media/boot
sudo mount -t ext3 /dev/mmcblk0p2 /media/rootfs
sudo cp barebox.bin /media/boot/barebox.bin
sudo cp uImage /media/boot/uImage
sudo tar xaf rootfs.tar -C /media/rootfs
sync
sudo umount /media/boot
sudo umount /media/rootfs

I was not successfull.

I guess the "dd" command should be changed to:
"dd if=barebox.bin of=/dev/mmcbkl0 bs=512 skip=4"

Are the other steps ok?

>The bootloader has to be "signed" by a signing tool that can be found
>in LTIB, or written according to the datasheet.

Do you know any tool that can do this?

Regards

--------------------------------------------------------------
Mikael ?sberg
PhD student (Doktorand), Computer Engineering
School of Innovation, Design and Engineering
M?lardalen University, V?ster?s Sweden
Phone: +46(0)21 101502
Room nr: U1-145
Mail: mikael.asberg at mdh.se
--------------------------------------------------------------
________________________________________
Fr?n: Mickael Chazaux [mickael.chazaux at gmail.com]
Skickat: den 16 mars 2012 17:57
Till: Mikael ?sberg
Kopia: buildroot at busybox.net
?mne: Re: [Buildroot] Create a bootable SD Card

Hi,

>
> I have generated a file-system, bootloader and image for the platform i.MX28 EVK (using Buildroot).
>
> How do I create a bootable SD memory card (using these files)?
>

__IIRC__

The bootloader has to be written at address 0x800 on the SD card (dd
if=myfile of=/dev/mmcbkl0 bs=512 skip=4)
This leaves room for a standard PC BIOS partition header (Write it with fdisk)
In this partition header, you may define a partition starting *after*
the end of the bootloader, up to the end of the card, to put the
rootfs
If so, put on it whatever filesystem you like (squashfs, extX, ...)
with the method you prefer
    - squashfs example : dd if=mycompressedrootfs.squashfs of=/dev/mmcblk0p1
    - ext4 example : mkfs.ext4 /dev/mmcblk0p1 && mount /dev/mmcblk0p1
/mnt && cd  /mnt && tar -zxvpf mycoolrootfs.tar.gz

The bootloader has to be "signed" by a signing tool that can be found
in LTIB, or written according to the datasheet.

Regards,

Mickael
