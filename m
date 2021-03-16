From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 16 Mar 2021 23:38:22 +0900
Subject: [Buildroot] [PATCH 2/2] qemu_arm_versatile_nommu: switch to
 in-kernel defconfig + fragment
In-Reply-To: <20210316143822.3421019-1-masahiroy@kernel.org>
References: <20210316143822.3421019-1-masahiroy@kernel.org>
Message-ID: <20210316143822.3421019-2-masahiroy@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This platform has its own kernel defconfig in Buildroot, but we cannot
get quick idea about how much it diverged from the in-kernel defconfig.

Let's use the upstream arch/arm/config/versatile_defconfig as a base,
and maintain the diff as a merge-config fragment. The same .config is
still generated based on the 5.10.7 kernel.

The diff is quite big, but this is a good start-point for cleanups.
Follow-up works can drop diff lines unless we find a good reason for
divergence.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 board/qemu/arm-versatile/linux-nommu.config   | 47 ---------------
 .../arm-versatile/linux-nommu.config.fragment | 59 +++++++++++++++++++
 configs/qemu_arm_versatile_nommu_defconfig    |  4 +-
 3 files changed, 61 insertions(+), 49 deletions(-)
 delete mode 100644 board/qemu/arm-versatile/linux-nommu.config
 create mode 100644 board/qemu/arm-versatile/linux-nommu.config.fragment

diff --git a/board/qemu/arm-versatile/linux-nommu.config b/board/qemu/arm-versatile/linux-nommu.config
deleted file mode 100644
index 1d91d51a14..0000000000
--- a/board/qemu/arm-versatile/linux-nommu.config
+++ /dev/null
@@ -1,47 +0,0 @@
-# CONFIG_MMU is not set
-CONFIG_ARCH_VERSATILE=y
-CONFIG_ARM_SINGLE_ARCH_VERSATILE=y
-CONFIG_SET_MEM_PARAM=y
-CONFIG_DRAM_BASE=0x00000000
-CONFIG_DRAM_SIZE=0x08000000
-CONFIG_ARCH_VERSATILE_PB=y
-CONFIG_MACH_VERSATILE_AB=y
-CONFIG_MACH_VERSATILE_DT=y
-CONFIG_BINFMT_FLAT=y
-CONFIG_SYSVIPC=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_AEABI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_NETDEVICES=y
-CONFIG_SMC91X=y
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
diff --git a/board/qemu/arm-versatile/linux-nommu.config.fragment b/board/qemu/arm-versatile/linux-nommu.config.fragment
new file mode 100644
index 0000000000..6f1cc3f26d
--- /dev/null
+++ b/board/qemu/arm-versatile/linux-nommu.config.fragment
@@ -0,0 +1,59 @@
+# CONFIG_ARM_SINGLE_ARMV7M is not set
+CONFIG_ARM_SINGLE_ARCH_VERSATILE=y
+CONFIG_BINFMT_ELF_FDPIC=y
+CONFIG_BINFMT_FLAT=y
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CRAMFS is not set
+CONFIG_CMDLINE=""
+# CONFIG_DEBUG_FS is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DRM is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EXT2_FS is not set
+CONFIG_EXT4_FS=y
+CONFIG_FB_ARMCLCD=y
+# CONFIG_FONTS is not set
+CONFIG_FONT_8x16=y
+CONFIG_FONT_8x8=y
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FTRACE is not set
+# CONFIG_GPIO_PL061 is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_HWMON=y
+# CONFIG_I2C_VERSATILE is not set
+CONFIG_INET_DIAG=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_IPV6=y
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_PNP is not set
+# CONFIG_MMU is not set
+CONFIG_LOCALVERSION_AUTO=y
+# CONFIG_LOGO is not set
+CONFIG_LOG_BUF_SHIFT=17
+CONFIG_MDIO_DEVICE=y
+# CONFIG_MINIX_FS is not set
+# CONFIG_MMC is not set
+# CONFIG_MTD is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_NFSD is not set
+# CONFIG_NFS_FS is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_ISO8859_1 is not set
+# CONFIG_NO_HZ_IDLE is not set
+# CONFIG_NVMEM is not set
+CONFIG_DRAM_BASE=0x00000000
+CONFIG_DRAM_SIZE=0x08000000
+CONFIG_INITRAMFS_SOURCE="${BR_BINARIES_DIR}/rootfs.cpio"
+# CONFIG_PARTITION_ADVANCED is not set
+# CONFIG_OABI_COMPAT is not set
+CONFIG_PHYLIB=y
+# CONFIG_ROMFS_FS is not set
+# CONFIG_RTC_CLASS is not set
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIO_SERPORT=y
+CONFIG_SET_MEM_PARAM=y
+CONFIG_SLUB=y
+# CONFIG_SPI is not set
+# CONFIG_SYNC_FILE is not set
+# CONFIG_VFP is not set
diff --git a/configs/qemu_arm_versatile_nommu_defconfig b/configs/qemu_arm_versatile_nommu_defconfig
index fa783f9299..b60de66dff 100644
--- a/configs/qemu_arm_versatile_nommu_defconfig
+++ b/configs/qemu_arm_versatile_nommu_defconfig
@@ -32,8 +32,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-nommu.config"
+BR2_LINUX_KERNEL_DEFCONFIG="versatile"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux-nommu.config.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
 
-- 
2.27.0
