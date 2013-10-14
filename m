From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Oct 2013 00:39:06 +0200
Subject: [Buildroot] [PATCHv3] beaglebone: add BeagleBone Black support
In-Reply-To: <1381522187-16334-1-git-send-email-jkridner@beagleboard.org>
References: <1381522187-16334-1-git-send-email-jkridner@beagleboard.org>
Message-ID: <525C728A.6030808@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Jason,

On 11/10/13 22:09, Jason Kridner wrote:
> From: Jason Kridner <jdk@ti.com>
>
> * Update BeagleBone to 3.8.13-beagleboard kernel
> * Update to u-boot 2013.07
> * Add BeagleBone Black device tree
> * Remove M3 firmware loading until debugged
> * Remove BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS because it is the default
>
> Just to make sure this is documented well, here are the steps I used to test
> the output images:

  This kind of information should go into board/beaglebone/readme.txt.

>   # gzip rootfs.ext2

  If you set BR2_TARGET_ROOTFS_EXT2_GZIP you don't need to do this.

  However, using ext2 for a ramdisk image is horribly inefficient. You'd 
normally use a cpio image. Also, lzma (smaller size) or lzop (larger but 
faster uncompression) are better choices than gzip.

>   # mkimage -A arm -O linux -T ramdisk -C gzip -a 0x81000000 -d rootfs.ext2.gz ramdisk.gz

  Ideally, you should make a post-image script 
(BR2_ROOTFS_POST_IMAGE_SCRIPT) in the board/beaglebone directory that 
does these steps automatically. And since this script uses mkimage, I'd 
also explicitly enable BR2_PACKAGE_HOST_UBOOT_TOOLS (even though it is 
implicitly build for the kernel uImage).

>   # The URL is where I stored the ouptut of 'make beaglebone_defconfig; make'
>   $ wget -r https://s3.amazonaws.com/beagle/buildroot/2013-10-11-16%3A52%3A21/index.html
>   $ cd s3.amazonaws.com/beagle/buildroot/2013-10-11-16:52:21
>   $ cat >uEnv.txt <<EOF
>   bootpart=0:1
>   bootdir=
>   uenvcmd=run loaduimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
>   EOF

  You can add uEnv.txt to board/beaglebone and copy it to images/ in the 
post-image script.

>   # With /mnt being a FAT formatted uSD card with partition marked as bootable
>   $ cp MLO u-boot.img uImage ramdisk.gz uEnv.txt *.dtb /mnt
>   # eject /mnt
>   # Insert uSD card into BeagleBone Black
>   # Hold "BOOT" button
>   # Apply power and release "BOOT" button
>   # Serial log at screenlog.0

  With the post-image script, the readme can be limited to these 7 lines :-)

>
> Ideally for me, I'd switch to an initramfs and patch u-boot to avoid uEnv.txt,
> but I'll do that separately.

  I'm not a fan of initramfs because every rootfs change requires a slow 
re-link of the kernel... And I don't see the harm in uEnv.txt.

>
> Changes since v2 (http://lists.busybox.net/pipermail/buildroot/2013-September/079136.html):

  The patch changelog should be preceded by --- (on a line by itself). 
This separator tells git that what follows it doesn't have to be included 
in the commit log.

> * Moved back to ext2/ramdisk and eliminated u-boot customizations
> * Removed host tool customizations
>
> Changes since v1 (http://lists.busybox.net/pipermail/buildroot/2013-September/079046.html):
> * Added BeagleBone Black to single config for BeagleBone and BeagleBone Black,
>    rather than having two configs
> * Used 'make ARCH=arm savedefconfig' to create Linux config file
> * Dropped setting of DEVTMPFS, since it is default now
> * Switched to u-boot 2013.07 from 2013.04
> * Patched u-boot to work with initramfs by default without uEnv.txt
> * Removed wake-up M3 firmware loading for now, until debugged
>
> Signed-off-by: Jason Kridner <jdk@ti.com>

  The Signoff line should of course come before the ---

> ---
>   board/beaglebone/linux-3.8.config | 1035 ++++++++++++++++++++++++++++++++++---
>   configs/beaglebone_defconfig      |   13 +-
>   2 files changed, 975 insertions(+), 73 deletions(-)
>
> diff --git a/board/beaglebone/linux-3.8.config b/board/beaglebone/linux-3.8.config
> index 4242771..08ab221 100644
> --- a/board/beaglebone/linux-3.8.config
> +++ b/board/beaglebone/linux-3.8.config
> @@ -1,103 +1,409 @@
>   CONFIG_EXPERIMENTAL=y
> -CONFIG_DEFAULT_HOSTNAME="beaglebone"
> +CONFIG_KERNEL_LZO=y
>   CONFIG_SYSVIPC=y
>   CONFIG_POSIX_MQUEUE=y
>   CONFIG_NO_HZ=y
>   CONFIG_HIGH_RES_TIMERS=y
>   CONFIG_BSD_PROCESS_ACCT=y
> +CONFIG_BSD_PROCESS_ACCT_V3=y
> +CONFIG_TASKSTATS=y
> +CONFIG_TASK_DELAY_ACCT=y
> +CONFIG_TASK_XACCT=y
> +CONFIG_TASK_IO_ACCOUNTING=y

  You're adding a lot of kernel features here that were not enabled 
before. We generally prefer the kernel configs to be pretty minimal 
(except that all drivers for hardware that is present on the board should 
be included, of course. What's the history of this kernel config? You 
don't mention it at all in the commit message.

>   CONFIG_IKCONFIG=y
>   CONFIG_IKCONFIG_PROC=y
> -CONFIG_LOG_BUF_SHIFT=16
> +CONFIG_CGROUP_CPUACCT=y
> +CONFIG_RESOURCE_COUNTERS=y
> +CONFIG_MEMCG=y
> +CONFIG_BLK_CGROUP=y
> +CONFIG_NAMESPACES=y
> +CONFIG_SCHED_AUTOGROUP=y
>   CONFIG_BLK_DEV_INITRD=y
>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> -CONFIG_EMBEDDED=y
> +CONFIG_EXPERT=y
> +CONFIG_KALLSYMS_ALL=y
>   CONFIG_SLAB=y
>   CONFIG_PROFILING=y
>   CONFIG_OPROFILE=m
> -CONFIG_KPROBES=y
>   CONFIG_MODULES=y
>   CONFIG_MODULE_FORCE_LOAD=y
>   CONFIG_MODULE_UNLOAD=y
>   CONFIG_MODULE_FORCE_UNLOAD=y
>   CONFIG_MODVERSIONS=y
> -# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_MODULE_SRCVERSION_ALL=y
> +CONFIG_BLK_DEV_BSGLIB=y
> +CONFIG_BLK_DEV_INTEGRITY=y
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_MAC_PARTITION=y
>   CONFIG_ARCH_OMAP=y
>   CONFIG_OMAP_RESET_CLOCKS=y
>   CONFIG_OMAP_MUX_DEBUG=y
> +CONFIG_OMAP_MBOX_FWK=y
> +CONFIG_OMAP_32K_TIMER_HZ=512
>   # CONFIG_ARCH_OMAP2 is not set
> -# CONFIG_ARCH_OMAP3 is not set
> -# CONFIG_ARCH_OMAP4 is not set
> +# CONFIG_SOC_TI81XX is not set
> +# CONFIG_MACH_DEVKIT8000 is not set
> +# CONFIG_MACH_OMAP_LDP is not set
> +# CONFIG_MACH_OMAP3530_LV_SOM is not set
> +# CONFIG_MACH_OMAP3_TORPEDO is not set
> +# CONFIG_MACH_OVERO is not set
> +# CONFIG_MACH_OMAP3EVM is not set
> +# CONFIG_MACH_OMAP3517EVM is not set
> +# CONFIG_MACH_OMAP3_PANDORA is not set
> +# CONFIG_MACH_TOUCHBOOK is not set
> +# CONFIG_MACH_OMAP_3430SDP is not set
> +# CONFIG_MACH_NOKIA_RM680 is not set
> +# CONFIG_MACH_NOKIA_RX51 is not set
> +# CONFIG_MACH_OMAP_ZOOM2 is not set
> +# CONFIG_MACH_OMAP_ZOOM3 is not set
> +# CONFIG_MACH_CM_T35 is not set
> +# CONFIG_MACH_CM_T3517 is not set
> +# CONFIG_MACH_IGEP0030 is not set
> +# CONFIG_MACH_SBC3530 is not set
> +# CONFIG_MACH_OMAP_3630SDP is not set
> +# CONFIG_MACH_OMAP_4430SDP is not set
>   CONFIG_ARM_THUMBEE=y
> -CONFIG_ARM_ERRATA_720789=y
> -CONFIG_ARM_ARCH_TIMER=y
> +CONFIG_SMP=y

  SMP???

> +CONFIG_PREEMPT_VOLUNTARY=y
> +CONFIG_THUMB2_KERNEL=y
> +# CONFIG_COMPACTION is not set
>   CONFIG_ZBOOT_ROM_TEXT=0x0
>   CONFIG_ZBOOT_ROM_BSS=0x0
> -CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
> -CONFIG_KEXEC=y
> -CONFIG_AUTO_ZRELADDR=y
> +CONFIG_ARM_APPENDED_DTB=y

  You're not using appended DTB, right?

> +CONFIG_ARM_ATAG_DTB_COMPAT=y
>   CONFIG_CPU_FREQ=y
[snip a lot of deviations from defaults]
> +CONFIG_MTD=y

  Beaglebones don't even have any flash, right?

> +CONFIG_MTD_CMDLINE_PARTS=y
> +CONFIG_MTD_CHAR=y
> +CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_CFI=y
> +CONFIG_MTD_CFI_INTELEXT=y
> +CONFIG_MTD_NAND=y
> +CONFIG_MTD_NAND_OMAP2=y
> +CONFIG_MTD_ONENAND=y
> +CONFIG_MTD_ONENAND_VERIFY_WRITE=y
> +CONFIG_MTD_ONENAND_OMAP2=y
> +CONFIG_MTD_UBI=y
> +CONFIG_MTD_UBI_FASTMAP=y
[snip more fatness]
> +CONFIG_MEDIA_USB_SUPPORT=y

  Yeah, for USB devices you could consider that it's always possible to 
plug them in, but most of them are anyway useless without any userspace 
support... I would keep mass storage and vfat, though.

[snip 100s of modules]
>   CONFIG_EXT2_FS=y
>   CONFIG_EXT3_FS=y
>   # CONFIG_EXT3_FS_XATTR is not set
>   CONFIG_EXT4_FS=y
> +CONFIG_REISERFS_FS=m

  Keeping all possible extfses makes sense, but all the rest should go 
IMHO. Perhaps NFS can stay.

> +CONFIG_JFS_FS=m
> +CONFIG_XFS_FS=m
> +CONFIG_XFS_QUOTA=y
> +CONFIG_XFS_POSIX_ACL=y
> +CONFIG_XFS_RT=y
> +CONFIG_GFS2_FS=m
> +CONFIG_BTRFS_FS=m
> +CONFIG_NILFS2_FS=m
> +CONFIG_FANOTIFY=y
> +CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
>   CONFIG_QUOTA=y
>   CONFIG_QFMT_V2=y
> +CONFIG_AUTOFS4_FS=m
> +CONFIG_FUSE_FS=m
> +CONFIG_CUSE=m
>   CONFIG_MSDOS_FS=y
>   CONFIG_VFAT_FS=y
>   CONFIG_TMPFS=y
> -# CONFIG_MISC_FILESYSTEMS is not set
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_JFFS2_FS=y

  Definitely flash filesystems shouldn't be there.

[snip]
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index d6b5c31..47cd0c4 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -5,24 +5,22 @@ BR2_ARM_EABIHF=y
>
>   # system
>   BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
> -BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
>   BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
>   # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
>
>   # filesystem
> -BR2_PACKAGE_AM33X_CM3=y

  We normally don't keep things in comments, but here I think it makes 
sense to keep this package in a comment and mention that it is not 
included for the time being due to instability. That will invite a future 
version bumper to re-include it.


  Sorry for the large number of comments so long after you posted the 
patch...


  Regards,
  Arnout

>   BR2_TARGET_ROOTFS_EXT2=y
>   # BR2_TARGET_ROOTFS_TAR is not set
>
>   # lock down headers to avoid breaking with new defaults
>   BR2_KERNEL_HEADERS_VERSION=y
> -BR2_DEFAULT_KERNEL_VERSION="3.8.12"
> +BR2_DEFAULT_KERNEL_VERSION="3.8.13"
>
>   # bootloader
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.04"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.07"
>   BR2_TARGET_UBOOT_FORMAT_IMG=y
>   BR2_TARGET_UBOOT_SPL=y
>   BR2_TARGET_UBOOT_SPL_NAME="MLO"
> @@ -30,9 +28,10 @@ BR2_TARGET_UBOOT_SPL_NAME="MLO"
>   # kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> -BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="935f6c2f82056d538b528272e2bdbb5c08d69a58"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/beagleboard/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="ddd36e546e53d3c493075bbebd6188ee843208f9"
>   BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>   BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.8.config"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone"
> +BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
