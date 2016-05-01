From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 14:33:57 +0200
Subject: [Buildroot] [git commit] barebox: support auxiliary config build
Message-ID: <20160501123412.D6C157FF69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76165265afdae1cb41f1b7523f06beb23b84d41c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds support to build barebox with an auxiliary config.

This is useful for building an SPL (Secondary Program Loader) in
addition to the traditional TPL (Tertiary Program Loader). The
Beaglebone Black for example has two barebox configurations:

- am335x_defconfig builds the full barebox bootloader with device
  tree

- am335x_mlo_defconfig builds the smaller MLO bootloader that loads
  the full barebox bootloader from the eMMC or SD card.

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
  BR2_TARGET_BAREBOX_AUX=y
  BR2_TARGET_BAREBOX_AUX_BOARD_DEFCONFIG="am335x_mlo"
  BR2_TARGET_BAREBOX_AUX_IMAGE_FILE="images/barebox-am33xx-beaglebone-mlo.img"

  # kernel
  BR2_LINUX_KERNEL=y
  BR2_LINUX_KERNEL_USE_DEFCONFIG=y
  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
  BR2_LINUX_KERNEL_ZIMAGE=y

  # use the barebox built-in dtb
  # BR2_LINUX_KERNEL_DTS_SUPPORT is not set

Signed-off-by: Pieter Smith <pieter@boesman.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/barebox/Config.in                    | 16 +++++++++
 boot/barebox/barebox-aux/Config.in        | 59 +++++++++++++++++++++++++++++++
 boot/barebox/barebox-aux/barebox-aux.hash |  1 +
 boot/barebox/barebox-aux/barebox-aux.mk   |  8 +++++
 boot/barebox/barebox.mk                   |  1 +
 5 files changed, 85 insertions(+)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index e25b14b..0bb19d3 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -66,4 +66,20 @@ endif
 
 source boot/barebox/barebox/Config.in
 
+menuconfig BR2_TARGET_BAREBOX_AUX
+	bool "Build barebox with an auxiliary config"
+	help
+	  Build barebox with an auxiliary configuration.
+
+	  Useful for building an SPL (Secondary Program Loader) in
+	  addition to the traditional TPL (Tertiary Program Loader),
+	  such as the X-Loader or MLO for Texas Instruments
+	  processors.
+
+if BR2_TARGET_BAREBOX_AUX
+
+source boot/barebox/barebox-aux/Config.in
+
+endif
+
 endif
diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
new file mode 100644
index 0000000..35aadc0
--- /dev/null
+++ b/boot/barebox/barebox-aux/Config.in
@@ -0,0 +1,59 @@
+choice
+	prompt "Barebox configuration"
+	default BR2_TARGET_BAREBOX_AUX_USE_DEFCONFIG
+
+config BR2_TARGET_BAREBOX_AUX_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_TARGET_BAREBOX_AUX_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_AUX_BOARD_DEFCONFIG
+	string "board defconfig"
+	depends on BR2_TARGET_BAREBOX_AUX_USE_DEFCONFIG
+	help
+	  Name of the board for which Barebox should be built, without
+	  the _defconfig suffix.
+
+config BR2_TARGET_BAREBOX_AUX_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_BAREBOX_AUX_USE_CUSTOM_CONFIG
+	help
+	  Path to the barebox configuration file
+
+config BR2_TARGET_BAREBOX_AUX_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main Barebox configuration file.
+
+config BR2_TARGET_BAREBOX_AUX_IMAGE_FILE
+	string "Image filename"
+	help
+	  Name of the generated barebox image, which will be copied to
+	  the images directory.
+
+	  If left empty, defaults to:
+	  - barebox.bin for barebox versions older than 2012.10.
+	  - barebox-flash-image for later versions.
+
+config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV
+	bool "Generate an environment image"
+	help
+	  Generate a custom environment image. This environment will
+	  contain the variables and scripts to be used at boot by
+	  barebox.
+
+config BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV_PATH
+	string "Environment path"
+	depends on BR2_TARGET_BAREBOX_AUX_CUSTOM_ENV
+	help
+	  Path to the directory containing the custom barebox
+	  environment. Depending on your setup, it will probably be
+	  based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code, plus
+	  the additions needed. The output will be an image in the
+	  barebox devfs format, stored in the images directory, with
+	  the same name as the directory name given here.
diff --git a/boot/barebox/barebox-aux/barebox-aux.hash b/boot/barebox/barebox-aux/barebox-aux.hash
new file mode 120000
index 0000000..b6462b8
--- /dev/null
+++ b/boot/barebox/barebox-aux/barebox-aux.hash
@@ -0,0 +1 @@
+../barebox.hash
\ No newline at end of file
diff --git a/boot/barebox/barebox-aux/barebox-aux.mk b/boot/barebox/barebox-aux/barebox-aux.mk
new file mode 100644
index 0000000..fb287d3
--- /dev/null
+++ b/boot/barebox/barebox-aux/barebox-aux.mk
@@ -0,0 +1,8 @@
+################################################################################
+#
+# barebox-aux
+#
+################################################################################
+
+# Instantiate the auxiliary barebox package
+$(eval $(barebox-package))
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 8b83bf2..949fb9f 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -143,3 +143,4 @@ endef
 barebox-package=$(call inner-barebox-package,$(call UPPERCASE,$(pkgname)))
 
 include boot/barebox/barebox/barebox.mk
+include boot/barebox/barebox-aux/barebox-aux.mk
