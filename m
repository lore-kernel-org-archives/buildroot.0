From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 4 Jul 2020 17:41:39 +0200
Subject: [Buildroot] [PATCH] qemu_aarch64_virt: use the in-kernel
 defconfig
In-Reply-To: <20200704141802.1586504-1-masahiroy@kernel.org>
References: <20200704141802.1586504-1-masahiroy@kernel.org>
Message-ID: <affa122f-ca38-e1f8-7bba-79ece4e87024@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Masahiro,

Le 04/07/2020 ? 16:18, Masahiro Yamada a ?crit?:
> The defconfig file from the kernel tree works enough for the
> qemu-system-aarch64 virt machine. Remove the custom config file.

I'm agree that we should use the architecture's default configuration when
possible and use a defconfig fragment to enable (or disable) additional options.

Note: The default defconfig contain more option enabled that the defconfig
provided by Buildroot. The kernel build time is slightly increased.

Can you compare the diff between the two defconfig ?
If some options enabled in the custom linux.conf but not in the architecture's
default configuration, we need to consider adding them in a defconfig fragment file.

Best regards,
Romain

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  board/qemu/aarch64-virt/linux.config | 54 ----------------------------
>  configs/qemu_aarch64_virt_defconfig  |  3 +-
>  2 files changed, 1 insertion(+), 56 deletions(-)
>  delete mode 100644 board/qemu/aarch64-virt/linux.config
> 
> diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
> deleted file mode 100644
> index c9f2708ad5..0000000000
> --- a/board/qemu/aarch64-virt/linux.config
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -CONFIG_SYSVIPC=y
> -CONFIG_POSIX_MQUEUE=y
> -CONFIG_NO_HZ_IDLE=y
> -CONFIG_HIGH_RES_TIMERS=y
> -CONFIG_TASKSTATS=y
> -CONFIG_SCHED_AUTOGROUP=y
> -CONFIG_PROFILING=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -CONFIG_BLK_DEV_BSGLIB=y
> -CONFIG_ARCH_VEXPRESS=y
> -CONFIG_TRANSPARENT_HUGEPAGE=y
> -CONFIG_BINFMT_MISC=y
> -CONFIG_COMPAT=y
> -CONFIG_NET=y
> -CONFIG_PACKET=y
> -CONFIG_PACKET_DIAG=y
> -CONFIG_UNIX=y
> -CONFIG_NET_KEY=y
> -CONFIG_INET=y
> -CONFIG_IP_MULTICAST=y
> -CONFIG_IP_ADVANCED_ROUTER=y
> -CONFIG_BRIDGE=m
> -CONFIG_NET_SCHED=y
> -CONFIG_VSOCKETS=y
> -CONFIG_DEVTMPFS=y
> -CONFIG_DEVTMPFS_MOUNT=y
> -CONFIG_VIRTIO_BLK=y
> -CONFIG_BLK_DEV_SD=y
> -CONFIG_CHR_DEV_SG=y
> -CONFIG_SCSI_CONSTANTS=y
> -CONFIG_SCSI_LOGGING=y
> -CONFIG_SCSI_SCAN_ASYNC=y
> -CONFIG_SCSI_VIRTIO=y
> -CONFIG_ATA=y
> -CONFIG_NETDEVICES=y
> -CONFIG_DUMMY=y
> -CONFIG_MACVLAN=y
> -CONFIG_VIRTIO_NET=y
> -CONFIG_NLMON=y
> -CONFIG_VT_HW_CONSOLE_BINDING=y
> -CONFIG_SERIAL_AMBA_PL011=y
> -CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> -CONFIG_VIRTIO_CONSOLE=y
> -CONFIG_HW_RANDOM=y
> -CONFIG_HW_RANDOM_VIRTIO=y
> -CONFIG_RTC_CLASS=y
> -CONFIG_VIRTIO_MMIO=y
> -CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
> -CONFIG_MAILBOX=y
> -CONFIG_PL320_MBOX=y
> -CONFIG_EXT4_FS=y
> -CONFIG_TMPFS=y
> -CONFIG_TMPFS_POSIX_ACL=y
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index 9f22987694..5ca15f55b3 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -22,8 +22,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.42"
> -BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
>  # host-qemu for gitlab testing
> 
