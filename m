From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 07:38:40 +0200
Subject: [Buildroot] Setting better names for partitions
In-Reply-To: <CAOMZO5Cr9PUnSNDtMk7rcA_mC3FTe1AkCJT=9Jpj4WUKSMeDJw@mail.gmail.com>
References: <CAOMZO5Cr9PUnSNDtMk7rcA_mC3FTe1AkCJT=9Jpj4WUKSMeDJw@mail.gmail.com>
Message-ID: <20200415073840.7f790c52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabio,

On Tue, 14 Apr 2020 14:50:32 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> On i.MX we usually generate the boot images via
> board/freescale/common/imx/post-image.sh script, which creates two
> partitions:
> - One that contains the dtb and kernel
> - One for rootfs
> 
> The names of these partitions are strings like 5934-861D and
> ad09a287-46a9-4790-ba97-fbbb549e5e96.
> 
> Is there a way to specify a better name for the partitions? Something
> like "boot" and "rootfs" instead?
> 
> If so, how can this be achieved?

With DOS partition tables, there is no concept of "partition name" as
the partition table doesn't have any entry/space to store partition
names.

The strings like 5934-861D and ad09a287-46a9-4790-ba97-fbbb549e5e96 are
filesystems labels.

According to https://github.com/pengutronix/genimage/ and from a quick
look at the code, it seems like you can set such labels by doing:

	label = "boot"
	label = "rootfs"

inside the description of such images.

However, notice that when we do:

image boot.vfat {
  vfat {
    files = {
      "bcm2708-rpi-b.dtb",
      "bcm2708-rpi-b-plus.dtb",
      "bcm2708-rpi-cm.dtb",
      "rpi-firmware/bootcode.bin",
      "rpi-firmware/cmdline.txt",
      "rpi-firmware/config.txt",
      "rpi-firmware/fixup.dat",
      "rpi-firmware/start.elf",
      "zImage"
    }
  }
  size = 32M
}


image sdcard.img {
  hdimage {
  }

  partition boot {
    partition-type = 0xC
    bootable = "true"
    image = "boot.vfat"
  }

  partition rootfs {
    partition-type = 0x83
    image = "rootfs.ext4"
  }
}

The FAT filesystem image is created by genimage, and therefore the
label property would have an effect. However, the ext4 filesystem image
is created by Buildroot, so you will have to use the
BR2_TARGET_ROOTFS_EXT2_LABEL Buildroot option to set the label.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
