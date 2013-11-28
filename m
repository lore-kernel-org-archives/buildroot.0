From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 22:56:05 +0100
Subject: [Buildroot] [git commit] configs/qemu_mips64_malta: update config
Message-ID: <20131201201520.98DF79BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c98185c8d18c7a3e8fb9d8a63de46965fadcbae0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Slim down the kernel config, switch to ext4 (with ext2/3 support),
enable N32 & O32 ABI compatibility for extra testing goodness and enable
keyboard & mouse support.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/qemu/mips64-malta/linux-3.12.config |   35 ++++++----------------------
 board/qemu/mips64-malta/readme.txt        |    5 +---
 configs/qemu_mips64_malta_defconfig       |    4 ---
 3 files changed, 9 insertions(+), 35 deletions(-)

diff --git a/board/qemu/mips64-malta/linux-3.12.config b/board/qemu/mips64-malta/linux-3.12.config
index 6e7f7ee..c112793 100644
--- a/board/qemu/mips64-malta/linux-3.12.config
+++ b/board/qemu/mips64-malta/linux-3.12.config
@@ -1,23 +1,16 @@
 CONFIG_MIPS_MALTA=y
 CONFIG_CPU_MIPS64_R1=y
 CONFIG_64BIT=y
-CONFIG_64BIT_PHYS_ADDR=y
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
@@ -26,7 +19,9 @@ CONFIG_MODVERSIONS=y
 CONFIG_MODULE_SRCVERSION_ALL=y
 # CONFIG_BLK_DEV_BSG is not set
 CONFIG_PCI=y
-CONFIG_PM=y
+CONFIG_MIPS32_COMPAT=y
+CONFIG_MIPS32_O32=y
+CONFIG_MIPS32_N32=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -40,39 +35,25 @@ CONFIG_IP_PNP=y
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
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO_I8042 is not set
 CONFIG_VT_HW_CONSOLE_BINDING=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
-# CONFIG_MFD_SUPPORT is not set
 CONFIG_FB=y
 CONFIG_FB_CIRRUS=y
 # CONFIG_VGA_CONSOLE is not set
-# CONFIG_HID_SUPPORT is not set
 # CONFIG_USB_SUPPORT is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_QUOTA=y
+CONFIG_EXT4_FS=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
 CONFIG_ROOT_NFS=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 4fa8a19..7999b78 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -3,9 +3,6 @@ Run the emulation with:
  qemu-system-mips64 -M malta -kernel output/images/vmlinux -serial stdio -hda output/images/rootfs.ext2 -append "root=/dev/hda"
 
 The login prompt will appear in the terminal that started Qemu. The
-graphical window is the framebuffer. No keyboard support has been
-enabled.
-
-This configuration is known to be flaky.
+graphical window is the framebuffer.
 
 Tested with QEMU 1.6.1
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index c0904b5..fd82233 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -2,10 +2,6 @@
 BR2_mips64=y
 BR2_MIPS_NABI64=y
 
-# Toolchain
-# uClibc dynamic loader seems broken for mips64
-BR2_PREFER_STATIC_LIB=y
-
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
