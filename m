From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 14:57:38 +0200
Subject: [Buildroot] [PATCH] board: add support for ARC AXS101 and
 AXS103 Software Development Platforms
In-Reply-To: <1438689614-31408-1-git-send-email-abrodkin@synopsys.com>
References: <1438689614-31408-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150804145738.44ad2bd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexey,

On Tue,  4 Aug 2015 15:00:14 +0300, Alexey Brodkin wrote:

> diff --git a/board/synopsys/axs10x/fs-overlay/etc/inittab b/board/synopsys/axs10x/fs-overlay/etc/inittab
> new file mode 100644
> index 0000000..de3d6e8
> --- /dev/null
> +++ b/board/synopsys/axs10x/fs-overlay/etc/inittab
> @@ -0,0 +1,41 @@
> +# /etc/inittab
> +#
> +# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
> +#
> +# Note: BusyBox init doesn't support runlevels.  The runlevels field is
> +# completely ignored by BusyBox init. If you want runlevels, use
> +# sysvinit.
> +#
> +# Format for each entry: <id>:<runlevels>:<action>:<process>
> +#
> +# id        == tty to run on, or empty for /dev/console
> +# runlevels == ignored
> +# action    == one of sysinit, respawn, askfirst, wait, and once
> +# process   == program to run
> +
> +# Startup the system
> +null::sysinit:/bin/mount -t proc proc /proc
> +null::sysinit:/bin/mkdir -p /dev/pts
> +null::sysinit:/bin/mkdir -p /dev/shm
> +null::sysinit:/bin/mount -a
> +null::sysinit:/bin/hostname -F /etc/hostname
> +# now run any rc scripts
> +::sysinit:/etc/init.d/rcS
> +
> +# Start an "askfirst" shell on the console (whatever that may be)
> +#::askfirst:-/bin/sh # ASKFIRST_SHELL

Why?

> +
> +# /sbin/getty invocations for selected ttys
> +tty0::respawn:/sbin/getty 115200 tty0
> +
> +# Put a getty on the serial port
> +console::respawn:/sbin/getty -L console 0 vt100

It's a bit annoying to have a custom inittab just for this, but I agree
that this is the only solution with today's Buildroot.


> diff --git a/configs/snps_axs101_defconfig b/configs/snps_axs101_defconfig
> new file mode 100644
> index 0000000..6af4ac3
> --- /dev/null
> +++ b/configs/snps_axs101_defconfig
> @@ -0,0 +1,13 @@
> +BR2_arcle=y
> +BR2_TARGET_GENERIC_HOSTNAME="axs101"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2-rc5"
> +BR2_LINUX_KERNEL_DEFCONFIG="axs101"

Please force the version of the kernel headers, so that they match the
kernel being built.

> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
> diff --git a/configs/snps_axs103_defconfig b/configs/snps_axs103_defconfig
> new file mode 100644
> index 0000000..40e4fac
> --- /dev/null
> +++ b/configs/snps_axs103_defconfig
> @@ -0,0 +1,14 @@
> +BR2_arcle=y
> +BR2_archs38=y
> +BR2_TARGET_GENERIC_HOSTNAME="axs103"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to the ARC Software Development Platform"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2-rc5"

Ditto.

See other defconfigs, they are doing:

# Lock to 4.1 headers to avoid breaking with newer kernels
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="4.1"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y

# Kernel
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
BR2_LINUX_KERNEL_DEFCONFIG="vexpress"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
