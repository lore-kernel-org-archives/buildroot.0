From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jun 2017 11:25:26 +0200
Subject: [Buildroot] [git commit] configs/pc_x86_64_{bios,
	efi}_defconfig: use custom linux config
Message-ID: <20170615093124.E8E8180298@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35d4f50fa4ac5073b48127e6a647ff9b6876e070
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reusing the qemu x86-64 linux config isn't very obvious, so these defconfigs
aren't taken into consideration when the qemu defconfigs are updated,
breaking the build.

Instead use a custom linux config for the pc defconfigs.  With this, we also
can get rid of the fragment file containing the delta fra the qemu config.

Created by linux-update-defconfig (after turning of the fragment file).
Also drop the linux kernel version number from the file name as it just
causes extra noise whenever the kernel is bumped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/pc/linux-extras.config     | 45 ---------------------
 board/pc/linux.config            | 84 ++++++++++++++++++++++++++++++++++++++++
 configs/pc_x86_64_bios_defconfig |  3 +-
 configs/pc_x86_64_efi_defconfig  |  3 +-
 4 files changed, 86 insertions(+), 49 deletions(-)

diff --git a/board/pc/linux-extras.config b/board/pc/linux-extras.config
deleted file mode 100644
index 8c9c225..0000000
--- a/board/pc/linux-extras.config
+++ /dev/null
@@ -1,45 +0,0 @@
-# Filesystem support
-CONFIG_FUSE_FS=y
-CONFIG_SQUASHFS=y
-
-# Ethernet drivers
-CONFIG_ATL2=m
-CONFIG_ATL1=m
-CONFIG_ATL1E=m
-CONFIG_ATL1C=m
-CONFIG_ALX=m
-CONFIG_E100=m
-CONFIG_E1000=m
-CONFIG_E1000E=m
-CONFIG_IGB=m
-CONFIG_R8169=m
-
-# Video drivers
-CONFIG_DRM_I915=y
-CONFIG_FB_VESA=y
-
-# Wireless drivers
-CONFIG_CFG80211=m
-CONFIG_CFG80211_WEXT=y
-CONFIG_MAC80211=m
-CONFIG_ATH_CARDS=m
-CONFIG_ATH9K=m
-CONFIG_ATH9K_HTC=m
-CONFIG_CARL9170=m
-CONFIG_ATH10K=m
-CONFIG_ATH10K_PCI=m
-CONFIG_IWL4965=m
-CONFIG_IWL3945=m
-CONFIG_IWLWIFI=m
-CONFIG_RT2X00=m
-CONFIG_RT2800PCI=m
-CONFIG_RT73USB=m
-CONFIG_RT2800USB=m
-CONFIG_RT2800USB_RT3573=y
-CONFIG_RT2800USB_RT53XX=y
-CONFIG_RT2800USB_RT55XX=y
-# CONFIG_RTL_CARDS is not set
-CONFIG_RTL8XXXU=m
-
-# EFI support
-CONFIG_EFI=y
diff --git a/board/pc/linux.config b/board/pc/linux.config
new file mode 100644
index 0000000..0fff117
--- /dev/null
+++ b/board/pc/linux.config
@@ -0,0 +1,84 @@
+CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_EFI=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_NETFILTER=y
+CONFIG_IP_NF_IPTABLES=y
+CONFIG_IP_NF_FILTER=y
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_ATL2=m
+CONFIG_ATL1=m
+CONFIG_ATL1E=m
+CONFIG_ATL1C=m
+CONFIG_ALX=m
+CONFIG_E100=m
+CONFIG_E1000=m
+CONFIG_E1000E=m
+CONFIG_IGB=m
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+CONFIG_R8169=m
+CONFIG_ATH9K=m
+CONFIG_ATH9K_HTC=m
+CONFIG_CARL9170=m
+CONFIG_ATH10K=m
+CONFIG_ATH10K_PCI=m
+CONFIG_IWL4965=m
+CONFIG_IWL3945=m
+CONFIG_IWLWIFI=m
+CONFIG_RT2X00=m
+CONFIG_RT2800PCI=m
+CONFIG_RT73USB=m
+CONFIG_RT2800USB=m
+CONFIG_RT2800USB_RT3573=y
+CONFIG_RT2800USB_RT53XX=y
+CONFIG_RT2800USB_RT55XX=y
+# CONFIG_RTL_CARDS is not set
+CONFIG_RTL8XXXU=m
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_DRM_I915=y
+CONFIG_DRM_QXL=y
+CONFIG_DRM_BOCHS=y
+CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB_VESA=y
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
+CONFIG_FUSE_FS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_SQUASHFS=y
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index b8515d1..d64f09a 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -29,8 +29,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.11.config"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Firmware
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 212d72f..ea2abc3 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -32,8 +32,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux-4.11.5.config"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/pc/linux-extras.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Firmware
