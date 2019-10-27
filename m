From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 27 Oct 2019 15:56:16 +0100
Subject: [Buildroot] [git commit] configs/qemu_arm_vexpress_tz: Armv7-A
 emulation with TrustZone services
Message-ID: <20191027144949.71A3D8A2C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0971ec7ec989883634175e7611a044334ea8a0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This change introduces a Qemu board for an Armv7-A target executing
with OP-TEE secure world services. The target Linux based normal world
embeds the standard minimal filesystem with OP-TEE non-secure components
embedded files from OP-TEE test, examples and benchmark packages.

qemu_arm_vexpress_tz_defconfig differs from qemu_arm_vexpress_defconfig.
Supporting both secure and non-secure worlds on the Arm target mandates
a secure world, here OP-TEE OS, and a bootloader to boot both worlds,
here TF-A (boot/arm-trusted-firmware). Here non-secure Linux kernel is
booted through U-boot

  TF-A bootloader (BL1/BL2) => OP-TEE (BL32) => U-boot (BL33).
  | Executes as secure         | Secure         | Execs as Non-secure
  | Loads BL32/BL33 in RAM     | Jumps to BL33  | Always booted after
  | Jumps to BL32 once done    | as Non-secure  | secure world inits

Vexpress and vexpress-tz defconfigs also differs in that Qemu emulates
a Cortex-A9 in the former and a Cortex-A15 in the later. Cortex-A15
is the Armv7-A CPU used in upstream TF-A and OP-TEE OS packages hence
selected here.

Defconfig adds a fragment to the Linux kernel native configuration to
enable OP-TEE driver support.

Defconfig adds a fragment to the U-Boot native configuration set boot
command, enable semihosting and remove U-Boot persistent environment
storage support.

The defconfig also enables build of the Qemu emulator in case the
system installed Qemu does not yet support CPU TrustZone secure state.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
[Arnout, with the help of Peter: correct spelling mistakes in readme,
 fix U-Boot version to 2019.01, download tarball of TF-A instead of git]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/qemu/arm-vexpress-tz/linux.fragment |   3 +
 board/qemu/arm-vexpress-tz/post-build.sh  |  10 +++
 board/qemu/arm-vexpress-tz/readme.txt     | 138 ++++++++++++++++++++++++++++++
 board/qemu/arm-vexpress-tz/u-boot.config  |   7 ++
 configs/qemu_arm_vexpress_tz_defconfig    |  51 +++++++++++
 5 files changed, 209 insertions(+)

diff --git a/board/qemu/arm-vexpress-tz/linux.fragment b/board/qemu/arm-vexpress-tz/linux.fragment
new file mode 100644
index 0000000000..1537d938f1
--- /dev/null
+++ b/board/qemu/arm-vexpress-tz/linux.fragment
@@ -0,0 +1,3 @@
+### Enable OP-TEE
+CONFIG_TEE=y
+CONFIG_OPTEE=y
diff --git a/board/qemu/arm-vexpress-tz/post-build.sh b/board/qemu/arm-vexpress-tz/post-build.sh
new file mode 100755
index 0000000000..7ead69a99a
--- /dev/null
+++ b/board/qemu/arm-vexpress-tz/post-build.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+set -u
+set -e
+
+# Rename boot images for the dear TF-A
+ln -sf u-boot.bin ${BINARIES_DIR}/bl33.bin
+ln -sf tee-header_v2.bin ${BINARIES_DIR}/bl32.bin
+ln -sf tee-pager_v2.bin ${BINARIES_DIR}/bl32_extra1.bin
+ln -sf tee-pageable_v2.bin ${BINARIES_DIR}/bl32_extra2.bin
diff --git a/board/qemu/arm-vexpress-tz/readme.txt b/board/qemu/arm-vexpress-tz/readme.txt
new file mode 100644
index 0000000000..f058dbae4a
--- /dev/null
+++ b/board/qemu/arm-vexpress-tz/readme.txt
@@ -0,0 +1,138 @@
+Board qemu_arm_vexpress_tz builds a QEMU ARMv7-A target system with
+OP-TEE running in the TrustZone secure world and a Linux based
+OS running in the non-secure world. The board configuration enables
+builds of the QEMU host ARM target emulator.
+
+  make qemu_arm_vexpress_tz_defconfig
+  make
+
+The BIOS used in the QEMU host is the ARM Trusted Firmware-A (TF-A). TF-A
+uses QEMU semihosting file access to access boot image files. The
+QEMU platform is quite specific for that in TF-A and one needs to
+run the emulation from the image directory for TF-A to boot the
+secure and non-secure worlds.
+
+  cd output/images && ../host/bin/qemu-system-arm \
+	-machine virt -machine secure=on -cpu cortex-a15 \
+	-smp 1 -s -m 1024 -d unimp \
+	-serial stdio \
+	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
+	-semihosting-config enable,target=native \
+	-bios bl1.bin
+
+The boot stage traces (if any) followed by the login prompt will appear
+in the terminal that started QEMU.
+
+If you want to emulate more cores, use "-smp {1|2|3|4}" to select the
+number of cores.
+
+Note: "-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic"
+brings network support that is used i.e. in OP-TEE regression tests.
+
+Tested with QEMU 2.12.0, and 3.1.0.
+
+
+-- Boot Details --
+
+TF-A is used as QEMU BIOS. Its BL1 image boots and load its BL2 image. In turn,
+this image loads the OP-TEE secure world (ARMv7-A BL32 stage) and the U-boot as
+non-secure bootloader (BL33 stage).
+
+QEMU natively hosts and loads in RAM the QEMU ARM target device tree. OP-TEE
+reads and modifies its content according to OP-TEE configuration.
+
+Enable TF-A traces from LOG_LEVEL (I.e LOG_LEVEL=40) from
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.
+
+
+-- OP-TEE Traces --
+
+Secure boot stages and/or secure runtime services may use a serial link for
+their traces.
+
+The ARM Trusted Firmware outputs its traces on the QEMU standard (first)
+serial interface.
+
+The OP-TEE OS uses the QEMU second serial interface.
+
+To get the OP-TEE OS traces, append a second -serial argument after
+-serial stdio in the QEMU command line. I.e, the following enables 2 serial
+consoles over telnet connections:
+
+  cd output/images && ../host/bin/qemu-system-arm \
+	-machine virt -machine secure=on -cpu cortex-a15 \
+	-smp 1 -s -m 1024 -d unimp \
+	-serial telnet:127.0.0.1:1235,server \
+	-serial telnet:127.0.0.1:1236,server \
+	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
+	-semihosting-config enable,target=native \
+	-bios bl1.bin
+
+QEMU is now waiting for the telnet connection. From another shell, open a
+telnet connection on the port for the U-boot and Linux consoles:
+
+  telnet 127.0.0.1 1235
+
+and again for the secure console
+
+  telnet 127.0.0.1 1236
+
+
+-- Using gdb --
+
+One can debug the OP-TEE secure world using GDB through the QEMU host.
+To do so, simply run the qemu-system-arm emulation, then run a GDB client
+and connect the QEMU internal GDB server.
+
+The example below assumes we run QEMU and the GDB client from the same
+host computer. We use option -S of qemu-system-arm to make QEMU
+waiting for the GDB continue instruction before booting the images.
+
+From a first shell:
+  cd output/images && ../host/bin/qemu-system-arm \
+	-machine virt -machine secure=on -cpu cortex-a15 \
+	-smp 1 -s -m 1024 -d unimp \
+	-serial stdio \
+	-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic \
+	-semihosting-config enable,target=native \
+	-bios bl1.bin \
+	-S
+
+From a second shell:
+  ./output/host/bin/arm-linux-gnueabihf-gdb
+  GNU gdb (GNU Toolchain for the A-profile Architecture 8.2-2018-08 (arm-rel-8.23)) 8.1.1.20180704-git
+  Copyright (C) 2018 Free Software Foundation, Inc.
+  ...
+  For help, type "help".
+  Type "apropos word" to search for commands related to "word".
+  (gdb)
+
+From this GDB console, connect to the target, load the OP-TEE core symbols,
+set a breakpoint to its entry point (__text_start) and start emulation:
+
+  (gdb) target remote 127.0.0.1:1234
+  (gdb) symbol-file ../build/optee_os-<reference>/out/arm/core/tee.elf
+  (gdb) hbreak __text_start
+  Hardware assisted breakpoint 1 at 0xe100000: file core/arch/arm/kernel/generic_entry_a32.S, line 246.
+  (gdb) cont
+  Continuing.
+
+  Thread 1 hit Breakpoint 1, _start () at core/arch/arm/kernel/generic_entry_a32.S:246
+  246		bootargs_entry
+  (gdb)
+
+
+Emulation has started, TF-A has loaded OP-TEE and U-boot images in memory and
+has booted OP-TEE. Emulation stopped at OP-TEE core entry.
+
+Note: QEMU hosts a GDB service listening to TCP port 1234, as set through
+qemu-system-arm command line option -s.
+
+Note: To build the GDB server, the following extra options have to be added to
+the Buildroot configuration:
+
+    BR2_ENABLE_DEBUG=y
+    BR2_PACKAGE_GDB=y
+    BR2_PACKAGE_HOST_GDB=y
+    BR2_TOOLCHAIN_BUILDROOT_CXX=y
+    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
diff --git a/board/qemu/arm-vexpress-tz/u-boot.config b/board/qemu/arm-vexpress-tz/u-boot.config
new file mode 100644
index 0000000000..fd74bf1fe7
--- /dev/null
+++ b/board/qemu/arm-vexpress-tz/u-boot.config
@@ -0,0 +1,7 @@
+CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_BOOTCOMMAND="fdt addr ${fdt_addr} && fdt resize 1000 && smhload zImage ${kernel_addr_r} && smhload rootfs.cpio.gz ${ramdisk_addr_r} ramdisk_addr_end &&  setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && fdt chosen ${ramdisk_addr_r} ${ramdisk_addr_end} && bootz ${kernel_addr_r} - ${fdt_addr}"
+CONFIG_SEMIHOSTING=y
+# Drop flash accesses
+CONFIG_ENV_IS_IN_FLASH=n
+CONFIG_MTD=n
+CONFIG_MTD_NOR_FLASH=n
diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
new file mode 100644
index 0000000000..bf75493dbe
--- /dev/null
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -0,0 +1,51 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_ARM_FPU_VFPV3D16=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Linux 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca15_a7"
+
+# TF-A for booting OP-TEE secure and uboot/linux non secure
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
+
+# OP-TEE components
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
+BR2_PACKAGE_OPTEE_BENCHMARK=y
+BR2_PACKAGE_OPTEE_EXAMPLES=y
+BR2_PACKAGE_OPTEE_TEST=y
+
+# U-boot for booting the dear Linux kernel
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config"
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
