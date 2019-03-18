From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 19 Mar 2019 00:21:07 +0100
Subject: [Buildroot] [PATCH v2 6/8] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
References: <1552951269-16967-1-git-send-email-etienne.carriere@linaro.org>
Message-ID: <1552951269-16967-6-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change introduces a Qemu board for an Armv7-A target executing
with OP-TEE secure world services.

The target Linux based normal world embeds the standard minimal
filesystem with OP-TEE non-secure components embedded files from
OP-TEE test, examples and benchmark packages.

The Linux custom configuration is dumped from the vexpress_defconfig
with few added fragments: OP-TEE driver and 9p for virtual filesystem
to ease file manipulation and exchanges through Qemu virtfs support.

U-Boot qemu_arm defconfig is modified with a configuration fragment
to set boot command, enable semihosting and remove U-Boot persistent
environment storage support.

The standard way for booting OP-TEE with a non-secure world companion
use the Arm Trusted Firmware-A as bootloader. OP-TEE OS provides the
BL32 image and U-boot the BL33 image. The boot scenario is:

  TF-A bootloader (BL1/BL2) => OP-TEE (BL32) => U-boot (BL33).
  | Executes as secure         | Secure         | Execs as Non-secure
  | Loads BL32/BL33 in RAM     | Jumps to BL33  | Always booted after
  | Jumps to BL32 once done    | as Non-secure  | secure world inits

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
  - Bump kernel to 4.19.
  - Use kernel defconfig and add optee and 9p as config fragments.
  - Remove ARM_ARCH_MAJOR from platform configuration directive
    BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.

---
 board/qemu/armv7a-tz-virt/linux.fragment |   8 ++
 board/qemu/armv7a-tz-virt/readme.txt     | 145 +++++++++++++++++++++++++++++++
 board/qemu/armv7a-tz-virt/u-boot.config  |   7 ++
 configs/qemu_armv7a_tz_virt_defconfig    |  48 ++++++++++
 4 files changed, 208 insertions(+)
 create mode 100644 board/qemu/armv7a-tz-virt/linux.fragment
 create mode 100644 board/qemu/armv7a-tz-virt/readme.txt
 create mode 100644 board/qemu/armv7a-tz-virt/u-boot.config
 create mode 100644 configs/qemu_armv7a_tz_virt_defconfig

diff --git a/board/qemu/armv7a-tz-virt/linux.fragment b/board/qemu/armv7a-tz-virt/linux.fragment
new file mode 100644
index 0000000..8fca146
--- /dev/null
+++ b/board/qemu/armv7a-tz-virt/linux.fragment
@@ -0,0 +1,8 @@
+### Enable OP-TEE
+CONFIG_TEE=y
+CONFIG_OPTEE=y
+### Enable 9P VFS
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
+CONFIG_9P_FS=y
+CONFIG_9P_FS_POSIX_ACL=y
diff --git a/board/qemu/armv7a-tz-virt/readme.txt b/board/qemu/armv7a-tz-virt/readme.txt
new file mode 100644
index 0000000..c5b54dc
--- /dev/null
+++ b/board/qemu/armv7a-tz-virt/readme.txt
@@ -0,0 +1,145 @@
+Board qemu_armv7a_tz_virt builds a Qemu Armv7-A target system with
+OP-TEE running in the TrustZone secure wolrd setup and a Linux based
+OS running in the non-secure wolrd. The board also builds the Qemu
+host to run the Arm target emulation.
+
+  make qemu_armv7a_tz_virt_defconfig
+  make
+
+BIOS used in the Qemu host is the Arm Trusted Firmware-A (TF-A). TF-A
+uses Qemu semihosting file access to access boot image files. The
+Qemu platform is quite specific for that in TF-A and one needs to
+rename some image files and run the emulation from the image directory
+for TF-A to boot the secure and non-secure world.
+
+I.e:
+  ln -s ./u-boot.bin output/images/bl33.bin
+  ln -s ./tee-header_v2.bin output/images/bl32.bin
+  ln -s ./tee-pager_v2.bin output/images/bl32_extra1.bin
+  ln -s ./tee-pageable_v2.bin output/images/bl32_extra2.bin
+
+Run the emulation from the output/images directory with:
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
+in the terminal that started Qemu.
+
+If you want to emulate more cores use "-smp {1|2|3|4}" to select the
+number of cores.
+
+Note "-netdev user,id=vmnic -device virtio-net-device,netdev=vmnic"
+brings virtfs support for file sharing with the hosted Linux OS. Board
+Linux configuration file for armv7a-tz-virt enables the requiredresources.
+BR2_PACKAGE_HOST_QEMU_VIRTFS=y build Qemu with required resources.
+
+Tested with QEMU 2.12.0
+
+-- Boot Details --
+
+TF-A is used as Qemu BIOS. Its BL1 image boots and load its BL2 image. In turn, this
+image loads the OP-TEE secure world (Armv7-A BL32 stage) and the U-boot as non-secure
+bootloader (BL33 stage).
+
+The Qemu natively host and loads in RAM the Qemu Arm target device tree. OP-TEE reads
+and modifes its content according to OP-TEE configuration.
+
+Enable TF-A traces from LOG_LEVEL (I.e LOG_LEVEL=40) from
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES.
+
+-- OP-TEE Traces --
+
+Secure boot stages and/or secure runtime services may use a serial link for
+their traces.
+
+The Arm Trusted Firmware outputs its traces on the Qemu standard (first)
+serial  interface.
+
+The OP-TEE OS uses the Qemu second serial interface.
+
+To get the OP-TEE OS traces one shall append a second -serial argument after
+-serial stdio in the Qemu command line. I.e the following enables 2 serial
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
+Qemu is now waiting for the telnet connection. From another shell, open a
+telnet connection on the port for the U-boot and Linux consoles:
+  telnet 127.0.0.1 1235
+
+and again for the secure console
+  telnet 127.0.0.1 1236
+
+-- Using gdb --
+
+One can debug the OP-TEE secure world using GDB through the Qemu host.
+To do so, one can simply run the qemu-system-arm emulation then
+run a GDB client and connect the Qemu internal GDB server.
+
+The example below assumes we run Qemu and the GDB client from the same
+host computer. We use option -S of qemu-system-arm to make Qemu
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
+  ./output/host/bin/arm-linux-gnueabihf-gd
+  GNU gdb (GNU Toolchain for the A-profile Architecture 8.2-2018-08 (arm-rel-8.23)) 8.1.1.20180704-git
+  Copyright (C) 2018 Free Software Foundation, Inc.
+  ...
+  For help, type "help".
+  Type "apropos word" to search for commands related to "word".
+  (gdb) 
+
+From this GDB console, connect target, load OP-TEE core symbols, set a
+breakpoint to its entry (__text_start) and start emulation:
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
+
+Note: Qemu hosts a GDB service listening to TCP port 1234, as set through
+qemu-system-arm commandline option -s.
+
+
+Note: GDB server used above (from image/host/bin) was built from Buildroot
+using the following extra configuration directives:
+
+    BR2_ENABLE_DEBUG=y
+    BR2_PACKAGE_GDB=y
+    BR2_PACKAGE_HOST_GDB=y
+    BR2_TOOLCHAIN_BUILDROOT_CXX=y
+    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
diff --git a/board/qemu/armv7a-tz-virt/u-boot.config b/board/qemu/armv7a-tz-virt/u-boot.config
new file mode 100644
index 0000000..fd74bf1
--- /dev/null
+++ b/board/qemu/armv7a-tz-virt/u-boot.config
@@ -0,0 +1,7 @@
+CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_BOOTCOMMAND="fdt addr ${fdt_addr} && fdt resize 1000 && smhload zImage ${kernel_addr_r} && smhload rootfs.cpio.gz ${ramdisk_addr_r} ramdisk_addr_end &&  setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && fdt chosen ${ramdisk_addr_r} ${ramdisk_addr_end} && bootz ${kernel_addr_r} - ${fdt_addr}"
+CONFIG_SEMIHOSTING=y
+# Drop flash accesses
+CONFIG_ENV_IS_IN_FLASH=n
+CONFIG_MTD=n
+CONFIG_MTD_NOR_FLASH=n
diff --git a/configs/qemu_armv7a_tz_virt_defconfig b/configs/qemu_armv7a_tz_virt_defconfig
new file mode 100644
index 0000000..0c78270
--- /dev/null
+++ b/configs/qemu_armv7a_tz_virt_defconfig
@@ -0,0 +1,48 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a15=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3D16=y
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+# Filesystems (support several boot config)
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_EXT2=y
+# Linux 4.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/armv7a-tz-virt/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca15_a7"
+# TF-A for booting OP-TEE secure and uboot/linux non secure
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_OPTEE_AS_BL32=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram LOG_LEVEL=30"
+#BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y
+# OP-TEE components
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
+BR2_TARGET_OPTEE_OS_ADDITIONAL_VARIABLES="CFG_TEE_CORE_LOG_LEVEL=2"
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_PACKAGE_OPTEE_TEST=y
+BR2_PACKAGE_OPTEE_EXAMPLES=y
+BR2_PACKAGE_OPTEE_BENCHMARK=y
+# U-boot for booting the dear Linux kernel
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/armv7a-tz-virt/u-boot.config"
+# Qemu emulator for the Arm target
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+BR2_PACKAGE_HOST_QEMU_VIRTFS=y
-- 
1.9.1
