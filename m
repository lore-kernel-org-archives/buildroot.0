From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 May 2014 08:24:28 +0200
Subject: [Buildroot] [PATCH v2] Adding support for Ariag25 and Terra
 board from Acmesystems
In-Reply-To: <1400875790-20928-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1400875790-20928-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <5385811C.6090700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/05/14 22:09, Angelo Compagnucci wrote:
> This patch adds support for Acmesystems' AriaG25 SOM and the
> corresponding Terra demo board.
> The AriaG25 config is fairly basic, it provides only the minimal
> configuration to get the module booting.
> The Terra config instead provides many userspace tools.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  board/acmesystems/ariag25/at91-ariag25.config      | 211 +++++++++++++++++++++
>  board/acmesystems/ariag25/at91-ariag25.dts         | 191 +++++++++++++++++++
>  .../fs-overlay/etc/network/interfaces              |   5 +
>  configs/ariag25_defconfig                          |  12 ++
>  configs/ariag25_demo_terra_defconfig               |  21 ++
>  5 files changed, 440 insertions(+)
>  create mode 100644 board/acmesystems/ariag25/at91-ariag25.config
>  create mode 100644 board/acmesystems/ariag25/at91-ariag25.dts
>  create mode 100644 board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
>  create mode 100644 configs/ariag25_defconfig
>  create mode 100644 configs/ariag25_demo_terra_defconfig
> 
> diff --git a/board/acmesystems/ariag25/at91-ariag25.config b/board/acmesystems/ariag25/at91-ariag25.config
> new file mode 100644
> index 0000000..07a0eca
> --- /dev/null
> +++ b/board/acmesystems/ariag25/at91-ariag25.config
> @@ -0,0 +1,211 @@
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_KERNEL_LZO=y
> +CONFIG_SYSVIPC=y
> +CONFIG_LOG_BUF_SHIFT=16
> +CONFIG_BLK_DEV_INITRD=y
> +CONFIG_RD_BZIP2=y
> +CONFIG_RD_LZMA=y
> +CONFIG_RD_XZ=y
> +CONFIG_RD_LZO=y
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +CONFIG_SYSCTL_SYSCALL=y
> +CONFIG_KALLSYMS_ALL=y
> +CONFIG_EMBEDDED=y
> +CONFIG_SLAB=y
> +CONFIG_JUMP_LABEL=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_FORCE_LOAD=y
> +CONFIG_MODULE_UNLOAD=y
> +CONFIG_MODULE_FORCE_UNLOAD=y
> +CONFIG_MODVERSIONS=y
> +CONFIG_MODULE_SRCVERSION_ALL=y
> +CONFIG_BLK_DEV_BSGLIB=y
> +CONFIG_DEFAULT_NOOP=y
> +CONFIG_ARCH_AT91=y
> +CONFIG_SOC_AT91SAM9260=y
> +CONFIG_SOC_AT91SAM9261=y
> +CONFIG_SOC_AT91SAM9263=y
> +CONFIG_SOC_AT91SAM9RL=y
> +CONFIG_SOC_AT91SAM9G45=y
> +CONFIG_SOC_AT91SAM9X5=y
> +CONFIG_SOC_AT91SAM9N12=y

 Any reason to support all these different chips?

> +CONFIG_MACH_AT91SAM9_DT=y
> +CONFIG_AT91_TIMER_HZ=128
> +CONFIG_AEABI=y
[snip]
> +CONFIG_EXT4_FS=y
> +CONFIG_EXT4_FS_POSIX_ACL=y

 Why do you need ext4 support?

> +CONFIG_FANOTIFY=y
> +CONFIG_VFAT_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +# CONFIG_MISC_FILESYSTEMS is not set
> +# CONFIG_NETWORK_FILESYSTEMS is not set
> +CONFIG_NLS_CODEPAGE_437=y
> +CONFIG_NLS_CODEPAGE_850=y
> +CONFIG_NLS_ISO8859_1=y
[snip]
> diff --git a/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces b/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces
> new file mode 100644
> index 0000000..104c1a1
> --- /dev/null
> +++ b/board/acmesystems/ariag25_terra/fs-overlay/etc/network/interfaces

 You're not actually using this in your defconfigs...

> @@ -0,0 +1,5 @@
> +auto lo
> +iface lo inet loopback
> +
> +auto eth0
> +iface eth0 inet dhcp
> diff --git a/configs/ariag25_defconfig b/configs/ariag25_defconfig
> new file mode 100644
> index 0000000..b2a23ff
> --- /dev/null
> +++ b/configs/ariag25_defconfig
> @@ -0,0 +1,12 @@
> +BR2_arm=y
> +BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y

 There's no reason to have this in the minimal defconfig.

> +BR2_TARGET_GENERIC_HOSTNAME="ariag25"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to AriaG25 by www.acmesystems.it!"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/ariag25/at91-ariag25.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/ariag25/at91-ariag25.dts"

 Since you create just a root filesystem and a kernel, not even a bootloader,
I'd expect a README file with an explanation how you get this stuff on your device.

> diff --git a/configs/ariag25_demo_terra_defconfig b/configs/ariag25_demo_terra_defconfig
> new file mode 100644
> index 0000000..3457472
> --- /dev/null
> +++ b/configs/ariag25_demo_terra_defconfig
> @@ -0,0 +1,21 @@
> +BR2_arm=y
> +BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +BR2_TARGET_GENERIC_HOSTNAME="ariag25"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to AriaG25 by www.acmesystems.it!"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/acmesystems/ariag25/at91-ariag25.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
> +BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/ariag25/at91-ariag25.dts"
> +BR2_PACKAGE_PYTHON=y
> +BR2_PACKAGE_PYTHON_SQLITE=y
> +BR2_PACKAGE_PYTHON_ZLIB=y
> +BR2_PACKAGE_PYTHON_SERIAL=y
> +BR2_PACKAGE_DROPBEAR=y
> +BR2_PACKAGE_IPUTILS=y
> +BR2_PACKAGE_NTP=y
> +BR2_PACKAGE_OPKG=y

 I like the fact that we get our first demo config. However, I don't understand
the choice of packages here. dropbear makes a lot of sense of course, but the
others just seem a bit random. In this case, I don't think the demo config makes
a lot of sense.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
