From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jun 2014 18:15:47 +0200
Subject: [Buildroot] [PATCH] add default config for qemu-system-xtensa
In-Reply-To: <20140624131914.GA29732@waldemar-brodkorb.de>
References: <20140624131914.GA29732@waldemar-brodkorb.de>
Message-ID: <53A9A433.10407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/06/14 15:19, Waldemar Brodkorb wrote:
> Tested with Qemu 2.0.0.
> Overlay is from
> https://github.com/jcmvbkbc/xtensa-toolchain-build/tree/master/overlays
> 
> Many thanks to Max Filippov <jcmvbkbc@gmail.com> for his extended help
> and kernel config examples.
> 
> A small kernel patch is required, because mkimage does not contain
> support for Xtensa and the uImage target is failing. Redboot is unused
> so disable it, too.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../xtensa-lx60/disable-redboot-and-uboot.patch    |   12 +++++++
>  board/qemu/xtensa-lx60/linux-3.15.config           |   35 ++++++++++++++++++++
>  board/qemu/xtensa-lx60/readme.txt                  |    7 ++++
>  board/qemu/xtensa-lx60/xtensa_dc232b.tar           |  Bin 0 -> 747520 bytes

 Ugh, that's ugly... But the only thing we have I guess.

>  configs/qemu_xtensa_lx60_defconfig                 |   24 ++++++++++++++
>  5 files changed, 78 insertions(+)
>  create mode 100644 board/qemu/xtensa-lx60/disable-redboot-and-uboot.patch
>  create mode 100644 board/qemu/xtensa-lx60/linux-3.15.config
>  create mode 100644 board/qemu/xtensa-lx60/readme.txt
>  create mode 100644 board/qemu/xtensa-lx60/xtensa_dc232b.tar
>  create mode 100644 configs/qemu_xtensa_lx60_defconfig
> 
> diff --git a/board/qemu/xtensa-lx60/disable-redboot-and-uboot.patch b/board/qemu/xtensa-lx60/disable-redboot-and-uboot.patch
> new file mode 100644
> index 0000000..a4d8ce0
> --- /dev/null
> +++ b/board/qemu/xtensa-lx60/disable-redboot-and-uboot.patch

 The patch should have a filename according to the patch naming convention, e.g.

linux-0001-disable-redboot-and-uboot.patch

 Also, the patch should have a description and a Signed-off-by line.

> @@ -0,0 +1,12 @@
> +diff -Nur linux-3.15.orig/arch/xtensa/boot/Makefile linux-3.15/arch/xtensa/boot/Makefile
> +--- linux-3.15.orig/arch/xtensa/boot/Makefile	2014-06-08 20:19:54.000000000 +0200
> ++++ linux-3.15/arch/xtensa/boot/Makefile	2014-06-14 20:07:15.206091165 +0200
> +@@ -23,7 +23,7 @@
> + 
> + bootdir-$(CONFIG_XTENSA_PLATFORM_ISS)	 += boot-elf
> + bootdir-$(CONFIG_XTENSA_PLATFORM_XT2000) += boot-redboot boot-elf boot-uboot
> +-bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-redboot boot-elf boot-uboot
> ++bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-elf
> + 
> + zImage Image: $(bootdir-y)
> + 
> diff --git a/board/qemu/xtensa-lx60/linux-3.15.config b/board/qemu/xtensa-lx60/linux-3.15.config
> new file mode 100644
> index 0000000..279a745
> --- /dev/null
> +++ b/board/qemu/xtensa-lx60/linux-3.15.config
> @@ -0,0 +1,35 @@
> +# CONFIG_SWAP is not set
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_INITRAMFS_SOURCE="/home/wbx/br/output/images/rootfs.cpio"

 Better to strip this from the saved defconfig.

> +CONFIG_XTENSA_VARIANT_DC232B=y
> +# CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX is not set
> +CONFIG_XTENSA_PLATFORM_XTFPGA=y
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE="console=ttyS0,38400"
> +# CONFIG_COMPACTION is not set
> +# CONFIG_BOUNCE is not set
> +# CONFIG_CROSS_MEMORY_ATTACH is not set
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> +# CONFIG_INET_XFRM_MODE_BEET is not set
> +# CONFIG_INET_LRO is not set
> +# CONFIG_INET_DIAG is not set
> +# CONFIG_IPV6 is not set
> +# CONFIG_WIRELESS is not set
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +CONFIG_NETDEVICES=y
> +# CONFIG_WLAN is not set
> +CONFIG_SERIAL_8250=y
> +# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> +CONFIG_SERIAL_8250_CONSOLE=y
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_HWMON is not set
> +# CONFIG_VGA_CONSOLE is not set
> +# CONFIG_S32C1I_SELFTEST is not set
> +CONFIG_LD_NO_RELAX=y
> diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
> new file mode 100644
> index 0000000..0bfed90
> --- /dev/null
> +++ b/board/qemu/xtensa-lx60/readme.txt
> @@ -0,0 +1,7 @@
> +Run the emulation with:
> +
> + qemu-system-xtensa -M lx60 -cpu dc232b -monitor null -nographic -kernel output/images/Image.elf
> +
> +The login prompt will appear in the terminal that started Qemu.
> +
> +Tested with QEMU 2.0.0
> diff --git a/board/qemu/xtensa-lx60/xtensa_dc232b.tar b/board/qemu/xtensa-lx60/xtensa_dc232b.tar
[snip]
> diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
> new file mode 100644
> index 0000000..70da439
> --- /dev/null
> +++ b/configs/qemu_xtensa_lx60_defconfig
> @@ -0,0 +1,24 @@
> +# Architecture
> +BR2_xtensa=y
> +BR2_XTENSA_CUSTOM=y
> +BR2_XTENSA_CUSTOM_NAME="dc232b"
> +BR2_XTENSA_CORE_NAME="lx60"
> +BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
> +
> +# System
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +
> +# Filesystem
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.15.1"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-3.15.config"
> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
> +BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"

 Since this patch relies on the other one you sent, you should send the two
patches as a series. That makes the dependency explicit to the maintainers, so
they don't accidentally commit the second patch without committing the first one
first.

> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
> +BR2_LINUX_KERNEL_PATCH="board/qemu/xtensa-lx60/disable-redboot-and-uboot.patch"

 We're migrating to using BR2_GLOBAL_PATCH_DIR instead. I think we should avoid
the package-specific patch options for new configs.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
