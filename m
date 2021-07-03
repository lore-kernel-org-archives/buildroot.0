From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Jul 2021 21:39:59 +0200
Subject: [Buildroot] [PATCH 1/2] boot/, linux/,
 package/: improve help text of kconfig packages
Message-ID: <20210703194001.693553-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The <pkg>_HELP_CMDS variable allows packages using the kconfig-package
infrastructure to display their specific targets related to the
handling of their configuration.

However, it was not consistently used and handled by the different
packages. This commit makes sure all packages using kconfig-package
have that help text, and that is does reflect which targets are
available/usable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap3/at91bootstrap3.mk      | 9 +++++++++
 boot/barebox/barebox/barebox.mk            | 8 ++++++--
 boot/uboot/uboot.mk                        | 4 +++-
 linux/linux.mk                             | 4 +++-
 package/busybox/busybox.mk                 | 2 ++
 package/linux-backports/linux-backports.mk | 9 +++++++++
 package/swupdate/swupdate.mk               | 9 +++++++++
 package/uclibc/uclibc.mk                   | 7 ++++++-
 package/xvisor/xvisor.mk                   | 9 +++++++++
 9 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index b253129dfb..0bf401953f 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -61,6 +61,15 @@ endif
 AT91BOOTSTRAP3_KCONFIG_EDITORS = menuconfig xconfig gconfig
 AT91BOOTSTRAP3_KCONFIG_OPTS = $(AT91BOOTSTRAP3_MAKE_OPTS)
 
+define AT91BOOTSTRAP3_HELP_CMDS
+	@echo '  at91bootstrap3-menuconfig       - Run At91bootstrap3 kernel menuconfig'
+	@echo '  at91bootstrap3-savedefconfig    - Run At91bootstrap3 kernel savedefconfig'
+	@echo '  at91bootstrap3-update-defconfig - Save the At91bootstrap3 configuration to the path specified'
+	@echo '                                      by BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE, as a defconfig'
+	@echo '  at91bootstrap3-update-config    - Save the At91bootstrap3 configuration to the path specified'
+	@echo '                                      by BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE, as a full .config'
+endef
+
 # Checks to give errors that the user can understand
 # Must be before we call to kconfig-package
 ifeq ($(BR_BUILDING),y)
diff --git a/boot/barebox/barebox/barebox.mk b/boot/barebox/barebox/barebox.mk
index 39afb0fccb..c9905b3335 100644
--- a/boot/barebox/barebox/barebox.mk
+++ b/boot/barebox/barebox/barebox.mk
@@ -5,8 +5,12 @@
 ################################################################################
 
 define BAREBOX_HELP_CMDS
-	@echo '  barebox-menuconfig     - Run barebox menuconfig'
-	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
+	@echo '  barebox-menuconfig       - Run barebox menuconfig'
+	@echo '  barebox-savedefconfig    - Run barebox savedefconfig'
+	@echo '  barebox-update-defconfig - Save the Barebox configuration to the path specified'
+	@echo '                             by BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE, as a defconfig'
+	@echo '  barebox-update-config    - Save the Barebox configuration to the path specified'
+	@echo '                             by BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE, as a full .config'
 endef
 
 # Instantiate the barebox package
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a7eaedb06f..cb31223746 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -296,7 +296,9 @@ define UBOOT_HELP_CMDS
 	@echo '  uboot-menuconfig       - Run U-Boot menuconfig'
 	@echo '  uboot-savedefconfig    - Run U-Boot savedefconfig'
 	@echo '  uboot-update-defconfig - Save the U-Boot configuration to the path specified'
-	@echo '                             by BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE'
+	@echo '                             by BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE, as a defconfig'
+	@echo '  uboot-update-config    - Save the U-Boot configuration to the path specified'
+	@echo '                             by BR2_TARGET_UBOOT_CUSTOM_CONFIG_FILE, as a full .config'
 endef
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
diff --git a/linux/linux.mk b/linux/linux.mk
index 1457228eb9..1852fa34ef 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -20,7 +20,9 @@ define LINUX_HELP_CMDS
 	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
 	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
 	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
-	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
+	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE, as a defconfig'
+	@echo '  linux-update-config    - Save the Linux configuration to the path specified'
+	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE, as a full .config'
 endef
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 413939e28d..6504ec4f9a 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -13,6 +13,8 @@ BUSYBOX_CPE_ID_VENDOR = busybox
 
 define BUSYBOX_HELP_CMDS
 	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
+	@echo '  busybox-update-config    - Save the Busybox configuration to the path specified'
+	@echo '                             by BR2_PACKAGE_BUSYBOX_CONFIG, as a full .config'
 endef
 
 BUSYBOX_CFLAGS = \
diff --git a/package/linux-backports/linux-backports.mk b/package/linux-backports/linux-backports.mk
index 068dcffcc8..f4a6583090 100644
--- a/package/linux-backports/linux-backports.mk
+++ b/package/linux-backports/linux-backports.mk
@@ -14,6 +14,15 @@ LINUX_BACKPORTS_LICENSE_FILES = \
 	LICENSES/exceptions/Linux-syscall-note \
 	LICENSES/preferred/GPL-2.0
 
+define LINUX_BACKPORTS_HELP_CMDS
+	@echo '  linux-backports-menuconfig       - Run linux-backports menuconfig'
+	@echo '  linux-backports-savedefconfig    - Run linux-backports savedefconfig'
+	@echo '  linux-backports-update-defconfig - Save the linux-backports configuration to the path specified'
+	@echo '                                       by BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE, as a defconfig'
+	@echo '  linux-backports-update-config    - Save the linux-backports configuration to the path specified'
+	@echo '                                       by BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE, as a full .config'
+endef
+
 # flex and bison are needed to generate kconfig parser. We use the
 # same logic as the linux kernel (we add host dependencies only if
 # host does not have them). See linux/linux.mk and
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index d96a0c2e07..689ef6b6e8 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -151,6 +151,15 @@ SWUPDATE_BUILD_CONFIG = $(@D)/.config
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
+define SWUPDATE_HELP_CMDS
+	@echo '  swupdate-menuconfig       - Run swupdate menuconfig'
+	@echo '  swupdate-savedefconfig    - Run swupdate savedefconfig'
+	@echo '  swupdate-update-defconfig - Save the swupdate configuration to the path specified'
+	@echo '                                by BR2_PACKAGE_SWUPDATE_CONFIG, as a defconfig'
+	@echo '  swupdate-update-config    - Save the swupdate configuration to the path specified'
+	@echo '                                by BR2_PACKAGE_SWUPDATE_CONFIG, as a full .config'
+endef
+
 ifeq ($(BR2_STATIC_LIBS),y)
 define SWUPDATE_PREFER_STATIC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC)
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index a7c96684d0..910d479cfd 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -14,7 +14,12 @@ UCLIBC_CPE_ID_VENDOR = uclibc-ng_project
 UCLIBC_CPE_ID_PRODUCT = uclibc-ng
 
 define UCLIBC_HELP_CMDS
-	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
+	@echo '  uclibc-menuconfig       - Run uClibc menuconfig'
+	@echo '  uclibc-savedefconfig    - Run uClibc savedefconfig'
+	@echo '  uclibc-update-defconfig - Save the uClibc configuration to the path specified'
+	@echo '                              by BR2_UCLIBC_CONFIG, as a defconfig'
+	@echo '  uclibc-update-config    - Save the uClibc configuration to the path specified'
+	@echo '                              by BR2_UCLIBC_CONFIG, as a full .config'
 endef
 
 # uclibc is part of the toolchain so disable the toolchain dependency
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index 394ff7c80b..aa5831e10c 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -19,6 +19,15 @@ ifeq ($(BR2_PACKAGE_XVISOR_BUILD_TEST_DTB),y)
 XVISOR_MAKE_TARGETS += dtbs
 endif
 
+define XVISOR_HELP_CMDS
+	@echo '  xvisor-menuconfig       - Run xvisor menuconfig'
+	@echo '  xvisor-savedefconfig    - Run xvisor savedefconfig'
+	@echo '  xvisor-update-defconfig - Save the xvisor configuration to the path specified'
+	@echo '                              by BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE, as a defconfig'
+	@echo '  xvisor-update-config    - Save the xvisor configuration to the path specified'
+	@echo '                              by BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE, as a full .config'
+endef
+
 XVISOR_KCONFIG_DOTCONFIG = build/openconf/.config
 
 ifeq ($(BR2_PACKAGE_XVISOR_USE_DEFCONFIG),y)
-- 
2.31.1
