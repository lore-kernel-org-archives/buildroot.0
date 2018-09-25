From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 21:40:10 +0200
Subject: [Buildroot] [git commit] configs/qemu_riscv64_virt: new defconfig
Message-ID: <20180925194643.D1E6D88CAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52ef63d0bd5d7998869babb5baef4a1353b51612
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add RISC-V 64-bit defconfig for QEMU virt machine.

Tested with QEMU 2.12.1

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                       |  1 +
 DEVELOPERS                           |  2 ++
 board/qemu/riscv64-virt/linux.config | 23 +++++++++++++++++++++++
 board/qemu/riscv64-virt/readme.txt   |  7 +++++++
 configs/qemu_riscv64_virt_defconfig  | 24 ++++++++++++++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 05e54ab6b6..b220d544f8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -215,6 +215,7 @@ qemu_ppc64le_pseries_defconfig: *defconfig
 qemu_ppc_g3beige_defconfig: *defconfig
 qemu_ppc_mpc8544ds_defconfig: *defconfig
 qemu_ppc_virtex_ml507_defconfig: *defconfig
+qemu_riscv64_virt_defconfig: *defconfig
 qemu_sh4_r2d_defconfig: *defconfig
 qemu_sh4eb_r2d_defconfig: *defconfig
 qemu_sparc64_sun4u_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 056c3a143e..e5cd83af0d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1301,7 +1301,9 @@ F:	package/ratpoison/
 N:	Mark Corbin <mark.corbin@embecosm.com>
 F:	arch/arch.mk.riscv
 F:	arch/Config.in.riscv
+F:	board/qemu/riscv64-virt/
 F:	boot/riscv-pk/
+F:	configs/qemu_riscv64_virt_defconfig
 
 N:	Markos Chandras <markos.chandras@imgtec.com>
 F:	package/harfbuzz/
diff --git a/board/qemu/riscv64-virt/linux.config b/board/qemu/riscv64-virt/linux.config
new file mode 100644
index 0000000000..d09e8b3bb1
--- /dev/null
+++ b/board/qemu/riscv64-virt/linux.config
@@ -0,0 +1,23 @@
+CONFIG_ARCH_RV64I=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=8
+CONFIG_PCI=y
+CONFIG_SYSVIPC=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_WIRELESS is not set
+CONFIG_VIRTIO_BLK=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+# CONFIG_ETHERNET is not set
+# CONFIG_WLAN is not set
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_VIRT_DRIVERS=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_EXT2_FS=y
+CONFIG_EXT4_FS=y
+CONFIG_TMPFS=y
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
new file mode 100644
index 0000000000..9f6e35c867
--- /dev/null
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+  qemu-system-riscv64 -M virt -kernel output/images/bbl -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.12.1
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
new file mode 100644
index 0000000000..59343ee98f
--- /dev/null
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -0,0 +1,24 @@
+# Architecture
+BR2_riscv=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fe92d7905c6ea0ebeabeb725b8040754ede7c220"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv64-virt/linux.config"
+
+# Bootloader
+BR2_TARGET_RISCV_PK=y
