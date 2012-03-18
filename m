From: =?iso-8859-1?Q?Mikael_=C5sberg?= <mikael.asberg@mdh.se>
Date: Sun, 18 Mar 2012 11:52:51 +0100
Subject: [Buildroot] Create a bootable SD Card
In-Reply-To: <CAAbSJMVHwjaJTFdS51gLf81kN6qDBMmGPZJUZZatUWd2X2cz1A@mail.gmail.com>
References: <63D6870D443E63419AC4A0C97B86C0920428BC3017@MBXCLUSTER.mdh.local>,
 <CAAbSJMVHwjaJTFdS51gLf81kN6qDBMmGPZJUZZatUWd2X2cz1A@mail.gmail.com>
Message-ID: <63D6870D443E63419AC4A0C97B86C0920428BC3019@MBXCLUSTER.mdh.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have two issues:

1.

>In this partition header, you may define a partition starting *after*
>the end of the bootloader, up to the end of the card, to put the
>rootfs

How do I know where the bootloader part ends?

2.

Where do I put my "uImage"? From my experience it should be in /boot but my rootfs does not have /boot?

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
