From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 May 2021 22:51:36 +0200
Subject: [Buildroot] [PATCH v3 5/7] boot/beaglev-ddrinit: new package
In-Reply-To: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210504205139.1055360-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a package for the DDR initialization code used on the
BeagleV platform.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 DEVELOPERS                              |  1 +
 boot/Config.in                          |  1 +
 boot/beaglev-ddrinit/Config.in          |  9 ++++++++
 boot/beaglev-ddrinit/beaglev-ddrinit.mk | 29 +++++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 boot/beaglev-ddrinit/Config.in
 create mode 100644 boot/beaglev-ddrinit/beaglev-ddrinit.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7ce78742fc..39bc71ea34 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2604,6 +2604,7 @@ N:	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 F:	arch/Config.in.arm
 F:	board/beaglev/
 F:	board/stmicroelectronics/stm32mp157c-dk2/
+F:	boot/beaglev-ddrinit/
 F:	boot/boot-wrapper-aarch64/
 F:	boot/grub2/
 F:	boot/gummiboot/
diff --git a/boot/Config.in b/boot/Config.in
index b3adbfc8bc..f581205c6c 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -6,6 +6,7 @@ source "boot/at91bootstrap3/Config.in"
 source "boot/at91dataflashboot/Config.in"
 source "boot/arm-trusted-firmware/Config.in"
 source "boot/barebox/Config.in"
+source "boot/beaglev-ddrinit/Config.in"
 source "boot/binaries-marvell/Config.in"
 source "boot/boot-wrapper-aarch64/Config.in"
 source "boot/grub2/Config.in"
diff --git a/boot/beaglev-ddrinit/Config.in b/boot/beaglev-ddrinit/Config.in
new file mode 100644
index 0000000000..5392f49088
--- /dev/null
+++ b/boot/beaglev-ddrinit/Config.in
@@ -0,0 +1,9 @@
+config BR2_TARGET_BEAGLEV_DDRINIT
+	bool "beaglev-ddrinit"
+	depends on BR2_riscv
+	depends on BR2_HOSTARCH = "x86_64" # host-riscv64-elf-toolchain
+	help
+	  This package builds the DDRinit firmware used on the BeagleV
+	  platform.
+
+	  https://github.com/starfive-tech/beagle_ddrlnit
diff --git a/boot/beaglev-ddrinit/beaglev-ddrinit.mk b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
new file mode 100644
index 0000000000..72e6aea965
--- /dev/null
+++ b/boot/beaglev-ddrinit/beaglev-ddrinit.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# beaglev-ddrinit
+#
+################################################################################
+
+# HEAD of the starfive branch
+BEAGLEV_DDRINIT_VERSION = 15b80de81263996affb2a29332aa681925709983
+BEAGLEV_DDRINIT_SITE = $(call github,starfive-tech,beagle_ddrlnit,$(BEAGLEV_DDRINIT_VERSION))
+BEAGLEV_DDRINIT_INSTALL_TARGET = NO
+BEAGLEV_DDRINIT_INSTALL_IMAGES = YES
+BEAGLEV_DDRINIT_DEPENDENCIES = host-riscv64-elf-toolchain
+# unfortunately, no real license file, but several sources files are
+# under GPL-2.0+, making the whole work GPL-2.0+
+BEAGLEV_DDRINIT_LICENSE = GPL-2.0+
+
+define BEAGLEV_DDRINIT_BUILD_CMDS
+	$(MAKE) -C $(@D)/build \
+		CROSSCOMPILE=$(HOST_DIR)/bin/riscv64-unknown-elf- \
+		SUFFIX=buildroot \
+		GIT_VERSION=$(BEAGLEV_DDRINIT_VERSION)
+endef
+
+define BEAGLEV_DDRINIT_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/build/ddrinit-2133-buildroot.bin.out \
+		$(BINARIES_DIR)/ddrinit-2133-buildroot.bin.out
+endef
+
+$(eval $(generic-package))
-- 
2.30.2
