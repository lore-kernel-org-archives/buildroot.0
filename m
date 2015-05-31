From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 May 2015 10:08:42 +0300
Subject: [Buildroot] [PATCH v2 1/1] Solid-Run HummingBoard i2eX
 defconfig and bootable microSD Bash script
In-Reply-To: <1433025084-25182-1-git-send-email-yba@tkos.co.il>
References: <1433025084-25182-1-git-send-email-yba@tkos.co.il>
Message-ID: <20150531070842.GD2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yonatan,

On Sun, May 31, 2015 at 01:31:24AM +0300, Jonathan Ben-Avraham wrote:
> Solid-Run HummingBoard i2eX defconfig and bootable microSD Bash script
> 
> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
> ---
>  board/solid-run/hummingboard-i2eX/readme.txt |  11 ++
>  board/solid-run/make_sd_card.sh              | 278 +++++++++++++++++++++++++++
>  configs/hummingboard_i2eX_defconfig          |  25 +++
>  3 files changed, 314 insertions(+)
>  create mode 100644 board/solid-run/hummingboard-i2eX/readme.txt
>  create mode 100755 board/solid-run/make_sd_card.sh
>  create mode 100644 configs/hummingboard_i2eX_defconfig
> 
> diff --git a/board/solid-run/hummingboard-i2eX/readme.txt b/board/solid-run/hummingboard-i2eX/readme.txt
> new file mode 100644
> index 0000000..4e25179
> --- /dev/null
> +++ b/board/solid-run/hummingboard-i2eX/readme.txt
> @@ -0,0 +1,11 @@
> +Solid-Run HummingBoard-i2eX minimal defconfig, without WiFi or OpenGL firmware
> +is provided in configs/hummingboard_i2eX_defconfig
> +
> +Bash script for creating bootable microSD cards is in
> +board/solid-run/make_sd_card.sh
> +
> +Example usage:
> +
> +sudo make_sd_card.sh sde output HummingBoard-i2eX 256

A short description of script parameters would be nice.

> +
> +Maintainer: yba at tkos.co.il
> diff --git a/board/solid-run/make_sd_card.sh b/board/solid-run/make_sd_card.sh
> new file mode 100755
> index 0000000..8586ff6
> --- /dev/null
> +++ b/board/solid-run/make_sd_card.sh
> @@ -0,0 +1,278 @@
> +#!/bin/bash -eu

[...]

> +# rootfs partition starting at 1MB with size of ROOTFS_PARTITION_SIZE
> +ROOTFS_PARTITION="n\np\n1\n2048\n+16M\nn\np\n2\n\n+${ROOTFS_PARTITION_SIZE}M\na\n\nw\n"
> +
> +# Not so cool - I will have to maintain this script every time Rabeeh pushes
> +# new code
> +if [ -z "${KERNEL_DIR+x}" ]
> +then
> +	KERNEL_DIR=${BUILDROOT_OUTPUT_DIR}/build/linux-ea83bda1b403d745c67fbf6ea307d05ca138577f
> +fi
> +
> +if [ -z "${UBOOT_DIR+x}" ]
> +then
> +	UBOOT_DIR=${BUILDROOT_OUTPUT_DIR}/build/uboot-e817fa3165a607b581433a6abfe37e095a5d1dc9
> +fi

These variables are set here but are only used below for kernel and U-Boot 
directory existence check.

> +
> +# Handle Ubuntu fdisk silliness
> +if echo $(uname -a) | grep -q Ubuntu
> +then
> +	FDISK="fdisk -c -u"
> +else
> +	FDISK="fdisk -u=sectors"
> +fi

AFAIK fdisk behaviour changed between versions. This is no Ubuntu specific. 
Anyway, sfdisk is better suited for scripted use.

[...]

> +BINS="fdisk mkfs.ext4 mount umount dd mktemp partprobe"
> +for BIN in ${BINS}
> +do
> +	if ! which ${BIN} >/dev/null
> +	then
> +		echo "${ME} ERROR: Required executable ${BIN} is not in PATH"
> +		ERROR=$((${ERROR}+1))
> +	fi
> +done

Buildroot can build host versions of util-linux (fdisk, mount, umount), 
e2fsprogs (mkfs.ext4), and parted (partprobe). In that case you should find 
these utilities under ${BUILDROOT_OUTPUT_DIR}/host/usr/sbin/.

[...]

> +if ! mount ${PART2} ${MOUNT_POINT}
> +then
> +	echo "${ME} ERROR: Cannot mount ${PART2} on ${MOUNT_POINT}"
> +	exit 1
> +fi
> +
> +tar xvf ${BUILDROOT_OUTPUT_DIR}/images/rootfs.tar -C ${MOUNT_POINT}
> +umount ${MOUNT_POINT}
> +
> +if ! mkfs.ext4 -F -O ^has_journal -E stride=2,stripe-width=1024 -b 4096 ${PART1}
> +then
> +	echo "${ME} ERROR: Failed to create ext4 filesystem on ${PART1}"
> +	exit 1
> +fi

Buildroot can create ready made ext{2,3,4} images itself. See 'Filesystem 
images -> ext2/3/4 root filesystem' in menuconfig.

> +
> +if ! mount ${PART1} ${MOUNT_POINT}
> +then
> +	echo "${ME} ERROR: Cannot mount ${PART1} on ${MOUNT_POINT}"
> +	exit 1
> +fi
> +
> +cp ${BUILDROOT_OUTPUT_DIR}/images/zImage ${MOUNT_POINT}

Buildroot can do that for you as well. See 'Kernel -> Install kernel image to 
/boot in target' in menuconfig.

> +
> +case ${BOARD_MODEL} in
> +	HummingBoard-i2eX)
> +		cp ${BUILDROOT_OUTPUT_DIR}/images/imx6q-hummingboard.dtb ${MOUNT_POINT}

Ditto.

> +		;;
> +	*)
> +		if [ -f  ${BUILDROOT_OUTPUT_DIR}/images/${BOARD_MODEL} ]
> +		then
> +			cp ${BUILDROOT_OUTPUT_DIR}/images/${BOARD_MODEL} ${MOUNT_POINT}
> +		else
> +			echo "${ME} WARNING: No dtb file found"
> +		fi
> +		;;
> +esac
> +
> +umount ${MOUNT_POINT}

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
