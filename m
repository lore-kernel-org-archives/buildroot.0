From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 5 Jun 2017 21:52:07 +0200
Subject: [Buildroot] [PATCH] configs/qemu: bump to the latest kernel version
Message-ID: <20170605195206.GA32194@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xtensa patches no longer required, the make target name changed
to Image. The Qemu binary for OpenRisc was renamed upstream.
I removed the x86->x86_64 symlink, independent files preferred.

Defconfig               Kernel  Qemu            Network Status
--------------------------------------------------------------
aarch64_virt            4.11.3   2.9.0           YES     OK
arm_versatile           4.11.3   2.9.0           YES     OK
arm_versatile_nommu     4.4.70   2.9.0           YES     OK
arm_vexpress            4.11.3   2.9.0           YES     OK
m68k_mcf5208            4.11.3   2.9.0           YES     OK
m68k_q800               4.11.3   q800-v2.4.0     NO (2)  OK
microblazebe            4.11.3   2.9.0           YES     OK
microblazeel            4.11.3   2.9.0           YES     OK
mips32r2el_malta        4.11.3   2.9.0           YES     OK
mips32r2_malta          4.11.3   2.9.0           YES     OK
mips32r6el_malta        4.11.3   2.9.0           YES     OK
mips32r6_malta          4.11.3   2.9.0           YES     OK
mips64el_malta          4.11.3   2.9.0           YES     OK
mips64_malta            4.11.3   2.9.0           YES     OK
mips64r6el_malta        4.11.3   2.9.0           YES     OK
mips64r6_malta          4.11.3   2.9.0           YES     OK
nios2-10m50             4.11.3   2.9.0           NO      OK
or1k                    4.11.3   2.9.0           NO      OK (5)
ppc_g3beige             4.11.3   2.9.0           YES     OK
ppc_mpc8544ds           4.11.3   2.9.0           YES     OK
ppc_virtex_ml507        4.9.6    2.9.0           NO      OK (3)
ppc64_pseries           4.11.3   2.9.0           YES     OK
sh4                     4.9.6    2.9.0           YES     OK (4)
sh4eb                   4.9.6    2.9.0           NO (1)  OK (4)
sparc_ss10              4.11.3   2.9.0           YES     OK
sparc64_sun4u           4.11.3   2.9.0           YES     OK
sparc_sun4u             4.11.3   2.9.0           YES     OK
x86                     4.11.3   2.9.0           YES     OK
x86_64                  4.11.3   2.9.0           YES     OK
xtensa_lx60             4.11.3   2.9.0           YES     OK
xtensa_lx60_nommu       4.11.3   2.9.0           YES     OK

(1) - Probably an endian issue with 8139 emulation/driver
(2) - There's a network interface, but enabling it in qemu fails
(3) - Kernel oops with 4.11.3 on boot
(4) - System is extremely slow with 4.11.3, needs further investigation
(5) - Qemu binary got renamed to qemu-system-or1k

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 board/qemu/aarch64-virt/linux-4.11.config          | 56 ++++++++++++++++++++++
 board/qemu/aarch64-virt/linux-4.9.config           | 56 ----------------------
 board/qemu/aarch64-virt/readme.txt                 |  2 +-
 board/qemu/arm-versatile/linux-4.11.config         | 43 +++++++++++++++++
 board/qemu/arm-versatile/linux-4.9.config          | 43 -----------------
 board/qemu/arm-versatile/readme.txt                |  2 +-
 board/qemu/arm-vexpress/readme.txt                 |  2 +-
 board/qemu/m68k-mcf5208/linux-4.11.config          | 28 +++++++++++
 board/qemu/m68k-mcf5208/linux-4.8.config           | 28 -----------
 board/qemu/m68k-mcf5208/readme.txt                 |  2 +-
 board/qemu/m68k-q800/linux-4.11.config             | 26 ++++++++++
 board/qemu/m68k-q800/linux-4.9.config              | 26 ----------
 board/qemu/microblazebe-mmu/linux-4.11.config      | 20 ++++++++
 board/qemu/microblazebe-mmu/linux-4.9.config       | 20 --------
 board/qemu/microblazebe-mmu/readme.txt             |  2 +-
 board/qemu/microblazeel-mmu/linux-4.11.config      | 19 ++++++++
 board/qemu/microblazeel-mmu/linux-4.9.config       | 19 --------
 board/qemu/microblazeel-mmu/readme.txt             |  2 +-
 board/qemu/mips32r2-malta/linux-4.11.config        | 30 ++++++++++++
 board/qemu/mips32r2-malta/linux-4.9.config         | 30 ------------
 board/qemu/mips32r2-malta/readme.txt               |  2 +-
 board/qemu/mips32r2el-malta/linux-4.11.config      | 31 ++++++++++++
 board/qemu/mips32r2el-malta/linux-4.9.config       | 31 ------------
 board/qemu/mips32r2el-malta/readme.txt             |  2 +-
 board/qemu/mips32r6-malta/linux-4.11.config        | 30 ++++++++++++
 board/qemu/mips32r6-malta/linux-4.9.config         | 30 ------------
 board/qemu/mips32r6-malta/readme.txt               |  2 +-
 board/qemu/mips32r6el-malta/linux-4.11.config      | 30 ++++++++++++
 board/qemu/mips32r6el-malta/linux-4.9.config       | 30 ------------
 board/qemu/mips32r6el-malta/readme.txt             |  2 +-
 board/qemu/mips64-malta/linux-4.11.config          | 34 +++++++++++++
 board/qemu/mips64-malta/linux-4.8.config           | 34 -------------
 board/qemu/mips64-malta/readme.txt                 |  2 +-
 board/qemu/mips64el-malta/linux-4.11.config        | 35 ++++++++++++++
 board/qemu/mips64el-malta/linux-4.9.config         | 35 --------------
 board/qemu/mips64r6-malta/linux-4.11.config        | 34 +++++++++++++
 board/qemu/mips64r6-malta/linux-4.9.config         | 34 -------------
 board/qemu/mips64r6el-malta/linux-4.11.config      | 34 +++++++++++++
 board/qemu/mips64r6el-malta/linux-4.9.config       | 34 -------------
 board/qemu/mips64r6el-malta/readme.txt             |  5 +-
 board/qemu/nios2-10m50/linux-4.11.fragment         |  3 ++
 board/qemu/nios2-10m50/linux-4.9.fragment          |  3 --
 board/qemu/nios2-10m50/readme.txt                  |  4 +-
 board/qemu/or1k/linux-4.11.config                  | 30 ++++++++++++
 board/qemu/or1k/linux-4.9.config                   | 30 ------------
 board/qemu/or1k/patches/linux/0001-ld-or1k.patch   | 16 -------
 board/qemu/or1k/patches/linux/0002-kallsyms.patch  | 25 ----------
 board/qemu/or1k/readme.txt                         |  4 +-
 board/qemu/ppc-g3beige/linux-4.11.config           | 25 ++++++++++
 board/qemu/ppc-g3beige/linux-4.9.config            | 25 ----------
 board/qemu/ppc-g3beige/readme.txt                  |  2 +-
 board/qemu/ppc-mpc8544ds/linux-4.11.config         | 38 +++++++++++++++
 board/qemu/ppc-mpc8544ds/linux-4.9.config          | 38 ---------------
 board/qemu/ppc-mpc8544ds/readme.txt                |  2 +-
 board/qemu/ppc64-pseries/readme.txt                |  2 +-
 board/qemu/sh4-r2d/linux-4.11.config               | 38 +++++++++++++++
 board/qemu/sh4-r2d/linux-4.9.config                | 38 ---------------
 board/qemu/sh4eb-r2d/linux-4.11.config             | 38 +++++++++++++++
 board/qemu/sh4eb-r2d/linux-4.9.config              | 38 ---------------
 board/qemu/sparc-ss10/linux-4.11.config            | 31 ++++++++++++
 board/qemu/sparc-ss10/linux-4.9.config             | 31 ------------
 board/qemu/sparc-ss10/readme.txt                   |  2 +-
 board/qemu/sparc64-sun4u/linux-4.11.config         | 25 ++++++++++
 board/qemu/sparc64-sun4u/linux-4.9.config          | 25 ----------
 board/qemu/sparc64-sun4u/readme.txt                |  2 +-
 board/qemu/x86/linux-4.11.config                   | 45 +++++++++++++++++
 board/qemu/x86/linux-4.9.config                    |  1 -
 board/qemu/x86/readme.txt                          |  2 +-
 board/qemu/x86_64/linux-4.11.config                | 45 +++++++++++++++++
 board/qemu/x86_64/linux-4.9.config                 | 45 -----------------
 board/qemu/x86_64/readme.txt                       |  2 +-
 board/qemu/xtensa-lx60/linux-4.11-nommu.config     | 38 +++++++++++++++
 board/qemu/xtensa-lx60/linux-4.11.config           | 36 ++++++++++++++
 board/qemu/xtensa-lx60/linux-4.9-nommu.config      | 38 ---------------
 board/qemu/xtensa-lx60/linux-4.9.config            | 36 --------------
 .../linux-0001-disable-redboot-and-uboot.patch     | 16 -------
 board/qemu/xtensa-lx60/readme.txt                  |  3 +-
 configs/qemu_aarch64_virt_defconfig                |  8 ++--
 configs/qemu_arm_versatile_defconfig               |  8 ++--
 configs/qemu_arm_versatile_nommu_defconfig         |  2 +-
 configs/qemu_arm_vexpress_defconfig                |  6 +--
 configs/qemu_m68k_mcf5208_defconfig                |  8 ++--
 configs/qemu_m68k_q800_defconfig                   |  8 ++--
 configs/qemu_microblazebe_mmu_defconfig            |  8 ++--
 configs/qemu_microblazeel_mmu_defconfig            |  8 ++--
 configs/qemu_mips32r2_malta_defconfig              |  8 ++--
 configs/qemu_mips32r2el_malta_defconfig            |  8 ++--
 configs/qemu_mips32r6_malta_defconfig              |  8 ++--
 configs/qemu_mips32r6el_malta_defconfig            |  8 ++--
 configs/qemu_mips64_malta_defconfig                |  8 ++--
 configs/qemu_mips64el_malta_defconfig              |  8 ++--
 configs/qemu_mips64r6_malta_defconfig              |  8 ++--
 configs/qemu_mips64r6el_malta_defconfig            |  8 ++--
 configs/qemu_nios2_10m50_defconfig                 |  8 ++--
 configs/qemu_or1k_defconfig                        | 11 ++---
 configs/qemu_ppc64_pseries_defconfig               |  6 +--
 configs/qemu_ppc_g3beige_defconfig                 |  8 ++--
 configs/qemu_ppc_mpc8544ds_defconfig               |  8 ++--
 configs/qemu_sparc64_sun4u_defconfig               |  8 ++--
 configs/qemu_sparc_ss10_defconfig                  |  8 ++--
 configs/qemu_x86_64_defconfig                      |  8 ++--
 configs/qemu_x86_defconfig                         |  8 ++--
 configs/qemu_xtensa_lx60_defconfig                 | 13 ++---
 configs/qemu_xtensa_lx60_nommu_defconfig           | 13 ++---
 104 files changed, 970 insertions(+), 998 deletions(-)
 create mode 100644 board/qemu/aarch64-virt/linux-4.11.config
 delete mode 100644 board/qemu/aarch64-virt/linux-4.9.config
 create mode 100644 board/qemu/arm-versatile/linux-4.11.config
 delete mode 100644 board/qemu/arm-versatile/linux-4.9.config
 create mode 100644 board/qemu/m68k-mcf5208/linux-4.11.config
 delete mode 100644 board/qemu/m68k-mcf5208/linux-4.8.config
 create mode 100644 board/qemu/m68k-q800/linux-4.11.config
 delete mode 100644 board/qemu/m68k-q800/linux-4.9.config
 create mode 100644 board/qemu/microblazebe-mmu/linux-4.11.config
 delete mode 100644 board/qemu/microblazebe-mmu/linux-4.9.config
 create mode 100644 board/qemu/microblazeel-mmu/linux-4.11.config
 delete mode 100644 board/qemu/microblazeel-mmu/linux-4.9.config
 create mode 100644 board/qemu/mips32r2-malta/linux-4.11.config
 delete mode 100644 board/qemu/mips32r2-malta/linux-4.9.config
 create mode 100644 board/qemu/mips32r2el-malta/linux-4.11.config
 delete mode 100644 board/qemu/mips32r2el-malta/linux-4.9.config
 create mode 100644 board/qemu/mips32r6-malta/linux-4.11.config
 delete mode 100644 board/qemu/mips32r6-malta/linux-4.9.config
 create mode 100644 board/qemu/mips32r6el-malta/linux-4.11.config
 delete mode 100644 board/qemu/mips32r6el-malta/linux-4.9.config
 create mode 100644 board/qemu/mips64-malta/linux-4.11.config
 delete mode 100644 board/qemu/mips64-malta/linux-4.8.config
 create mode 100644 board/qemu/mips64el-malta/linux-4.11.config
 delete mode 100644 board/qemu/mips64el-malta/linux-4.9.config
 create mode 100644 board/qemu/mips64r6-malta/linux-4.11.config
 delete mode 100644 board/qemu/mips64r6-malta/linux-4.9.config
 create mode 100644 board/qemu/mips64r6el-malta/linux-4.11.config
 delete mode 100644 board/qemu/mips64r6el-malta/linux-4.9.config
 create mode 100644 board/qemu/nios2-10m50/linux-4.11.fragment
 delete mode 100644 board/qemu/nios2-10m50/linux-4.9.fragment
 create mode 100644 board/qemu/or1k/linux-4.11.config
 delete mode 100644 board/qemu/or1k/linux-4.9.config
 delete mode 100644 board/qemu/or1k/patches/linux/0001-ld-or1k.patch
 delete mode 100644 board/qemu/or1k/patches/linux/0002-kallsyms.patch
 create mode 100644 board/qemu/ppc-g3beige/linux-4.11.config
 delete mode 100644 board/qemu/ppc-g3beige/linux-4.9.config
 create mode 100644 board/qemu/ppc-mpc8544ds/linux-4.11.config
 delete mode 100644 board/qemu/ppc-mpc8544ds/linux-4.9.config
 create mode 100644 board/qemu/sh4-r2d/linux-4.11.config
 delete mode 100644 board/qemu/sh4-r2d/linux-4.9.config
 create mode 100644 board/qemu/sh4eb-r2d/linux-4.11.config
 delete mode 100644 board/qemu/sh4eb-r2d/linux-4.9.config
 create mode 100644 board/qemu/sparc-ss10/linux-4.11.config
 delete mode 100644 board/qemu/sparc-ss10/linux-4.9.config
 create mode 100644 board/qemu/sparc64-sun4u/linux-4.11.config
 delete mode 100644 board/qemu/sparc64-sun4u/linux-4.9.config
 create mode 100644 board/qemu/x86/linux-4.11.config
 delete mode 120000 board/qemu/x86/linux-4.9.config
 create mode 100644 board/qemu/x86_64/linux-4.11.config
 delete mode 100644 board/qemu/x86_64/linux-4.9.config
 create mode 100644 board/qemu/xtensa-lx60/linux-4.11-nommu.config
 create mode 100644 board/qemu/xtensa-lx60/linux-4.11.config
 delete mode 100644 board/qemu/xtensa-lx60/linux-4.9-nommu.config
 delete mode 100644 board/qemu/xtensa-lx60/linux-4.9.config
 delete mode 100644 board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch

diff --git a/board/qemu/aarch64-virt/linux-4.11.config b/board/qemu/aarch64-virt/linux-4.11.config
new file mode 100644
index 0000000..93cb42f
--- /dev/null
+++ b/board/qemu/aarch64-virt/linux-4.11.config
@@ -0,0 +1,56 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_FHANDLE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_TASKSTATS=y
+CONFIG_SCHED_AUTOGROUP=y
+CONFIG_PROFILING=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_SMP=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_BINFMT_MISC=y
+CONFIG_COMPAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_PACKET_DIAG=y
+CONFIG_UNIX=y
+CONFIG_NET_KEY=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+CONFIG_IP_ADVANCED_ROUTER=y
+CONFIG_BRIDGE=m
+CONFIG_NET_SCHED=y
+CONFIG_VSOCKETS=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_CONSTANTS=y
+CONFIG_SCSI_LOGGING=y
+CONFIG_SCSI_SCAN_ASYNC=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_NETDEVICES=y
+CONFIG_DUMMY=y
+CONFIG_MACVLAN=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NLMON=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_RTC_CLASS=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_MAILBOX=y
+CONFIG_PL320_MBOX=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/aarch64-virt/linux-4.9.config b/board/qemu/aarch64-virt/linux-4.9.config
deleted file mode 100644
index 93cb42f..0000000
--- a/board/qemu/aarch64-virt/linux-4.9.config
+++ /dev/null
@@ -1,56 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
-CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_TASKSTATS=y
-CONFIG_SCHED_AUTOGROUP=y
-CONFIG_PROFILING=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_BLK_DEV_BSGLIB=y
-CONFIG_ARCH_VEXPRESS=y
-CONFIG_SMP=y
-CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_BINFMT_MISC=y
-CONFIG_COMPAT=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_PACKET_DIAG=y
-CONFIG_UNIX=y
-CONFIG_NET_KEY=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_ADVANCED_ROUTER=y
-CONFIG_BRIDGE=m
-CONFIG_NET_SCHED=y
-CONFIG_VSOCKETS=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_VIRTIO_BLK=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_CONSTANTS=y
-CONFIG_SCSI_LOGGING=y
-CONFIG_SCSI_SCAN_ASYNC=y
-CONFIG_SCSI_VIRTIO=y
-CONFIG_ATA=y
-CONFIG_NETDEVICES=y
-CONFIG_DUMMY=y
-CONFIG_MACVLAN=y
-CONFIG_VIRTIO_NET=y
-CONFIG_NLMON=y
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_VIRTIO_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_HW_RANDOM_VIRTIO=y
-CONFIG_RTC_CLASS=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
-CONFIG_MAILBOX=y
-CONFIG_PL320_MBOX=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
index 1c4c7f9..ece8a53 100644
--- a/board/qemu/aarch64-virt/readme.txt
+++ b/board/qemu/aarch64-virt/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/arm-versatile/linux-4.11.config b/board/qemu/arm-versatile/linux-4.11.config
new file mode 100644
index 0000000..b1001d8
--- /dev/null
+++ b/board/qemu/arm-versatile/linux-4.11.config
@@ -0,0 +1,43 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+# CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_VERSATILE=y
+CONFIG_PCI=y
+CONFIG_PCI_VERSATILE=y
+CONFIG_AEABI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_SYM53C8XX_2=y
+CONFIG_NETDEVICES=y
+CONFIG_8139CP=y
+CONFIG_PHYLIB=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIO_AMBAKMI=y
+CONFIG_LEGACY_PTY_COUNT=16
+CONFIG_SERIAL_8250=m
+CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=m
+CONFIG_FB=y
+CONFIG_FB_ARMCLCD=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_SOUND=y
+CONFIG_SND=m
+CONFIG_SND_MIXER_OSS=m
+CONFIG_SND_PCM_OSS=m
+CONFIG_SND_ARMAACI=m
+CONFIG_EXT4_FS=y
+CONFIG_VFAT_FS=m
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_MAGIC_SYSRQ=y
diff --git a/board/qemu/arm-versatile/linux-4.9.config b/board/qemu/arm-versatile/linux-4.9.config
deleted file mode 100644
index b1001d8..0000000
--- a/board/qemu/arm-versatile/linux-4.9.config
+++ /dev/null
@@ -1,43 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_VERSATILE=y
-CONFIG_PCI=y
-CONFIG_PCI_VERSATILE=y
-CONFIG_AEABI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_SYM53C8XX_2=y
-CONFIG_NETDEVICES=y
-CONFIG_8139CP=y
-CONFIG_PHYLIB=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIO_AMBAKMI=y
-CONFIG_LEGACY_PTY_COUNT=16
-CONFIG_SERIAL_8250=m
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_AMBA_PL011=y
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=m
-CONFIG_FB=y
-CONFIG_FB_ARMCLCD=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_SOUND=y
-CONFIG_SND=m
-CONFIG_SND_MIXER_OSS=m
-CONFIG_SND_PCM_OSS=m
-CONFIG_SND_ARMAACI=m
-CONFIG_EXT4_FS=y
-CONFIG_VFAT_FS=m
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_MAGIC_SYSRQ=y
diff --git a/board/qemu/arm-versatile/readme.txt b/board/qemu/arm-versatile/readme.txt
index c8ea4cd..6e899f4 100644
--- a/board/qemu/arm-versatile/readme.txt
+++ b/board/qemu/arm-versatile/readme.txt
@@ -9,4 +9,4 @@ Or for the noMMU emulation:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/arm-vexpress/readme.txt b/board/qemu/arm-vexpress/readme.txt
index 99812b9..57bb814 100644
--- a/board/qemu/arm-vexpress/readme.txt
+++ b/board/qemu/arm-vexpress/readme.txt
@@ -8,4 +8,4 @@ graphical window is the framebuffer.
 If you want to emulate more cores change "-smp 1" to "-smp 2" for
 dual-core or even "smp -4" for a quad-core configuration.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/m68k-mcf5208/linux-4.11.config b/board/qemu/m68k-mcf5208/linux-4.11.config
new file mode 100644
index 0000000..09a89d7
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/linux-4.11.config
@@ -0,0 +1,28 @@
+CONFIG_M68K=y
+CONFIG_COLDFIRE=y
+# CONFIG_MMU is not set
+CONFIG_M520x=y
+CONFIG_CLOCK_SET=y
+CONFIG_CLOCK_FREQ=66666666
+CONFIG_CLOCK_DIV=1
+CONFIG_M5208EVB=y
+CONFIG_FREESCALE=y
+CONFIG_RAMBASE=0x40000000
+CONFIG_RAMSIZE=0x0
+CONFIG_VECTORBASE=0x40000000
+CONFIG_KERNELBASE=0x40020000
+CONFIG_4KSTACKS=y
+CONFIG_RAMKERNEL=y
+CONFIG_BINFMT_FLAT=y
+CONFIG_SERIAL_MCF=y
+CONFIG_SERIAL_MCF_BAUDRATE=115200
+CONFIG_SERIAL_MCF_CONSOLE=y
+CONFIG_BOOTPARAM=y
+CONFIG_BOOTPARAM_STRING="console=ttyS0,115200"
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_NET_VENDOR_FREESCALE=y
+CONFIG_FEC=y
diff --git a/board/qemu/m68k-mcf5208/linux-4.8.config b/board/qemu/m68k-mcf5208/linux-4.8.config
deleted file mode 100644
index 09a89d7..0000000
--- a/board/qemu/m68k-mcf5208/linux-4.8.config
+++ /dev/null
@@ -1,28 +0,0 @@
-CONFIG_M68K=y
-CONFIG_COLDFIRE=y
-# CONFIG_MMU is not set
-CONFIG_M520x=y
-CONFIG_CLOCK_SET=y
-CONFIG_CLOCK_FREQ=66666666
-CONFIG_CLOCK_DIV=1
-CONFIG_M5208EVB=y
-CONFIG_FREESCALE=y
-CONFIG_RAMBASE=0x40000000
-CONFIG_RAMSIZE=0x0
-CONFIG_VECTORBASE=0x40000000
-CONFIG_KERNELBASE=0x40020000
-CONFIG_4KSTACKS=y
-CONFIG_RAMKERNEL=y
-CONFIG_BINFMT_FLAT=y
-CONFIG_SERIAL_MCF=y
-CONFIG_SERIAL_MCF_BAUDRATE=115200
-CONFIG_SERIAL_MCF_CONSOLE=y
-CONFIG_BOOTPARAM=y
-CONFIG_BOOTPARAM_STRING="console=ttyS0,115200"
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_NETDEVICES=y
-CONFIG_NET_VENDOR_FREESCALE=y
-CONFIG_FEC=y
diff --git a/board/qemu/m68k-mcf5208/readme.txt b/board/qemu/m68k-mcf5208/readme.txt
index 00deb2c..014a0dc 100644
--- a/board/qemu/m68k-mcf5208/readme.txt
+++ b/board/qemu/m68k-mcf5208/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/m68k-q800/linux-4.11.config b/board/qemu/m68k-q800/linux-4.11.config
new file mode 100644
index 0000000..44eb70e
--- /dev/null
+++ b/board/qemu/m68k-q800/linux-4.11.config
@@ -0,0 +1,26 @@
+CONFIG_M68K=y
+CONFIG_M68040=y
+CONFIG_M68KFPU_EMU=y
+CONFIG_MAC=y
+CONFIG_MACINTOSH_DRIVERS=y
+CONFIG_ADB=y
+CONFIG_ADB_MACII=y
+CONFIG_TTY=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_MACSONIC=y
+CONFIG_SCSI=y
+CONFIG_SCSI_DMA=y
+CONFIG_SCSI_LOWLEVEL=y
+CONFIG_SCSI_MAC_ESP=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SERIAL_PMACZILOG=y
+CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
diff --git a/board/qemu/m68k-q800/linux-4.9.config b/board/qemu/m68k-q800/linux-4.9.config
deleted file mode 100644
index 44eb70e..0000000
--- a/board/qemu/m68k-q800/linux-4.9.config
+++ /dev/null
@@ -1,26 +0,0 @@
-CONFIG_M68K=y
-CONFIG_M68040=y
-CONFIG_M68KFPU_EMU=y
-CONFIG_MAC=y
-CONFIG_MACINTOSH_DRIVERS=y
-CONFIG_ADB=y
-CONFIG_ADB_MACII=y
-CONFIG_TTY=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_NETDEVICES=y
-CONFIG_MACSONIC=y
-CONFIG_SCSI=y
-CONFIG_SCSI_DMA=y
-CONFIG_SCSI_LOWLEVEL=y
-CONFIG_SCSI_MAC_ESP=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SERIAL_PMACZILOG=y
-CONFIG_SERIAL_PMACZILOG_TTYS=y
-CONFIG_SERIAL_PMACZILOG_CONSOLE=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
diff --git a/board/qemu/microblazebe-mmu/linux-4.11.config b/board/qemu/microblazebe-mmu/linux-4.11.config
new file mode 100644
index 0000000..7bcd382
--- /dev/null
+++ b/board/qemu/microblazebe-mmu/linux-4.11.config
@@ -0,0 +1,20 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_OPT_LIB_ASM=y
+CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
+CONFIG_MMU=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_XILINX_EMACLITE=y
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
diff --git a/board/qemu/microblazebe-mmu/linux-4.9.config b/board/qemu/microblazebe-mmu/linux-4.9.config
deleted file mode 100644
index 7bcd382..0000000
--- a/board/qemu/microblazebe-mmu/linux-4.9.config
+++ /dev/null
@@ -1,20 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_OPT_LIB_ASM=y
-CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
-CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
-CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
-CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
-CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
-CONFIG_MMU=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_NETDEVICES=y
-CONFIG_XILINX_EMACLITE=y
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_TMPFS=y
diff --git a/board/qemu/microblazebe-mmu/readme.txt b/board/qemu/microblazebe-mmu/readme.txt
index 25fc35c..cf0afda 100644
--- a/board/qemu/microblazebe-mmu/readme.txt
+++ b/board/qemu/microblazebe-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/microblazeel-mmu/linux-4.11.config b/board/qemu/microblazeel-mmu/linux-4.11.config
new file mode 100644
index 0000000..a622828
--- /dev/null
+++ b/board/qemu/microblazeel-mmu/linux-4.11.config
@@ -0,0 +1,19 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
+CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
+CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
+CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
+CONFIG_MMU=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETDEVICES=y
+CONFIG_XILINX_EMACLITE=y
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
diff --git a/board/qemu/microblazeel-mmu/linux-4.9.config b/board/qemu/microblazeel-mmu/linux-4.9.config
deleted file mode 100644
index a622828..0000000
--- a/board/qemu/microblazeel-mmu/linux-4.9.config
+++ /dev/null
@@ -1,19 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_XILINX_MICROBLAZE0_FAMILY="spartan3adsp"
-CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
-CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
-CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
-CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=1
-CONFIG_MMU=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_NETDEVICES=y
-CONFIG_XILINX_EMACLITE=y
-CONFIG_SERIAL_UARTLITE=y
-CONFIG_SERIAL_UARTLITE_CONSOLE=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_TMPFS=y
diff --git a/board/qemu/microblazeel-mmu/readme.txt b/board/qemu/microblazeel-mmu/readme.txt
index 1a77a56..9edf101 100644
--- a/board/qemu/microblazeel-mmu/readme.txt
+++ b/board/qemu/microblazeel-mmu/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips32r2-malta/linux-4.11.config b/board/qemu/mips32r2-malta/linux-4.11.config
new file mode 100644
index 0000000..3a26ac8
--- /dev/null
+++ b/board/qemu/mips32r2-malta/linux-4.11.config
@@ -0,0 +1,30 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS32_R2=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r2-malta/linux-4.9.config b/board/qemu/mips32r2-malta/linux-4.9.config
deleted file mode 100644
index 3a26ac8..0000000
--- a/board/qemu/mips32r2-malta/linux-4.9.config
+++ /dev/null
@@ -1,30 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_MIPS32_R2=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-CONFIG_USB=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r2-malta/readme.txt b/board/qemu/mips32r2-malta/readme.txt
index 13f8910..7002ab1 100644
--- a/board/qemu/mips32r2-malta/readme.txt
+++ b/board/qemu/mips32r2-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips32r2el-malta/linux-4.11.config b/board/qemu/mips32r2el-malta/linux-4.11.config
new file mode 100644
index 0000000..79d7352
--- /dev/null
+++ b/board/qemu/mips32r2el-malta/linux-4.11.config
@@ -0,0 +1,31 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_LITTLE_ENDIAN=y
+CONFIG_CPU_MIPS32_R2=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r2el-malta/linux-4.9.config b/board/qemu/mips32r2el-malta/linux-4.9.config
deleted file mode 100644
index 79d7352..0000000
--- a/board/qemu/mips32r2el-malta/linux-4.9.config
+++ /dev/null
@@ -1,31 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_LITTLE_ENDIAN=y
-CONFIG_CPU_MIPS32_R2=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-CONFIG_USB=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r2el-malta/readme.txt b/board/qemu/mips32r2el-malta/readme.txt
index 5c4bbda..bfc9c49 100644
--- a/board/qemu/mips32r2el-malta/readme.txt
+++ b/board/qemu/mips32r2el-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips32r6-malta/linux-4.11.config b/board/qemu/mips32r6-malta/linux-4.11.config
new file mode 100644
index 0000000..d559676
--- /dev/null
+++ b/board/qemu/mips32r6-malta/linux-4.11.config
@@ -0,0 +1,30 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS32_R6=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r6-malta/linux-4.9.config b/board/qemu/mips32r6-malta/linux-4.9.config
deleted file mode 100644
index d559676..0000000
--- a/board/qemu/mips32r6-malta/linux-4.9.config
+++ /dev/null
@@ -1,30 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_MIPS32_R6=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-CONFIG_USB=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r6-malta/readme.txt b/board/qemu/mips32r6-malta/readme.txt
index 107c47d..7d79c66 100644
--- a/board/qemu/mips32r6-malta/readme.txt
+++ b/board/qemu/mips32r6-malta/readme.txt
@@ -4,4 +4,4 @@ qemu-system-mips -M malta -cpu mips32r6-generic -kernel output/images/vmlinux -d
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips32r6el-malta/linux-4.11.config b/board/qemu/mips32r6el-malta/linux-4.11.config
new file mode 100644
index 0000000..d559676
--- /dev/null
+++ b/board/qemu/mips32r6el-malta/linux-4.11.config
@@ -0,0 +1,30 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS32_R6=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r6el-malta/linux-4.9.config b/board/qemu/mips32r6el-malta/linux-4.9.config
deleted file mode 100644
index d559676..0000000
--- a/board/qemu/mips32r6el-malta/linux-4.9.config
+++ /dev/null
@@ -1,30 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_MIPS32_R6=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-CONFIG_USB=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips32r6el-malta/readme.txt b/board/qemu/mips32r6el-malta/readme.txt
index e29115f..78f8350 100644
--- a/board/qemu/mips32r6el-malta/readme.txt
+++ b/board/qemu/mips32r6el-malta/readme.txt
@@ -4,4 +4,4 @@ qemu-system-mipsel -M malta -cpu mips32r6-generic -kernel output/images/vmlinux
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips64-malta/linux-4.11.config b/board/qemu/mips64-malta/linux-4.11.config
new file mode 100644
index 0000000..cd0b560
--- /dev/null
+++ b/board/qemu/mips64-malta/linux-4.11.config
@@ -0,0 +1,34 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS64_R1=y
+CONFIG_64BIT=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_MIPS32_COMPAT=y
+CONFIG_MIPS32_O32=y
+CONFIG_MIPS32_N32=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64-malta/linux-4.8.config b/board/qemu/mips64-malta/linux-4.8.config
deleted file mode 100644
index cd0b560..0000000
--- a/board/qemu/mips64-malta/linux-4.8.config
+++ /dev/null
@@ -1,34 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_MIPS64_R1=y
-CONFIG_64BIT=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_MIPS32_COMPAT=y
-CONFIG_MIPS32_O32=y
-CONFIG_MIPS32_N32=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-CONFIG_USB=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index a89985d..8a73210 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/mips64el-malta/linux-4.11.config b/board/qemu/mips64el-malta/linux-4.11.config
new file mode 100644
index 0000000..c6b46d4
--- /dev/null
+++ b/board/qemu/mips64el-malta/linux-4.11.config
@@ -0,0 +1,35 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_LITTLE_ENDIAN=y
+CONFIG_CPU_MIPS64_R1=y
+CONFIG_64BIT=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_MIPS32_COMPAT=y
+CONFIG_MIPS32_O32=y
+CONFIG_MIPS32_N32=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64el-malta/linux-4.9.config b/board/qemu/mips64el-malta/linux-4.9.config
deleted file mode 100644
index c6b46d4..0000000
--- a/board/qemu/mips64el-malta/linux-4.9.config
+++ /dev/null
@@ -1,35 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_LITTLE_ENDIAN=y
-CONFIG_CPU_MIPS64_R1=y
-CONFIG_64BIT=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_MIPS32_COMPAT=y
-CONFIG_MIPS32_O32=y
-CONFIG_MIPS32_N32=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-CONFIG_USB=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64r6-malta/linux-4.11.config b/board/qemu/mips64r6-malta/linux-4.11.config
new file mode 100644
index 0000000..0ebfdbd
--- /dev/null
+++ b/board/qemu/mips64r6-malta/linux-4.11.config
@@ -0,0 +1,34 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS64_R6=y
+CONFIG_64BIT=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_MIPS32_COMPAT=y
+CONFIG_MIPS32_O32=y
+CONFIG_MIPS32_N32=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64r6-malta/linux-4.9.config b/board/qemu/mips64r6-malta/linux-4.9.config
deleted file mode 100644
index 0ebfdbd..0000000
--- a/board/qemu/mips64r6-malta/linux-4.9.config
+++ /dev/null
@@ -1,34 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_MIPS64_R6=y
-CONFIG_64BIT=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_MIPS32_COMPAT=y
-CONFIG_MIPS32_O32=y
-CONFIG_MIPS32_N32=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-CONFIG_USB=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64r6el-malta/linux-4.11.config b/board/qemu/mips64r6el-malta/linux-4.11.config
new file mode 100644
index 0000000..0ebfdbd
--- /dev/null
+++ b/board/qemu/mips64r6el-malta/linux-4.11.config
@@ -0,0 +1,34 @@
+CONFIG_MIPS_MALTA=y
+CONFIG_CPU_MIPS64_R6=y
+CONFIG_64BIT=y
+CONFIG_MIPS_MT_SMP=y
+CONFIG_NR_CPUS=2
+CONFIG_SYSVIPC=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_MIPS32_COMPAT=y
+CONFIG_MIPS32_O32=y
+CONFIG_MIPS32_N32=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_IDE_GENERIC=y
+CONFIG_BLK_DEV_GENERIC=y
+CONFIG_BLK_DEV_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_FB=y
+CONFIG_FB_CIRRUS=y
+CONFIG_USB=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64r6el-malta/linux-4.9.config b/board/qemu/mips64r6el-malta/linux-4.9.config
deleted file mode 100644
index 0ebfdbd..0000000
--- a/board/qemu/mips64r6el-malta/linux-4.9.config
+++ /dev/null
@@ -1,34 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_MIPS64_R6=y
-CONFIG_64BIT=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_SYSVIPC=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_MIPS32_COMPAT=y
-CONFIG_MIPS32_O32=y
-CONFIG_MIPS32_N32=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-CONFIG_USB=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64r6el-malta/readme.txt b/board/qemu/mips64r6el-malta/readme.txt
index b1dc23a..9250cf3 100644
--- a/board/qemu/mips64r6el-malta/readme.txt
+++ b/board/qemu/mips64r6el-malta/readme.txt
@@ -4,7 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
-
-Might work with 2.6.0 by changing the -cpu entry to MIPS64R6-generic
-since the naming was updated and the old name removed in 2.7.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/nios2-10m50/linux-4.11.fragment b/board/qemu/nios2-10m50/linux-4.11.fragment
new file mode 100644
index 0000000..76c864f
--- /dev/null
+++ b/board/qemu/nios2-10m50/linux-4.11.fragment
@@ -0,0 +1,3 @@
+# Embed the DTB in the kernel image
+CONFIG_NIOS2_DTB_SOURCE_BOOL=y
+CONFIG_NIOS2_DTB_SOURCE="arch/nios2/boot/dts/10m50_devboard.dts"
diff --git a/board/qemu/nios2-10m50/linux-4.9.fragment b/board/qemu/nios2-10m50/linux-4.9.fragment
deleted file mode 100644
index 76c864f..0000000
--- a/board/qemu/nios2-10m50/linux-4.9.fragment
+++ /dev/null
@@ -1,3 +0,0 @@
-# Embed the DTB in the kernel image
-CONFIG_NIOS2_DTB_SOURCE_BOOL=y
-CONFIG_NIOS2_DTB_SOURCE="arch/nios2/boot/dts/10m50_devboard.dts"
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
index 978ba95..f7dee37 100644
--- a/board/qemu/nios2-10m50/readme.txt
+++ b/board/qemu/nios2-10m50/readme.txt
@@ -4,6 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with the upcoming QEMU 2.9.0 [1]
-
-[1] http://git.qemu.org/?p=qemu.git;h=ae5045ae5b2bbd8ce1335d1b05f9ecacca83a6cf
+Tested with QEMU 2.9.0.
diff --git a/board/qemu/or1k/linux-4.11.config b/board/qemu/or1k/linux-4.11.config
new file mode 100644
index 0000000..0a817b1
--- /dev/null
+++ b/board/qemu/or1k/linux-4.11.config
@@ -0,0 +1,30 @@
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+CONFIG_OPENRISC_BUILTIN_DTB="or1ksim"
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_TMPFS=y
+CONFIG_NETDEVICES=y
+CONFIG_ETHOC=y
+# CONFIG_WLAN is not set
+# CONFIG_INPUT_MOUSEDEV is not set
+# CONFIG_INPUT_KEYBOARD is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+# CONFIG_USB_SUPPORT is not set
diff --git a/board/qemu/or1k/linux-4.9.config b/board/qemu/or1k/linux-4.9.config
deleted file mode 100644
index 0a817b1..0000000
--- a/board/qemu/or1k/linux-4.9.config
+++ /dev/null
@@ -1,30 +0,0 @@
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
-CONFIG_OPENRISC_BUILTIN_DTB="or1ksim"
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_TMPFS=y
-CONFIG_NETDEVICES=y
-CONFIG_ETHOC=y
-# CONFIG_WLAN is not set
-# CONFIG_INPUT_MOUSEDEV is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_OF_PLATFORM=y
-# CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
-# CONFIG_USB_SUPPORT is not set
diff --git a/board/qemu/or1k/patches/linux/0001-ld-or1k.patch b/board/qemu/or1k/patches/linux/0001-ld-or1k.patch
deleted file mode 100644
index aba2463..0000000
--- a/board/qemu/or1k/patches/linux/0001-ld-or1k.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-OpenRISC arch name was in the beginning or32
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur linux-4.4.5.orig/arch/openrisc/kernel/vmlinux.lds.S linux-4.4.5/arch/openrisc/kernel/vmlinux.lds.S
---- linux-4.4.5.orig/arch/openrisc/kernel/vmlinux.lds.S	2016-03-10 00:35:58.000000000 +0100
-+++ linux-4.4.5/arch/openrisc/kernel/vmlinux.lds.S	2016-03-16 09:21:07.933535532 +0100
-@@ -30,7 +30,7 @@
- #include <asm/cache.h>
- #include <asm-generic/vmlinux.lds.h>
- 
--OUTPUT_FORMAT("elf32-or32", "elf32-or32", "elf32-or32")
-+OUTPUT_FORMAT("elf32-or1k", "elf32-or1k", "elf32-or1k")
- jiffies = jiffies_64 + 4;
- 
- SECTIONS
diff --git a/board/qemu/or1k/patches/linux/0002-kallsyms.patch b/board/qemu/or1k/patches/linux/0002-kallsyms.patch
deleted file mode 100644
index e788a7a..0000000
--- a/board/qemu/or1k/patches/linux/0002-kallsyms.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: https://lkml.org/lkml/2016/12/31/13
-
-The build robot reports:
-
-   .tmp_kallsyms1.o: In function `kallsyms_relative_base':
->> (.rodata+0x8a18): undefined reference to `_text'
-
-This is when using 'make alldefconfig'. Adding this _text symbol to mark
-the start of the kernel as in other architecture fixes this.
-
-Signed-off-by: Stafford Horne <shorne@gmail.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur linux-4.9.orig/arch/openrisc/kernel/vmlinux.lds.S linux-4.9/arch/openrisc/kernel/vmlinux.lds.S
---- linux-4.9.orig/arch/openrisc/kernel/vmlinux.lds.S	2016-12-11 20:17:54.000000000 +0100
-+++ linux-4.9/arch/openrisc/kernel/vmlinux.lds.S	2017-01-01 12:13:43.039107518 +0100
-@@ -38,6 +38,8 @@
-         /* Read-only sections, merged into text segment: */
-         . = LOAD_BASE ;
- 
-+	_text = .;
-+
- 	/* _s_kernel_ro must be page aligned */
- 	. = ALIGN(PAGE_SIZE);
- 	_s_kernel_ro = .;
diff --git a/board/qemu/or1k/readme.txt b/board/qemu/or1k/readme.txt
index 53c66ad..a04314e 100644
--- a/board/qemu/or1k/readme.txt
+++ b/board/qemu/or1k/readme.txt
@@ -1,9 +1,9 @@
 Run the emulation with:
 
- qemu-system-or32 -kernel output/images/vmlinux -nographic
+ qemu-system-or1k -kernel output/images/vmlinux -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
 Ethernet support is not working, yet.
 
-Tested with QEMU 2.8.0.
+Tested with QEMU 2.9.0.
diff --git a/board/qemu/ppc-g3beige/linux-4.11.config b/board/qemu/ppc-g3beige/linux-4.11.config
new file mode 100644
index 0000000..7994553
--- /dev/null
+++ b/board/qemu/ppc-g3beige/linux-4.11.config
@@ -0,0 +1,25 @@
+CONFIG_ALTIVEC=y
+CONFIG_SYSVIPC=y
+CONFIG_HIGHMEM=y
+CONFIG_YENTA=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_IDE=y
+CONFIG_BLK_DEV_IDECD=y
+CONFIG_BLK_DEV_CMD64X=y
+CONFIG_BLK_DEV_IDE_PMAC=y
+CONFIG_ADB=y
+CONFIG_ADB_CUDA=y
+CONFIG_ADB_PMU=y
+CONFIG_NETDEVICES=y
+CONFIG_PCNET32=y
+CONFIG_8139CP=y
+CONFIG_SERIAL_PMACZILOG=y
+CONFIG_SERIAL_PMACZILOG_TTYS=y
+CONFIG_SERIAL_PMACZILOG_CONSOLE=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_BOOTX_TEXT=y
diff --git a/board/qemu/ppc-g3beige/linux-4.9.config b/board/qemu/ppc-g3beige/linux-4.9.config
deleted file mode 100644
index 7994553..0000000
--- a/board/qemu/ppc-g3beige/linux-4.9.config
+++ /dev/null
@@ -1,25 +0,0 @@
-CONFIG_ALTIVEC=y
-CONFIG_SYSVIPC=y
-CONFIG_HIGHMEM=y
-CONFIG_YENTA=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_BLK_DEV_CMD64X=y
-CONFIG_BLK_DEV_IDE_PMAC=y
-CONFIG_ADB=y
-CONFIG_ADB_CUDA=y
-CONFIG_ADB_PMU=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-CONFIG_8139CP=y
-CONFIG_SERIAL_PMACZILOG=y
-CONFIG_SERIAL_PMACZILOG_TTYS=y
-CONFIG_SERIAL_PMACZILOG_CONSOLE=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_BOOTX_TEXT=y
diff --git a/board/qemu/ppc-g3beige/readme.txt b/board/qemu/ppc-g3beige/readme.txt
index 3bd88a6..42c97a0 100644
--- a/board/qemu/ppc-g3beige/readme.txt
+++ b/board/qemu/ppc-g3beige/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.11.config b/board/qemu/ppc-mpc8544ds/linux-4.11.config
new file mode 100644
index 0000000..b36847c
--- /dev/null
+++ b/board/qemu/ppc-mpc8544ds/linux-4.11.config
@@ -0,0 +1,38 @@
+CONFIG_PPC_85xx=y
+CONFIG_PHYS_64BIT=y
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MPC8540_ADS=y
+CONFIG_MPC85xx_DS=y
+CONFIG_HIGHMEM=y
+CONFIG_MATH_EMULATION=y
+CONFIG_PCI=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_MSI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+CONFIG_E1000=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=6
+CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_DETECT_IRQ=y
+CONFIG_SERIAL_8250_RSA=y
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_EHCI_FSL=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_TMPFS=y
diff --git a/board/qemu/ppc-mpc8544ds/linux-4.9.config b/board/qemu/ppc-mpc8544ds/linux-4.9.config
deleted file mode 100644
index b36847c..0000000
--- a/board/qemu/ppc-mpc8544ds/linux-4.9.config
+++ /dev/null
@@ -1,38 +0,0 @@
-CONFIG_PPC_85xx=y
-CONFIG_PHYS_64BIT=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MPC8540_ADS=y
-CONFIG_MPC85xx_DS=y
-CONFIG_HIGHMEM=y
-CONFIG_MATH_EMULATION=y
-CONFIG_PCI=y
-CONFIG_PCIEPORTBUS=y
-CONFIG_PCI_MSI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_NETDEVICES=y
-CONFIG_E1000=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=6
-CONFIG_SERIAL_8250_RUNTIME_UARTS=6
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_DETECT_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_USB=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_FSL=y
-CONFIG_USB_OHCI_HCD=y
-CONFIG_TMPFS=y
diff --git a/board/qemu/ppc-mpc8544ds/readme.txt b/board/qemu/ppc-mpc8544ds/readme.txt
index d8f31cb..0008c84 100644
--- a/board/qemu/ppc-mpc8544ds/readme.txt
+++ b/board/qemu/ppc-mpc8544ds/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/ppc64-pseries/readme.txt b/board/qemu/ppc64-pseries/readme.txt
index 94fa228..7cc0c67 100644
--- a/board/qemu/ppc64-pseries/readme.txt
+++ b/board/qemu/ppc64-pseries/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/sh4-r2d/linux-4.11.config b/board/qemu/sh4-r2d/linux-4.11.config
new file mode 100644
index 0000000..a3d6544
--- /dev/null
+++ b/board/qemu/sh4-r2d/linux-4.11.config
@@ -0,0 +1,38 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_CPU_SUBTYPE_SH7751R=y
+CONFIG_MEMORY_START=0x0c000000
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_SH_RTS7751R2D=y
+CONFIG_RTS7751R2D_PLUS=y
+CONFIG_HEARTBEAT=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_PATA_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_8139CP=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_SH_SCI_CONSOLE=y
+CONFIG_SPI=y
+CONFIG_SPI_SH_SCI=y
+CONFIG_MFD_SM501=y
+CONFIG_FB=y
+CONFIG_FB_SH_MOBILE_LCDC=y
+CONFIG_FB_SH_MOBILE_HDMI=y
+CONFIG_FB_SM501=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+CONFIG_SOUND=y
+CONFIG_SND_YMFPCI=y
+CONFIG_SOUND_PRIME=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_R9701=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/sh4-r2d/linux-4.9.config b/board/qemu/sh4-r2d/linux-4.9.config
deleted file mode 100644
index a3d6544..0000000
--- a/board/qemu/sh4-r2d/linux-4.9.config
+++ /dev/null
@@ -1,38 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_CPU_SUBTYPE_SH7751R=y
-CONFIG_MEMORY_START=0x0c000000
-CONFIG_FLATMEM_MANUAL=y
-CONFIG_SH_RTS7751R2D=y
-CONFIG_RTS7751R2D_PLUS=y
-CONFIG_HEARTBEAT=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_PATA_PLATFORM=y
-CONFIG_NETDEVICES=y
-CONFIG_8139CP=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_SH_SCI_CONSOLE=y
-CONFIG_SPI=y
-CONFIG_SPI_SH_SCI=y
-CONFIG_MFD_SM501=y
-CONFIG_FB=y
-CONFIG_FB_SH_MOBILE_LCDC=y
-CONFIG_FB_SH_MOBILE_HDMI=y
-CONFIG_FB_SM501=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-CONFIG_SOUND=y
-CONFIG_SND_YMFPCI=y
-CONFIG_SOUND_PRIME=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_R9701=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/sh4eb-r2d/linux-4.11.config b/board/qemu/sh4eb-r2d/linux-4.11.config
new file mode 100644
index 0000000..6ead626
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/linux-4.11.config
@@ -0,0 +1,38 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_CPU_SUBTYPE_SH7751R=y
+CONFIG_MEMORY_START=0x0c000000
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_CPU_BIG_ENDIAN=y
+CONFIG_SH_RTS7751R2D=y
+CONFIG_RTS7751R2D_PLUS=y
+CONFIG_HEARTBEAT=y
+CONFIG_PCI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_PATA_PLATFORM=y
+CONFIG_NETDEVICES=y
+CONFIG_8139CP=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_SH_SCI_CONSOLE=y
+CONFIG_SPI=y
+CONFIG_SPI_SH_SCI=y
+CONFIG_MFD_SM501=y
+CONFIG_FB=y
+CONFIG_FB_SH_MOBILE_LCDC=y
+CONFIG_FB_SH_MOBILE_HDMI=y
+CONFIG_FB_SM501=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+CONFIG_SND_YMFPCI=y
+CONFIG_SOUND_PRIME=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_R9701=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/sh4eb-r2d/linux-4.9.config b/board/qemu/sh4eb-r2d/linux-4.9.config
deleted file mode 100644
index 6ead626..0000000
--- a/board/qemu/sh4eb-r2d/linux-4.9.config
+++ /dev/null
@@ -1,38 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_CPU_SUBTYPE_SH7751R=y
-CONFIG_MEMORY_START=0x0c000000
-CONFIG_FLATMEM_MANUAL=y
-CONFIG_CPU_BIG_ENDIAN=y
-CONFIG_SH_RTS7751R2D=y
-CONFIG_RTS7751R2D_PLUS=y
-CONFIG_HEARTBEAT=y
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_PATA_PLATFORM=y
-CONFIG_NETDEVICES=y
-CONFIG_8139CP=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_SH_SCI_CONSOLE=y
-CONFIG_SPI=y
-CONFIG_SPI_SH_SCI=y
-CONFIG_MFD_SM501=y
-CONFIG_FB=y
-CONFIG_FB_SH_MOBILE_LCDC=y
-CONFIG_FB_SH_MOBILE_HDMI=y
-CONFIG_FB_SM501=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-CONFIG_SND_YMFPCI=y
-CONFIG_SOUND_PRIME=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_R9701=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/sparc-ss10/linux-4.11.config b/board/qemu/sparc-ss10/linux-4.11.config
new file mode 100644
index 0000000..cb8d01d
--- /dev/null
+++ b/board/qemu/sparc-ss10/linux-4.11.config
@@ -0,0 +1,31 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_PCI=y
+CONFIG_SUN_OPENPROMFS=m
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_WIRELESS is not set
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_SCSI_SUNESP=y
+CONFIG_NETDEVICES=y
+CONFIG_SUNLANCE=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_SUNKBD=y
+CONFIG_MOUSE_SERIAL=y
+CONFIG_SERIAL_SUNZILOG=y
+CONFIG_SERIAL_SUNZILOG_CONSOLE=y
+CONFIG_SERIAL_SUNSU=y
+CONFIG_SERIAL_SUNSU_CONSOLE=y
+CONFIG_SUN_OPENPROMIO=m
+CONFIG_EXT4_FS=y
+CONFIG_ISO9660_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/sparc-ss10/linux-4.9.config b/board/qemu/sparc-ss10/linux-4.9.config
deleted file mode 100644
index cb8d01d..0000000
--- a/board/qemu/sparc-ss10/linux-4.9.config
+++ /dev/null
@@ -1,31 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PCI=y
-CONFIG_SUN_OPENPROMFS=m
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_WIRELESS is not set
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_SUNESP=y
-CONFIG_NETDEVICES=y
-CONFIG_SUNLANCE=y
-# CONFIG_WLAN is not set
-CONFIG_INPUT_EVDEV=y
-CONFIG_KEYBOARD_SUNKBD=y
-CONFIG_MOUSE_SERIAL=y
-CONFIG_SERIAL_SUNZILOG=y
-CONFIG_SERIAL_SUNZILOG_CONSOLE=y
-CONFIG_SERIAL_SUNSU=y
-CONFIG_SERIAL_SUNSU_CONSOLE=y
-CONFIG_SUN_OPENPROMIO=m
-CONFIG_EXT4_FS=y
-CONFIG_ISO9660_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/sparc-ss10/readme.txt b/board/qemu/sparc-ss10/readme.txt
index 5a07ee0..0ce461d 100644
--- a/board/qemu/sparc-ss10/readme.txt
+++ b/board/qemu/sparc-ss10/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/sparc64-sun4u/linux-4.11.config b/board/qemu/sparc64-sun4u/linux-4.11.config
new file mode 100644
index 0000000..0e1e168
--- /dev/null
+++ b/board/qemu/sparc64-sun4u/linux-4.11.config
@@ -0,0 +1,25 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_EMBEDDED=y
+CONFIG_MODULES=y
+CONFIG_PCI=y
+CONFIG_SUN_OPENPROMFS=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_ATA=y
+CONFIG_PATA_CMD64X=y
+CONFIG_NETDEVICES=y
+CONFIG_E1000=y
+CONFIG_SERIAL_SUNSU=y
+CONFIG_SERIAL_SUNSU_CONSOLE=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="utf-8"
+CONFIG_MAGIC_SYSRQ=y
diff --git a/board/qemu/sparc64-sun4u/linux-4.9.config b/board/qemu/sparc64-sun4u/linux-4.9.config
deleted file mode 100644
index 0e1e168..0000000
--- a/board/qemu/sparc64-sun4u/linux-4.9.config
+++ /dev/null
@@ -1,25 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ_IDLE=y
-CONFIG_EMBEDDED=y
-CONFIG_MODULES=y
-CONFIG_PCI=y
-CONFIG_SUN_OPENPROMFS=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_ATA=y
-CONFIG_PATA_CMD64X=y
-CONFIG_NETDEVICES=y
-CONFIG_E1000=y
-CONFIG_SERIAL_SUNSU=y
-CONFIG_SERIAL_SUNSU_CONSOLE=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_NLS=y
-CONFIG_NLS_DEFAULT="utf-8"
-CONFIG_MAGIC_SYSRQ=y
diff --git a/board/qemu/sparc64-sun4u/readme.txt b/board/qemu/sparc64-sun4u/readme.txt
index aaf96c3..adfff70 100644
--- a/board/qemu/sparc64-sun4u/readme.txt
+++ b/board/qemu/sparc64-sun4u/readme.txt
@@ -4,4 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/x86/linux-4.11.config b/board/qemu/x86/linux-4.11.config
new file mode 100644
index 0000000..e3bd145
--- /dev/null
+++ b/board/qemu/x86/linux-4.11.config
@@ -0,0 +1,45 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_BOCHS=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/x86/linux-4.9.config b/board/qemu/x86/linux-4.9.config
deleted file mode 120000
index 44b2fa1..0000000
--- a/board/qemu/x86/linux-4.9.config
+++ /dev/null
@@ -1 +0,0 @@
-../x86_64/linux-4.9.config
\ No newline at end of file
diff --git a/board/qemu/x86/readme.txt b/board/qemu/x86/readme.txt
index 4f2e4c7..1750096 100644
--- a/board/qemu/x86/readme.txt
+++ b/board/qemu/x86/readme.txt
@@ -6,4 +6,4 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/x86_64/linux-4.11.config b/board/qemu/x86_64/linux-4.11.config
new file mode 100644
index 0000000..e3bd145
--- /dev/null
+++ b/board/qemu/x86_64/linux-4.11.config
@@ -0,0 +1,45 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_BOCHS=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/x86_64/linux-4.9.config b/board/qemu/x86_64/linux-4.9.config
deleted file mode 100644
index e3bd145..0000000
--- a/board/qemu/x86_64/linux-4.9.config
+++ /dev/null
@@ -1,45 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_SMP=y
-CONFIG_HYPERVISOR_GUEST=y
-CONFIG_PARAVIRT=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_VIRTIO_BLK=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_VIRTIO=y
-CONFIG_ATA=y
-CONFIG_ATA_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_VIRTIO_NET=y
-CONFIG_NE2K_PCI=y
-CONFIG_8139CP=y
-CONFIG_INPUT_EVDEV=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_VIRTIO_CONSOLE=y
-CONFIG_HW_RANDOM_VIRTIO=m
-CONFIG_DRM=y
-CONFIG_DRM_BOCHS=y
-CONFIG_DRM_QXL=y
-CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_SOUND=y
-CONFIG_SND=y
-CONFIG_SND_HDA_INTEL=y
-CONFIG_SND_HDA_GENERIC=y
-CONFIG_USB=y
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_VIRTIO_PCI=y
-CONFIG_VIRTIO_BALLOON=y
-CONFIG_VIRTIO_INPUT=y
-CONFIG_VIRTIO_MMIO=y
-CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/x86_64/readme.txt b/board/qemu/x86_64/readme.txt
index 6ea28d3..ecd7813 100644
--- a/board/qemu/x86_64/readme.txt
+++ b/board/qemu/x86_64/readme.txt
@@ -6,4 +6,4 @@ Optionally add -smp N to emulate a SMP system with N CPUs.
 
 The login prompt will appear in the graphical window.
 
-Tested with QEMU 2.5.0
+Tested with QEMU 2.9.0
diff --git a/board/qemu/xtensa-lx60/linux-4.11-nommu.config b/board/qemu/xtensa-lx60/linux-4.11-nommu.config
new file mode 100644
index 0000000..10f7ee1
--- /dev/null
+++ b/board/qemu/xtensa-lx60/linux-4.11-nommu.config
@@ -0,0 +1,38 @@
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_XTENSA_VARIANT_CUSTOM=y
+CONFIG_XTENSA_VARIANT_CUSTOM_NAME="dc233c"
+# CONFIG_XTENSA_VARIANT_MMU is not set
+CONFIG_XTENSA_UNALIGNED_USER=y
+CONFIG_PREEMPT=y
+CONFIG_KERNEL_LOAD_ADDRESS=0x00003000
+# CONFIG_PCI is not set
+CONFIG_XTENSA_PLATFORM_XTFPGA=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlycon=uart8250,mmio32,0xfd050020,115200n8 console=ttyS0,115200n8 memmap=0x04000000 at 0"
+CONFIG_DEFAULT_MEM_START=0x00000000
+CONFIG_BINFMT_FLAT=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_IPV6 is not set
+CONFIG_NETFILTER=y
+CONFIG_DNS_RESOLVER=y
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_NETDEVICES=y
+CONFIG_MARVELL_PHY=y
+# CONFIG_WLAN is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
+CONFIG_FANOTIFY=y
+CONFIG_PRINTK_TIME=y
+# CONFIG_S32C1I_SELFTEST is not set
diff --git a/board/qemu/xtensa-lx60/linux-4.11.config b/board/qemu/xtensa-lx60/linux-4.11.config
new file mode 100644
index 0000000..625b860
--- /dev/null
+++ b/board/qemu/xtensa-lx60/linux-4.11.config
@@ -0,0 +1,36 @@
+# CONFIG_SWAP is not set
+# CONFIG_CROSS_MEMORY_ATTACH is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_XTENSA_VARIANT_DC233C=y
+CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX=y
+CONFIG_XTENSA_PLATFORM_XTFPGA=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="console=ttyS0,38400 memmap=0x04000000 at 0"
+# CONFIG_COMPACTION is not set
+# CONFIG_BOUNCE is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_NETDEVICES=y
+# CONFIG_WLAN is not set
+CONFIG_SERIAL_8250=y
+# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
+CONFIG_SERIAL_8250_CONSOLE=y
+# CONFIG_HW_RANDOM is not set
+# CONFIG_HWMON is not set
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_LD_NO_RELAX=y
+# CONFIG_S32C1I_SELFTEST is not set
diff --git a/board/qemu/xtensa-lx60/linux-4.9-nommu.config b/board/qemu/xtensa-lx60/linux-4.9-nommu.config
deleted file mode 100644
index 10f7ee1..0000000
--- a/board/qemu/xtensa-lx60/linux-4.9-nommu.config
+++ /dev/null
@@ -1,38 +0,0 @@
-CONFIG_NO_HZ_IDLE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_XTENSA_VARIANT_CUSTOM=y
-CONFIG_XTENSA_VARIANT_CUSTOM_NAME="dc233c"
-# CONFIG_XTENSA_VARIANT_MMU is not set
-CONFIG_XTENSA_UNALIGNED_USER=y
-CONFIG_PREEMPT=y
-CONFIG_KERNEL_LOAD_ADDRESS=0x00003000
-# CONFIG_PCI is not set
-CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="earlycon=uart8250,mmio32,0xfd050020,115200n8 console=ttyS0,115200n8 memmap=0x04000000 at 0"
-CONFIG_DEFAULT_MEM_START=0x00000000
-CONFIG_BINFMT_FLAT=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_IPV6 is not set
-CONFIG_NETFILTER=y
-CONFIG_DNS_RESOLVER=y
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_NETDEVICES=y
-CONFIG_MARVELL_PHY=y
-# CONFIG_WLAN is not set
-CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_TMPFS=y
-CONFIG_FANOTIFY=y
-CONFIG_PRINTK_TIME=y
-# CONFIG_S32C1I_SELFTEST is not set
diff --git a/board/qemu/xtensa-lx60/linux-4.9.config b/board/qemu/xtensa-lx60/linux-4.9.config
deleted file mode 100644
index 625b860..0000000
--- a/board/qemu/xtensa-lx60/linux-4.9.config
+++ /dev/null
@@ -1,36 +0,0 @@
-# CONFIG_SWAP is not set
-# CONFIG_CROSS_MEMORY_ATTACH is not set
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_XTENSA_VARIANT_DC233C=y
-CONFIG_INITIALIZE_XTENSA_MMU_INSIDE_VMLINUX=y
-CONFIG_XTENSA_PLATFORM_XTFPGA=y
-CONFIG_CMDLINE_BOOL=y
-CONFIG_CMDLINE="console=ttyS0,38400 memmap=0x04000000 at 0"
-# CONFIG_COMPACTION is not set
-# CONFIG_BOUNCE is not set
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_NETDEVICES=y
-# CONFIG_WLAN is not set
-CONFIG_SERIAL_8250=y
-# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_LD_NO_RELAX=y
-# CONFIG_S32C1I_SELFTEST is not set
diff --git a/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch b/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch
deleted file mode 100644
index c0ccf48..0000000
--- a/board/qemu/xtensa-lx60/linux/linux-0001-disable-redboot-and-uboot.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-disable boot-uboot and boot-redboot, requires a patched u-boot and mkimage
-
-Signed-off-by:Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur linux-3.15.orig/arch/xtensa/boot/Makefile linux-3.15/arch/xtensa/boot/Makefile
---- linux-3.15.orig/arch/xtensa/boot/Makefile	2014-06-08 20:19:54.000000000 +0200
-+++ linux-3.15/arch/xtensa/boot/Makefile	2014-06-14 20:07:15.206091165 +0200
-@@ -23,7 +23,7 @@
- 
- bootdir-$(CONFIG_XTENSA_PLATFORM_ISS)	 += boot-elf
- bootdir-$(CONFIG_XTENSA_PLATFORM_XT2000) += boot-redboot boot-elf boot-uboot
--bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-redboot boot-elf boot-uboot
-+bootdir-$(CONFIG_XTENSA_PLATFORM_XTFPGA) += boot-elf
- 
- zImage Image: $(bootdir-y)
- 
diff --git a/board/qemu/xtensa-lx60/readme.txt b/board/qemu/xtensa-lx60/readme.txt
index be77345..9a82c53 100644
--- a/board/qemu/xtensa-lx60/readme.txt
+++ b/board/qemu/xtensa-lx60/readme.txt
@@ -4,5 +4,4 @@ Run the emulation with:
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.6.0
-Known to fail with 2.5.0
+Tested with QEMU 2.9.0
diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
index 222c69e..1ef4405 100644
--- a/configs/qemu_aarch64_virt_defconfig
+++ b/configs/qemu_aarch64_virt_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux-4.11.config"
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index afeef75..9845ec6 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.11.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index 6cc646b..9c48172 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -27,6 +27,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.45"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.70"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-4.4-nommu.config"
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index f8dd5a0..faba6a6 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -13,13 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_mcf5208_defconfig
index a5ebf15..ccbdcfa 100644
--- a/configs/qemu_m68k_mcf5208_defconfig
+++ b/configs/qemu_m68k_mcf5208_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-mcf5208/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800_defconfig
index 7bba7ef..6dc50a7 100644
--- a/configs/qemu_m68k_q800_defconfig
+++ b/configs/qemu_m68k_q800_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/m68k-q800/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index 3af8ad9..ae736ff 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux-4.11.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 6bda8cc..3dedecf 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux-4.11.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
 BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/xilinx-xemaclite.patch"
diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips32r2_malta_defconfig
index efac1f2..db408b0 100644
--- a/configs/qemu_mips32r2_malta_defconfig
+++ b/configs/qemu_mips32r2_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mips32r2el_malta_defconfig
index 066c897..ccec419 100644
--- a/configs/qemu_mips32r2el_malta_defconfig
+++ b/configs/qemu_mips32r2el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r2el-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips32r6_malta_defconfig
index 898477b..3aee84c 100644
--- a/configs/qemu_mips32r6_malta_defconfig
+++ b/configs/qemu_mips32r6_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mips32r6el_malta_defconfig
index a082167..aa43dce 100644
--- a/configs/qemu_mips32r6el_malta_defconfig
+++ b/configs/qemu_mips32r6el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips32r6el-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 7c40063..52e4299 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.8.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index e957045..2b35c1a 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips64r6_malta_defconfig
index dccdc16..06c0133 100644
--- a/configs/qemu_mips64r6_malta_defconfig
+++ b/configs/qemu_mips64r6_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mips64r6el_malta_defconfig
index 8bbc114..e80e728 100644
--- a/configs/qemu_mips64r6el_malta_defconfig
+++ b/configs/qemu_mips64r6el_malta_defconfig
@@ -10,15 +10,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64r6el-malta/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Compiler
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index 345a6e5..a9eaf08 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -1,10 +1,10 @@
 BR2_nios2=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux-4.9.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux-4.11.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
index 4f70285..0eb1916 100644
--- a/configs/qemu_or1k_defconfig
+++ b/configs/qemu_or1k_defconfig
@@ -1,19 +1,16 @@
 # Architecture
 BR2_or1k=y
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/or1k/patches"
-
 # Filesystem
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4,9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4,11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/or1k/linux-4.11.config"
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index c15de3b..7af20e9 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3beige_defconfig
index 58d4dfc..9482aaa 100644
--- a/configs/qemu_ppc_g3beige_defconfig
+++ b/configs/qemu_ppc_g3beige_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-g3beige/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 0252da7..d2d92b6 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -9,15 +9,15 @@ BR2_SYSTEM_DHCP="eth0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux-4.11.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc64_sun4u_defconfig
index ef2d22f..1f4df06 100644
--- a/configs/qemu_sparc64_sun4u_defconfig
+++ b/configs/qemu_sparc64_sun4u_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc64-sun4u/linux-4.11.config"
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
index 1d6c951..b492f88 100644
--- a/configs/qemu_sparc_ss10_defconfig
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -9,12 +9,12 @@ BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux-4.11.config"
diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defconfig
index 7002d5e..aa17ace 100644
--- a/configs/qemu_x86_64_defconfig
+++ b/configs/qemu_x86_64_defconfig
@@ -9,12 +9,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.11.config"
diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
index 99ca604..c023a8e 100644
--- a/configs/qemu_x86_defconfig
+++ b/configs/qemu_x86_defconfig
@@ -10,12 +10,12 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-4.11.config"
diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index 915b6ff..3e98222 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -5,9 +5,6 @@ BR2_XTENSA_CUSTOM_NAME="dc233c"
 BR2_XTENSA_CORE_NAME="lx60"
 BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60"
-
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -16,15 +13,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.9.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.11.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 8c66c3a..998cd2a 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -9,9 +9,6 @@ BR2_XTENSA_OVERLAY_DIR="board/qemu/xtensa-lx60"
 BR2_PACKAGE_HOST_ELF2FLT=y
 # BR2_USE_MMU is not set
 
-# Patches
-BR2_GLOBAL_PATCH_DIR="board/qemu/xtensa-lx60"
-
 # System
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
@@ -20,15 +17,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 4.11 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.9-nommu.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/xtensa-lx60/linux-4.11-nommu.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
 BR2_LINUX_KERNEL_IMAGE_NAME="Image.elf"
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
-- 
2.1.4
