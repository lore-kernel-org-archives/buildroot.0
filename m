From: daggs <daggs@gmx.com>
Date: Fri, 23 Dec 2016 14:41:59 +0100
Subject: [Buildroot] [PATCH 1/2] first_boot_rootfs_resizer: New Package.
In-Reply-To: <20161217165039.6169d54c@free-electrons.com>
References: <20161202101028.26736-1-daggs@gmx.com>,
 <20161217165039.6169d54c@free-electrons.com>
Message-ID: <trinity-0083f4f6-b9ec-4e8f-83e5-87b64224abf7-1482500518932@3capp-mailcom-bs05>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

> Hello,
> 
> On Fri,  2 Dec 2016 12:10:27 +0200, Dagg Stompler wrote:
> > this new package will resize the root fs to the max possible when
> > booting an image for the first time.
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> I think this is still way too use-case specific, and I'll explain below
> why your implementation only works in your specific case, but will fail
> in many other cases.
> 
> > diff --git a/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk b/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk
> > new file mode 100644
> > index 000000000..8752831ea
> > --- /dev/null
> > +++ b/package/first_boot_rootfs_resizer/first_boot_rootfs_resizer.mk
> > @@ -0,0 +1,23 @@
> > +################################################################################
> > +#
> > +# first_boot_rootfs_resizer
> > +#
> > +################################################################################
> > +
> > +FIRST_BOOT_ROOTFS_RESIZER_LICENSE = unclear
> 
> We clearly shouldn't have an "unclear" license for such a package.
the file is ported from the odroidc2 buildroot, I've marked it unclear because it doesn't states it's license anywhere.

> 
> > +FIRST_BOOT_ROOTFS_RESIZER_PRIO = $(shell printf "%02u" $(BR2_PACKAGE_FIRST_BOOT_ROOTFS_RESIZER_SYSV_PRIORITY))
> 
> Don't make the priority configurable.
ok.

> 
> > +++ b/package/first_boot_rootfs_resizer/resize_fs.sh
> > @@ -0,0 +1,44 @@
> > +#!/bin/sh
> > +### BEGIN INIT INFO
> > +# Provides:          resize_fs.sh
> > +# Required-Start:    $remote_fs $all
> > +# Required-Stop:
> > +# Default-Start:     2 3 4 5 S
> > +# Default-Stop:
> > +# Short-Description: First boot system setup
> > +### END INIT INFO
> 
> Not needed in Buildroot init scripts.
> 
> > +PATH=/sbin:/usr/sbin:/bin:/usr/bin
> 
> Not needed.
will remove.

> 
> > +ROOT=$(cat /proc/cmdline | tr ' ' '\n' | grep root= | cut -f 2 -d =)
> 
> This will fail badly if you have a GPT partition table and root= is
> using the partition UUID, like:
> 
> 	root=UUID=xyz
> 
I see, that should be the proper way to detect the rootfs file system?

> > +DEV=$(echo ${ROOT} | sed 's/p[0-9]\+$//g')
> 
> This only works for mmcblkXpY case, but not for sdXY
correct, will see how I can generalize it more.

> 
> > +if [ -f /.first_boot ]; then
> > +	echo "Resizing fs, please wait... upon finish the system will be restarted"
> > +	# ok, its the very first boot, we need to resize the disk.
> > +	p2_start=`fdisk -l ${DEV} | grep ${PART} | awk '{print $2}'`
> > +	p2_finish=`fdisk -l ${DEV} | grep sectors | awk '{printf $5}'`
> 
> This will not work with the Busybox fdisk, which is the default in
> Buildroot:
> 
> Disk /dev/sda: 256.0 GB, 256060514304 bytes
> 255 heads, 63 sectors/track, 31130 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>    Device Boot      Start         End      Blocks  Id System
> /dev/sda1   *           1        3648    29295616  83 Linux
> /dev/sda2            3648        4644     8000512  82 Linux swap
> /dev/sda3            4644       31131   212761600  83 Linux
I'm pretty sure I've tested it with busybox's fdisk.

> 
> > +
> > +	fdisk ${DEV} <<EOF
> > +p
> > +d
> > +2
> > +n
> > +p
> > +2
> > +$p2_start
> > +$p2_finish
> > +p
> > +w
> > +EOF
> 
> Using sfdisk is probably more appropriate here, as it's meant to be
> used for scripting.
ok, will check.

> 
> > +	rm -fr /.first_boot
> > +	sync
> > +	reboot
> > +else
> > +	resize2fs ${ROOT} && rm -fr $0
> 
> This only works if the root filesystem is ext2/ext3/ext4. Perhaps your
> package should depend on BR2_TARGET_ROOTFS_EXT2. Or the script should
> check if the filesystem is really ext2, ext3 or ext4 before proceeding.
ok, I think it is better for now to limit it to ext2.

> 
> Also, this logic doesn't work if the root filesystem is mounted
> read-only, since you expect to be able to remove .first_boot, and
> remove the script itself.
so essentally, if the fs is read only, there is no way to remove it.
so the right way is to check every boot if the fs is maxed out to the boot dev and resize it if not.
am I correct?

> 
> > diff --git a/package/first_boot_rootfs_resizer/resizing b/package/first_boot_rootfs_resizer/resizing
> > new file mode 100644
> > index 000000000..4a19ce40e
> > --- /dev/null
> > +++ b/package/first_boot_rootfs_resizer/resizing
> > @@ -0,0 +1,11 @@
> > +#!/bin/sh
> > +
> > +case "$1" in
> > +	start)
> > +		if [ -f /usr/sbin/resize_fs.sh ]; then /usr/sbin/resize_fs.sh; fi
> > +		;;
> > +	*)
> > +		;;
> > +esac
> 
> Why wouldn't the S00resizefs script directly do the resizing work?
as said above, I've ported it from the odroidc2 buildroot, so I didn't tried to change it too much.

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
