From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@intel.com>
Date: Mon,  6 Jun 2016 18:20:57 +0200
Subject: [Buildroot] [PATCH] configs/minnowboard_max: bump kernel to 4.6.1
Message-ID: <1465230057-22582-1-git-send-email-vincent.stehle@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, rebase kernel config and adapt kernel command line in grub config
file to follow mmc numbering change.

Signed-off-by: Vincent Stehl? <vincent.stehle@intel.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard/grub-minnowboard-max.cfg  |  2 +-
 board/minnowboard/linux-4.6.config          | 55 +++++++++++++++++++++++++++++
 configs/minnowboard_max-graphical_defconfig |  6 ++--
 configs/minnowboard_max_defconfig           |  8 ++---
 4 files changed, 63 insertions(+), 8 deletions(-)
 create mode 100644 board/minnowboard/linux-4.6.config

diff --git a/board/minnowboard/grub-minnowboard-max.cfg b/board/minnowboard/grub-minnowboard-max.cfg
index f38db8f..3d6feb7 100644
--- a/board/minnowboard/grub-minnowboard-max.cfg
+++ b/board/minnowboard/grub-minnowboard-max.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /bzImage root=/dev/mmcblk0p2 rootwait console=tty0 console=ttyS0,115200
+	linux /bzImage root=/dev/mmcblk2p2 rootwait console=tty0 console=ttyS0,115200
 }
diff --git a/board/minnowboard/linux-4.6.config b/board/minnowboard/linux-4.6.config
new file mode 100644
index 0000000..3bc1ffd
--- /dev/null
+++ b/board/minnowboard/linux-4.6.config
@@ -0,0 +1,55 @@
+CONFIG_SYSVIPC=y
+CONFIG_NO_HZ=y
+CONFIG_SMP=y
+CONFIG_X86_INTEL_LPSS=y
+CONFIG_MATOM=y
+CONFIG_EFI=y
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_X86_INTEL_PSTATE=y
+CONFIG_X86_ACPI_CPUFREQ=y
+CONFIG_INTEL_IDLE=y
+CONFIG_IA32_EMULATION=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_R8169=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_DW=y
+CONFIG_I2C_I801=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_I2C_DESIGNWARE_PCI=y
+CONFIG_SPI=y
+CONFIG_SPI_DESIGNWARE=y
+CONFIG_SPI_PXA2XX=y
+CONFIG_PINCTRL_BAYTRAIL=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_AGP=y
+CONFIG_DRM=y
+CONFIG_DRM_LOAD_EDID_FIRMWARE=y
+CONFIG_DRM_I915=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+# CONFIG_SND_DRIVERS is not set
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_CODEC_HDMI=y
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_NOP_USB_XCEIV=y
+CONFIG_MMC=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PCI=y
+CONFIG_MMC_SDHCI_ACPI=y
+CONFIG_PWM=y
+CONFIG_EXT4_FS=y
diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index 8634c54..a5f60a7 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -3,7 +3,7 @@ BR2_x86_64=y
 BR2_x86_atom=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
@@ -23,9 +23,9 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Linux
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.6.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
diff --git a/configs/minnowboard_max_defconfig b/configs/minnowboard_max_defconfig
index 7c418c5..1bb22f9 100644
--- a/configs/minnowboard_max_defconfig
+++ b/configs/minnowboard_max_defconfig
@@ -9,8 +9,8 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="minnowboard-max"
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 4.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_6=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
@@ -22,9 +22,9 @@ BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 # Linux kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.1"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard/linux-4.6.config"
 
 # Bootloader
 BR2_TARGET_GRUB2=y
-- 
2.8.1
