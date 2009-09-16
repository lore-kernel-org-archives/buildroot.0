From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2009 23:07:41 +0200
Subject: [Buildroot] [PATCH 1/6] Remove the "project" feature
In-Reply-To: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1253135266-26880-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "project" feature was designed to allow to several projects to be
built inside the same Buildroot source tree and allowing the toolchain
and non-configurable packages to be shared between the different
projects on the same architecture. While being interesting in theory,
this feature adds a level of complexity to Buildroot, both from an
user perspective and from a developer perspective, while one of the
main Buildroot strengh is to be simple. Moreover, this feature is only
seldomly used by our users.

From a user-level perspective, this for example allows to remove the
project_build_ARCH directory, which was very confusing. The
autotools-stamps directory is also removed, since these stamps are
back at their normal location.

Description of the changes involved :

 * project/, directory removed

 * Makefile

    - Don't include project/Makefile.in and project/project.mk anymore

    - Grab a copy of the contents of project/Makefile.in at the
      location it was imported, but remove the definition related to
      PROJECT_BUILD_DIR. The TARGET_DIR is now in
      $(BUILD_DIR)/target_dir

    - Remove the creation/removal of the $(PROJECT_BUILD_DIR) and
      $(PROJECT_BUILD_DIR)/autotools-stamps directories

    - Don't make world depends on target-host-info. This target was
      defined by project/project.mk to customize /etc/issue,
      /etc/hostname and create /etc/br-version depending on the
      project definitions. We can of course imagine re-adding such a
      feature later.

    - Replace PROJECT_BUILD_DIR by BUILD_DIR everywhere

    - Remove the update, log and lognr.$(PROJECT) target, they were
      specific to the project feature.

 * package/Makefile.autotools.in

    - Replace PROJECT_BUILD_DIR by BUILD_DIR for the location of the
      configure cache

    - Move the INSTALL_TARGET and HOOK_POST_INSTALL stamps to the same
      directory as the other stamps (i.e, in the package directory).

 * package/Makefile.in

    - Replace PROJECT_BUILD_DIR by BUILD_DIR for the location of the
      configure cache

 * package/at/at.mk,
   package/busybox/busybox.mk,
   package/busybox/initramfs.mk,
   package/customize/customize.mk,
   package/linux-fusion/linux-fusion.mk,
   package/ltp-testsuite/ltp-testsuite.mk,
   package/nfs-utils/nfs-utils.mk,
   target/cpio/cpioroot.mk,
   target/cramfs/cramfs.mk,
   target/device/Atmel/DataFlashBoot/DataflashBoot.mk,
   target/device/Atmel/Makefile.in,
   target/device/Atmel/at91bootstrap/at91bootstrap.mk,
   target/device/KwikByte/Makefile.in,
   target/ext2/ext2root.mk,
   target/initramfs/initramfs.mk,
   target/iso9660/iso9660.mk,
   target/jffs2/jffs2root.mk,
   target/linux/Makefile.in,
   target/romfs/romfs.mk,
   target/squashfs/squashfsroot.mk,
   target/tar/tarroot.mk,
   target/ubifs/ubifsroot.mk

    - Replace PROJECT_BUILD_DIR by BUILD_DIR

 * target/device/Config.in

    - Do not include project/Config.in anymore

 * target/linux/Makefile.in.advanced

    - Replace PROJECT_BUILD_DIR by BUILD_DIR

    - Store the stamps file in $(STAMP_DIR) instead of
      $(PROJECT_BUILD_DIR)/autotools-stamps

 * target/u-boot/Makefile.in

    - Replace PROJECT_BUILD_DIR by BUILD_DIR

    - Remove $(PROJECT) from the U-Boot target binary name

    - Remove the insertion in the configuration of the project name as
      the hostname

    - The u-boot-autoscript target now generates
      $(U_BOOT_AUTOSCRIPT).img instead of
      $(U_BOOT_AUTOSCRIPT).$(PROJECT)

 * toolchain/gcc/gcc-uclibc-3.x.mk
   toolchain/gcc/gcc-uclibc-4.x.mk

    - Move the stamps files to $(STAMP_DIR)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                           |  115 ++++++++++++++------
 package/Makefile.autotools.in                      |    9 +-
 package/at/at.mk                                   |    6 +-
 package/busybox/busybox.mk                         |   12 +-
 package/busybox/initramfs.mk                       |   32 +++---
 package/customize/customize.mk                     |   10 +-
 package/linux-fusion/linux-fusion.mk               |    8 +-
 package/ltp-testsuite/ltp-testsuite.mk             |    2 +-
 package/nfs-utils/nfs-utils.mk                     |    6 +-
 project/Config.in                                  |   25 -----
 project/Makefile.in                                |   79 --------------
 project/project.mk                                 |   52 ---------
 target/cpio/cpioroot.mk                            |   18 ++--
 target/cramfs/cramfs.mk                            |   18 ++--
 target/device/Atmel/DataFlashBoot/DataflashBoot.mk |    6 +-
 target/device/Atmel/Makefile.in                    |    4 +-
 target/device/Atmel/at91bootstrap/at91bootstrap.mk |    6 +-
 target/device/Config.in                            |    2 -
 target/device/KwikByte/Makefile.in                 |    4 +-
 target/ext2/ext2root.mk                            |   20 ++--
 target/initramfs/initramfs.mk                      |   18 ++--
 target/iso9660/iso9660.mk                          |   16 ++--
 target/jffs2/jffs2root.mk                          |   20 ++--
 target/linux/Makefile.in                           |    6 +-
 target/linux/Makefile.in.advanced                  |   26 +++---
 target/romfs/romfs.mk                              |   18 ++--
 target/squashfs/squashfsroot.mk                    |   18 ++--
 target/tar/tarroot.mk                              |   18 ++--
 target/u-boot/Makefile.in                          |   17 ++--
 target/ubifs/ubifsroot.mk                          |   18 ++--
 toolchain/gcc/gcc-uclibc-3.x.mk                    |    6 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    6 +-
 32 files changed, 254 insertions(+), 367 deletions(-)
 delete mode 100644 project/Config.in
 delete mode 100644 project/Makefile.in
 delete mode 100644 project/project.mk

diff --git a/Makefile b/Makefile
index f2e349f..8adaff4 100644
--- a/Makefile
+++ b/Makefile
@@ -217,10 +217,76 @@ BASE_TARGETS:=uclibc
 endif
 TARGETS:=
 
-# setup our paths
-include project/Makefile.in
+# Strip off the annoying quoting
+ARCH:=$(call qstrip,$(BR2_ARCH))
+ifeq ($(ARCH),xtensa)
+ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
+endif
+WGET:=$(call qstrip,$(BR2_WGET)) $(SPIDER) $(QUIET)
+SVN_CO:=$(call qstrip,$(BR2_SVN_CO)) $(QUIET)
+SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
+BZR_CO:=$(call qstrip,$(BR2_BZR_CO)) $(QUIET)
+BZR_UP:=$(call qstrip,$(BR2_BZR_UP)) $(QUIET)
+GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
+ZCAT:=$(call qstrip,$(BR2_ZCAT))
+BZCAT:=$(call qstrip,$(BR2_BZCAT))
+TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
+
+# Buildroot supports building out of tree similarly to the Linux kernel.
+# To use, add O= to the make command line (make O=/tmp/build)
+BASE_DIR:=$(shell pwd)
+ifdef O
+ifeq ("$(origin O)", "command line")
+BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
+$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
+
+# other packages might also support Linux-style out of tree builds
+# with the O=<dir> syntax (E.G. Busybox does). As make automatically
+# forwards command line variable definitions those packages get very
+# confused. Fix this by telling make to not do so
+MAKEOVERRIDES =
+endif
+endif
+
+TOPDIR_PREFIX:=$(call qstrip,$(BR2_TOPDIR_PREFIX))_
+TOPDIR_SUFFIX:=_$(call qstrip,$(BR2_TOPDIR_SUFFIX))
+ifeq ($(TOPDIR_PREFIX),_)
+TOPDIR_PREFIX:=
+endif
+ifeq ($(TOPDIR_SUFFIX),_)
+TOPDIR_SUFFIX:=
+endif
+
+DL_DIR=$(call qstrip,$(BR2_DL_DIR))
+ifeq ($(DL_DIR),)
+DL_DIR:=$(BASE_DIR)/dl
+endif
+
+BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
-BR2_DEPENDS_DIR=$(PROJECT_BUILD_DIR)/buildroot-config
+GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
+
+STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
+
+# packages compiled for the host goes here
+HOST_DIR:=$(BUILD_DIR)/host_dir
+
+# stamp (dependency) files go here
+STAMP_DIR:=$(BUILD_DIR)/stamps
+
+BINARIES_DIR:=$(BASE_DIR)/binaries/
+TARGET_DIR:=$(BUILD_DIR)/target_dir
+
+# define values for prepatched source trees for toolchains
+VENDOR_SITE:=$(call qstrip,$(BR2_VENDOR_SITE))
+VENDOR_SUFFIX:=$(call qstrip,$(BR2_VENDOR_SUFFIX))
+VENDOR_BINUTILS_RELEASE:=$(call qstrip,$(BR2_VENDOR_BINUTILS_RELEASE))
+VENDOR_GCC_RELEASE:=$(call qstrip,$(BR2_VENDOR_GCC_RELEASE))
+VENDOR_UCLIBC_RELEASE:=$(call qstrip,$(BR2_VENDOR_UCLIBC_RELEASE))
+VENDOR_GDB_RELEASE:=$(call qstrip,$(BR2_VENDOR_GDB_RELEASE))
+VENDOR_PATCH_DIR:=$(call qstrip,$(BR2_VENDOR_PATCH_DIR))
+
+BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
 
 include toolchain/Makefile.in
 include package/Makefile.in
@@ -237,8 +303,6 @@ all: world
 # In this section, we need .config
 include .config.cmd
 
-include project/*.mk
-
 # We also need the various per-package makefiles, which also add
 # each selected package to TARGETS if that package was selected
 # in the .config file.
@@ -290,20 +354,18 @@ $(BR2_DEPENDS_DIR): .config
 	cp -dpRf $(CONFIG)/buildroot-config $@
 
 dirs: $(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
-	$(PROJECT_BUILD_DIR)/autotools-stamps $(STAMP_DIR)
+	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs
 
-world: dependencies dirs target-host-info $(BASE_TARGETS) $(TARGETS_ALL)
+world: dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 
 
 .PHONY: all world dirs clean dirclean distclean source \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(PROJECT_BUILD_DIR) \
-	$(PROJECT_BUILD_DIR)/autotools-stamps $(STAMP_DIR)
+	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 #############################################################
 #
@@ -311,8 +373,7 @@ world: dependencies dirs target-host-info $(BASE_TARGETS) $(TARGETS_ALL)
 # dependencies anywhere else
 #
 #############################################################
-$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(HOST_DIR) $(PROJECT_BUILD_DIR) \
-	$(PROJECT_BUILD_DIR)/autotools-stamps $(BINARIES_DIR) $(STAMP_DIR):
+$(DL_DIR) $(TOOL_BUILD_DIR) $(BUILD_DIR) $(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR):
 	@mkdir -p $@
 
 $(STAGING_DIR):
@@ -330,7 +391,7 @@ endif
 endif
 	@mkdir -p $(STAGING_DIR)/usr/include
 
-$(PROJECT_BUILD_DIR)/.root:
+$(BUILD_DIR)/.root:
 	mkdir -p $(TARGET_DIR)
 	if ! [ -d "$(TARGET_DIR)/bin" ]; then \
 		if [ -d "$(TARGET_SKELETON)" ]; then \
@@ -345,10 +406,10 @@ $(PROJECT_BUILD_DIR)/.root:
 	-find $(TARGET_DIR) -type f -name .empty -print0 | xargs -0 rm -rf
 	touch $@
 
-$(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root
+$(TARGET_DIR): $(BUILD_DIR)/.root
 
 erase-fakeroots:
-	rm -f $(PROJECT_BUILD_DIR)/.fakeroot*
+	rm -f $(BUILD_DIR)/.fakeroot*
 
 target-finalize:
 ifeq ($(BR2_HAVE_DEVFILES),y)
@@ -372,7 +433,7 @@ ifneq ($(BR2_ROOTFS_POST_BUILD_SCRIPT),"")
 endif
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
-LOCALE_WHITELIST=$(PROJECT_BUILD_DIR)/locales.nopurge
+LOCALE_WHITELIST=$(BUILD_DIR)/locales.nopurge
 LOCALE_NOPURGE=$(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 
 target-purgelocales:
@@ -403,21 +464,21 @@ external-deps:
 #
 #############################################################
 clean: $(TARGETS_CLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps $(STAMP_DIR)
+	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
 
 dirclean: $(TARGETS_DIRCLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(PROJECT_BUILD_DIR)/.root $(PROJECT_BUILD_DIR)/autotools-stamps $(STAMP_DIR)
+	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
 
 distclean:
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)
 	rm -rf $(DL_DIR)
 endif
-	rm -rf $(TOOL_BUILD_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(BINARIES_DIR) \
+	rm -rf $(TOOL_BUILD_DIR) $(BUILD_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
 	.config.cmd
 	$(MAKE) -C $(CONFIG) clean
 
 sourceball:
-	rm -rf $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(BINARIES_DIR)
+	rm -rf $(BUILD_DIR) $(BUILD_DIR) $(BINARIES_DIR)
 	set -e; \
 	cd ..; \
 	rm -f buildroot.tar.bz2; \
@@ -530,28 +591,16 @@ distclean: clean
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
 flush:
-	rm -f $(PROJECT_BUILD_DIR)/tgt-config.cache
+	rm -f $(BUILD_DIR)/tgt-config.cache
 
 %_defconfig: $(CONFIG)/conf
 	cp $(shell find ./target/ -name $@) .config
 	-@$(MAKE) oldconfig
 
-update:
-	cp .config $(BOARD_PATH)/$(PROJECT)_defconfig
-
 configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
 
 prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
 
-.lognr.$(PROJECT):
-	@echo "0" > .lognr.$(PROJECT)
-
-log:	.lognr.$(PROJECT)
-	@expr `cat .lognr.$(PROJECT)` + 1 > .lognr.$(PROJECT)	
-	@echo Creating $(PROJECT)-`cat .lognr.$(PROJECT)`.log
-	@$(MAKE) > $(PROJECT)-`cat .lognr.$(PROJECT)`.log 2>&1
-
-
 cross: $(BASE_TARGETS)
 
 help:
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 859e7bc..d4e6160 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -243,7 +243,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(TARGET_CONFIGURE_ENV) \
 	$($(PKG)_CONF_ENV) \
 	$(if $(THIS_SRCDIR),$(THIS_SRCDIR)/,./)configure \
-		$(if $(filter YES,$($(PKG)_USE_CONFIG_CACHE)),--cache-file="$(PROJECT_BUILD_DIR)/tgt-config.cache",) \
+		$(if $(filter YES,$($(PKG)_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/tgt-config.cache",) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -274,7 +274,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	touch $@
 
 # Install to target dir
-$(PROJECT_BUILD_DIR)/autotools-stamps/%_target_installed:
+$(BUILD_DIR)/%/.stamp_target_installed:
 	$(call MESSAGE,"Installing to target")
 	$($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $($(PKG)_DIR)/$($(PKG)_SUBDIR)
 	$(if $(BR2_HAVE_MANPAGES),,for d in man share/man; do \
@@ -352,8 +352,7 @@ $(2)_DIR_PREFIX			=  $(if $(3),$(3),$(TOP_SRCDIR)/package)
 
 
 # define sub-target stamps
-# targets which affect $(TARGET_DIR) must use a unique stamp for each $(PROJECT)
-$(2)_TARGET_INSTALL_TARGET =	$(PROJECT_BUILD_DIR)/autotools-stamps/$(1)_target_installed
+$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
@@ -369,7 +368,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 $(2)_HOOK_POST_EXTRACT =	$$($(2)_DIR)/.stamp_hook_post_extract
 $(2)_HOOK_POST_CONFIGURE =	$$($(2)_DIR)/.stamp_hook_post_configure
 $(2)_HOOK_POST_BUILD =		$$($(2)_DIR)/.stamp_hook_post_build
-$(2)_HOOK_POST_INSTALL =	$(PROJECT_BUILD_DIR)/autotools-stamps/$(1)_hook_post_install
+$(2)_HOOK_POST_INSTALL =	$$($(2)_DIR)/.stamp_hook_post_install
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
diff --git a/package/at/at.mk b/package/at/at.mk
index b3b2f35..52c4090 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -49,11 +49,11 @@ $(TARGET_DIR)/$(AT_TARGET_SCRIPT): $(AT_DIR)/$(AT_BINARY)
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE) DAEMON_USERNAME=root DAEMON_GROUPNAME=root ' \
 	 '$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(AT_DIR) install' \
-		> $(PROJECT_BUILD_DIR)/.fakeroot.at
+		> $(BUILD_DIR)/.fakeroot.at
 ifneq ($(BR2_HAVE_MANPAGES),y)
-	echo 'rm -rf $(TARGET_DIR)/usr/man' >> $(PROJECT_BUILD_DIR)/.fakeroot.at
+	echo 'rm -rf $(TARGET_DIR)/usr/man' >> $(BUILD_DIR)/.fakeroot.at
 endif
-	echo 'rm -rf $(TARGET_DIR)/usr/doc/at' >> $(PROJECT_BUILD_DIR)/.fakeroot.at
+	echo 'rm -rf $(TARGET_DIR)/usr/doc/at' >> $(BUILD_DIR)/.fakeroot.at
 	$(INSTALL) -m 0755 -D $(AT_DIR)/debian/rc $(TARGET_DIR)/$(AT_TARGET_SCRIPT)
 
 at: host-fakeroot $(TARGET_DIR)/$(AT_TARGET_SCRIPT)
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 45461f8..eb79134 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -7,12 +7,12 @@
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_SNAPSHOT),y)
 # Be aware that this changes daily....
-BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox
+BUSYBOX_DIR:=$(BUILD_DIR)/busybox
 BUSYBOX_SOURCE:=busybox-snapshot.tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads/snapshots
 else
 BUSYBOX_VERSION=$(call qstrip,$(BR2_BUSYBOX_VERSION))
-BUSYBOX_DIR:=$(PROJECT_BUILD_DIR)/busybox-$(BUSYBOX_VERSION)
+BUSYBOX_DIR:=$(BUILD_DIR)/busybox-$(BUSYBOX_VERSION)
 BUSYBOX_SOURCE:=busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_SITE:=http://www.busybox.net/downloads
 endif
@@ -27,7 +27,7 @@ $(DL_DIR)/$(BUSYBOX_SOURCE):
 	$(call DOWNLOAD,$(BUSYBOX_SITE),$(BUSYBOX_SOURCE))
 
 $(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
-	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
 	# if we have external syslogd, force busybox to use it
 	$(SED) "/#include.*busybox\.h/a#define CONFIG_SYSLOGD" $(BUSYBOX_DIR)/init/init.c
@@ -126,11 +126,11 @@ busybox: $(TARGET_DIR)/bin/busybox
 
 busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE)
 
-busybox-unpacked: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.unpacked
+busybox-unpacked: host-sed $(BUILD_DIR) $(BUSYBOX_DIR)/.unpacked
 
-busybox-config: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.config
+busybox-config: host-sed $(BUILD_DIR) $(BUSYBOX_DIR)/.config
 
-busybox-menuconfig: host-sed $(PROJECT_BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.config
+busybox-menuconfig: host-sed $(BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.config
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
 
 busybox-update:
diff --git a/package/busybox/initramfs.mk b/package/busybox/initramfs.mk
index c67e866..afb80f9 100644
--- a/package/busybox/initramfs.mk
+++ b/package/busybox/initramfs.mk
@@ -6,7 +6,7 @@
 ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
 
 BUSYBOX_INITRAMFS_DIR:=$(BUSYBOX_DIR)-initramfs
-BR2_INITRAMFS_DIR:=$(PROJECT_BUILD_DIR)/initramfs
+BR2_INITRAMFS_DIR:=$(BUILD_DIR)/initramfs
 BB_INITRAMFS_TARGET:=$(IMAGE).initramfs_lst
 
 $(BUSYBOX_INITRAMFS_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
@@ -105,39 +105,39 @@ $(BR2_INITRAMFS_DIR)/bin/busybox: $(BUSYBOX_INITRAMFS_DIR)/busybox
 
 
 $(BB_INITRAMFS_TARGET): host-fakeroot $(BR2_INITRAMFS_DIR)/bin/busybox
-	ln -fs bin/busybox $(PROJECT_BUILD_DIR)/initramfs/init
-	mkdir -p $(PROJECT_BUILD_DIR)/initramfs/etc
+	ln -fs bin/busybox $(BUILD_DIR)/initramfs/init
+	mkdir -p $(BUILD_DIR)/initramfs/etc
 	cat target/generic/target_busybox_skeleton/etc/inittab > \
-		$(PROJECT_BUILD_DIR)/initramfs/etc/inittab
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
-	(echo "chown -R 0:0 $(PROJECT_BUILD_DIR)/initramfs"; \
-	 echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(PROJECT_BUILD_DIR)/initramfs"; \
-	 echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(PROJECT_BUILD_DIR)/initramfs > $(BB_INITRAMFS_TARGET)"; \
-	) > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
-	chmod +x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+		$(BUILD_DIR)/initramfs/etc/inittab
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+	(echo "chown -R 0:0 $(BUILD_DIR)/initramfs"; \
+	 echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(BUILD_DIR)/initramfs"; \
+	 echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(BUILD_DIR)/initramfs > $(BB_INITRAMFS_TARGET)"; \
+	) > $(BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+	chmod +x $(BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	$(HOST_DIR)/usr/bin/fakeroot -- \
-		$(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+		$(BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(BB_INITRAMFS_TARGET))
 	touch -c $@
 
-$(PROJECT_BUILD_DIR)/.initramfs_done: $(BR2_INITRAMFS_DIR)/bin/busybox \
+$(BUILD_DIR)/.initramfs_done: $(BR2_INITRAMFS_DIR)/bin/busybox \
 					$(BB_INITRAMFS_TARGET)
 	touch $@
 
 busybox-initramfs-source:
-busybox-initramfs: $(PROJECT_BUILD_DIR)/.initramfs_done
+busybox-initramfs: $(BUILD_DIR)/.initramfs_done
 
 busybox-initramfs-menuconfig: host-sed $(BUILD_DIR) busybox-source $(BUSYBOX_INITRAMFS_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_INITRAMFS_DIR) menuconfig
 
 busybox-initramfs-clean:
-	rm -f $(BUSYBOX_INITRAMFS_DIR)/busybox $(PROJECT_BUILD_DIR)/.initramfs_*
+	rm -f $(BUSYBOX_INITRAMFS_DIR)/busybox $(BUILD_DIR)/.initramfs_*
 	rm -rf $(BR2_INITRAMFS_DIR) $(BB_INITRAMFS_TARGET)
 	-$(MAKE) -C $(BUSYBOX_INITRAMFS_DIR) clean
 
 busybox-initramfs-dirclean:
 	rm -rf $(BUSYBOX_INITRAMFS_DIR) $(BR2_INITRAMFS_DIR) \
-		$(PROJECT_BUILD_DIR)/.initramfs_*
+		$(BUILD_DIR)/.initramfs_*
 endif
 #############################################################
 #
diff --git a/package/customize/customize.mk b/package/customize/customize.mk
index 4fe4b8b..780e42b 100644
--- a/package/customize/customize.mk
+++ b/package/customize/customize.mk
@@ -6,14 +6,14 @@
 CUST_DIR:=package/customize/source
 
 $(BUILD_DIR)/.customize:
-	rm -f $(PROJECT_BUILD_DIR)/series
+	rm -f $(BUILD_DIR)/series
 	(cd $(CUST_DIR); \
-	 /bin/ls -d * > $(PROJECT_BUILD_DIR)/series || \
-	 touch $(PROJECT_BUILD_DIR)/series )
-	for f in `cat $(PROJECT_BUILD_DIR)/series`; do \
+	 /bin/ls -d * > $(BUILD_DIR)/series || \
+	 touch $(BUILD_DIR)/series )
+	for f in `cat $(BUILD_DIR)/series`; do \
 		cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f; \
 	done
-	rm -f $(PROJECT_BUILD_DIR)/series
+	rm -f $(BUILD_DIR)/series
 	touch $@
 
 customize: $(BUILD_DIR)/.customize
diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 6a1c12a..058e965 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -13,7 +13,7 @@ LINUX_FUSION_INSTALL_TARGET = YES
 # BR2_LINUX26_VERSION is not really dependable
 # LINUX26_VERSION is not yet set.
 # Retrieve REAL kernel version from file.
-LINUX_FOR_FUSION=`cat $(PROJECT_BUILD_DIR)/.linux-version`
+LINUX_FOR_FUSION=`cat $(BUILD_DIR)/.linux-version`
 
 LINUX_FUSION_DIR:=$(BUILD_DIR)/linux-fusion-$(LINUX_FUSION_VERSION)
 LINUX_FUSION_ETC_DIR:=$(TARGET_DIR)/etc/udev/rules.d
@@ -21,14 +21,14 @@ LINUX_FUSION_ETC_DIR:=$(TARGET_DIR)/etc/udev/rules.d
 LINUX_FUSION_CAT:=$(ZCAT)
 
 LINUX_FUSION_MAKE_OPTS:=  KERNEL_VERSION=$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(PROJECT_BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(PROJECT_BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS += KERNEL_BUILD=$(BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
+LINUX_FUSION_MAKE_OPTS += KERNEL_SOURCE=$(BUILD_DIR)/linux-$(LINUX_FOR_FUSION)
 
 LINUX_FUSION_MAKE_OPTS += SYSROOT=$(STAGING_DIR)
 LINUX_FUSION_MAKE_OPTS += ARCH=$(BR2_ARCH)
 LINUX_FUSION_MAKE_OPTS += CROSS_COMPILE=$(TARGET_CROSS)
 LINUX_FUSION_MAKE_OPTS += KERNEL_MODLIB=/lib/modules/$(LINUX_FOR_FUSION)
-LINUX_FUSION_MAKE_OPTS += DESTDIR=$(PROJECT_BUILD_DIR)/root
+LINUX_FUSION_MAKE_OPTS += DESTDIR=$(BUILD_DIR)/root
 LINUX_FUSION_MAKE_OPTS += HEADERDIR=$(STAGING_DIR)
 #LINUX_FUSION_MAKE_OPTS += 
 
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 355be02..7be12fd 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -48,7 +48,7 @@ $(LTP_TESTSUITE_DIR)/.installed: $(LTP_TESTSUITE_DIR)/.compiled
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) ' \
 			'-C $(LTP_TESTSUITE_DIR) install' \
-			> $(PROJECT_BUILD_DIR)/.fakeroot.ltp
+			> $(BUILD_DIR)/.fakeroot.ltp
 	touch $@
 
 ltp-testsuite: host-fakeroot $(LTP_TESTSUITE_DIR)/.installed
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index e47bf37..bf8e668 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -59,7 +59,7 @@ NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPCDEBUG) += usr/sbin/rpcdebug
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_LOCKD) += usr/sbin/rpc.lockd
 NFS_UTILS_TARGETS_$(BR2_PACKAGE_NFS_UTILS_RPC_RQUOTAD) += usr/sbin/rpc.rquotad
 
-$(PROJECT_BUILD_DIR)/.fakeroot.nfs-utils: $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY)
+$(BUILD_DIR)/.fakeroot.nfs-utils: $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY)
 	# Use fakeroot to pretend to do 'make install' as root
 	echo '$(MAKE) prefix=$(TARGET_DIR)/usr statedir=$(TARGET_DIR)/var/lib/nfs $(TARGET_CONFIGURE_OPTS) -C $(NFS_UTILS_DIR) install' > $@
 	echo 'rm -f $(TARGET_DIR)/usr/bin/event_rpcgen.py $(TARGET_DIR)/usr/sbin/nhfs* $(TARGET_DIR)/usr/sbin/nfsstat $(TARGET_DIR)/usr/sbin/showmount' >> $@
@@ -70,7 +70,7 @@ $(PROJECT_BUILD_DIR)/.fakeroot.nfs-utils: $(NFS_UTILS_DIR)/$(NFS_UTILS_BINARY)
 	echo "file; done" >> $@
 	echo 'rm -rf $(TARGET_DIR)/var/lib/nfs' >> $@
 
-$(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY): $(PROJECT_BUILD_DIR)/.fakeroot.nfs-utils
+$(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY): $(BUILD_DIR)/.fakeroot.nfs-utils
 	touch -c $@
 
 nfs-utils: host-fakeroot $(TARGET_DIR)/$(NFS_UTILS_TARGET_BINARY)
@@ -81,7 +81,7 @@ nfs-utils-clean:
 		rm -f $(TARGET_DIR)/$$file; \
 	done
 	-$(MAKE) -C $(NFS_UTILS_DIR) clean
-	rm -f $(PROJECT_BUILD_DIR)/.fakeroot.nfs-utils
+	rm -f $(BUILD_DIR)/.fakeroot.nfs-utils
 
 nfs-utils-dirclean:
 	rm -rf $(NFS_UTILS_DIR)
diff --git a/project/Config.in b/project/Config.in
deleted file mode 100644
index 0e9e781..0000000
--- a/project/Config.in
+++ /dev/null
@@ -1,25 +0,0 @@
-comment "Project Options"
-
-config BR2_PROJECT
-	string "Project name"
-	default "uclibc"
-	help
-	  The project name is used to define subdirectories
-	  * where the Board Support Packages are built
-	    (Linux,Root fs Bootmonitor,Utilities etc.)
-	  * where the resulting binaries are stored.
-	  Older targets may still build in the build_<arch>
-	  and store binaries in the top directory.
-
-config BR2_HOSTNAME
-	string "hostname"
-	default "uclibc"
-	help
-	  The hostname string is stored in "/etc/hostname"
-
-config BR2_BANNER
-	string "banner"
-	default "Welcome to Buildroot"
-	help
-	  The banner string is stored in "/etc/issue"
-
diff --git a/project/Makefile.in b/project/Makefile.in
deleted file mode 100644
index 69c8572..0000000
--- a/project/Makefile.in
+++ /dev/null
@@ -1,79 +0,0 @@
-PROJECT:=$(call qstrip,$(BR2_PROJECT))
-TARGET_HOSTNAME:=$(call qstrip,$(BR2_HOSTNAME))
-BANNER:=$(call qstrip,$(BR2_BANNER))
-
-# silent mode requested?
-QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q,)
-
-# Strip off the annoying quoting
-ARCH:=$(call qstrip,$(BR2_ARCH))
-ifeq ($(ARCH),xtensa)
-ARCH:=$(ARCH)_$(call qstrip,$(BR2_xtensa_core_name))
-endif
-WGET:=$(call qstrip,$(BR2_WGET)) $(SPIDER) $(QUIET)
-SVN_CO:=$(call qstrip,$(BR2_SVN_CO)) $(QUIET)
-SVN_UP:=$(call qstrip,$(BR2_SVN_UP)) $(QUIET)
-BZR_CO:=$(call qstrip,$(BR2_BZR_CO)) $(QUIET)
-BZR_UP:=$(call qstrip,$(BR2_BZR_UP)) $(QUIET)
-GIT:=$(call qstrip,$(BR2_GIT)) $(QUIET)
-ZCAT:=$(call qstrip,$(BR2_ZCAT))
-BZCAT:=$(call qstrip,$(BR2_BZCAT))
-TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
-
-# Buildroot supports building out of tree similarly to the Linux kernel.
-# To use, add O= to the make command line (make O=/tmp/build)
-BASE_DIR:=$(shell pwd)
-ifdef O
-ifeq ("$(origin O)", "command line")
-BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)
-$(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
-
-# other packages might also support Linux-style out of tree builds
-# with the O=<dir> syntax (E.G. Busybox does). As make automatically
-# forwards command line variable definitions those packages get very
-# confused. Fix this by telling make to not do so
-MAKEOVERRIDES =
-endif
-endif
-
-TOPDIR_PREFIX:=$(call qstrip,$(BR2_TOPDIR_PREFIX))_
-TOPDIR_SUFFIX:=_$(call qstrip,$(BR2_TOPDIR_SUFFIX))
-ifeq ($(TOPDIR_PREFIX),_)
-TOPDIR_PREFIX:=
-endif
-ifeq ($(TOPDIR_SUFFIX),_)
-TOPDIR_SUFFIX:=
-endif
-
-DL_DIR=$(call qstrip,$(BR2_DL_DIR))
-ifeq ($(DL_DIR),)
-DL_DIR:=$(BASE_DIR)/dl
-endif
-
-# All non-configurable packages should be built in BUILD_DIR
-BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
-
-GNU_TARGET_SUFFIX:=-$(call qstrip,$(BR2_GNU_TARGET_SUFFIX))
-
-STAGING_DIR:=$(call qstrip,$(BR2_STAGING_DIR))
-
-# packages compiled for the host goes here
-HOST_DIR:=$(BUILD_DIR)/host_dir
-
-# stamp (dependency) files go here
-STAMP_DIR:=$(BUILD_DIR)/stamps
-
-# All configurable packages (like Busybox,Linux etc) should be built
-# in PROJECT_BUILD_DIR
-PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
-BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
-TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
-
-# define values for prepatched source trees for toolchains
-VENDOR_SITE:=$(call qstrip,$(BR2_VENDOR_SITE))
-VENDOR_SUFFIX:=$(call qstrip,$(BR2_VENDOR_SUFFIX))
-VENDOR_BINUTILS_RELEASE:=$(call qstrip,$(BR2_VENDOR_BINUTILS_RELEASE))
-VENDOR_GCC_RELEASE:=$(call qstrip,$(BR2_VENDOR_GCC_RELEASE))
-VENDOR_UCLIBC_RELEASE:=$(call qstrip,$(BR2_VENDOR_UCLIBC_RELEASE))
-VENDOR_GDB_RELEASE:=$(call qstrip,$(BR2_VENDOR_GDB_RELEASE))
-VENDOR_PATCH_DIR:=$(call qstrip,$(BR2_VENDOR_PATCH_DIR))
diff --git a/project/project.mk b/project/project.mk
deleted file mode 100644
index 3074eff..0000000
--- a/project/project.mk
+++ /dev/null
@@ -1,52 +0,0 @@
-PROJECT_FILE:=$(LOCAL)/$(PROJECT)/$(PROJECT).config
-
-
-.PHONY: target-host-info saveconfig getconfig
-
-target-host-info: $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname $(TARGET_DIR)/etc/br-version
-
-$(TARGET_DIR)/etc/issue: .config
-	mkdir -p $(TARGET_DIR)/etc
-	echo "" > $@
-	echo "" >> $@
-	echo "$(BANNER)" >> $@
-
-$(TARGET_DIR)/etc/hostname: .config
-	mkdir -p $(TARGET_DIR)/etc
-	echo "$(TARGET_HOSTNAME)" > $@
-
-$(TARGET_DIR)/etc/br-version: .config
-	mkdir -p $(TARGET_DIR)/etc
-	echo $(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion) >$@
-
-saveconfig:
-	mkdir -p $(LOCAL)/$(PROJECT)
-	-cp .config $(PROJECT_FILE)
-	if [ -f $(LINUX26_DIR)/.config ]; then \
-		cp $(LINUX26_DIR)/.config \
-			$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config; \
-		$(SED) '/BR2_PACKAGE_LINUX_KCONFIG/d' $(PROJECT_FILE); \
-		echo "BR2_PACKAGE_LINUX_KCONFIG=\"$(LOCAL)/$(PROJECT)/linux-$(LINUX26_VERSION).config\"" >> $(PROJECT_FILE); \
-		$(SED) '/BR2_BOARD_PATH/d' $(PROJECT_FILE); \
-		echo "BR2_BOARD_PATH=\"$(LOCAL)/$(PROJECT)\"" >> $(PROJECT_FILE); \
-	fi
-	if [ -f $(BUSYBOX_DIR)/.config ]; then \
-		cp $(BUSYBOX_DIR)/.config \
-			$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config; \
-		$(SED) '/BR2_PACKAGE_BUSYBOX_CONFIG/d' $(PROJECT_FILE); \
-		echo "BR2_PACKAGE_BUSYBOX_CONFIG=\"$(LOCAL)/$(PROJECT)/busybox-$(BUSYBOX_VERSION).config\"" >> $(PROJECT_FILE); \
-	fi
-	if [ -f $(UCLIBC_DIR)/.config ]; then \
-		cp $(UCLIBC_DIR)/.config \
-			$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config; \
-		$(SED) '/BR2_UCLIBC_CONFIG/d' $(PROJECT_FILE); \
-		echo "BR2_UCLIBC_CONFIG=\"$(LOCAL)/$(PROJECT)/uclibc-$(UCLIBC_VER).config\"" >> $(PROJECT_FILE); \
-	fi
-	if [ -f $(UBOOT_DIR)/include/configs/$(PROJECT).h ]; then \
-		mkdir -p $(LOCAL)/$(PROJECT)/u-boot; \
-		cp $(UBOOT_DIR)/include/configs/$(PROJECT).h \
-			$(LOCAL)/$(PROJECT)/u-boot/$(PROJECT).h; \
-	fi
-
-getconfig:
-	-cp $(LOCAL)/$(PROJECT)/$(PROJECT).config .config
diff --git a/target/cpio/cpioroot.mk b/target/cpio/cpioroot.mk
index 0dbdb2e..2197d10 100644
--- a/target/cpio/cpioroot.mk
+++ b/target/cpio/cpioroot.mk
@@ -40,21 +40,21 @@ cpioroot-init:
 
 $(CPIO_BASE): host-fakeroot makedevs cpioroot-init
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 endif
 	# Use fakeroot so tar believes the previous fakery
 	echo "cd $(TARGET_DIR) && find . | cpio --quiet -o -H newc > $(CPIO_BASE)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
-	#- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
+	#- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CPIO_BASE))
 ifeq ($(CPIO_ROOTFS_COMPRESSOR),)
 ifneq ($(ROOTFS_CPIO_COPYTO),)
 	$(Q)cp -f $(CPIO_BASE) $(ROOTFS_CPIO_COPYTO)
diff --git a/target/cramfs/cramfs.mk b/target/cramfs/cramfs.mk
index 99f9f79..79353b5 100644
--- a/target/cramfs/cramfs.mk
+++ b/target/cramfs/cramfs.mk
@@ -52,21 +52,21 @@ CRAMFS_TARGET=$(IMAGE).cramfs
 
 cramfsroot: host-fakeroot makedevs cramfs
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 endif
 	# Use fakeroot so mkcramfs believes the previous fakery
 	echo "$(CRAMFS_DIR)/mkcramfs -q $(CRAMFS_OPTS) " \
-		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
-	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 
 cramfsroot-source: cramfs-source
 
diff --git a/target/device/Atmel/DataFlashBoot/DataflashBoot.mk b/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
index c3dc857..8939c28 100644
--- a/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
+++ b/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
@@ -8,16 +8,16 @@ DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
 ATMEL_MIRROR:=$(call qstrip,$(BR2_ATMEL_MIRROR))
 DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
-DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)
+DATAFLASHBOOT_DIR:=$(BUILD_DIR)/$(DATAFLASHBOOT_NAME)
 DATAFLASHBOOT_BINARY:=$(DATAFLASHBOOT_NAME).bin
 
 $(DL_DIR)/$(DATAFLASHBOOT_SOURCE):
 	 $(call DOWNLOAD,$(DATAFLASHBOOT_SITE),$(DATAFLASHBOOT_SOURCE))
 
 $(DATAFLASHBOOT_DIR)/.unpacked: $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
-	mkdir -p $(PROJECT_BUILD_DIR)
+	mkdir -p $(BUILD_DIR)
 	ls $(DL_DIR)/$(DATAFLASHBOOT_SOURCE)
-	$(BZCAT) $(DL_DIR)/$(DATAFLASHBOOT_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	$(BZCAT) $(DL_DIR)/$(DATAFLASHBOOT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(DATAFLASHBOOT_DIR)/.unpacked
 
 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY): $(DATAFLASHBOOT_DIR)/.unpacked
diff --git a/target/device/Atmel/Makefile.in b/target/device/Atmel/Makefile.in
index bb03529..bf7a2d1 100644
--- a/target/device/Atmel/Makefile.in
+++ b/target/device/Atmel/Makefile.in
@@ -38,7 +38,7 @@ LINUX26_RC_PATCH:=$(call qstrip,$(BR2_LINUX26_RC_PATCH))
 LINUX26_KCONFIG:=$(BOARD_PATH)/$(BOARD_NAME)-linux-$(LINUX26_VERSION).config
 
 # This should be part of target/linux/Makefile.in
-LINUX26_BUILD_DIR:=$(PROJECT_BUILD_DIR)
+LINUX26_BUILD_DIR:=$(BUILD_DIR)
 
 #LINUX26_BINLOC=$(LINUX26_FORMAT)
 #LINUX26_BINLOC:=$(BINARIES_DIR)/$(LINUX26_KERNEL)
@@ -80,7 +80,7 @@ include $(ATMEL_PATH)/at91bootstrap/at91bootstrap.mk
 endif
 
 atmel_status:
-	@echo PROJECT_BUILD_DIR=$(PROJECT_BUILD_DIR)
+	@echo BUILD_DIR=$(BUILD_DIR)
 	@echo BOARD_NAME=$(BOARD_NAME)
 	@echo BR2_BOARD_PATH=$(BR2_BOARD_PATH)
 	@echo BR2_MAJOR_MINOR=$(BR2_LINUX_MAJOR_VERSION)$(BR2_LINUX_MINOR_VERSION)
diff --git a/target/device/Atmel/at91bootstrap/at91bootstrap.mk b/target/device/Atmel/at91bootstrap/at91bootstrap.mk
index 92da683..32ed3e2 100644
--- a/target/device/Atmel/at91bootstrap/at91bootstrap.mk
+++ b/target/device/Atmel/at91bootstrap/at91bootstrap.mk
@@ -10,7 +10,7 @@ AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
 ATMEL_MIRROR:=$(call qstrip,$(BR2_ATMEL_MIRROR))
 AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
-AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
+AT91BOOTSTRAP_DIR:=$(BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
 AT91BOOTSTRAP:=$(call qstrip,$(BR2_AT91BOOTSTRAP))
 AT91BOOTSTRAP_ZCAT:=$(BZCAT)
 
@@ -37,8 +37,8 @@ $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE):
 	 $(call DOWNLOAD,$(AT91BOOTSTRAP_SITE),$(AT91BOOTSTRAP_SOURCE))
 
 $(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
-	mkdir -p $(PROJECT_BUILD_DIR)
-	$(AT91BOOTSTRAP_ZCAT) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(BUILD_DIR)
+	$(AT91BOOTSTRAP_ZCAT) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) target/device/Atmel/at91bootstrap/ at91bootstrap-$(AT91BOOTSTRAP_VERSION)\*.patch
 	touch $(AT91BOOTSTRAP_DIR)/.unpacked
 
diff --git a/target/device/Config.in b/target/device/Config.in
index 0e6e09a..6b7f11a 100644
--- a/target/device/Config.in
+++ b/target/device/Config.in
@@ -1,7 +1,5 @@
 menu "Target options"
 
-source "project/Config.in"
-
 comment "Preset Devices"
 
 source "target/device/ARMLTD/Config.in"
diff --git a/target/device/KwikByte/Makefile.in b/target/device/KwikByte/Makefile.in
index d889bc2..1f0b60b 100644
--- a/target/device/KwikByte/Makefile.in
+++ b/target/device/KwikByte/Makefile.in
@@ -20,7 +20,7 @@ LINUX26_KCONFIG:=$(BOARD_PATH)/$(BOARD_NAME)-linux.config
 endif
 
 # This should be part of target/linux/Makefile.in
-LINUX26_BUILD_DIR:=$(PROJECT_BUILD_DIR)
+LINUX26_BUILD_DIR:=$(BUILD_DIR)
 
 LINUX26_BINLOC=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 
@@ -38,7 +38,7 @@ endif
 # Needs to be AFTER board specific Makefiles
 
 kwikbyte_status:
-	@echo PROJECT_BUILD_DIR=$(PROJECT_BUILD_DIR)
+	@echo BUILD_DIR=$(BUILD_DIR)
 	@echo BOARD_NAME=$(BOARD_NAME)
 	@echo BR2_BOARD_PATH=$(BR2_BOARD_PATH)
 	@echo MAJOR_MINOR=$(LINUX_MAJOR_VER)$(LINUX_MINOR_VER)
diff --git a/target/ext2/ext2root.mk b/target/ext2/ext2root.mk
index 11624cf..49b53f4 100644
--- a/target/ext2/ext2root.mk
+++ b/target/ext2/ext2root.mk
@@ -87,14 +87,14 @@ endif
 
 $(EXT2_BASE): host-fakeroot makedevs genext2fs
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 endif
 	# Use fakeroot so genext2fs believes the previous fakery
 ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
@@ -106,14 +106,14 @@ ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
 	set -x; \
 	echo "$(GENEXT2_DIR)/genext2fs -b $$GENEXT2_SIZE " \
 		"-N $$GENEXT2_INODES -d $(TARGET_DIR) " \
-		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 else
 	echo "$(GENEXT2_DIR)/genext2fs -d $(TARGET_DIR) " \
-		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+		"$(EXT2_OPTS) $(EXT2_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 endif
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
-	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
 
 ifneq ($(EXT2_ROOTFS_COMPRESSOR),)
 $(EXT2_BASE).$(EXT2_ROOTFS_COMPRESSOR_EXT): $(EXT2_ROOTFS_COMPRESSOR_PREREQ) $(EXT2_BASE)
diff --git a/target/initramfs/initramfs.mk b/target/initramfs/initramfs.mk
index 195a929..0030278 100644
--- a/target/initramfs/initramfs.mk
+++ b/target/initramfs/initramfs.mk
@@ -18,19 +18,19 @@ $(INITRAMFS_TARGET) initramfs: host-fakeroot makedevs
 	rm -f $(TARGET_DIR)/init
 	ln -s sbin/init $(TARGET_DIR)/init
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 	# Use fakeroot so gen_initramfs_list.sh believes the previous fakery
 	echo "$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $(INITRAMFS_TARGET)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	-rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	-rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
 initramfs-source:
 
diff --git a/target/iso9660/iso9660.mk b/target/iso9660/iso9660.mk
index 4dfa1ad..94edf63 100644
--- a/target/iso9660/iso9660.mk
+++ b/target/iso9660/iso9660.mk
@@ -60,17 +60,17 @@ $(ISO9660_TARGET): host-fakeroot $(LINUX_KERNEL) $(EXT2_TARGET) grub mkisofs
 	cp $(LINUX_KERNEL) $(ISO9660_TARGET_DIR)/kernel
 	cp $(EXT2_TARGET) $(ISO9660_TARGET_DIR)/initrd
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	echo "chown -R 0:0 $(ISO9660_TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 	# Use fakeroot so mkisofs believes the previous fakery
 	echo "$(MKISOFS_TARGET) -R -b boot/grub/stage2_eltorito -no-emul-boot " \
 		"-boot-load-size 4 -boot-info-table -o $(ISO9660_TARGET) $(ISO9660_TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
-	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ISO9660_TARGET))
 
 iso9660root: $(ISO9660_TARGET)
 	echo $(ISO9660_TARGET)
diff --git a/target/jffs2/jffs2root.mk b/target/jffs2/jffs2root.mk
index 9d67347..7d31417 100644
--- a/target/jffs2/jffs2root.mk
+++ b/target/jffs2/jffs2root.mk
@@ -46,28 +46,28 @@ endif
 #
 $(JFFS2_TARGET): host-fakeroot makedevs mtd-host
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 endif
 	# Use fakeroot so mkfs.jffs2 believes the previous fakery
 ifneq ($(BR2_TARGET_ROOTFS_JFFS2_SUMMARY),)
 	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $(JFFS2_TARGET).nosummary && " \
 		"$(SUMTOOL) $(SUMTOOL_OPTS) -i $(JFFS2_TARGET).nosummary -o $(JFFS2_TARGET) && " \
 		"rm $(JFFS2_TARGET).nosummary" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 else
 	echo "$(MKFS_JFFS2) $(JFFS2_OPTS) -d $(TARGET_DIR) -o $(JFFS2_TARGET)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 endif
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
-	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(JFFS2_TARGET))
 	@ls -l $(JFFS2_TARGET)
 ifeq ($(BR2_JFFS2_TARGET_SREC),y)
 	$(TARGET_CROSS)objcopy -I binary -O srec --adjust-vma 0xa1000000 $(JFFS2_TARGET) $(JFFS2_TARGET).srec
diff --git a/target/linux/Makefile.in b/target/linux/Makefile.in
index 742fe19..cf430d9 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -69,7 +69,7 @@ LINUX26_KERNEL_NAME=$(BINARIES_DIR)/$(LINUX26_FORMAT)$(ROOTFS_STRIPPED_SUFFIX)
 endif
 
 # Version of Linux AFTER patches
-LINUX26_DIR=$(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # for packages that need it
 LINUX_VERSION:=$(LINUX26_VERSION)
@@ -106,10 +106,10 @@ endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
 	@echo "*** Unpacking kernel source"
-	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
-	mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
+	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
 endif
 	touch $@
 
diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index 9de4735..b4774ca 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -48,7 +48,7 @@ BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
 endif
 
 # Version of Linux AFTER patches
-LINUX26_DIR:=$(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_DIR:=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # for packages that need it
 LINUX_VERSION:=$(LINUX26_VERSION)
@@ -132,7 +132,7 @@ endif
 # --------------
 # UIMAGE
 ifeq ($(LINUX26_FORMAT),uImage)
-LINUX26_MKIMAGE_DIR:=$(PROJECT_BUILD_DIR)/u-boot-tools
+LINUX26_MKIMAGE_DIR:=$(BUILD_DIR)/u-boot-tools
 LINUX26_MKIMAGE_DEP:=$(LINUX26_MKIMAGE_DIR)/mkimage
 ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
@@ -200,17 +200,17 @@ endif
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
 	@echo "*** Unpacking kernel source"
-	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
-	mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
-	echo $(LINUX26_VERSION_PROBED) > $(PROJECT_BUILD_DIR)/.linux-version
+	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
+	echo $(LINUX26_VERSION_PROBED) > $(BUILD_DIR)/.linux-version
 endif
 	touch $@
 
 
 # -----------------------------------------------------------------------------
-LINUX26_TARGETS+=$(LINUX26_KERNEL) $(PROJECT_BUILD_DIR)/.linux-version
+LINUX26_TARGETS+=$(LINUX26_KERNEL) $(BUILD_DIR)/.linux-version
 
 ifeq ($(BR2_LINUX_COPYTO_ROOTFS),y)
 LINUX26_TARGETS+=$(TARGET_DIR)/boot/$(LINUX26_KERNEL_NAME)
@@ -381,7 +381,7 @@ $(LINUX26_KERNEL): $(LINUX26_DIR)/$(LINUX26_BINLOC)
 	touch $@
 
 # -----------------------------------------------------------------------------
-$(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed: $(LINUX26_DIR)/.depend_done
+$(STAMP_DIR)/linux_modules_target_installed: $(LINUX26_DIR)/.depend_done
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
 	# Make Linux depend on modules only if enabled in the .config.
@@ -441,8 +441,8 @@ $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	touch $@
 endif
 
-$(PROJECT_BUILD_DIR)/.linux-version: $(LINUX26_KERNEL)
-	echo $(LINUX26_VERSION_PROBED) > $(PROJECT_BUILD_DIR)/.linux-version
+$(BUILD_DIR)/.linux-version: $(LINUX26_KERNEL)
+	echo $(LINUX26_VERSION_PROBED) > $(BUILD_DIR)/.linux-version
 	echo LINUX_MODULES=`$(LINUX26_VERSION_PROBED)`
 
 $(LINUX26_MKIMAGE_DIR)/mkimage:	$(U_BOOT_TOOLS)
@@ -451,9 +451,9 @@ $(LINUX26_MKIMAGE_DIR)/mkimage:	$(U_BOOT_TOOLS)
 
 linux26: $(LINUX26_TARGETS)
 
-linux26-version: $(PROJECT_BUILD_DIR)/.linux-version
+linux26-version: $(BUILD_DIR)/.linux-version
 
-linux26-modules: cross-depmod26 $(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed
+linux26-modules: cross-depmod26 $(STAMP_DIR)/linux_modules_target_installed
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
 
@@ -470,7 +470,7 @@ linux26-force:
 
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
-	rm -f $(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed
+	rm -f $(STAMP_DIR)/linux_modules_target_installed
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
 	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean
 
@@ -531,7 +531,7 @@ linux-status:
 	@echo LINUX26_TARGETS=$(LINUX26_TARGETS)
 	@echo LINUX26_VERSION=$(LINUX26_VERSION)
 	@echo LINUX26_MAKE_FLAGS=$(LINUX26_MAKE_FLAGS)
-	@echo PROJECT_BUILD_DIR=$(PROJECT_BUILD_DIR)
+	@echo BUILD_DIR=$(BUILD_DIR)
 	@echo TARGETS=$(TARGETS)
 
 endif
diff --git a/target/romfs/romfs.mk b/target/romfs/romfs.mk
index 2e2470b..6e7fbee 100644
--- a/target/romfs/romfs.mk
+++ b/target/romfs/romfs.mk
@@ -38,20 +38,20 @@ ROMFS_TARGET=$(IMAGE).romfs
 
 romfsroot: host-fakeroot makedevs romfs
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 endif
 	# Use fakeroot so genromfs believes the previous fakery
-	echo "$(ROMFS_DIR)/genromfs -d $(TARGET_DIR) -f $(ROMFS_TARGET)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
-	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	echo "$(ROMFS_DIR)/genromfs -d $(TARGET_DIR) -f $(ROMFS_TARGET)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(ROMFS_TARGET))
 
 romfsroot-source: romfs-source
 
diff --git a/target/squashfs/squashfsroot.mk b/target/squashfs/squashfsroot.mk
index 3ff0f3b..ebb0cd2 100644
--- a/target/squashfs/squashfsroot.mk
+++ b/target/squashfs/squashfsroot.mk
@@ -48,24 +48,24 @@ SQUASHFS_TARGET:=$(IMAGE).squashfs
 
 squashfsroot: host-fakeroot makedevs squashfs
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 endif
 	# Use fakeroot so mksquashfs believes the previous fakery
 	echo "$(SQUASHFS_DIR)/squashfs-tools/mksquashfs " \
 		    "$(TARGET_DIR) $(SQUASHFS_TARGET) " \
 		    "-noappend $(SQUASHFS_ENDIANNESS)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 	chmod 0644 $(SQUASHFS_TARGET)
-	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(SQUASHFS_TARGET))
 
 squashfsroot-source: squashfs-source
 
diff --git a/target/tar/tarroot.mk b/target/tar/tarroot.mk
index a62f5bf..a7e95df 100644
--- a/target/tar/tarroot.mk
+++ b/target/tar/tarroot.mk
@@ -25,20 +25,20 @@ ROOTFS_TAR_COPYTO:=$(call qstrip,$(BR2_TARGET_ROOTFS_TAR_COPYTO))
 
 tarroot: host-fakeroot makedevs
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 endif
 	# Use fakeroot so tar believes the previous fakery
 	echo "tar -c$(TAR_OPTS)f $(TAR_TARGET) -C $(TARGET_DIR) ." \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 ifneq ($(TAR_COMPRESSOR),)
 	-rm -f $(TAR_TARGET).$()
 	PATH="$(STAGING_DIR)/sbin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/sbin:$(STAGING_DIR)/usr/bin:$(PATH)" $(TAR_COMPRESSOR) $(TAR_TARGET) > $(TAR_TARGET).$(TAR_COMPRESSOR_EXT)
@@ -46,7 +46,7 @@ endif
 ifneq ($(ROOTFS_TAR_COPYTO),)
 	$(Q)cp -f $(TAR_TARGET) $(ROOTFS_TAR_COPYTO)
 endif
-	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
 tarroot-source:
 
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index 3dc78b1..6987737 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -8,11 +8,11 @@ U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 
 U_BOOT_SITE:=$(call qstrip,$(BR2_U_BOOT_SITE))
-U_BOOT_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
-U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
+U_BOOT_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
+U_BOOT_PATCH_DIR:=$(BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
-U_BOOT_TARGET_BIN:=$(PROJECT)-u-boot-$(U_BOOT_VERSION)-$(DATE).bin
+U_BOOT_TARGET_BIN:=u-boot-$(U_BOOT_VERSION)-$(DATE).bin
 
 U_BOOT_TOOLS_BIN:=mkimage
 U_BOOT_TOOLS:=$(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN)
@@ -66,7 +66,7 @@ $(DL_DIR)/$(U_BOOT_SOURCE):
 
 $(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
 	$(U_BOOT_CAT) $(DL_DIR)/$(U_BOOT_SOURCE) \
-		| tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+		| tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	mkdir -p $(U_BOOT_DIR)
 	touch $@
 
@@ -102,9 +102,6 @@ ifdef BR2_TARGET_UBOOT_DEFAULT_ENV
 	@echo "#define __BR2_ADDED_CONFIG_H" >> $(U_BOOT_INC_CONF_FILE)
 	$(call insert_define, DATE, $(DATE))
 	$(call insert_define, CONFIG_LOAD_SCRIPTS, 1)
-ifneq ($(strip $(BR2_PROJECT)),"")
-	$(call insert_define, CONFIG_HOSTNAME, $(BR2_PROJECT))
-endif
 endif # BR2_TARGET_UBOOT_DEFAULT_ENV
 ifdef BR2_TARGET_UBOOT_NETWORK
 ifneq ($(strip $(BR2_TARGET_UBOOT_IPADDR)),"")
@@ -194,7 +191,7 @@ $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 
 u-boot: $(U_BOOT_TARGETS)
 
-u-boot-autoscript: $(U_BOOT_AUTOSCRIPT).$(PROJECT)
+u-boot-autoscript: $(U_BOOT_AUTOSCRIPT).img
 
 u-boot-clean:
 	-$(MAKE) -C $(U_BOOT_DIR) clean
@@ -249,7 +246,7 @@ endif
 	echo setargs >> $(U_BOOT_AUTOSCRIPT)
 	echo saveenv >> $(U_BOOT_AUTOSCRIPT)
 
-$(U_BOOT_AUTOSCRIPT).$(PROJECT): $(U_BOOT_AUTOSCRIPT) $(MKIMAGE)
+$(U_BOOT_AUTOSCRIPT).img: $(U_BOOT_AUTOSCRIPT) $(MKIMAGE)
 	$(MKIMAGE) -A $(ARCH) \
 				-O linux \
 				-T script \
@@ -258,7 +255,7 @@ $(U_BOOT_AUTOSCRIPT).$(PROJECT): $(U_BOOT_AUTOSCRIPT) $(MKIMAGE)
 				-e 0 \
 				-n "autoscr config" \
 				-d $(U_BOOT_AUTOSCRIPT) \
-				$(U_BOOT_AUTOSCRIPT).$(PROJECT)
+				$(U_BOOT_AUTOSCRIPT).img
 
 
 
diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
index c09c981..e73d4f9 100644
--- a/target/ubifs/ubifsroot.mk
+++ b/target/ubifs/ubifsroot.mk
@@ -77,21 +77,21 @@ endif
 
 $(UBIFS_BASE): host-fakeroot makedevs mkfs.ubifs
 	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	touch $(PROJECT_BUILD_DIR)/.fakeroot.00000
-	cat $(PROJECT_BUILD_DIR)/.fakeroot* > $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+	rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+	touch $(BUILD_DIR)/.fakeroot.00000
+	cat $(BUILD_DIR)/.fakeroot* > $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+	echo "chown -R 0:0 $(TARGET_DIR)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 ifneq ($(TARGET_DEVICE_TABLE),)
 	# Use fakeroot to pretend to create all needed device nodes
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+		>> $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 endif
 	# Use fakeroot so mkfs.ubifs believes the previous fakery
 	echo "$(MKFS_UBIFS_DIR)/mkfs.ubifs -d $(TARGET_DIR) " \
-		"$(UBIFS_OPTS) -o $(UBIFS_BASE)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	$(HOST_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
-	- at rm -f $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+		"$(UBIFS_OPTS) -o $(UBIFS_BASE)" >> $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+	chmod a+x $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+	$(HOST_DIR)/usr/bin/fakeroot -- $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
+	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(UBIFS_TARGET))
 
 ifneq ($(UBIFS_ROOTFS_COMPRESSOR),)
 $(UBIFS_BASE).$(UBIFS_ROOTFS_COMPRESSOR_EXT): $(UBIFS_ROOTFS_COMPRESSOR_PREREQ) $(UBIFS_BASE)
diff --git a/toolchain/gcc/gcc-uclibc-3.x.mk b/toolchain/gcc/gcc-uclibc-3.x.mk
index 131c9bd..dde609b 100644
--- a/toolchain/gcc/gcc-uclibc-3.x.mk
+++ b/toolchain/gcc/gcc-uclibc-3.x.mk
@@ -324,7 +324,7 @@ endif
 	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
-$(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed: $(GCC_BUILD_DIR2)/.installed
+$(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
@@ -354,7 +354,7 @@ endif
 
 cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 cross_compiler gcc: gcc-config $(GCC_BUILD_DIR2)/.installed \
-	$(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed \
+	$(STAMP_DIR)/gcc_libs_target_installed \
 	$(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
@@ -379,7 +379,7 @@ gcc-dirclean: gcc_initial-dirclean
 #############################################################
 GCC_BUILD_DIR3:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
-$(GCC_BUILD_DIR3)/.prepared: $(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
+$(GCC_BUILD_DIR3)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	touch $@
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index e9249c1..4129152 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -352,7 +352,7 @@ endif
 	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
-$(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed: $(GCC_BUILD_DIR2)/.installed
+$(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
@@ -381,7 +381,7 @@ endif
 cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 cross_compiler gcc: uclibc-configured binutils gcc_initial \
 	$(LIBFLOAT_TARGET) uclibc $(GCC_BUILD_DIR2)/.installed \
-	$(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed \
+	$(STAMP_DIR)/gcc_libs_target_installed \
 	$(GCC_TARGETS)
 
 gcc-source: $(DL_DIR)/$(GCC_SOURCE)
@@ -403,7 +403,7 @@ gcc-dirclean: gcc_initial-dirclean
 #############################################################
 GCC_BUILD_DIR3:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
-$(GCC_BUILD_DIR3)/.prepared: $(PROJECT_BUILD_DIR)/autotools-stamps/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
+$(GCC_BUILD_DIR3)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	touch $@
 
-- 
1.6.0.4
