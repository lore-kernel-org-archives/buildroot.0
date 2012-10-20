From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 21 Oct 2012 01:45:27 +0200
Subject: [Buildroot] [PATCH 06/10] Add update-all-config target
In-Reply-To: <1350776731-8467-1-git-send-email-arnout@mind.be>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
Message-ID: <1350776731-8467-7-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The update-all-config target updates all the external configuration
file with their current values.  This includes:
- buildroot
- busybox
- linux
- crosstool-ng
- uClibc
- at91bootstrap3

Linux and buildroot are saved as defconfigs.  For Linux, this means
that it will fail on kernels before 2.6.33 (when the savedefconfig
was added to Linux Kconfig).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Barebox is missing because there is no BR2_TARGET_BAREBOX_CONFIG option.
Can be added once Maxime's patch has been accepted.
---
 Makefile                                         |    6 ++++++
 boot/at91bootstrap3/at91bootstrap3.mk            |    1 +
 docs/manual/customize-store.txt                  |   18 ++++--------------
 linux/linux.mk                                   |    2 ++
 package/busybox/busybox.mk                       |    4 ++++
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++++
 toolchain/uClibc/uclibc.mk                       |    4 ++++
 7 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 2122d45..e257c61 100644
--- a/Makefile
+++ b/Makefile
@@ -548,6 +548,10 @@ legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
 show-targets:
 	@echo $(TARGETS)
 
+# UPDATE_ALL_CONFIG_TARGETS is set by the individual packages that have a
+# save*config target.
+update-all-config: savedefconfig $(UPDATE_ALL_CONFIG_TARGETS)
+
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 all: menuconfig
@@ -700,6 +704,8 @@ help:
 	@echo '  defconfig              - New config with default answer to all options'
 	@echo '                             BR2_DEFCONFIG, if set, is used as input'
 	@echo '  savedefconfig          - Save current config as ./defconfig (minimal config)'
+	@echo '  update-all-config      - Update all configuration targets that have an input:'
+	@echo '                           buildroot, busybox, linux, crosstool-ng, uClibc'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
 	@echo '  randpackageconfig      - New config with random answer to package options'
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index bb6ef09..1451ad8 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -69,6 +69,7 @@ endif
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG),y)
 at91bootstrap3-update-config: at91bootstrap3-configure
 	cp -f $(AT91BOOTSTRAP3_DIR)/.config $(AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE)
+UPDATE_ALL_CONFIG_TARGETS += at91bootstrap3-update-defconfig
 else
 at91bootstrap3-update-config: ;
 endif
diff --git a/docs/manual/customize-store.txt b/docs/manual/customize-store.txt
index c7ef00c..6deed49 100644
--- a/docs/manual/customize-store.txt
+++ b/docs/manual/customize-store.txt
@@ -60,6 +60,8 @@ configuration files easier.
   path specified by +BR2_UCLIBC_CONFIG+.
 * +make ctng-update-config+ saves the crosstool-NG configuration to the
   patch specified by +BR2_TOOLCHAIN_CTNG_CONFIG+.
+* +make update-all-config+ updates all of the above configuration files
+  for which you have defined the corresponding +_CONFIG+ option.
 
 
 Creating your own board support
@@ -119,12 +121,6 @@ you can skip the steps that are not relevant for your use case.
    * +BR2_TOOLCHAIN_CTNG_CONFIG+
    * +BR2_UCLIBC_CONFIG+
    * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
-1. Write the configuration files:
-   * +make linux-update-defconfig+
-   * +make busybox-update-config+
-   * +make ctng-update-config+
-   * +make uclibc-update-config+
-   * +cp <output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
 1. Create +board/<manufacturer>/<boardname>/fs-overlay+ and fill it
    with additional files you need on your rootfs, e.g.
    +board/<manufacturer>/<boardname>/etc/inittab+.  Set +BR2_ROOTFS_OVERLAY+
@@ -136,7 +132,7 @@ you can skip the steps that are not relevant for your use case.
 1. If additional setuid permissions have to be set or device nodes have
    to be created, create +board/<manufacturer>/<boardname>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
-1. +make savedefconfig+ to save the buildroot configuration.
+1. Write the configuration files: +make update-all-config+
 1. +cp defconfig configs/<boardname>_defconfig+
 
 
@@ -160,12 +156,6 @@ the buildroot tree).
    * +BR2_TOOLCHAIN_CTNG_CONFIG+
    * +BR2_UCLIBC_CONFIG+
    * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
-1. Write the configuration files:
-   * +make linux-update-defconfig+
-   * +make busybox-update-config+
-   * +make ctng-update-config+
-   * +make uclibc-update-config+
-   * +cp <output>/build/at91bootstrap3-*/.config <path-to-board-directory>/at91bootstrap3.config+
 1. Create +<path-to-board-directory>/fs-overlay+ and fill it
    with additional files you need on your rootfs, e.g.
    +<path-to-board-directory>/etc/inittab+. Set +BR2_ROOTFS_OVERLAY+
@@ -176,7 +166,7 @@ the buildroot tree).
 1. If additional setuid permissions have to be set or device nodes have
    to be created, create +<path-to-board-directory>/device_table.txt+
    and add that path to +BR2_ROOTFS_DEVICE_TABLE+.
-1. +make savedefconfig+ to save the buildroot configuration.
+1. Write the configuration files: +make update-all-config+
 1. +cp defconfig <path-to-board-directory>/buildroot.config+
 1. Create a script or Makefile in the board directory that calls
    buildroot:
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..98ffe44 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -151,6 +151,8 @@ ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
 KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
+# savedefconfig requires a kernel >= 2.6.33
+UPDATE_ALL_CONFIG_TARGETS += linux-update-defconfig
 endif
 
 define LINUX_CONFIGURE_CMDS
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e95364c..c73d0d0 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -217,3 +217,7 @@ busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch
 
 busybox-update-config: busybox-configure
 	cp -f $(BUSYBOX_BUILD_CONFIG) $(BUSYBOX_CONFIG_FILE)
+
+ifneq ($(BUSYBOX_CONFIG_FILE),)
+UPDATE_ALL_CONFIG_TARGETS += busybox-update-config
+endif
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index fb6da0f..37398bd 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -400,3 +400,7 @@ ctng-menuconfig: $(CTNG_DIR)/.config
 
 ctng-update-config: $(CTNG_DIR)/.config
 	cp -f $< $(CTNG_CONFIG_FILE)
+
+ifneq ($(CTNG_CONFIG_FILE),)
+UPDATE_ALL_CONFIG_TARGETS += ctng-update-config
+endif
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index d1cd718..0faaf18 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -508,6 +508,10 @@ uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
 uclibc-update-config: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
+ifneq ($(UCLIBC_CONFIG_FILE),)
+UPDATE_ALL_CONFIG_TARGETS += uclibc-update-config
+endif
+
 uclibc-configured: gcc_initial kernel-headers $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source
-- 
1.7.10.4
