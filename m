From: Stephan Hoffmann <sho@relinux.de>
Date: Fri, 11 Nov 2011 13:45:37 +0100
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <4EBC5656.2010103@gmail.com>
References: <4EBC554E.7050605@gmail.com> <4EBC5656.2010103@gmail.com>
Message-ID: <4EBD18F1.6020804@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.11.2011 23:55, schrieb Spenser Gilliland:
> Hi, I'm trying to add the Microblaze arch to buildroot.
Hello Spenser,

I am also working on Microblaze, but did not try to build a toolchain
yet. There is some information on this on the internet, especially here:
http://www.monstr.eu/. There are lots of patches for the toolchain and I
don't know how complete the Bicroblaze support in the original gcc is.

Instead I use the glibc toolchain provided by Xilinx and the u-boot
provided by Avnet for my Avnet Spartan 6 LX9 MicroBoard.

I made a small patch adding the config options and default
configurations for buildroot and the kernel. The modifications I made
are inspired by prior work I found at some places in the web. I am also
planning to publish my microblaze configuration, but this is still work
in progress.

Originally, I tried to build a nommu configuration because my FPGA is
very small and I wanted to save space. This did not work because the
toolchain for FLT binaries that I found on the net did not harmonize
with the kernel, the kernel was not able to load the binaries. Finally,
I suspended this because of lack of time. If your efforts to buils a
toolchain succeed this approach might get interesting again. Xilinx
supports only the mmu configuration for Linux.

Regarding the Linux kernel recent versions (3.x) work more or less out
of the box after providing a valid device tree file matching the
Microblaze configuration.

Kind regards

Stephan
>
> My changes are available at  git://github.com/Spenser309/buildroot.git
>
> Thanks,
> Spenser
>

From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 31 Oct 2011 14:15:55 +0100
Subject: [PATCH] Added support for MicroBlaze soft cpu
Signed-off-by: Stephan Hoffmann <sho@relinux.de>

---
 board/relinux/s6lx9microboard/s6lx9_mmu_defconfig |   67
+++++++++++++++++++++
 configs/spartan6lx9_mb_defconfig                  |   21 +++++++
 linux/Config.in                                   |    5 ++
 linux/linux.mk                                    |    8 +++
 target/Config.in.arch                             |    6 ++-
 5 files changed, 106 insertions(+), 1 deletions(-)
 create mode 100644 board/relinux/s6lx9microboard/s6lx9_mmu_defconfig
 create mode 100644 configs/spartan6lx9_mb_defconfig

diff --git a/board/relinux/s6lx9microboard/s6lx9_mmu_defconfig
b/board/relinux/s6lx9microboard/s6lx9_mmu_defconfig
new file mode 100644
index 0000000..ef398de
--- /dev/null
+++ b/board/relinux/s6lx9microboard/s6lx9_mmu_defconfig
@@ -0,0 +1,67 @@
+CONFIG_EXPERIMENTAL=y
+CONFIG_SYSVIPC=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
+CONFIG_INITRAMFS_COMPRESSION_GZIP=y
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_KALLSYMS_EXTRA_PASS=y
+# CONFIG_HOTPLUG is not set
+# CONFIG_BASE_FULL is not set
+# CONFIG_FUTEX is not set
+# CONFIG_EPOLL is not set
+# CONFIG_SIGNALFD is not set
+# CONFIG_SHMEM is not set
+CONFIG_SLAB=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_BLK_DEV_BSG is not set
+CONFIG_KERNEL_BASE_ADDR=0x80000000
+CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan6"
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
+CONFIG_XILINX_MICROBLAZE0_HW_VER="8.20.a"
+CONFIG_HZ_100=y
+CONFIG_MMU=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE_FORCE=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_LRO is not set
+# CONFIG_IPV6 is not set
+CONFIG_PROC_DEVICETREE=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_NETDEVICES=y
+CONFIG_NET_ETHERNET=y
+CONFIG_XILINX_EMACLITE=y
+# CONFIG_INPUT is not set
+# CONFIG_SERIO is not set
+# CONFIG_VT is not set
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_EXT2_FS=y
+# CONFIG_DNOTIFY is not set
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+CONFIG_CIFS=y
+CONFIG_CIFS_STATS=y
+CONFIG_CIFS_STATS2=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEBUG_SLAB=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_INFO=y
+CONFIG_EARLY_PRINTK=y
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/configs/spartan6lx9_mb_defconfig
b/configs/spartan6lx9_mb_defconfig
new file mode 100644
index 0000000..150ad88
--- /dev/null
+++ b/configs/spartan6lx9_mb_defconfig
@@ -0,0 +1,21 @@
+BR2_microblaze=y
+BR2_JLEVEL=4
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/microblazeel-unknown-linux-gnu/"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="Microblaze Buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Microblaze Buildroot"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.0.7"
+BR2_LINUX_KERNEL_VERSION="3.0.7"
+BR2_LINUX_KERNEL_PATCH="http://www.kernel.org/pub/linux/kernel/projects/rt/3.0/patch-3.0.7-rt20.patch"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/board/relinux/s6lx9microboard/s6lx9_mmu_defconfig"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="simpleImage.xilinx"
diff --git a/linux/Config.in b/linux/Config.in
index 0082ca8..358747d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -121,6 +121,11 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
        help
          Path to the kernel configuration file
 
+config BR2_LINUX_KERNEL_DTS_FILE
+       string "Device Tree dts file location"
+       depends on BR2_microblaze
+       help
+         Path from where the dts file has to be copied
 #
 # Binary format
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index 9beb706..690d9f4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -117,6 +117,14 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
 
+ifeq ($(KERNEL_ARCH),microblaze)
+define LINUX_COPY_DTS
+       if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
+               cp $(BR2_LINUX_KERNEL_DTS_FILE)
$(@D)/arch/microblaze/boot/dts ; \
+       fi
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_COPY_DTS
+endif
 
 ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call
qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
diff --git a/target/Config.in.arch b/target/Config.in.arch
index 5e9fad4..24edfa5 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -21,6 +21,8 @@ config BR2_i386
 config BR2_m68k
        bool "m68k"
        depends on BROKEN # ice in uclibc / inet_ntoa_r
+config BR2_microblaze
+       bool "microblaze"
 config BR2_mips
        bool "mips"
 config BR2_mipsel
@@ -490,6 +492,7 @@ config BR2_ARCH
        default "i686"          if BR2_x86_athlon
        default "i686"          if BR2_x86_athlon_4
        default "m68k"          if BR2_m68k
+       default "microblaze"    if BR2_microblaze
        default "mips"          if BR2_mips
        default "mipsel"        if BR2_mipsel
        default "powerpc"       if BR2_powerpc
@@ -515,7 +518,7 @@ config BR2_ARCH
 
 config BR2_ENDIAN
        string
-       default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 ||
BR2_mipsel || \
+       default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 ||
BR2_mipsel || BR2_microblaze || \
                            BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_x86_64
|| BR2_sh64
        default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k ||
BR2_mips || \
                            BR2_powerpc || BR2_sh2 || BR2_sh2a || \
@@ -580,6 +583,7 @@ config BR2_GCC_TARGET_TUNE
        default 68030           if BR2_m68k_68030
        default 68040           if BR2_m68k_68040
        default 68060           if BR2_m68k_68060
+       default microblaze      if BR2_microblaze
        default mips1           if BR2_mips_1
        default mips2           if BR2_mips_2
        default mips3           if BR2_mips_3
-- 
1.7.0.4


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
