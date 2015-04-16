From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Apr 2015 08:02:45 +0200
Subject: [Buildroot] [git commit] configs/qemu: update mips malta
	configurations
Message-ID: <20150416060438.99EB97FEC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=28ec083f8278459bd2dc0669ef0e4918e24a9adb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to kernel 4.0.
Simplify kernel config to reduce bloat.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/mips-malta/linux-3.19.config     |   60 --------------------------
 board/qemu/mips-malta/linux-4.0.config      |   28 ++++++++++++
 board/qemu/mips-malta/readme.txt            |    2 +-
 board/qemu/mips64-malta/linux-3.19.config   |   60 --------------------------
 board/qemu/mips64-malta/linux-4.0.config    |   32 ++++++++++++++
 board/qemu/mips64-malta/readme.txt          |    2 +-
 board/qemu/mips64el-malta/linux-3.19.config |   61 ---------------------------
 board/qemu/mips64el-malta/linux-4.0.config  |   33 ++++++++++++++
 board/qemu/mips64el-malta/readme.txt        |    2 +-
 board/qemu/mipsel-malta/linux-3.19.config   |   61 ---------------------------
 board/qemu/mipsel-malta/linux-4.0.config    |   29 +++++++++++++
 board/qemu/mipsel-malta/readme.txt          |    2 +-
 configs/qemu_mips64_malta_defconfig         |   10 ++--
 configs/qemu_mips64el_malta_defconfig       |   10 ++--
 configs/qemu_mips_malta_defconfig           |   10 ++--
 configs/qemu_mipsel_malta_defconfig         |   10 ++--
 16 files changed, 146 insertions(+), 266 deletions(-)

diff --git a/board/qemu/mips-malta/linux-3.19.config b/board/qemu/mips-malta/linux-3.19.config
deleted file mode 100644
index 4716bb6..0000000
--- a/board/qemu/mips-malta/linux-3.19.config
+++ /dev/null
@@ -1,60 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_MIPS32_R2=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_HZ_100=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=15
-CONFIG_NAMESPACES=y
-CONFIG_RELAY=y
-CONFIG_EMBEDDED=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_MODULE_SRCVERSION_ALL=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-# CONFIG_WLAN is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO_I8042 is not set
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-# CONFIG_VGA_CONSOLE is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT4_FS=y
-CONFIG_QUOTA=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
diff --git a/board/qemu/mips-malta/linux-4.0.config b/board/qemu/mips-malta/linux-4.0.config
new file mode 100644
index 0000000..60fcd70
--- /dev/null
+++ b/board/qemu/mips-malta/linux-4.0.config
@@ -0,0 +1,28 @@
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
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips-malta/readme.txt b/board/qemu/mips-malta/readme.txt
index 7dac3cb..2c96059 100644
--- a/board/qemu/mips-malta/readme.txt
+++ b/board/qemu/mips-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/board/qemu/mips64-malta/linux-3.19.config b/board/qemu/mips64-malta/linux-3.19.config
deleted file mode 100644
index f850f09..0000000
--- a/board/qemu/mips64-malta/linux-3.19.config
+++ /dev/null
@@ -1,60 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_MIPS64_R1=y
-CONFIG_64BIT=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_HZ_100=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=15
-CONFIG_NAMESPACES=y
-CONFIG_RELAY=y
-CONFIG_EMBEDDED=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_MODULE_SRCVERSION_ALL=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PCI=y
-CONFIG_MIPS32_COMPAT=y
-CONFIG_MIPS32_O32=y
-CONFIG_MIPS32_N32=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-# CONFIG_WLAN is not set
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-# CONFIG_VGA_CONSOLE is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
diff --git a/board/qemu/mips64-malta/linux-4.0.config b/board/qemu/mips64-malta/linux-4.0.config
new file mode 100644
index 0000000..9b5d4e6
--- /dev/null
+++ b/board/qemu/mips64-malta/linux-4.0.config
@@ -0,0 +1,32 @@
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
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64-malta/readme.txt b/board/qemu/mips64-malta/readme.txt
index 11fba34..80c9310 100644
--- a/board/qemu/mips64-malta/readme.txt
+++ b/board/qemu/mips64-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/board/qemu/mips64el-malta/linux-3.19.config b/board/qemu/mips64el-malta/linux-3.19.config
deleted file mode 100644
index 6fe3594..0000000
--- a/board/qemu/mips64el-malta/linux-3.19.config
+++ /dev/null
@@ -1,61 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_LITTLE_ENDIAN=y
-CONFIG_CPU_MIPS64_R1=y
-CONFIG_64BIT=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_HZ_100=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=15
-CONFIG_NAMESPACES=y
-CONFIG_RELAY=y
-CONFIG_EMBEDDED=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_MODULE_SRCVERSION_ALL=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PCI=y
-CONFIG_MIPS32_COMPAT=y
-CONFIG_MIPS32_O32=y
-CONFIG_MIPS32_N32=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-# CONFIG_WLAN is not set
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-# CONFIG_VGA_CONSOLE is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT4_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
diff --git a/board/qemu/mips64el-malta/linux-4.0.config b/board/qemu/mips64el-malta/linux-4.0.config
new file mode 100644
index 0000000..8877a2e
--- /dev/null
+++ b/board/qemu/mips64el-malta/linux-4.0.config
@@ -0,0 +1,33 @@
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
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mips64el-malta/readme.txt b/board/qemu/mips64el-malta/readme.txt
index 8ad80c4..82ab883 100644
--- a/board/qemu/mips64el-malta/readme.txt
+++ b/board/qemu/mips64el-malta/readme.txt
@@ -5,4 +5,4 @@ Run the emulation with:
 The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/board/qemu/mipsel-malta/linux-3.19.config b/board/qemu/mipsel-malta/linux-3.19.config
deleted file mode 100644
index 4ce1d91..0000000
--- a/board/qemu/mipsel-malta/linux-3.19.config
+++ /dev/null
@@ -1,61 +0,0 @@
-CONFIG_MIPS_MALTA=y
-CONFIG_CPU_LITTLE_ENDIAN=y
-CONFIG_CPU_MIPS32_R2=y
-CONFIG_MIPS_MT_SMP=y
-CONFIG_NR_CPUS=2
-CONFIG_HZ_100=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=15
-CONFIG_NAMESPACES=y
-CONFIG_RELAY=y
-CONFIG_EMBEDDED=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_MODULE_SRCVERSION_ALL=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PCI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECD=y
-CONFIG_IDE_GENERIC=y
-CONFIG_BLK_DEV_GENERIC=y
-CONFIG_BLK_DEV_PIIX=y
-CONFIG_NETDEVICES=y
-CONFIG_PCNET32=y
-# CONFIG_WLAN is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO_I8042 is not set
-CONFIG_VT_HW_CONSOLE_BINDING=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-# CONFIG_HW_RANDOM is not set
-# CONFIG_HWMON is not set
-CONFIG_FB=y
-CONFIG_FB_CIRRUS=y
-# CONFIG_VGA_CONSOLE is not set
-# CONFIG_USB_SUPPORT is not set
-CONFIG_EXT4_FS=y
-CONFIG_QUOTA=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_NFS_FS=y
-CONFIG_ROOT_NFS=y
diff --git a/board/qemu/mipsel-malta/linux-4.0.config b/board/qemu/mipsel-malta/linux-4.0.config
new file mode 100644
index 0000000..b9a743f
--- /dev/null
+++ b/board/qemu/mipsel-malta/linux-4.0.config
@@ -0,0 +1,29 @@
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
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
diff --git a/board/qemu/mipsel-malta/readme.txt b/board/qemu/mipsel-malta/readme.txt
index 27d3153..a77eb88 100644
--- a/board/qemu/mipsel-malta/readme.txt
+++ b/board/qemu/mipsel-malta/readme.txt
@@ -6,4 +6,4 @@ The login prompt will appear in the terminal that started Qemu. The
 graphical window is the framebuffer. No keyboard support has been
 enabled.
 
-Tested with QEMU 2.2.0
+Tested with QEMU 2.2.1
diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64_malta_defconfig
index 8bce340..35761ff 100644
--- a/configs/qemu_mips64_malta_defconfig
+++ b/configs/qemu_mips64_malta_defconfig
@@ -6,17 +6,17 @@ BR2_MIPS_NABI64=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64-malta/linux-4.0.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips64el_malta_defconfig
index 8999e6c..923cccd 100644
--- a/configs/qemu_mips64el_malta_defconfig
+++ b/configs/qemu_mips64el_malta_defconfig
@@ -6,17 +6,17 @@ BR2_MIPS_NABI64=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips64el-malta/linux-4.0.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mips_malta_defconfig b/configs/qemu_mips_malta_defconfig
index 4ed02c0..d09a16b 100644
--- a/configs/qemu_mips_malta_defconfig
+++ b/configs/qemu_mips_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mips-malta/linux-4.0.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
diff --git a/configs/qemu_mipsel_malta_defconfig b/configs/qemu_mipsel_malta_defconfig
index 012eefe..f345d71 100644
--- a/configs/qemu_mipsel_malta_defconfig
+++ b/configs/qemu_mipsel_malta_defconfig
@@ -6,17 +6,17 @@ BR2_mips_32r2=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.19 headers to avoid breaking with newer kernels
+# Lock to 4.0 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.19"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_19=y
+BR2_DEFAULT_KERNEL_VERSION="4.0"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.19"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-3.19.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/mipsel-malta/linux-4.0.config"
 BR2_LINUX_KERNEL_VMLINUX=y
 
 # Serial port config
