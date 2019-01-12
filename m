From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 17:38:25 +0100
Subject: [Buildroot] [git commit] boot/shim: new package
Message-ID: <20190112164856.465FC8B8A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18c463e124c8a607ed336cc96e4fe39d3a64d2da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a package for 'shim', an EFI bootloader for secure
boot chain loading.

While gnu-efi supports 32bit ARM, this is currently broken in shim.

Patches to fix this have been submitted upstream but are not included
here for now.

https://github.com/rhboot/shim/pull/162

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Thomas: use BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS, add separate depends
on to exclude ARM32 build.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS          |  1 +
 boot/Config.in      |  1 +
 boot/shim/Config.in | 19 +++++++++++++++++++
 boot/shim/shim.hash |  3 +++
 boot/shim/shim.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b3923ae4f..aa1bf325cb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1649,6 +1649,7 @@ F:	board/openblocks/a6/
 F:	board/orangepi/
 F:	board/pandaboard/
 F:	board/roseapplepi/
+F:	boot/shim/
 F:	configs/minnowboard_max-graphical_defconfig
 F:	configs/minnowboard_max_defconfig
 F:	configs/nexbox_a95x_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 8e0c8e5df4..11856fd9c7 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -15,6 +15,7 @@ source "boot/mv-ddr-marvell/Config.in"
 source "boot/mxs-bootlets/Config.in"
 source "boot/riscv-pk/Config.in"
 source "boot/s500-bootloader/Config.in"
+source "boot/shim/Config.in"
 source "boot/syslinux/Config.in"
 source "boot/ts4800-mbrboot/Config.in"
 source "boot/uboot/Config.in"
diff --git a/boot/shim/Config.in b/boot/shim/Config.in
new file mode 100644
index 0000000000..ea6650f54c
--- /dev/null
+++ b/boot/shim/Config.in
@@ -0,0 +1,19 @@
+config BR2_TARGET_SHIM
+	bool "shim"
+	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
+	# ARM32 build currently broken
+	depends on !BR2_ARM_CPU_HAS_ARM
+	select BR2_PACKAGE_GNU_EFI
+	help
+	  Boot loader to chain-load signed boot loaders under Secure
+	  Boot.
+
+	  This package provides a minimalist boot loader which allows
+	  verifying signatures of other UEFI binaries against either
+	  the Secure Boot DB/DBX or against a built-in signature
+	  database.  Its purpose is to allow a small,
+	  infrequently-changing binary to be signed by the UEFI CA,
+	  while allowing an OS distributor to revision their main
+	  bootloader independently of the CA.
+
+	  https://github.com/rhboot/shim
diff --git a/boot/shim/shim.hash b/boot/shim/shim.hash
new file mode 100644
index 0000000000..318390f80b
--- /dev/null
+++ b/boot/shim/shim.hash
@@ -0,0 +1,3 @@
+# locally computed hash
+sha256 279d19cc95b9974ea2379401a6a0653d949c3fa3d61f0c4bd6a7b9e840bdc425  shim-15.tar.gz
+sha256 15edf527919ddcb2f514ab9d16ad07ef219e4bb490e0b79560be510f0c159cc2  COPYRIGHT
diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
new file mode 100644
index 0000000000..ba5bc51957
--- /dev/null
+++ b/boot/shim/shim.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# shim
+#
+################################################################################
+
+SHIM_VERSION = 15
+SHIM_SITE = $(call github,rhboot,shim,$(SHIM_VERSION))
+SHIM_LICENSE = BSD-2-Clause
+SHIM_LICENSE_FILES = COPYRIGHT
+SHIM_DEPENDENCIES = gnu-efi
+SHIM_INSTALL_TARGET = NO
+SHIM_INSTALL_IMAGES = YES
+
+SHIM_MAKE_OPTS = \
+	ARCH="$(GNU_EFI_PLATFORM)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	DASHJ="-j$(PARALLEL_JOBS)" \
+	EFI_INCLUDE="$(STAGING_DIR)/usr/include/efi" \
+	EFI_PATH="$(STAGING_DIR)/usr/lib" \
+	LIBDIR="$(STAGING_DIR)/usr/lib"
+
+define SHIM_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(SHIM_MAKE_OPTS)
+endef
+
+define SHIM_INSTALL_IMAGES_CMDS
+	$(INSTALL) -m 0755 -t $(BINARIES_DIR) $(@D)/*.efi
+endef
+
+$(eval $(generic-package))
