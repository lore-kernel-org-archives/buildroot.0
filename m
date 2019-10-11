From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 11 Oct 2019 22:52:19 +0200
Subject: [Buildroot] [git commit] boot/riscv-pk: Remove obselete bootloader
Message-ID: <20191011205821.384508D489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67cfae0f2650c48d3d2c3761828e9cd7d3bd3895
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RISCV Proxy Kernel (AKA BBL) isn't being used by most distros so has
very limited testing. It has been replaced by OpenSBI and been
deprecated for awhile, so let's just remove it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy          |  7 +++++++
 DEVELOPERS                |  1 -
 boot/Config.in            |  1 -
 boot/riscv-pk/Config.in   | 17 -----------------
 boot/riscv-pk/riscv-pk.mk | 32 --------------------------------
 5 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4a670f0f0e..74201b50e7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_TARGET_RISCV_PK
+	bool "riscv-pk was removed"
+	select BR2_LEGACY
+	help
+	  The RISC-V Proxy Kernel (pk) and Berkley Boot Loader (BBL)
+	  have been replaced with OpenSBI.
+
 config BR2_PACKAGE_SQLITE_STAT3
 	bool "sqlite stat3 support was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index eedef29088..fc5c8e989a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1476,7 +1476,6 @@ F:	arch/arch.mk.riscv
 F:	arch/Config.in.riscv
 F:	board/qemu/riscv32-virt/
 F:	board/qemu/riscv64-virt/
-F:	boot/riscv-pk/
 F:	configs/qemu_riscv32_virt_defconfig
 F:	configs/qemu_riscv64_virt_defconfig
 
diff --git a/boot/Config.in b/boot/Config.in
index ac1a997f00..b3adbfc8bc 100644
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
index cf9c5cd8ee..0000000000
--- a/boot/riscv-pk/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-comment "riscv-pk needs a Linux kernel to be built"
-	depends on BR2_riscv
-	depends on !BR2_LINUX_KERNEL
-
-config BR2_TARGET_RISCV_PK
-	bool "riscv-pk (deprecated)"
-	depends on BR2_riscv
-	depends on BR2_LINUX_KERNEL
-	help
-	  The RISC-V Proxy Kernel (pk) and Boot Loader (BBL) have
-	  been deprecated. Please use OpenSBI instead.
-
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
