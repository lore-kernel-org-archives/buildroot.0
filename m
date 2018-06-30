From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 19:43:57 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi3_defconfig: fix
 filesystem size
In-Reply-To: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
References: <1530264190-9535-1-git-send-email-leon.anavi@konsulko.com>
Message-ID: <20180630174357.GI2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Leon, All,

On 2018-06-29 12:23 +0300, Leon Anavi spake thusly:
> Increase the filesystem size for raspberrypi3 by setting
> BR2_TARGET_ROOTFS_EXT2_SIZE to "120M". The filesystem for
> raspberrypi3_64 has the same size.
> 
> Fixes:
> Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "services"
> mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system

I don't have this issue here:

    $ make raspberrypi3_defconfig
    $ make
    $ du -hs output/target/
    57M     output/target/
    $ ls -lsh output/images/
    total 159M
     24K -rw-r--r-- 1 ymorin ymorin  24K Jun 30 19:35 bcm2710-rpi-3-b.dtb
     28K -rw-r--r-- 1 ymorin ymorin  25K Jun 30 19:35 bcm2710-rpi-3-b-plus.dtb
     24K -rw-r--r-- 1 ymorin ymorin  23K Jun 30 19:35 bcm2710-rpi-cm3.dtb
    8.0M -rw-r--r-- 1 ymorin ymorin  32M Jun 30 19:35 boot.vfat
     54M -rw-r--r-- 1 ymorin ymorin  60M Jun 30 19:35 rootfs.ext2
       0 lrwxrwxrwx 1 ymorin ymorin   11 Jun 30 19:35 rootfs.ext4 -> rootfs.ext2
    4.0K drwxr-xr-x 3 ymorin ymorin 4.0K Jun 30 19:24 rpi-firmware
     93M -rw-r--r-- 1 ymorin ymorin  93M Jun 30 19:35 sdcard.img
    4.7M -rw-r--r-- 1 ymorin ymorin 4.7M Jun 30 19:35 zImage

Regards,
Yann E. MORIN.

> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  configs/raspberrypi3_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 856f321..0ef9afe 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -28,6 +28,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
>  # Filesystem / image
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
