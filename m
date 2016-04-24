From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 24 Apr 2016 11:18:46 +0200
Subject: [Buildroot] [PATCH v5 4/5] barebox: support 2nd config build
In-Reply-To: <cover.1461489060.git.pieter@boesman.nl>
References: <cover.1461489060.git.pieter@boesman.nl>
Message-ID: <f8d6dec31737cde2abaf82ee4f64ea215e48e452.1461489060.git.pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds support to build barebox with a 2nd config.

This is useful for building an SPL (Secondary Program Loader) in addition to
the traditional TPL (Tertiary Program Loader). The Beaglebone Black for example
has two barebox configurations:
- am335x_defconfig builds the full barebox bootloader with device tree, and
- am335x_mlo_defconfig builds the smaller MLO bootloader that loads the full
  barebox bootloader from the eMMC or SD card.

Tested with the following defconfig:

  # architecture
  BR2_arm=y
  BR2_cortex_a8=y
  BR2_ARM_EABIHF=y

  # system
  BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
  BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW=y

  # filesystem
  BR2_PACKAGE_AM33X_CM3=y
  BR2_TARGET_ROOTFS_EXT2=y
  BR2_TARGET_ROOTFS_EXT2_4=y

  # bootloader
  BR2_TARGET_BAREBOX=y
  BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="am335x"
  BR2_TARGET_BAREBOX_IMAGE_FILE="images/barebox-am33xx-beaglebone.img"
  BR2_TARGET_BAREBOX_CUSTOM_ENV=y
  BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH="board/beaglebone/barebox/barebox.env"
  BR2_TARGET_BAREBOX_2=y
  BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG="am335x_mlo"
  BR2_TARGET_BAREBOX_2_IMAGE_FILE="images/barebox-am33xx-beaglebone-mlo.img"

  # kernel
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_USE_DEFCONFIG=y
  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
  BR2_LINUX_KERNEL_ZIMAGE=y

  # use the barebox built-in dtb
  # BR2_LINUX_KERNEL_DTS_SUPPORT is not set

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/Config.in                |  2 +
 boot/barebox/barebox-2/Config.in      | 72 +++++++++++++++++++++++++++++++++++
 boot/barebox/barebox-2/barebox-2.hash |  1 +
 boot/barebox/barebox-2/barebox-2.mk   |  9 +++++
 boot/barebox/barebox.mk               |  3 ++
 5 files changed, 87 insertions(+)
 create mode 100644 boot/barebox/barebox-2/Config.in
 create mode 120000 boot/barebox/barebox-2/barebox-2.hash
 create mode 100644 boot/barebox/barebox-2/barebox-2.mk

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index db538b3..5f0274c 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -131,4 +131,6 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
 	  barebox devfs format, stored in the images directory, with
 	  the same name as the directory name given here.
 
+source boot/barebox/barebox-2/Config.in
+
 endif
diff --git a/boot/barebox/barebox-2/Config.in b/boot/barebox/barebox-2/Config.in
new file mode 100644
index 0000000..fa78711
--- /dev/null
+++ b/boot/barebox/barebox-2/Config.in
@@ -0,0 +1,72 @@
+menuconfig BR2_TARGET_BAREBOX_2
+	bool "Build barebox with a 2nd config"
+	help
+	  Build barebox with a 2nd configuration.
+
+	  Useful for building an SPL (Secondary Program Loader) in addition to
+	  the traditional TPL (Tertiary Program Loader), such as the X-Loader
+	  or MLO for Texas Instruments processors.
+
+if BR2_TARGET_BAREBOX_2
+
+choice
+	prompt "Barebox configuration"
+	default BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
+
+config BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_TARGET_BAREBOX_2_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG
+	string "board defconfig"
+	depends on BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
+	help
+	  Name of the board for which Barebox should be built, without
+	  the _defconfig suffix.
+
+
+config BR2_TARGET_BAREBOX_2_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_BAREBOX_2_USE_CUSTOM_CONFIG
+	help
+	  Path to the barebox configuration file
+
+config BR2_TARGET_BAREBOX_2_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main Barebox configuration file.
+
+config BR2_TARGET_BAREBOX_2_IMAGE_FILE
+	string "Built image filename"
+	default "barebox-flash-image"
+	help
+	  Name of the built barebox image filename in the barebox build or
+	  build images directory.
+
+	  Set to barebox.bin for barebox versions older than 2012.10.
+
+config BR2_TARGET_BAREBOX_2_CUSTOM_ENV
+	bool "Generate an environment image"
+	help
+	  Generate a custom environment image. This environment will
+	  contain the variables and scripts to be used at boot by
+	  barebox.
+
+config BR2_TARGET_BAREBOX_2_CUSTOM_ENV_PATH
+	string "Environment path"
+	depends on BR2_TARGET_BAREBOX_2_CUSTOM_ENV
+	help
+	  Path to the directory containing the custom barebox
+	  environment. Depending on your setup, it will probably be
+	  based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code, plus
+	  the additions needed. The output will be an image in the
+	  barebox devfs format, stored in the images directory, with
+	  the same name as the directory name given here.
+
+endif
diff --git a/boot/barebox/barebox-2/barebox-2.hash b/boot/barebox/barebox-2/barebox-2.hash
new file mode 120000
index 0000000..b6462b8
--- /dev/null
+++ b/boot/barebox/barebox-2/barebox-2.hash
@@ -0,0 +1 @@
+../barebox.hash
\ No newline at end of file
diff --git a/boot/barebox/barebox-2/barebox-2.mk b/boot/barebox/barebox-2/barebox-2.mk
new file mode 100644
index 0000000..68a9d70
--- /dev/null
+++ b/boot/barebox/barebox-2/barebox-2.mk
@@ -0,0 +1,9 @@
+################################################################################
+#
+# barebox-2
+#
+################################################################################
+
+# Instantiate a 2nd barebox package, built from the same sources as the 1st,
+# but with it's own configuration:
+$(eval $(barebox-package))
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index a5b1b1e..e7d15e2 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -144,3 +144,6 @@ barebox-package=$(call inner-barebox-package,$(call UPPERCASE,$(pkgname)))
 
 # instantiate this barebox package
 $(eval $(barebox-package))
+
+# add the 2nd barebox package build
+include boot/barebox/barebox-2/barebox-2.mk
-- 
2.5.0
