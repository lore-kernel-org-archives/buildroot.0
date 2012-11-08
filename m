From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  8 Nov 2012 09:36:12 +0100
Subject: [Buildroot] [PATCH v3 06/10] Add update-all-configs target
In-Reply-To: <1352363776-23638-1-git-send-email-arnout@mind.be>
References: <1352363776-23638-1-git-send-email-arnout@mind.be>
Message-ID: <1352363776-23638-6-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The update-all-config starget updates all the external configuration
file with their current values.  This includes:
- buildroot
- busybox
- linux
- crosstool-ng
- uClibc
- at91bootstrap3
- barebox

Linux and buildroot are saved as defconfigs.  For Linux, this means
that it will fail on kernels before 2.6.33 (when the savedefconfig
was added to Linux Kconfig).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v3: - added barebox
    - renamed to update-all-configs (Luca Ceresoli)
---
 Makefile                                         |    7 +++++++
 boot/at91bootstrap3/at91bootstrap3.mk            |    1 +
 boot/barebox/barebox.mk                          |    1 +
 docs/manual/customize-store.txt                  |   11 +++--------
 linux/linux.mk                                   |    2 ++
 package/busybox/busybox.mk                       |    4 ++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++++
 toolchain/uClibc/uclibc.mk                       |    4 ++++
 8 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index e6eb379..0e9ae92 100644
--- a/Makefile
+++ b/Makefile
@@ -549,6 +549,10 @@ legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
 show-targets:
 	@echo $(TARGETS)
 
+# UPDATE_ALL_CONFIGS_TARGETS is set by the individual packages that have a
+# save*config target.
+update-all-configs: savedefconfig $(UPDATE_ALL_CONFIGS_TARGETS)
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -701,6 +705,9 @@ help:
 	@echo '  defconfig              - New config with default answer to all options'
 	@echo '                             BR2_DEFCONFIG, if set, is used as input'
 	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
+	@echo '  update-all-configs     - Update all configuration targets that have an input:'
+	@echo '                           buildroot, busybox, linux, crosstool-ng, uClibc,
+	@echo '                           at91bootstrap3, barebox'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
 	@echo '  randpackageconfig      - New config with random answer to package options'
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index bb6ef09..902c153 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -69,6 +69,7 @@ endif
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
 at91bootstrap3-update-config: at91bootstrap3-configure
 	cp -f $(AT91BOOTSTRAP3_DIR)/.config $(AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)
+UPDATE_ALL_CONFIGS_TARGETS += at91bootstrap3-update-config
 else
 at91bootstrap3-update-config: ;
 endif
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index a025d5f..bda2759 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -106,6 +106,7 @@ barebox-update-config: barebox-configure $(BAREBOX_DIR)/.config
 
 barebox-update-defconfig: barebox-savedefconfig
 	cp -f $(BAREBOX_DIR)/defconfig $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
+UPDATE_ALL_CONFIGS_TARGETS += barebox-update-defconfig
 else
 barebox-update-config: ;
 barebox-update-defconfig: ;
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index 6c799ee..e1bce3a 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -66,6 +66,8 @@ configuration files easier.
   +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+.
 * +make barebox-update-defconfig+ saves the barebox configuration to the
   path specified by +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+.
+* +make update-all-configs+ updates all of the above configuration files
+  for which you have defined the corresponding +_CONFIG+ option.
 
 Creating your own board support
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -125,13 +127,6 @@ you can skip the steps that are not relevant for your use case.
    * +BR2_UCLIBC_CONFIG+
    * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
    * +BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE+
-1. Write the configuration files:
-   * +make linux-update-defconfig+
-   * +make busybox-update-config+
-   * +make ctng-update-config+
-   * +make uclibc-update-config+
-   * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
-   * +make barebox-update-defconfig+
 1. Create +board/<manufacturer>/<boardname>/fs-overlay/+ and fill it
    with additional files you need on your rootfs, e.g.
    +board/<manufacturer>/<boardname>/fs-overlay/etc/inittab+.
@@ -144,7 +139,7 @@ you can skip the steps that are not relevant for your use case.
 1. If additional setuid permissions have to be set or device nodes have
    to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
-1. +make savedefconfig+ to save the buildroot configuration.
+1. Save the configuration files: +make update-all-configs+
 1. +cp defconfig configs/<boardname>_defconfig+
 1. To add patches to the linux build, set +BR2_LINUX_KERNEL_PATCH+ to
    +board/<manufacturer>/<boardname>/patches/linux/+ and add your
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..7273ce6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -151,6 +151,8 @@ ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+# savedefconfig requires a kernel >= 2.6.33
+UPDATE_ALL_CONFIGS_TARGETS += linux-update-defconfig
 endif
 
 define LINUX_CONFIGURE_CMDS
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 14a0ea2..fb67b71 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -220,3 +220,7 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 
 busybox-update-config: busybox-configure
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
+
+ifneq ($(BUSYBOX_CONFIG_FILE),)
+UPDATE_ALL_CONFIGS_TARGETS += busybox-update-config
+endif
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 85ca71e..f8dc88a 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -400,3 +400,7 @@ ctng-menuconfig: $(CTNG_DIR)/.config
 
 ctng-update-config: $(CTNG_DIR)/.config
 	cp -f $< $(CTNG_CONFIG_FILE)
+
+ifneq ($(CTNG_CONFIG_FILE),)
+UPDATE_ALL_CONFIGS_TARGETS += ctng-update-config
+endif
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 8cf59bc..c6ee491 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -508,6 +508,10 @@ uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
 uclibc-update-config: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
+ifneq ($(UCLIBC_CONFIG_FILE),)
+UPDATE_ALL_CONFIGS_TARGETS += uclibc-update-config
+endif
+
 uclibc-configured: gcc_initial kernel-headers $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source
-- 
1.7.10.4
