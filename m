From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 23:49:08 +0100
Subject: [Buildroot] [PATCH v2] configs/olimex_imx233_olinuxino: switch
 to u-boot
In-Reply-To: <1456122476-6210-1-git-send-email-phil@zankapfel.net>
References: <1456075479-12750-1-git-send-email-phil@zankapfel.net>
 <1456122476-6210-1-git-send-email-phil@zankapfel.net>
Message-ID: <20160222234908.5cd7b5a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Phil Eichinger,

On Mon, 22 Feb 2016 07:27:56 +0100, Phil Eichinger wrote:

> Signed-off-by: Phil Eichinger <phil@zankapfel.net>
> Tested-by: Phil Eichinger <phil@zankapfel.net>

Tested-by tags are meant to be given by other people, not the patch
author, since we assume you have tested the patches you are
submitting :-)

> -BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
> +BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
> +BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x42000000"

Any reason to use an appended uImage? If you're using a recent version
of U-Boot, you should use bootz to boot a zImage, and boot with a DTB
separate from the kernel.

Also:

> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
> +BR2_TARGET_UBOOT_FORMAT_SD=y

Please used a fixed U-Boot version, otherwise your defconfig might
break in the future when we bump the default U-Boot version. See other
defconfig.

Another thing is that you removed some comments from the defconfig,
while some of them were really useful, such as the one that explains
why BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y is enabled. We normally
don't enable mdev support in our default defconfig, but this defconfig
has a specific reason for doing so, so this comment should be kept.

Finally, but this is a possible improvement for the future, you could
probably replace the complicated sequence of commands to build the SD
card by a nice post-image script that relies on genimage. But this is
for another patch.

Could you send an updated version that takes into account the above
suggestions?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
