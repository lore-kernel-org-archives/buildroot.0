From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 10 Jul 2019 17:38:53 +0200
Subject: [Buildroot] [PATCH] configs/beaglebone: increase rootfs image
 size
In-Reply-To: <1562705654-1620-1-git-send-email-pjtexier@koncepto.io>
References: <1562705654-1620-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190710173853.1f96e165@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pierre-Jean,

On Tue,  9 Jul 2019 22:54:14 +0200, Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> The default rootfs image size is too small (60M).
> So, increase it to 120M.
>
> Fixes:
>
>  Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "koi8_r.py"
>  mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system
>  *** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)
>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  configs/beaglebone_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index b4f152f..0ba3310 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -13,6 +13,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk"
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"

Tested with buildroot master, no change:

	$ make O=$PWD -C ../buildroot_git beaglebone_defconfig
	$ make

	$ mount -t ext4 -o loop images/rootfs.ext4 /mnt/
	$ df /mnt/
Filesystem     1K-blocks  Used Available Use% Mounted on
/dev/loop0         55397 15029     36068  30% /mnt
	$ umount /mnt

Still plenty of space available....

	$ find . -name koi8_r.py

No koi8_r.py found, you enabled some additional options?

Regards,
Peter

>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
