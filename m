From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon, 25 Mar 2013 00:33:37 -0400 (EDT)
Subject: [Buildroot] [PATCH 2/2] configs: add RaspberryPi defconfig
In-Reply-To: <1358087034-2706-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <275398855.2673.1364186017130.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Minor comments below.

> For more info, please find board/raspberrypi/README.txt

If the defconfig filename is rpi_defconfig, shouldn't the board
directory be called board/rpi for consistency?


> +++ b/board/raspberrypi/README.txt

The patchs adds a whitespace error:

Applying: configs: add RaspberryPi defconfig
/home/vivien/projects/buildroot/.git/rebase-apply/patch:140: new blank line at EOF.
+
warning: 1 line adds whitespace errors


> +What is generated
> +-----------------
> +
> +After building, you should obtain this tree:
> +
> +    output/images/
> +    +-- rootfs.tar
> +    +-- rpi-firmware
> +    |?? +-- bootcode.bin
> +    |?? +-- config.txt
> +    |?? +-- fixup_cd.dat
> +    |?? +-- fixup.dat
> +    |?? +-- start_cd.elf
> +    |?? `-- start.elf
> +    `-- zImage
> +
> +Note : rootfs.tar will only be there if you kept "tar the root
> filesystem"
> +option selected in "Filesystem images".
> +
> +Where should the binaries be copied on the SDCard
> +-------------------------------------------------
> +
> +Your SDCard must have its first partition using fat32 and with
> bootable flags.
> +
> +At the root of the partition, the RaspberryPi must find the
> following files:
> +
> + * bootcode.bin
> + * config.txt
> + * fixup_cd.dat
> + * fixup.dat
> + * start_cd.elf
> + * start.elf
> + * zImage
> +
> +So you should, copy the entire content of output/images/rpi-firmware
> along with
> +zImage.
> +
> +Note : You can create any number of partitions you desire, the only
> requirement
> +is that the first partition must be using fat32.
> +
> +Persistent rootfs
> +==================
> +
> +How to build it
> +---------------
> +
> +You only need to use the rpi_defconfig, to do so:
> + * make rpi_defconfig
> +
> +What is generated
> +-----------------
> +
> +After building, you should obtain this tree:
> +
> +    output/images/
> +    +-- rootfs.tar
> +    +-- rpi-firmware
> +    |?? +-- bootcode.bin
> +    |?? +-- config.txt
> +    |?? +-- fixup_cd.dat
> +    |?? +-- fixup.dat
> +    |?? +-- start_cd.elf
> +    |?? `-- start.elf
> +    `-- zImage
> +
> +Where should the binaries be copied on the SDCard
> +-------------------------------------------------
> +
> +Your SDCard must have its first partition using fat32 and with
> bootable flags.
> +It should also have another partition which will contain your
> rootfs, it should
> +be partitioned as ext4.

I don't think ext4 is a requirement here, ext2 also works well.

> +
> +Boot partition
> +~~~~~~~~~~~~
> +
> +The first partition will contain everything used to boot the
> RaspberryPi.
> +You must copy theses files at the root of partition:
> +
> + * bootcode.bin
> + * config.txt
> + * fixup_cd.dat
> + * fixup.dat
> + * start_cd.elf
> + * start.elf
> + * zImage

The information in the README file is a bit redundant (especially
commands, output/images and 3rd party files listings). It could be
more concise, with just a note at the end for the non-persistent
config (with initramfs).


It may also be nice to have a simple script to create the sdcard
in the board directory, such as the one provided by OpenELEC:

https://github.com/OpenELEC/OpenELEC.tv/blob/master/packages/tools/bcm2835-bootloader/files/create_sdcard

What do you think?

Cheers,
Vivien
