From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Nov 2015 21:40:30 +0100
Subject: [Buildroot] [PATCH 2/2] board: add support for Chromebook Snow
In-Reply-To: <8ac071d88d311f605b895f6b8df18fc4bdd07d55.1447689401.git.alex.suykov@gmail.com>
References: <cover.1447689401.git.alex.suykov@gmail.com>
 <8ac071d88d311f605b895f6b8df18fc4bdd07d55.1447689401.git.alex.suykov@gmail.com>
Message-ID: <564A3F3E.1020207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-11-15 18:54, Alex Suykov wrote:
> Samsung XE303C12 aka Chromebook Snow is an Exynos5250-based netbook.
> 
> There is barely anything special about this target as far as toolchain
> is concerned, but its bootloader only accepts signed kernel images
> in a Chromium OS specific format, and is not controllable otherwise.
> 
> This config provides a script for building the proper kernel blobs,
> and a short manual for booting Buildroot images on the device.
> 
> The kernel defconfig is also provided. Mainline kernel already
> has exynos_defconfig which could have been used here, but it builds
> mwifiex statically, and that module tries to load its firmware during
> initialization.
> 
> Since the board was going to get a custom kernel config anyway,
> exynos_defconfig was trimmed to only include the drivers needed
> for this particular chip and this particular board.
> 
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
[snip]

> +Partitioning the SD card
> +------------------------
> +Figure out the device name for the card on the host system. Typically
> +it is either /dev/sdX or /dev/mmcblkX.
> +
> +	SD=/dev/sdb
> +
> +DOUBLE CHECK THE DEVICE NAME! The commands below will destroy and partially
> +overwrite partitions on that device. Also make sure you have appropriate
> +write permissions.
> +
> +You will need cgpt utility from vboot-utils package:
> +
> +	CGPT=output/host/usr/bin/cgpt
> +
> +First, erase and create a new GPT:
> +
> +	$CGPT create -z $SD
> +	$CGPT create $SD	# ignore complaints about invalid GPT
> +
> +Take a look at the table:
> +
> +	$CGPT show $SD
> +	       start        size    part  contents
> +	           0           1          PMBR
> +	           1           1          Pri GPT header
> +	           2          32          Pri GPT table
> +	    15564767          32          Sec GPT table
> +	    15564799           1          Sec GPT header
> +
> +All offsets and sizes are in 512-blocks, and this table is from a 8GB SD card.
> +Decide partition sizes. The kernel and the rootfs partition must fit between
> +Pri and Sec GPT tables. It is also a good idea to have everything aligned
> +at 8KB (16 blocks) boundary.
> +
> +	start=$[(2+32+15)&~15]
> +	kernelsize=$[8*1024*2]			# 8MB in 512 blocks
> +	rootfssize=$[(15564767-kernelsize-start)&~15]
> +
> +Create the partitions, marking the kernel partition as bootable.
> +
> +	$CGPT add -i 1 -b $start -s $kernelsize \
> +		-t kernel -l kernel\
> +		-S 1 -T 1 -P 10 $SD
> +	$CGPT add -i 2 -b $[start+kernelsize] -s $rootfssize \
> +		-t data -l rootfs $SD

 Wouldn't it be possible to do all this in a post-image script that generates an
SD card image?

> +
> +Check the resulting GPT:
> +
> +	$CGPT show $SD
> +	       start        size    part  contents
> +	           0           1          PMBR
> +	           1           1          Pri GPT header
> +	           2          32          Pri GPT table
> +	          48       16384       1  Label: "kernel"
> +	                                  Type: ChromeOS kernel
> +	                                  UUID: ...
> +	                                  Attr: priority=10 tries=1 successful=1
> +	       16432    15548320       2  Label: "rootfs"
> +	                                  Type: Linux data
> +	                                  UUID: ...
> +	    15564767          32          Sec GPT table
> +	    15564799           1          Sec GPT header
> +
> +Natually this only needs to be done once per card.
> +
> +
> +Writing kernel and rootfs to the SD card
> +----------------------------------------
> +Write .kpart directly to the bootable partition:
> +
> +	dd if=output/images/uImage.kpart of=${SD}1
> +
> +Make a new filesystem on the rootfs parition, and unpack fs image there:
> +
> +	mkfs.ext4 ${SD}2
> +	mount ${SD2} /mnt/<ROOTFS-PARTITION>
> +	tar -xvf output/images/rootfs.tar -C /mnt/<ROOTFS-PARTITION>
> +	umount /mnt/<ROOTFS-PARTITION>
> +
> +This will require root permissions even if you can write to $SD.
> +
> +Alternatively, just write the fs image directly to the partition:
> +
> +	dd if=output/images/rootfs.ext2 of=${SD}2
> +
> +Select ext* fs image in menuconfig before doing this, and consider specifying
> +extra fs size to have some empty space available there.

 Just add an ext4 image to the buildroot config right away.

[snip]
> diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
> new file mode 100644
> index 0000000..631ed73
> --- /dev/null
> +++ b/configs/chromebook_snow_defconfig
> @@ -0,0 +1,17 @@
> +BR2_arm=y
> +BR2_cortex_a15=y

 You also have to fixate the kernel headers version, i.e. use a custom version
and specify 4.3

> +BR2_BINUTILS_VERSION_2_25_X=y
> +BR2_GCC_VERSION_5_X=y
> +BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_TARGET_GENERIC_GETTY_TERM="linux"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
> +BR2_LINUX_KERNEL=y

 Here also fixate the version, but SAME_AS_HEADERS is ok.

> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/chromebook/snow/linux-4.3.config"
> +BR2_LINUX_KERNEL_ZIMAGE=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797=y

 As mentioned, add an ext4 image.

 Regards,
 Arnout

> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +BR2_PACKAGE_HOST_VBOOT_UTILS=y
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
