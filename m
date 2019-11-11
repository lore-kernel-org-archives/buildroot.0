From: Whitney, Scott <scwhitn@amazon.com>
Date: Mon, 11 Nov 2019 20:14:59 +0000
Subject: [Buildroot] How to create/install U-Boot and Linux to boot from eMMC
Message-ID: <a78aeb5e102b46c5827b626bcc23c23c@EX13D04UEA001.ant.amazon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot community,

I'm using Buildroot to successfully build U-Boot and a Linux image for an AM6548 Sitara processor.  I created sdcard.img in output/images using genimage, with the following configuration file:

image boot.vfat {
    vfat {
        files = {
            "sysfw.itb",
            "tiboot3.bin",
            "tispl.bin",
            "u-boot.img",
            "uEnv.txt",
            "Image",
            "k3-am654-reflex3-board.dtb"
        }
    }
    size = 70M
}

image sdcard.img {
    hdimage {
    }

    partition u-boot {
        partition-type = 0xC
        bootable = "true"
        image = "boot.vfat"
    }

    partition rootfs {
        partition-type = 0x83
        image = "rootfs.ext4"
        size = 1G
    }
}

I program this directly onto the SD card with:

    sudo dd if=./sdcard.img of=/dev/mmcblk0 bs=1M

where /dev/mmcblk0 is how my SD card shows up in Ubuntu, as can be seen using lsblk.  This combination of boot and rootfs partitions goes through U-Boot successfully and gets me to a Linux login prompt.  So far, so good.

Our board also has 8GB of eMMC memory.  I'd like to know how to use Buildroot to program boot/U-Boot and rootfs/Linux onto the eMMC so that we can boot directly from that without having to have an SD card installed.

Can anyone provide instructions for partitioning, formatting, and installing an image suitable for booting from eMMC card?  I can have genimage create an eMMC.img file if the format needs to be different, but I'm just not sure what needs to be on the eMMC for this to work successfully.

Many thanks for your help, and best regards!
Scott Whitney | Contractor - Software Engineering
scwhitn at amazon.com| o: xxx.xxx.xxx| m: 603.321.6662
a: 300 Riverpark Drive, North Reading, MA 01864
www.amazonrobotics.com
