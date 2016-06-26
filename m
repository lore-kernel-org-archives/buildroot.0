From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 22:22:01 +0200
Subject: [Buildroot] [PATCH 2/2] board: add support for the Odroid XU4
 board
In-Reply-To: <1466950062-31783-3-git-send-email-andi@etezian.org>
References: <1466950062-31783-1-git-send-email-andi@etezian.org>
 <1466950062-31783-3-git-send-email-andi@etezian.org>
Message-ID: <20160626222201.35c7cb53@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 17:07:42 +0300, Andi Shyti wrote:

> +Set up the bootloader
> +---------------------
> +
> +I will assume you will use an sd card which will have as mount point /dev/sdb.
> +The above images need to be flashed to the SD card to specific addresses, as
> +follows:
> +
> + # dd if=bl1.bin.hardkernel of=/dev/sdb seek=1 bs=512
> + # dd if=bl2.bin.hardkernel.1mb_uboot of=/dev/sdb seek=31 bs=512
> + # dd if=u-boot.bin of=/dev/sdb seek=63 bs=512
> + # dd if=tzsw.bin.hardkernel of=/dev/sdb seek=2111 bs=512
> +
> +With the above we should be able to boot up to the u-boot bootloader.
> +
> +Set up the SD card
> +------------------
> +
> +The SD card will need to partitions, which you can make with your favourite
> +partitioner. At the end it should look like this:
> +
> +Device         Boot  Start      End  Sectors  Size Id Type
> +/dev/sdb1             4096   135167   131072   64M  b W95 FAT32
> +/dev/sdb2           135168 15523839 15388672  7.3G 83 Linux
> +
> +IMPORTANT: Please note that the first partition starts at the block 4096 instead
> +of the default 2048. This is due to the sizes of the binaries we flased earlier,
> +which go over the 2048 block, therefore, you need to start the first partition
> +at a further location, e.g. 4096.
> +
> +Now format the two partitions, the first as vfat FS type, the second as EXT3 or
> +EXT4:
> +
> + # mkfs.vfat /dev/sdb1
> + # mkfs.ext4 /dev/sdb2
> +
> +Finalize the SD card
> +--------------------
> +
> +Now it's time to move Kernel and File System to the SD card. We will start from
> +the Kernel partition.
> +
> +First mount it:
> +
> + # mount /dev/sdb1/ /mnt/
> +
> +and copy kernel and dtb
> +
> + # cp <buildroot>/output/images/zImage /mnt/
> + # cp <buildroot>/output/images/exynos5422-odroidxu4.dtb /mnt/
> +
> +umount the partition
> +
> + # sync
> + # umount /dev/sdb1
> +
> +Mount the rootfs partition:
> +
> + # mount /dev/sdb2 /mnt/
> + # tar
> + # cp <buildroot>/output/images/rootfs.tar -C /mnt/
> +
> +Umount the partition
> +
> + # sync
> + # umount /dev/sdb2
> +
> +The SD card is ready, you can boot now your Odroid XU-4.

Please replace all this with a genimage script. It allows you to easily
describe a FAT and an ext4 partition, and also allows you to place your
bootloader images at arbitrary offsets.

See board/freescale/imx6ulevk/genimage.cfg for an example.

> +Automate u-boot commands
> +------------------------
> +
> +In order to avoid customizing u-boot from the u-boot system at boot time, you
> +can use the boot.cmd file in board/odroid-xu4.
> +
> +Jut run
> +
> + $ mkimage -A arm -T script -C none -d boot.cmd boot.scr

Please do this in a post-image script, do that boot.scr is directly
produced in output/images, and added to the FAT partition by the
genimage script.

See board/orangepi/orangepipc/post-build.sh for an example.

> diff --git a/configs/odroid-xu4_defconfig b/configs/odroid-xu4_defconfig
> new file mode 100644
> index 0000000..5eca993
> --- /dev/null
> +++ b/configs/odroid-xu4_defconfig
> @@ -0,0 +1,10 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_KERNEL_HEADERS_4_6=y

Please use:

BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y

which tells Buildroot to use the sources of the kernel being built for
the kernel headers.

> +BR2_LINUX_KERNEL=y

You need to specify the exact kernel version that you want to build.

> +BR2_LINUX_KERNEL_DEFCONFIG="exynos"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
> +BR2_PACKAGE_ODROID_XU_BL=y
> +BR2_TARGET_UBOOT=y

You need to specify the exact U-Boot version that you want to build.
So, as per my reply on PATCH 1/2, it should probably point to the
vendor-specific U-Boot version, so that you can use the pre-built
binaries for the first stage bootloaders.

> +BR2_TARGET_UBOOT_BOARDNAME="odroid-xu3"

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
