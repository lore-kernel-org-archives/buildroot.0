From: Mickael Chazaux <mickael.chazaux@gmail.com>
Date: Fri, 16 Mar 2012 17:57:13 +0100
Subject: [Buildroot] Create a bootable SD Card
In-Reply-To: <63D6870D443E63419AC4A0C97B86C0920428BC3017@MBXCLUSTER.mdh.local>
References: <63D6870D443E63419AC4A0C97B86C0920428BC3017@MBXCLUSTER.mdh.local>
Message-ID: <CAAbSJMVHwjaJTFdS51gLf81kN6qDBMmGPZJUZZatUWd2X2cz1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
