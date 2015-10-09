From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 23:32:10 +0200
Subject: [Buildroot] [git commit] configs/qemu: add sh4eb (big endian) sample
Message-ID: <20151009213222.CB96D81EDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1d61b04a4f65d9b5a354485702a995d3cf191d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/sh4eb-r2d/linux-4.2.config |   38 +++++++++++++++++++++++++++++++++
 board/qemu/sh4eb-r2d/readme.txt       |    8 +++++++
 configs/qemu_sh4eb_r2d_defconfig      |   24 ++++++++++++++++++++
 3 files changed, 70 insertions(+), 0 deletions(-)

diff --git a/board/qemu/sh4eb-r2d/linux-4.2.config b/board/qemu/sh4eb-r2d/linux-4.2.config
new file mode 100644
index 0000000..6ead626
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/linux-4.2.config
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
diff --git a/board/qemu/sh4eb-r2d/readme.txt b/board/qemu/sh4eb-r2d/readme.txt
new file mode 100644
index 0000000..23198ba
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/readme.txt
@@ -0,0 +1,8 @@
+Run the emulation with:
+
+  qemu-system-sh4eb -M r2d -kernel output/images/zImage -drive file=output/images/rootfs.ext2,if=ide -append "root=/dev/sda console=ttySC1,115200 noiotrap" -serial null -serial stdio -net nic,model=rtl8139 -net user
+
+The login prompt will appear in the terminal that started Qemu.
+The graphical window is the framebuffer.
+
+Tested with QEMU 2.4.0.1
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
new file mode 100644
index 0000000..4e6ea97
--- /dev/null
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -0,0 +1,24 @@
+# Architecture
+BR2_sh=y
+BR2_sh4eb=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttySC1"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Lock to 4.2 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.2.3"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_2=y
+
+# Linux kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.2.3"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.2.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
