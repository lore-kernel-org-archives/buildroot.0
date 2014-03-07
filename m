From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Mar 2014 07:08:36 -0300
Subject: [Buildroot] [PATCH] configs/qemu: fix and bump relevant
	kernel/header versions
Message-ID: <1394186916-14902-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tweak the configs to deal with b155f5a5ab321b06df1c5d5f5e104438e8288cf8
fallout.
And bump to the latest kernel versions.

As of this commit the microblaze qemu targets seem broken, probably
because of commit 14e527eb66d251c878f212236729d715e350c135 or some qemu
limitation.

SPARC seems to have issues as well, the kernel seems to go down with an
unhandled exception with qemu 1.7.0

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/arm-nuri/readme.txt                     |  2 +-
 .../{linux-3.11.config => linux-3.13.config}       | 22 +++-------
 board/qemu/arm-versatile/readme.txt                |  2 +-
 board/qemu/arm-vexpress/readme.txt                 |  2 +-
 .../{linux-3.12.config => linux-3.13.config}       | 15 ++-----
 board/qemu/microblazebe-mmu/readme.txt             |  2 +-
 .../{linux-3.12.config => linux-3.13.config}       | 15 ++-----
 board/qemu/microblazeel-mmu/readme.txt             |  2 +-
 .../{linux-3.12.config => linux-3.13.config}       | 24 ++--------
 board/qemu/mips-malta/readme.txt                   |  2 +-
 .../{linux-3.12.config => linux-3.13.config}       |  0
 board/qemu/mips64-malta/readme.txt                 |  2 +-
 .../{linux-3.12.config => linux-3.13.config}       |  0
 board/qemu/mips64el-malta/readme.txt               |  2 +-
 .../{linux-3.12.config => linux-3.13.config}       | 24 ++--------
 board/qemu/mipsel-malta/readme.txt                 |  2 +-
 .../{linux-3.12.config => linux-3.13.config}       | 51 +++-------------------
 board/qemu/powerpc-g3beige/readme.txt              |  2 +-
 board/qemu/powerpc-mpc8544ds/readme.txt            |  2 +-
 board/qemu/powerpc-virtex-ml507/readme.txt         |  2 +-
 board/qemu/sh4-r2d/linux-3.2.config                |  9 ----
 board/qemu/sh4-r2d/readme.txt                      |  2 +-
 board/qemu/sparc-ss10/readme.txt                   |  2 +-
 .../x86/{linux-3.12.config => linux-3.13.config}   |  7 ---
 board/qemu/x86/readme.txt                          |  2 +-
 .../{linux-3.12.config => linux-3.13.config}       |  7 ---
 board/qemu/x86_64/readme.txt                       |  2 +-
 configs/qemu_arm_nuri_defconfig                    |  6 ++-
 configs/qemu_arm_versatile_defconfig               |  9 ++--
 configs/qemu_arm_vexpress_defconfig                |  7 +--
 configs/qemu_microblazebe_mmu_defconfig            |  4 +-
 configs/qemu_microblazeel_mmu_defconfig            |  4 +-
 configs/qemu_mips64_malta_defconfig                |  9 ++--
 configs/qemu_mips64el_malta_defconfig              |  9 ++--
 configs/qemu_mips_malta_defconfig                  |  9 ++--
 configs/qemu_mipsel_malta_defconfig                |  9 ++--
 configs/qemu_ppc_g3beige_defconfig                 |  9 ++--
 configs/qemu_ppc_mpc8544ds_defconfig               |  7 +--
 configs/qemu_ppc_virtex_ml507_defconfig            |  7 +--
 configs/qemu_sh4_r2d_defconfig                     |  5 ++-
 configs/qemu_sparc_ss10_defconfig                  |  1 +
 configs/qemu_x86_64_defconfig                      |  9 ++--
 configs/qemu_x86_defconfig                         |  9 ++--
 43 files changed, 106 insertions(+), 213 deletions(-)
 rename board/qemu/arm-versatile/{linux-3.11.config => linux-3.13.config} (89%)
 rename board/qemu/microblazebe-mmu/{linux-3.12.config => linux-3.13.config} (85%)
 rename board/qemu/microblazeel-mmu/{linux-3.12.config => linux-3.13.config} (85%)
 rename board/qemu/mips-malta/{linux-3.12.config => linux-3.13.config} (75%)
 rename board/qemu/mips64-malta/{linux-3.12.config => linux-3.13.config} (100%)
 rename board/qemu/mips64el-malta/{linux-3.12.config => linux-3.13.config} (100%)
 rename board/qemu/mipsel-malta/{linux-3.12.config => linux-3.13.config} (75%)
 rename board/qemu/powerpc-g3beige/{linux-3.12.config => linux-3.13.config} (52%)
 rename board/qemu/x86/{linux-3.12.config => linux-3.13.config} (90%)
 rename board/qemu/x86_64/{linux-3.12.config => linux-3.13.config} (90%)

diff --git a/board/qemu/arm-nuri/readme.txt b/board/qemu/arm-nuri/readme.txt
index 6fdba81..0cf8d0b 100644
--- a/board/qemu/arm-nuri/readme.txt
+++ b/board/qemu/arm-nuri/readme.txt
@@ -7,4 +7,4 @@ graphical window is the framebuffer.
 
 Startup time is slow because of the SMP CPU emulation so be patient.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/arm-versatile/linux-3.11.config b/board/qemu/arm-versatile/linux-3.13.config
similarity index 89%
rename from board/qemu/arm-versatile/linux-3.11.config
rename to board/qemu/arm-versatile/linux-3.13.config
index da73575..38c6466 100644
--- a/board/qemu/arm-versatile/linux-3.11.config
+++ b/board/qemu/arm-versatile/linux-3.13.config
@@ -1,5 +1,3 @@
-CONFIG_ARCH_VERSATILE=y
-CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SYSVIPC=y
 CONFIG_LOG_BUF_SHIFT=14
@@ -7,16 +5,14 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_ARCH_VERSATILE=y
 CONFIG_MACH_VERSATILE_AB=y
 CONFIG_PCI=y
 CONFIG_AEABI=y
-# CONFIG_OABI_COMPAT is not set
-CONFIG_LEDS=y
-CONFIG_LEDS_CPU=y
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_CMDLINE="root=1f03 mem=32M"
-CONFIG_PM=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -27,24 +23,22 @@ CONFIG_IP_PNP_BOOTP=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_MTD=y
-CONFIG_MTD_PARTITIONS=y
 CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_ADV_OPTIONS=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_BLK_DEV_RAM=y
+CONFIG_EEPROM_LEGACY=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_EEPROM_LEGACY=m
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_SMC91X=y
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=16
 CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
@@ -52,15 +46,12 @@ CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_RSA=y
 CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_LEGACY_PTY_COUNT=16
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=m
 # CONFIG_HWMON is not set
 CONFIG_FB=y
 CONFIG_FB_ARMCLCD=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FONTS=y
-CONFIG_FONT_ACORN_8x8=y
 CONFIG_SOUND=y
 CONFIG_SND=m
 CONFIG_SND_MIXER_OSS=m
@@ -75,15 +66,14 @@ CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=y
 CONFIG_ROMFS_FS=y
 CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
 CONFIG_ROOT_NFS=y
 CONFIG_NFSD=y
 CONFIG_NFSD_V3=y
-CONFIG_PARTITION_ADVANCED=y
 CONFIG_NLS_CODEPAGE_850=m
 CONFIG_NLS_ISO8859_1=m
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_ERRORS=y
 CONFIG_DEBUG_LL=y
+CONFIG_FONTS=y
+CONFIG_FONT_ACORN_8x8=y
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index 7d0745f..2c02e26 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 9a4694d..50dd563 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/microblazebe-mmu/linux-3.12.config b/board/qemu/microblazebe-mmu/linux-3.13.config
similarity index 85%
rename from board/qemu/microblazebe-mmu/linux-3.12.config
rename to board/qemu/microblazebe-mmu/linux-3.13.config
index 7083cf5..c2ef789 100644
--- a/board/qemu/microblazebe-mmu/linux-3.12.config
+++ b/board/qemu/microblazebe-mmu/linux-3.13.config
@@ -1,16 +1,11 @@
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
 CONFIG_INITRAMFS_COMPRESSION_GZIP=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
-CONFIG_KALLSYMS_EXTRA_PASS=y
-# CONFIG_HOTPLUG is not set
 # CONFIG_BASE_FULL is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
@@ -20,6 +15,7 @@ CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
 CONFIG_OPT_LIB_ASM=y
 CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
 CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
@@ -40,7 +36,6 @@ CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_XILINX_EMACLITE=y
 # CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
@@ -53,16 +48,12 @@ CONFIG_SERIAL_UARTLITE_CONSOLE=y
 CONFIG_EXT2_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
 CONFIG_CIFS=y
 CONFIG_CIFS_STATS=y
 CONFIG_CIFS_STATS2=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_SLAB=y
+CONFIG_DETECT_HUNG_TASK=y
 CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_INFO=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_EARLY_PRINTK=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 8ade434..3c7e10c 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/microblazeel-mmu/linux-3.12.config b/board/qemu/microblazeel-mmu/linux-3.13.config
similarity index 85%
rename from board/qemu/microblazeel-mmu/linux-3.12.config
rename to board/qemu/microblazeel-mmu/linux-3.13.config
index cdeb324..7426f1f 100644
--- a/board/qemu/microblazeel-mmu/linux-3.12.config
+++ b/board/qemu/microblazeel-mmu/linux-3.13.config
@@ -1,16 +1,11 @@
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
-CONFIG_SYSFS_DEPRECATED_V2=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_INITRAMFS_SOURCE="rootfs.cpio"
 CONFIG_INITRAMFS_COMPRESSION_GZIP=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
 CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
-CONFIG_KALLSYMS_EXTRA_PASS=y
-# CONFIG_HOTPLUG is not set
 # CONFIG_BASE_FULL is not set
 # CONFIG_FUTEX is not set
 # CONFIG_EPOLL is not set
@@ -20,6 +15,7 @@ CONFIG_SLAB=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+CONFIG_PARTITION_ADVANCED=y
 CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
 CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
 CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
@@ -39,7 +35,6 @@ CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
 CONFIG_XILINX_EMACLITE=y
 # CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
@@ -52,16 +47,12 @@ CONFIG_SERIAL_UARTLITE_CONSOLE=y
 CONFIG_EXT2_FS=y
 # CONFIG_DNOTIFY is not set
 CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
 CONFIG_CIFS=y
 CONFIG_CIFS_STATS=y
 CONFIG_CIFS_STATS2=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_SLAB=y
+CONFIG_DETECT_HUNG_TASK=y
 CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_INFO=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 CONFIG_EARLY_PRINTK=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 9ac55db..d402d13 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/mips-malta/linux-3.12.config b/board/qemu/mips-malta/linux-3.13.config
similarity index 75%
rename from board/qemu/mips-malta/linux-3.12.config
rename to board/qemu/mips-malta/linux-3.13.config
index 7549ccc..df0fd1c 100644
--- a/board/qemu/mips-malta/linux-3.12.config
+++ b/board/qemu/mips-malta/linux-3.13.config
@@ -1,21 +1,15 @@
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_MIPS32_R2=y
 CONFIG_MIPS_MT_SMP=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=15
-CONFIG_SYSFS_DEPRECATED_V2=y
-CONFIG_RELAY=y
 CONFIG_NAMESPACES=y
-CONFIG_UTS_NS=y
-CONFIG_IPC_NS=y
-CONFIG_PID_NS=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_RELAY=y
 CONFIG_EMBEDDED=y
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -24,7 +18,6 @@ CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PCI=y
-CONFIG_PM=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -38,18 +31,13 @@ CONFIG_IP_PNP=y
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-# CONFIG_MISC_DEVICES is not set
 CONFIG_IDE=y
 CONFIG_BLK_DEV_IDECD=y
 CONFIG_IDE_GENERIC=y
 CONFIG_BLK_DEV_GENERIC=y
 CONFIG_BLK_DEV_PIIX=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
 CONFIG_PCNET32=y
-# CONFIG_NETDEV_1000 is not set
-# CONFIG_NETDEV_10000 is not set
 # CONFIG_WLAN is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -59,11 +47,9 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_MFD_SUPPORT is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
@@ -71,6 +57,4 @@ CONFIG_QUOTA=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
 CONFIG_ROOT_NFS=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index b367927..719a624 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/mips64-malta/linux-3.12.config b/board/qemu/mips64-malta/linux-3.13.config
similarity index 100%
rename from board/qemu/mips64-malta/linux-3.12.config
rename to board/qemu/mips64-malta/linux-3.13.config
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 7999b78..3ce3c62 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/mips64el-malta/linux-3.12.config b/board/qemu/mips64el-malta/linux-3.13.config
similarity index 100%
rename from board/qemu/mips64el-malta/linux-3.12.config
rename to board/qemu/mips64el-malta/linux-3.13.config
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index dba33d3..48bae37 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/mipsel-malta/linux-3.12.config b/board/qemu/mipsel-malta/linux-3.13.config
similarity index 75%
rename from board/qemu/mipsel-malta/linux-3.12.config
rename to board/qemu/mipsel-malta/linux-3.13.config
index b51de4b..23c76ec 100644
--- a/board/qemu/mipsel-malta/linux-3.12.config
+++ b/board/qemu/mipsel-malta/linux-3.13.config
@@ -2,21 +2,15 @@ CONFIG_MIPS_MALTA=y
 CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_CPU_MIPS32_R2=y
 CONFIG_MIPS_MT_SMP=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=15
-CONFIG_SYSFS_DEPRECATED_V2=y
-CONFIG_RELAY=y
 CONFIG_NAMESPACES=y
-CONFIG_UTS_NS=y
-CONFIG_IPC_NS=y
-CONFIG_PID_NS=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_RELAY=y
 CONFIG_EMBEDDED=y
-# CONFIG_SYSCTL_SYSCALL is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB=y
 CONFIG_MODULES=y
@@ -25,7 +19,6 @@ CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PCI=y
-CONFIG_PM=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -39,18 +32,13 @@ CONFIG_IP_PNP=y
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-# CONFIG_MISC_DEVICES is not set
 CONFIG_IDE=y
 CONFIG_BLK_DEV_IDECD=y
 CONFIG_IDE_GENERIC=y
 CONFIG_BLK_DEV_GENERIC=y
 CONFIG_BLK_DEV_PIIX=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
 CONFIG_PCNET32=y
-# CONFIG_NETDEV_1000 is not set
-# CONFIG_NETDEV_10000 is not set
 # CONFIG_WLAN is not set
 # CONFIG_INPUT_KEYBOARD is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -60,11 +48,9 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_MFD_SUPPORT is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
@@ -72,6 +58,4 @@ CONFIG_QUOTA=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
 CONFIG_ROOT_NFS=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index b77cc84..dd290c4 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/powerpc-g3beige/linux-3.12.config b/board/qemu/powerpc-g3beige/linux-3.13.config
similarity index 52%
rename from board/qemu/powerpc-g3beige/linux-3.12.config
rename to board/qemu/powerpc-g3beige/linux-3.13.config
index 098dae3..a8dd1f6 100644
--- a/board/qemu/powerpc-g3beige/linux-3.12.config
+++ b/board/qemu/powerpc-g3beige/linux-3.13.config
@@ -1,86 +1,47 @@
 CONFIG_ALTIVEC=y
-CONFIG_EXPERIMENTAL=y
-CONFIG_SWAP=y
 CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_COMPAT_BRK=y
 CONFIG_SLAB=y
-CONFIG_LBDAF=y
-CONFIG_PPC_PMAC=y
-CONFIG_PPC_OF_BOOT_TRAMPOLINE=y
 CONFIG_PPC601_SYNC_FIX=y
 CONFIG_HIGHMEM=y
-CONFIG_NO_HZ=y
-CONFIG_BINFMT_ELF=y
-CONFIG_PROC_DEVICETREE=y
-CONFIG_PM=y
-CONFIG_SECCOMP=y
 CONFIG_PCCARD=y
-CONFIG_PCMCIA=y
-CONFIG_PCMCIA_LOAD_CIS=y
-CONFIG_PCMCIA_IOCTL=y
 CONFIG_YENTA=y
 CONFIG_ADVANCED_OPTIONS=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-CONFIG_PACKET_MMAP=y
 CONFIG_UNIX=y
 CONFIG_INET=y
-CONFIG_INET_LRO=y
-CONFIG_PREVENT_FIRMWARE_BUILD=y
-CONFIG_FIRMWARE_IN_KERNEL=y
 CONFIG_CONNECTOR=y
-CONFIG_PROC_EVENTS=y
-CONFIG_BLK_DEV=y
+CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_IDE=y
-CONFIG_IDE_GD=y
-CONFIG_IDE_GD_ATA=y
 CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_PROC_FS=y
 CONFIG_BLK_DEV_CMD64X=y
 CONFIG_BLK_DEV_IDE_PMAC=y
-CONFIG_IEEE1394=y
-CONFIG_IEEE1394_OHCI1394=y
-CONFIG_IEEE1394_ETH1394=y
-CONFIG_IEEE1394_RAWIO=y
-CONFIG_IEEE1394_VIDEO1394=y
-CONFIG_IEEE1394_DV1394=y
-CONFIG_MACINTOSH_DRIVERS=y
 CONFIG_ADB=y
 CONFIG_ADB_CUDA=y
 CONFIG_ADB_PMU=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
+CONFIG_PCNET32=y
 CONFIG_MACE=y
 CONFIG_BMAC=y
-CONFIG_HAPPYMEAL=y
-CONFIG_SUNGEM=y
-CONFIG_CASSINI=y
-CONFIG_NET_PCI=y
-CONFIG_PCNET32=y
 CONFIG_NE2K_PCI=y
 CONFIG_8139CP=y
 CONFIG_8139TOO=y
-CONFIG_8139TOO_PIO=y
-CONFIG_SERIO=y
+CONFIG_HAPPYMEAL=y
+CONFIG_SUNGEM=y
+CONFIG_CASSINI=y
 CONFIG_SERIAL_PMACZILOG=y
 CONFIG_SERIAL_PMACZILOG_TTYS=y
 CONFIG_SERIAL_PMACZILOG_CONSOLE=y
-CONFIG_HW_RANDOM=y
 CONFIG_SSB=y
-CONFIG_SSB_PCIHOST=y
 CONFIG_SSB_PCMCIAHOST=y
 CONFIG_SSB_DRIVER_PCICORE=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-CONFIG_DNOTIFY=y
-CONFIG_INOTIFY=y
-CONFIG_INOTIFY_USER=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
-CONFIG_MISC_FILESYSTEMS=y
 CONFIG_SQUASHFS=y
 CONFIG_LIBCRC32C=y
 CONFIG_BOOTX_TEXT=y
-CONFIG_CRYPTO_HW=y
diff --git a/board/qemu/powerpc-g3beige/readme.txt b/board/qemu/powerpc-g3beige/readme.txt
index 07cb660..2711350 100644
--- a/board/qemu/powerpc-g3beige/readme.txt
+++ b/board/qemu/powerpc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/powerpc-mpc8544ds/readme.txt b/board/qemu/powerpc-mpc8544ds/readme.txt
index cd56ddd..27b3bee 100644
--- a/board/qemu/powerpc-mpc8544ds/readme.txt
+++ b/board/qemu/powerpc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/powerpc-virtex-ml507/readme.txt b/board/qemu/powerpc-virtex-ml507/readme.txt
index a9a6378..0547987 100644
--- a/board/qemu/powerpc-virtex-ml507/readme.txt
+++ b/board/qemu/powerpc-virtex-ml507/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/sh4-r2d/linux-3.2.config b/board/qemu/sh4-r2d/linux-3.2.config
index 287f36a..5fc878c 100644
--- a/board/qemu/sh4-r2d/linux-3.2.config
+++ b/board/qemu/sh4-r2d/linux-3.2.config
@@ -3,9 +3,6 @@ CONFIG_SYSVIPC=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
-CONFIG_SYSFS_DEPRECATED_V2=y
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-# CONFIG_SYSCTL_SYSCALL is not set
 CONFIG_SLAB=y
 CONFIG_PROFILING=y
 CONFIG_OPROFILE=y
@@ -34,11 +31,7 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
 CONFIG_8139CP=y
-CONFIG_8139TOO=y
-# CONFIG_8139TOO_PIO is not set
 # CONFIG_WLAN is not set
 CONFIG_INPUT_FF_MEMLESS=m
 # CONFIG_INPUT_MOUSEDEV is not set
@@ -66,7 +59,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_SUPERH_MONO is not set
 # CONFIG_LOGO_SUPERH_VGA16 is not set
 CONFIG_SOUND=y
-CONFIG_SND=m
 CONFIG_SND_YMFPCI=m
 CONFIG_SOUND_PRIME=m
 CONFIG_HID_A4TECH=y
@@ -100,6 +92,5 @@ CONFIG_TMPFS=y
 CONFIG_MINIX_FS=y
 CONFIG_NLS_CODEPAGE_932=y
 CONFIG_DEBUG_FS=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRC_T10DIF=y
diff --git a/board/qemu/sh4-r2d/readme.txt b/board/qemu/sh4-r2d/readme.txt
index 2a963eb..73dce14 100644
--- a/board/qemu/sh4-r2d/readme.txt
+++ b/board/qemu/sh4-r2d/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 725ab30..a126a55 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -1,6 +1,6 @@
 Run the emulation with:
 
-  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user
+  qemu-system-sparc -M SS-10 -kernel output/images/zImage -drive file=output/images/rootfs.ext2 -append "root=/dev/sda console=ttyS0,115200" -serial stdio -net nic,model=lance -net user -display none
 
 The login prompt will appear in the terminal that started Qemu.
 The graphical window is the framebuffer.
diff --git a/board/qemu/x86/linux-3.12.config b/board/qemu/x86/linux-3.13.config
similarity index 90%
rename from board/qemu/x86/linux-3.12.config
rename to board/qemu/x86/linux-3.13.config
index 5bf6944..ad9517c 100644
--- a/board/qemu/x86/linux-3.12.config
+++ b/board/qemu/x86/linux-3.13.config
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 # CONFIG_SWAP is not set
 # CONFIG_COMPAT_BRK is not set
@@ -29,12 +28,8 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
 CONFIG_NE2K_PCI=y
 CONFIG_8139CP=y
-# CONFIG_NETDEV_1000 is not set
-# CONFIG_NETDEV_10000 is not set
 # CONFIG_WLAN is not set
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -45,11 +40,9 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_MFD_SUPPORT is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HDA_INTEL=y
-# CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
 # CONFIG_X86_PLATFORM_DEVICES is not set
 # CONFIG_DMIID is not set
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index c07000c..c821255 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/board/qemu/x86_64/linux-3.12.config b/board/qemu/x86_64/linux-3.13.config
similarity index 90%
rename from board/qemu/x86_64/linux-3.12.config
rename to board/qemu/x86_64/linux-3.13.config
index 5bf6944..ad9517c 100644
--- a/board/qemu/x86_64/linux-3.12.config
+++ b/board/qemu/x86_64/linux-3.13.config
@@ -1,4 +1,3 @@
-CONFIG_EXPERIMENTAL=y
 # CONFIG_LOCALVERSION_AUTO is not set
 # CONFIG_SWAP is not set
 # CONFIG_COMPAT_BRK is not set
@@ -29,12 +28,8 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
 CONFIG_NE2K_PCI=y
 CONFIG_8139CP=y
-# CONFIG_NETDEV_1000 is not set
-# CONFIG_NETDEV_10000 is not set
 # CONFIG_WLAN is not set
 # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
 # CONFIG_INPUT_MOUSE is not set
@@ -45,11 +40,9 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_MFD_SUPPORT is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HDA_INTEL=y
-# CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
 # CONFIG_X86_PLATFORM_DEVICES is not set
 # CONFIG_DMIID is not set
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 3c344f9..f350d36 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 1.6.1
+Tested with QEMU 1.7.0
diff --git a/configs/qemu_arm_nuri_defconfig b/configs/qemu_arm_nuri_defconfig
index bddec64..40dcb37 100644
--- a/configs/qemu_arm_nuri_defconfig
+++ b/configs/qemu_arm_nuri_defconfig
@@ -14,12 +14,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttySAC1"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
 # Lock to 3.10 headers to avoid breaking with newer kernels
+# Stuck at 3.10.x because there's no Nuri DTS
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.24"
+BR2_DEFAULT_KERNEL_VERSION="3.10.32"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.10.32"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos4"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index a26054d..1348bab 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.11 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.11.10"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.11.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.13.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 6f163c8..e35a44a 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index d5f780b..f74a3a1 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -12,9 +12,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-3.13.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazebe-mmu/system.dts"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 54d5834..3a66d1b 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -12,9 +12,9 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-3.13.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/qemu/microblazeel-mmu/system.dts"
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 19423c2..97937d1 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -6,16 +6,17 @@ BR2_MIPS_NABI64=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.13.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 2f7405f..4adf204 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,16 +9,17 @@ BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.13.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index dc28087..3c1532c 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,16 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.13.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 6a73e4c..b673f0b 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,16 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.13.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index f6603a0..1668e72 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -6,16 +6,17 @@ BR2_powerpc_750=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/powerpc-g3beige/linux-3.13.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index cc90657..6d7f24d 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -6,14 +6,15 @@ BR2_powerpc_8548=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_virtex_ml507_defconfig b/configs/qemu_ppc_virtex_ml507_defconfig
index 99f8967..cd2f647 100644
--- a/configs/qemu_ppc_virtex_ml507_defconfig
+++ b/configs/qemu_ppc_virtex_ml507_defconfig
@@ -6,9 +6,10 @@ BR2_powerpc_440=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Use soft float
 BR2_SOFT_FLOAT=y
@@ -16,7 +17,7 @@ BR2_SOFT_FLOAT=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_DEFCONFIG="44x/virtex5"
 BR2_LINUX_KERNEL_VMLINUX=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index bcd50dd..b27d9ec 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -12,7 +12,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # Lock to 3.2 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.2.53"
+BR2_DEFAULT_KERNEL_VERSION="3.2.55"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_2=y
 
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
@@ -21,7 +22,7 @@ BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.2.55"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-3.2.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 95803e7..3b56d98 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,6 +9,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 # Lock to 3.12 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 67fc685..827d362 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,13 +9,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-3.13.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 9b45ce8..a5040c8 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,13 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.13 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.5"
+BR2_DEFAULT_KERNEL_VERSION="3.13.5"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12.5"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.13.config"
-- 
1.8.3.2
