From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Fri, 15 Mar 2019 23:06:39 +0000
Subject: [Buildroot] [PATCH 3/3] boot: riscv: Remove riscv-pk
In-Reply-To: <20190315230540.4311-1-alistair.francis@wdc.com>
References: <20190315230540.4311-1-alistair.francis@wdc.com>
Message-ID: <20190315230540.4311-3-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that OpenSBI is supported remove BBL (riscv-pk).

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 DEVELOPERS                |  1 -
 boot/Config.in            |  1 -
 boot/riscv-pk/Config.in   | 14 --------------
 boot/riscv-pk/riscv-pk.mk | 32 --------------------------------
 4 files changed, 48 deletions(-)
 delete mode 100644 boot/riscv-pk/Config.in
 delete mode 100644 boot/riscv-pk/riscv-pk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a8978856ad..246bb8b471 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1384,7 +1384,6 @@ F:	arch/Config.in.riscv
 F:	board/qemu/riscv32-virt/
 F:	board/qemu/riscv64-virt/
 F:	boot/opensbi/
-F:	boot/riscv-pk/
 F:	configs/qemu_riscv32_virt_defconfig
 F:	configs/qemu_riscv64_virt_defconfig
 
diff --git a/boot/Config.in b/boot/Config.in
index 97bd3de6e9..228868de8c 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -15,7 +15,6 @@ source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/optee-os/Config.in"
 source "boot/opensbi/Config.in"
-source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
diff --git a/boot/riscv-pk/Config.in b/boot/riscv-pk/Config.in
deleted file mode 100644
index b4fe36590f..0000000000
--- a/boot/riscv-pk/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-comment "riscv-pk needs a Linux kernel to be built"
-	depends on BR2_riscv
-	depends on !BR2_LINUX_KERNEL
-
-config BR2_TARGET_RISCV_PK
-	bool "riscv-pk"
-	depends on BR2_riscv
-	depends on BR2_LINUX_KERNEL
-	help
-	  The RISC-V Proxy Kernel (pk) package contains the Berkeley
-	  Boot Loader (BBL) which has been designed to boot a Linux
-	  kernel on a RISC-V processor.
-
-	  https://github.com/riscv/riscv-pk.git
diff --git a/boot/riscv-pk/riscv-pk.mk b/boot/riscv-pk/riscv-pk.mk
deleted file mode 100644
index 0ab5879ee4..0000000000
--- a/boot/riscv-pk/riscv-pk.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# riscv-pk
-#
-################################################################################
-
-RISCV_PK_VERSION = 706cc77c369fd3e4734b5a6aa813d421347f1814
-RISCV_PK_SITE = git://github.com/riscv/riscv-pk.git
-RISCV_PK_LICENSE = BSD-3-Clause
-RISCV_PK_LICENSE_FILES = LICENSE
-RISCV_PK_DEPENDENCIES = linux
-RISCV_PK_SUBDIR = build
-RISCV_PK_INSTALL_IMAGES = YES
-
-define RISCV_PK_CONFIGURE_CMDS
-	mkdir -p $(@D)/build
-	(cd $(@D)/build; \
-		$(TARGET_CONFIGURE_OPTS) ../configure \
-		--host=$(GNU_TARGET_NAME) \
-		--with-payload=$(BINARIES_DIR)/vmlinux \
-	)
-endef
-
-define RISCV_PK_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build bbl
-endef
-
-define RISCV_PK_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/build/bbl $(BINARIES_DIR)/bbl
-endef
-
-$(eval $(generic-package))
-- 
2.21.0
