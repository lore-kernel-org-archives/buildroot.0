From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Jan 2019 11:01:11 +0100
Subject: [Buildroot] [PATCH 3/3] boot: add shim EFI bootloader for secure
 boot chain loading
In-Reply-To: <20190111100111.17867-1-peter@korsgaard.com>
References: <20190111100111.17867-1-peter@korsgaard.com>
Message-ID: <20190111100111.17867-3-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While gnu-efi supports 32bit ARM, this is currently broken in shim.

Patches to fix this have been submitted upstream but are not included here
for now.

https://github.com/rhboot/shim/pull/162

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS          |  1 +
 boot/Config.in      |  1 +
 boot/shim/Config.in | 18 ++++++++++++++++++
 boot/shim/shim.hash |  3 +++
 boot/shim/shim.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 boot/shim/Config.in
 create mode 100644 boot/shim/shim.hash
 create mode 100644 boot/shim/shim.mk

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
index 0000000000..15d50e3c82
--- /dev/null
+++ b/boot/shim/Config.in
@@ -0,0 +1,18 @@
+config BR2_TARGET_SHIM
+	bool "shim"
+	depends on BR2_aarch64 || BR2_aarch64_be || \
+		BR2_i386 || BR2_x86_64 # gnu-efi
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
-- 
2.11.0
