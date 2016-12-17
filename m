From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:50:39 +0100
Subject: [Buildroot] [PATCH 1/2] first_boot_rootfs_resizer: New Package.
In-Reply-To: <20161202101028.26736-1-daggs@gmx.com>
References: <20161202101028.26736-1-daggs@gmx.com>
Message-ID: <20161217165039.6169d54c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Dec 2016 12:10:27 +0200, Dagg Stompler wrote:
> this new package will resize the root fs to the max possible when
> booting an image for the first time.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

I think this is still way too use-case specific, and I'll explain below
why your implementation only works in your specific case, but will fail
in many other cases.

> diff --git a/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk b/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk
> new file mode 100644
> index 000000000..8752831ea
> --- /dev/null
> +++ b/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# first_boot_rootfs_resizer
> +#
> +################################################################################
> +
> +FIRST_BOOT_ROOTFS_RESIZER_LICENSE = unclear

We clearly shouldn't have an "unclear" license for such a package.

> +FIRST_BOOT_ROOTFS_RESIZER_PRIO = $(shell printf "%02u" $(BR2_PACKAGE_FIRST_BOOT_ROOTFS_RESIZER_SYSV_PRIORITY))

Don't make the priority configurable.

> +++ b/package/first_boot_rootfs_resizer/resize_fs.sh
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          resize_fs.sh
> +# Required-Start:    $remote_fs $all
> +# Required-Stop:
> +# Default-Start:     2 3 4 5 S
> +# Default-Stop:
> +# Short-Description: First boot system setup
> +### END INIT INFO

Not needed in Buildroot init scripts.

> +PATH=/sbin:/usr/sbin:/bin:/usr/bin

Not needed.

> +ROOT=$(cat /proc/cmdline | tr ' ' '\n' | grep root= | cut -f 2 -d =)

This will fail badly if you have a GPT partition table and root= is
using the partition UUID, like:

	root=UUID=xyz

> +DEV=$(echo ${ROOT} | sed 's/p[0-9]\+$//g')

This only works for mmcblkXpY case, but not for sdXY

> +if [ -f /.first_boot ]; then
> +	echo "Resizing fs, please wait... upon finish the system will be restarted"
> +	# ok, its the very first boot, we need to resize the disk.
> +	p2_start=`fdisk -l ${DEV} | grep ${PART} | awk '{print $2}'`
> +	p2_finish=`fdisk -l ${DEV} | grep sectors | awk '{printf $5}'`

This will not work with the Busybox fdisk, which is the default in
Buildroot:

Disk /dev/sda: 256.0 GB, 256060514304 bytes
255 heads, 63 sectors/track, 31130 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks  Id System
/dev/sda1   *           1        3648    29295616  83 Linux
/dev/sda2            3648        4644     8000512  82 Linux swap
/dev/sda3            4644       31131   212761600  83 Linux

> +
> +	fdisk ${DEV} <<EOF
> +p
> +d
> +2
> +n
> +p
> +2
> +$p2_start
> +$p2_finish
> +p
> +w
> +EOF

Using sfdisk is probably more appropriate here, as it's meant to be
used for scripting.

> +	rm -fr /.first_boot
> +	sync
> +	reboot
> +else
> +	resize2fs ${ROOT} && rm -fr $0

This only works if the root filesystem is ext2/ext3/ext4. Perhaps your
package should depend on BR2_TARGET_ROOTFS_EXT2. Or the script should
check if the filesystem is really ext2, ext3 or ext4 before proceeding.

Also, this logic doesn't work if the root filesystem is mounted
read-only, since you expect to be able to remove .first_boot, and
remove the script itself.

> diff --git a/package/first_boot_rootfs_resizer/resizing b/package/first_boot_rootfs_resizer/resizing
> new file mode 100644
> index 000000000..4a19ce40e
> --- /dev/null
> +++ b/package/first_boot_rootfs_resizer/resizing
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +case "$1" in
> +	start)
> +		if [ -f /usr/sbin/resize_fs.sh ]; then /usr/sbin/resize_fs.sh; fi
> +		;;
> +	*)
> +		;;
> +esac

Why wouldn't the S00resizefs script directly do the resizing work?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
