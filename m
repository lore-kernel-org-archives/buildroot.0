From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Fri, 15 Mar 2019 23:06:38 +0000
Subject: [Buildroot] [PATCH 2/3] boot: riscv: Initial commit of OpenSBI
In-Reply-To: <20190315230540.4311-1-alistair.francis@wdc.com>
References: <20190315230540.4311-1-alistair.francis@wdc.com>
Message-ID: <20190315230540.4311-2-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenSBI is a much improved alternative to BLL (riscv-pk). Add OpenSBI
support to buildroot.

OpenSBI support uses the new RISC-V "Target Platform" config to build
the specified platform.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 DEVELOPERS              |  1 +
 boot/Config.in          |  1 +
 boot/opensbi/Config.in  | 25 +++++++++++++++++++++++++
 boot/opensbi/opensbi.mk | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 boot/opensbi/Config.in
 create mode 100644 boot/opensbi/opensbi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a57cb2e23..a8978856ad 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1383,6 +1383,7 @@ F:	arch/arch.mk.riscv
 F:	arch/Config.in.riscv
 F:	board/qemu/riscv32-virt/
 F:	board/qemu/riscv64-virt/
+F:	boot/opensbi/
 F:	boot/riscv-pk/
 F:	configs/qemu_riscv32_virt_defconfig
 F:	configs/qemu_riscv64_virt_defconfig
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
index 0000000000..01ee342215
--- /dev/null
+++ b/boot/opensbi/Config.in
@@ -0,0 +1,25 @@
+config BR2_TARGET_OPENSBI
+	bool "OpenSBI"
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
+config BR2_TARGET_OPENSBI_USE_PLAT
+	bool "Build OpenSBI for Platform"
+	depends on BR2_TARGET_OPENSBI
+
+config BR2_TARGET_OPENSBI_PLAT
+	string "OpenSBI Platform"
+	depends on BR2_TARGET_OPENSBI_USE_PLAT
+	default "qemu/virt" if BR2_RISCV_QEMU_VIRT
+	default "qemu/sifive_u" if BR2_RISCV_QEMU_SIFIVE_U
+	default ""
+endif
diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
new file mode 100644
index 0000000000..9da4e7f44e
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
+ifeq ($(BR2_TARGET_OPENSBI_USE_PLAT),y)
+	OPENSBI_PLAT = $(call qstrip,$(BR2_TARGET_UBOOT_BOARD_DEFCONFIG))
+	OPENSBI_MAKE_ENV += PLATFORM=$(OPENSBI_PLAT)
+endif
+
+define OPENSBI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(OPENSBI_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+ifeq ($(BR2_TARGET_OPENSBI_USE_PLAT),y)
+define OPENSBI_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.bin $(BINARIES_DIR)/fw_jump.bin
+	$(INSTALL) -m 0644 -D $(@D)/build/platform/$(OPENSBI_PLAT)/firmware/fw_jump.elf $(BINARIES_DIR)/fw_jump.elf
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.21.0
