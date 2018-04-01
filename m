From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:42:59 +0200
Subject: [Buildroot] [git commit] configs/qemu_ppc64_e5500: new defconfig
Message-ID: <20180401224309.8E6E283826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dab038d1ac2ada87f89aa3bbae8a816481091e05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding basic support modeled after the Freescale/NXP T1040RDBD4 board.

This target is used to support testing of the bootlin e5500 toolchain.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[Thomas: update .gitlab-ci.yml.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                        |  1 +
 DEVELOPERS                            |  2 ++
 board/qemu/ppc64-e5500/linux.fragment | 10 ++++++++++
 board/qemu/ppc64-e5500/readme.txt     |  7 +++++++
 configs/qemu_ppc64_e5500_defconfig    | 20 ++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 423f729660..3229fcf12c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -210,6 +210,7 @@ qemu_mips64r6_malta_defconfig: *defconfig
 qemu_mips64r6el_malta_defconfig: *defconfig
 qemu_nios2_10m50_defconfig: *defconfig
 qemu_or1k_defconfig: *defconfig
+qemu_ppc64_e5500_defconfig: *defconfig
 qemu_ppc64_pseries_defconfig: *defconfig
 qemu_ppc64le_pseries_defconfig: *defconfig
 qemu_ppc_g3beige_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 855654bde9..d6eb24a1fe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1171,8 +1171,10 @@ F:	package/ts4900-fpga/
 N:	Matt Weber <matthew.weber@rockwellcollins.com>
 F:	board/freescale/p*
 F:	board/freescale/t*
+F:	board/qemu/ppc64-e5500/
 F:	configs/freescale_p*
 F:	configs/freescale_t*
+F:	configs/qemu_ppc64_e5500_defconfig
 F:	package/argp-standalone/
 F:	package/aufs/
 F:	package/aufs-util/
diff --git a/board/qemu/ppc64-e5500/linux.fragment b/board/qemu/ppc64-e5500/linux.fragment
new file mode 100644
index 0000000000..071a55ccf7
--- /dev/null
+++ b/board/qemu/ppc64-e5500/linux.fragment
@@ -0,0 +1,10 @@
+# Enables generic PPC e500 base arch support for QEMU.
+# The e5500 is a variant of the e500 arch.
+CONFIG_PPC_QEMU_E500=y
+
+# Enable virtio (blk, rng and net devices)
+CONFIG_VIRTIO=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_HW_RANDOM_VIRTIO=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_VIRTIO_NET=y
diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
new file mode 100644
index 0000000000..0bfd41d76b
--- /dev/null
+++ b/board/qemu/ppc64-e5500/readme.txt
@@ -0,0 +1,7 @@
+Run the emulation with:
+
+ qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append 'console=ttyS0 root=/dev/vda' -serial mon:stdio -nographic
+
+The login prompt will appear in the terminal that started Qemu.
+
+Tested with QEMU 2.0.0
diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
new file mode 100644
index 0000000000..e4a7518f32
--- /dev/null
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -0,0 +1,20 @@
+# Architecture
+BR2_powerpc64=y
+BR2_powerpc_e5500=y
+
+# Serial port config
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+
+# Linux headers same as the kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
+BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
