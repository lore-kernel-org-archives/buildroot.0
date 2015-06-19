From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Jun 2015 22:49:20 +0200
Subject: [Buildroot] [V2 3/4] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <1434741204-3988-4-git-send-email-francois.perrad@gadz.org>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
 <1434741204-3988-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <55848050.8010904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/19/15 21:13, Francois Perrad wrote:
> config device tree / mainline (4.0.5)
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Just some minor documentation fixes... With that:

  Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +How to build it
> +===============
> +
> +    $ make olimex_a20_olinuxino_defconfig
> +
> +Compile all and build rootfs image:

Compile everything and build the rootfs image:

> +
> +    $ make
> +
> +Result of the build
> +-------------------
> +
> +After building, you should get a tree like this:
> +
> +    output/images/
> +    +-- rootfs.ext2
> +    +-- rootfs.ext4 -> rootfs.ext2
> +    +-- sun7i-a20-olinuxino-lime.dtb
> +    +-- u-boot.bin
> +    +-- u-boot-sunxi-with-spl.bin
> +    `-- zImage
> +
> +
> +How setting up the SD card

How to write the SD card

> +==========================
> +
> +
> +Prepare the SD card
> +-------------------
> +
> +Erase existing stuff, and create an unique Linux partition with `fdisk`.
> +
> +    # fdisk /dev/sdX
> +    Command (m for help): o
> +    Building a new DOS disklabel with disk identifier 0xf9e1616a.
> +    Changes will remain in memory only, until you decide to write them.
> +    After that, of course, the previous content won't be recoverable.
> +
> +    Command (m for help): n
> +    Partition type:
> +        p   primary (0 primary, 0 extended, 4 free)
> +        e   extended
> +    Select (default p): p
> +    Partition number (1-4, default 1): 1
> +    First sector (2048-7626751, default 2048): 2048
> +    Last sector, +sectors or +size{K,M,G} (2048-7626751, default 7626751): 
> +    Using default value 7626751
> +
> +    Command (m for help): p
> +
> +    Disk /dev/sdX: 3904 MB, 3904897024 bytes
> +    4 heads, 16 sectors/track, 119168 cylinders, total 7626752 sectors
> +    Units = sectors of 1 * 512 = 512 bytes
> +    Sector size (logical/physical): 512 bytes / 512 bytes
> +    I/O size (minimum/optimal): 512 bytes / 512 bytes
> +    Disk identifier: 0xf9e1616a
> +
> +            Device Boot      Start         End      Blocks   Id  System
> +    /dev/sdX1                 2048     7626751     3812352   83  Linux
> +
> +    Command (m for help): w
> +    The partition table has been altered!
> +
> +    Calling ioctl() to re-read partition table.
> +    Syncing disks.
> +
> +Copy images on the SD card
> +--------------------------
> +
> +    # dd if=output/images/rootfs.ext2 of=/dev/sdX1

 rootfs.ext4

 Also, I personally prefer to use cat rather than dd, it's generally faster.

> +    # dd if=output/images/u-boot-sunxi-with-spl.bin of=/dev/sdX bs=1024 seek=8
> +
> +
> +Finish
> +======
> +
> +Eject the SD card, insert it in the A20-OLinuXino-LIME board, and power it up.
> +
> diff --git a/configs/olimex_a20_olinuxino_defconfig b/configs/olimex_a20_olinuxino_defconfig
> new file mode 100644
> index 0000000..d59a2cc
> --- /dev/null
> +++ b/configs/olimex_a20_olinuxino_defconfig
> @@ -0,0 +1,41 @@
> +# Architecture
> +BR2_arm=y
> +BR2_cortex_a7=y
> +
> +# Kernel headers
> +BR2_KERNEL_HEADERS_4_0=y
> +
> +# System configuration
> +BR2_TARGET_GENERIC_HOSTNAME="a20-olinuxino"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to use OLinuXino!"

 The 'use' is redundant here.


 Regards,
 Arnout

> +BR2_TARGET_GENERIC_GETTY=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a20_olinuxino_lime/post-build.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="board/olimex/a20_olinuxino_lime/boot.cmd $(TARGET_DIR)/boot"
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
