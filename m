From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 18 Mar 2019 21:02:04 +0000
Subject: [Buildroot] [PATCH v2 5/5] boot: riscv: Initial commit of OpenSBI
In-Reply-To: <20190318210106.6347-1-alistair.francis@wdc.com>
References: <20190318210106.6347-1-alistair.francis@wdc.com>
Message-ID: <20190318210106.6347-5-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenSBI is a much improved alternative to BBL (riscv-pk). Add OpenSBI
support to buildroot.

OpenSBI is also set as the default boot loader for RISC-V.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 DEVELOPERS                          |  1 +
 board/qemu/riscv32-virt/readme.txt  | 10 ++++++---
 board/qemu/riscv64-virt/readme.txt  | 10 ++++++---
 boot/Config.in                      |  1 +
 boot/opensbi/Config.in              | 23 +++++++++++++++++++++
 boot/opensbi/opensbi.mk             | 32 +++++++++++++++++++++++++++++
 configs/qemu_riscv32_virt_defconfig |  4 +++-
 configs/qemu_riscv64_virt_defconfig |  4 +++-
 8 files changed, 77 insertions(+), 8 deletions(-)
 create mode 100644 boot/opensbi/Config.in
 create mode 100644 boot/opensbi/opensbi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c91325e284..72aca1a342 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -123,6 +123,7 @@ F:	package/kvazaar/
 F:	package/v4l2loopback/
 
 N:	Alistair Francis <alistair@alistair23.me>
+F:	boot/opensbi/
 F:	package/xen/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
diff --git a/board/qemu/riscv32-virt/readme.txt b/board/qemu/riscv32-virt/readme.txt
index 2da99580e5..f73f4278de 100644
--- a/board/qemu/riscv32-virt/readme.txt
+++ b/board/qemu/riscv32-virt/readme.txt
@@ -1,7 +1,11 @@
-Run the emulation with:
+Run Linux in emulation with:
 
-  qemu-system-riscv32 -M virt -kernel output/images/bbl -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+  qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80400000 -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.12.1
+It is also possible to boot u-boot in QEMU. Although at the time of testing there were some issues with the OpenSBI to u-boot hand off. Run u-boot in emulation with:
+
+  qemu-system-riscv32 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/u-boot,addr=0x80400000 -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+
+Tested with QEMU 3.1
diff --git a/board/qemu/riscv64-virt/readme.txt b/board/qemu/riscv64-virt/readme.txt
index 9f6e35c867..02b6fe0506 100644
--- a/board/qemu/riscv64-virt/readme.txt
+++ b/board/qemu/riscv64-virt/readme.txt
@@ -1,7 +1,11 @@
-Run the emulation with:
+Run Linux in emulation with:
 
-  qemu-system-riscv64 -M virt -kernel output/images/bbl -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+  qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/Image,addr=0x80200000 -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
 
 The login prompt will appear in the terminal that started Qemu.
 
-Tested with QEMU 2.12.1
+It is also possible to boot u-boot in QEMU. Although at the time of testing there were some issues with the OpenSBI to u-boot hand off. Run u-boot in emulation with:
+
+  qemu-system-riscv64 -M virt -kernel output/images/fw_jump.elf -device loader,file=output/images/u-boot,addr=0x80200000 -append "root=/dev/vda ro console=ttyS0" -drive file=output/images/rootfs.ext2,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 -netdev user,id=net0 -device virtio-net-device,netdev=net0 -nographic
+
+Tested with QEMU 3.1
diff --git a/boot/Config.in b/boot/Config.in
index 74481e7545..97bd3de6e9 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -14,6 +14,7 @@ source "boot/lpc32xxcdl/Config.in"
 source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
+source "boot/opensbi/Config.in"
 source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
new file mode 100644
index 0000000000..65d39aa664
--- /dev/null
+++ b/boot/opensbi/Config.in
@@ -0,0 +1,23 @@
+config BR2_TARGET_OPENSBI
+	bool "opensbi"
+	depends on BR2_riscv
+	help
+	  OpenSBI aims to provide an open-source and extensible
+	  implementation of the RISC-V SBI specification for a platform
+	  specific firmware (M-mode) and a general purpose OS, hypervisor
+	  or bootloader (S-mode or HS-mode). OpenSBI implementation can
+	  be easily extended by RISC-V platform or System-on-Chip vendors
+	  to fit a particular hadware configuration.
+
+	  https://github.com/riscv/opensbi.git
+
+if BR2_TARGET_OPENSBI
+config BR2_TARGET_OPENSBI_PLAT
+	string "OpenSBI Platform"
+	default ""
+	help
+	  Specifies the OpenSBI platform to build. If no platform is specified only
+	  the OpenSBI platform independent static library libsbi.a is built. If a
+	  platform is specified then the platform specific static library libplatsbi.a
+	  and firmware examples are built.
+endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
new file mode 100644
index 0000000000..ac4b70d8a8
--- /dev/null
+++ b/boot/opensbi/opensbi.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# OpenSBI
+#
+################################################################################
+
+OPENSBI_VERSION = ca20ac0cd4c099006d4eea4d9ac7bd7b58e2ae0f
+OPENSBI_SITE = git://github.com/riscv/opensbi.git
+OPENSBI_LICENSE = BSD-2-Clause
+OPENSBI_LICENSE_FILES = COPYING.BSD
+OPENSBI_INSTALL_IMAGES = YES
+
+OPENSBI_MAKE_ENV = \
+	CROSS_COMPILE=$(TARGET_CROSS)
+
+OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_OPENSBI_PLAT))
+ifneq ($(OPENSBI_PLAT),)
+	OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
+endif
+
+define OPENSBI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+ifneq ($(OPENSBI_PLAT),)
+define OPENSBI_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
+endef
+endif
+
+$(eval $(generic-package))
diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv32_virt_defconfig
index f7e9a23106..96d971333a 100644
--- a/configs/qemu_riscv32_virt_defconfig
+++ b/configs/qemu_riscv32_virt_defconfig
@@ -23,4 +23,6 @@ BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/riscv32-virt/linux.config"
 BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
-BR2_TARGET_RISCV_PK=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_USE_PLAT=y
+BR2_TARGET_OPENSBI_PLAT="qemu/virt"
diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv64_virt_defconfig
index ae67979d29..05d2764003 100644
--- a/configs/qemu_riscv64_virt_defconfig
+++ b/configs/qemu_riscv64_virt_defconfig
@@ -22,4 +22,6 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_IMAGE=y
 
 # Bootloader
-BR2_TARGET_RISCV_PK=y
+BR2_TARGET_OPENSBI=y
+BR2_TARGET_OPENSBI_USE_PLAT=y
+BR2_TARGET_OPENSBI_PLAT="qemu/virt"
-- 
2.21.0
