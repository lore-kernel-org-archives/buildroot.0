From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 15 Oct 2016 09:48:35 +0200
Subject: [Buildroot] [PATCH] qemu: add ARM noMMU defconfig
In-Reply-To: <20160929105520.GA27219@waldemar-brodkorb.de>
References: <20160929105520.GA27219@waldemar-brodkorb.de>
Message-ID: <6e7fec8f-c82d-8da2-a8d7-971a874389b1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

Le 29/09/2016 ? 12:55, Waldemar Brodkorb a ?crit :
> Useful for testing no-MMU ARM code in Qemu.
> 
> The newer Linux Kernels with DT support for Qemu Versatile isn't
> yet working, so use latest 4.4 kernel.

Welcome to Buildroot
Jan  1 00:00:09 login[67]: root login on 'ttyAMA0'
~ # cat /proc/cpuinfo
processor	: 0
model name	: ARM926EJ-S rev 5 (v5l)
BogoMIPS	: 640.61
Features	: swp half thumb fastmult edsp java
CPU implementer	: 0x41
CPU architecture: 5TEJ
CPU variant	: 0x0
CPU part	: 0x926
CPU revision	: 5

Hardware	: ARM-Versatile PB
Revision	: 0000
Serial		: 0000000000000000
~ # uname -a
Linux buildroot 4.4.22 #2 Sat Oct 15 09:31:08 CEST 2016 armv5tejl GNU/Linux

Tested-by: Romain Naour <romain.naour@gmail.com>

However I get a kernel panic on poweroff:
~ # poweroff
Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

CPU: 0 PID: 1 Comm: init Not tainted 4.4.22 #2
Hardware name: ARM-Versatile PB
[<0000e1d4>] (unwind_backtrace) from [<0000c680>] (show_stack+0x10/0x14)
[<0000c680>] (show_stack) from [<00056aa8>] (panic+0x80/0x1dc)
[<00056aa8>] (panic) from [<00014a14>] (do_exit+0x89c/0x8ec)
[<00014a14>] (do_exit) from [<000155f4>] (do_group_exit+0x38/0xb8)
[<000155f4>] (do_group_exit) from [<0001d534>] (get_signal+0x250/0x590)
[<0001d534>] (get_signal) from [<0000bf0c>] (do_signal+0xc8/0x380)
[<0000bf0c>] (do_signal) from [<0000c350>] (do_work_pending+0xb0/0xc0)
[<0000c350>] (do_work_pending) from [<0000a228>] (slow_work_pending+0xc/0x20)
---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

Best regards,
Romain

> 
> Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
> ---
> Only tested with serial output.
> Anyone with Linux und Xorg can test framebuffer?
> ---
>  board/qemu/arm-versatile/linux-4.4-nommu.config    | 46 ++++++++++++++++++++++
>  .../patches/linux/versatile-nommu.patch            | 30 ++++++++++++++
>  board/qemu/arm-versatile/readme.txt                |  4 ++
>  configs/qemu_arm_versatile_nommu_defconfig         | 32 +++++++++++++++
>  4 files changed, 112 insertions(+)
>  create mode 100644 board/qemu/arm-versatile/linux-4.4-nommu.config
>  create mode 100644 board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
>  create mode 100644 configs/qemu_arm_versatile_nommu_defconfig
> 
> diff --git a/board/qemu/arm-versatile/linux-4.4-nommu.config b/board/qemu/arm-versatile/linux-4.4-nommu.config
> new file mode 100644
> index 0000000..e1264dc
> --- /dev/null
> +++ b/board/qemu/arm-versatile/linux-4.4-nommu.config
> @@ -0,0 +1,46 @@
> +# CONFIG_MMU is not set
> +CONFIG_ARCH_VERSATILE=y
> +CONFIG_SET_MEM_PARAM=y
> +CONFIG_DRAM_BASE=0x00000000
> +CONFIG_DRAM_SIZE=0x08000000
> +CONFIG_ARCH_VERSATILE_PB=y
> +CONFIG_MACH_VERSATILE_AB=y
> +# CONFIG_MACH_VERSATILE_DT is not set
> +CONFIG_BINFMT_FLAT=y
> +CONFIG_SYSVIPC=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_ARCH_MULTI_V7 is not set
> +CONFIG_AEABI=y
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_UNIX=y
> +CONFIG_INET=y
> +CONFIG_NETDEVICES=y
> +CONFIG_SMC91X=y
> +CONFIG_PHYLIB=y
> +CONFIG_INPUT_EVDEV=y
> +CONFIG_SERIO_AMBAKMI=y
> +CONFIG_LEGACY_PTY_COUNT=16
> +CONFIG_SERIAL_8250=m
> +CONFIG_SERIAL_8250_EXTENDED=y
> +CONFIG_SERIAL_8250_MANY_PORTS=y
> +CONFIG_SERIAL_8250_SHARE_IRQ=y
> +CONFIG_SERIAL_8250_RSA=y
> +CONFIG_SERIAL_AMBA_PL011=y
> +CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
> +CONFIG_I2C=y
> +CONFIG_I2C_CHARDEV=m
> +CONFIG_FB=y
> +CONFIG_FB_ARMCLCD=y
> +CONFIG_FRAMEBUFFER_CONSOLE=y
> +CONFIG_SOUND=y
> +CONFIG_SND=m
> +CONFIG_SND_MIXER_OSS=m
> +CONFIG_SND_PCM_OSS=m
> +CONFIG_SND_ARMAACI=m
> +CONFIG_EXT4_FS=y
> +CONFIG_VFAT_FS=m
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_MAGIC_SYSRQ=y
> diff --git a/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
> new file mode 100644
> index 0000000..961b6c3
> --- /dev/null
> +++ b/board/qemu/arm-versatile/patches/linux/versatile-nommu.patch
> @@ -0,0 +1,30 @@
> +From b7c1666813424d329868335c8faf8886b0f85b6c Mon Sep 17 00:00:00 2001
> +From: Greg Ungerer <gerg@linux-m68k.org>
> +Date: Thu, 11 Aug 2016 21:33:11 +1000
> +Subject: [PATCH] arm: fix versatile platform to work in no-MMU mode
> +
> +If CONFIG_MMU is disabled then do not carry out the virtual memory address
> +translation for IO devices.
> +
> +With this fix in place we can run the ARM Versatile board (including its
> +qemu emulation) as a no-MMU Linux system.
> +
> +Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +
> +diff -Nur linux-4.4.17.orig/arch/arm/mach-versatile/include/mach/hardware.h linux-4.4.17/arch/arm/mach-versatile/include/mach/hardware.h
> +--- linux-4.4.17.orig/arch/arm/mach-versatile/include/mach/hardware.h	2016-08-10 11:49:43.000000000 +0200
> ++++ linux-4.4.17/arch/arm/mach-versatile/include/mach/hardware.h	2016-08-25 23:19:03.691716292 +0200
> +@@ -30,8 +30,12 @@
> + #define VERSATILE_PCI_VIRT_BASE		(void __iomem *)0xe8000000ul
> + #define VERSATILE_PCI_CFG_VIRT_BASE	(void __iomem *)0xe9000000ul
> + 
> ++#ifdef CONFIG_MMU
> + /* macro to get at MMIO space when running virtually */
> + #define IO_ADDRESS(x)		(((x) & 0x0fffffff) + (((x) >> 4) & 0x0f000000) + 0xf0000000)
> ++#else
> ++#define IO_ADDRESS(x)		(x)
> ++#endif
> + 
> + #define __io_address(n)		((void __iomem __force *)IO_ADDRESS(n))
> + 
> diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
> index f6f05f9..c8ea4cd 100644
> --- a/board/qemu/arm-versatile/readme.txt
> +++ b/board/qemu/arm-versatile/readme.txt
> @@ -2,6 +2,10 @@ Run the emulation with:
>  
>    qemu-system-arm -M versatilepb -kernel output/images/zImage -dtb output/images/versatile-pb.dtb -drive file=output/images/rootfs.ext2,if=scsi,format=raw -append "root=/dev/sda console=ttyAMA0,115200" -serial stdio -net nic,model=rtl8139 -net user
>  
> +Or for the noMMU emulation:
> +
> +  qemu-system-arm -M versatilepb -kernel output/images/zImage -append "console=ttyAMA0,115200" -serial stdio -net user -net nic,model=smc91c111
> +
>  The login prompt will appear in the terminal that started Qemu. The
>  graphical window is the framebuffer.
>  
> diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
> new file mode 100644
> index 0000000..49e4411
> --- /dev/null
> +++ b/configs/qemu_arm_versatile_nommu_defconfig
> @@ -0,0 +1,32 @@
> +# Architecture
> +BR2_arm=y
> +BR2_arm926t=y
> +
> +# Toolchain
> +BR2_PACKAGE_HOST_ELF2FLT=y
> +# BR2_USE_MMU is not set
> +
> +# Patches
> +BR2_GLOBAL_PATCH_DIR="board/qemu/arm-versatile/patches"
> +
> +# Busybox with hush
> +BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +
> +# System
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +
> +# Filesystem
> +# BR2_TARGET_ROOTFS_EXT2 is not set
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_ROOTFS_INITRAMFS=y
> +
> +# Linux headers same as kernel, a 4.4 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.22"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.4-nommu.config"
> 
