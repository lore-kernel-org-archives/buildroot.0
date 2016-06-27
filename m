From: Andi Shyti <andi.shyti@gmail.com>
Date: Tue, 28 Jun 2016 03:04:26 +0900
Subject: [Buildroot] [PATCH 2/2] board: add support for the Odroid XU4
 board
In-Reply-To: <20160626222201.35c7cb53@free-electrons.com>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
 <1466950062-31783-3-git-send-email-andi@etezian.org>
 <20160626222201.35c7cb53@free-electrons.com>
Message-ID: <20160627180426.GM424@jack.zhora.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> > +Finalize the SD card
> > +--------------------
> > +
> > +Now it's time to move Kernel and File System to the SD card. We will start from
> > +the Kernel partition.
> > +
> > +First mount it:
> > +
> > + # mount /dev/sdb1/ /mnt/
> > +
> > +and copy kernel and dtb
> > +
> > + # cp <buildroot>/output/images/zImage /mnt/
> > + # cp <buildroot>/output/images/exynos5422-odroidxu4.dtb /mnt/
> > +
> > +umount the partition
> > +
> > + # sync
> > + # umount /dev/sdb1
> > +
> > +Mount the rootfs partition:
> > +
> > + # mount /dev/sdb2 /mnt/
> > + # tar
> > + # cp <buildroot>/output/images/rootfs.tar -C /mnt/
> > +
> > +Umount the partition
> > +
> > + # sync
> > + # umount /dev/sdb2
> > +
> > +The SD card is ready, you can boot now your Odroid XU-4.
> 
> Please replace all this with a genimage script. It allows you to easily
> describe a FAT and an ext4 partition, and also allows you to place your
> bootloader images at arbitrary offsets.
> 
> See board/freescale/imx6ulevk/genimage.cfg for an example.

sure! It's indeed better!

> > +Automate u-boot commands
> > +------------------------
> > +
> > +In order to avoid customizing u-boot from the u-boot system at boot time, you
> > +can use the boot.cmd file in board/odroid-xu4.
> > +
> > +Jut run
> > +
> > + $ mkimage -A arm -T script -C none -d boot.cmd boot.scr
> 
> Please do this in a post-image script, do that boot.scr is directly
> produced in output/images, and added to the FAT partition by the
> genimage script.
> 
> See board/orangepi/orangepipc/post-build.sh for an example.

I will, thanks!

> > +BR2_arm=y
> > +BR2_cortex_a7=y
> > +BR2_KERNEL_HEADERS_4_6=y
> 
> Please use:
> 
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
> 
> which tells Buildroot to use the sources of the kernel being built for
> the kernel headers.

OK.

> > +BR2_LINUX_KERNEL=y
> 
> You need to specify the exact kernel version that you want to build.

OK.

> > +BR2_LINUX_KERNEL_DEFCONFIG="exynos"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
> > +BR2_PACKAGE_ODROID_XU_BL=y
> > +BR2_TARGET_UBOOT=y
> 
> You need to specify the exact U-Boot version that you want to build.
> So, as per my reply on PATCH 1/2, it should probably point to the
> vendor-specific U-Boot version, so that you can use the pre-built
> binaries for the first stage bootloaders.

OK.

> > +BR2_TARGET_UBOOT_BOARDNAME="odroid-xu3"
> 
> Thanks,

Thank you, I will fix the above in the second version of the
patchset.

Andi
