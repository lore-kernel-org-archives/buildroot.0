From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 12 Sep 2018 11:22:55 +0100
Subject: [Buildroot] [PATCH v2 5/6] boot/riscv-pk: add bootloader for RISC-V
 architecture
In-Reply-To: <20180912102256.3164-1-mark.corbin@embecosm.com>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
Message-ID: <20180912102256.3164-6-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the RISC-V Proxy Kernel (pk) package which provides the Berkeley
Boot Loader for booting RISC-V kernel images.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 DEVELOPERS                |  1 +
 boot/Config.in            |  1 +
 boot/riscv-pk/Config.in   | 13 +++++++++++++
 boot/riscv-pk/riscv-pk.mk | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 boot/riscv-pk/Config.in
 create mode 100644 boot/riscv-pk/riscv-pk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1c29da4038..4d6c599aea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1289,6 +1289,7 @@ F:	package/ratpoison/
 N:	Mark Corbin <mark.corbin@embecosm.com>
 F:	arch/arch.mk.riscv
 F:	arch/Config.in.riscv
+F:	boot/riscv-pk/
 
 N:	Markos Chandras <markos.chandras@imgtec.com>
 F:	package/harfbuzz/
diff --git a/boot/Config.in b/boot/Config.in
index 3687c41a2c..945168bf37 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -13,6 +13,7 @@ source "boot/gummiboot/Config.in"
 source "boot/lpc32xxcdl/Config.in"
 source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
+source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
diff --git a/boot/riscv-pk/Config.in b/boot/riscv-pk/Config.in
new file mode 100644
index 0000000000..ec49f6aa6d
--- /dev/null
+++ b/boot/riscv-pk/Config.in
@@ -0,0 +1,13 @@
+comment "riscv-pk (BBL) needs a Linux kernel to be built"
+	depends on BR2_riscv
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_TARGET_RISCV_PK
+	bool "riscv-pk (BBL)"
+	depends on BR2_riscv
+	depends on BR2_LINUX_KERNEL
+	help
+	  The RISC-V Proxy Kernel (pk) package contains the Berkeley
+	  Boot Loader (BBL) which has been designed to boot a Linux
+	  kernel on a RISC-V processor.
+	  https://github.com/riscv/riscv-pk.git
diff --git a/boot/riscv-pk/riscv-pk.mk b/boot/riscv-pk/riscv-pk.mk
new file mode 100644
index 0000000000..9eee7e0a82
--- /dev/null
+++ b/boot/riscv-pk/riscv-pk.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# riscv-pk (BBL)
+#
+################################################################################
+
+RISCV_PK_VERSION = 706cc77c369fd3e4734b5a6aa813d421347f1814
+RISCV_PK_SITE = git://github.com/riscv/riscv-pk.git
+RISCV_PK_LICENSE = BSD-3-Clause
+RISCV_PK_LICENSE_FILES = LICENSE
+RISCV_PK_DEPENDENCIES = linux
+RISCV_PK_SUBDIR = build
+RISCV_PK_INSTALL_IMAGES = YES
+
+define RISCV_PK_CONFIGURE_CMDS
+	mkdir -p $(@D)/build
+	(cd $(@D)/build; \
+	$(TARGET_CONFIGURE_OPTS) ../configure \
+	--host=$(GNU_TARGET_NAME) \
+	--with-payload=$(BINARIES_DIR)/vmlinux \
+	)
+endef
+
+define RISCV_PK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		-C $(@D)/build bbl
+endef
+
+define RISCV_PK_INSTALL_IMAGES_CMDS
+	cp $(@D)/build/bbl $(BINARIES_DIR)
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
