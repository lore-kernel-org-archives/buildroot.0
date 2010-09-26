From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 23:47:07 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile: generate a Makefile
	wrapper in $(O)
Message-ID: <20100926214829.198028B6D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aefad5317f2fd1645ace5a62b6b9643143093173
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If building out-of-tree, add a Makefile wrapper that calls-out to the real
Makefile with proper args.

Avoids having to pass -C and O= every time we call make.

This is highly inspired from how the Linux kernel does it, and portions of
it have been used. We can't use exactly the same implementation as the
kernel does, because:

 - the script writing the wrapper has been expunged of the few lines
   that were too kernel-related: in buildroot we do not need the version
   string in the wrapper, and we do not have a patchlevel version;

 - "in-tree build" does not have the same meaning for the kernel and for
   buildroot: for the kernel, $(O) point to the $(TOPDIR), while for
   buildroot $(O) points to $(TOPDIR)/output.

For more complete explanations, see:
  http://lists.busybox.net/pipermail/buildroot/2010-September/037815.html

[Peter: minor tweaks]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    3 +++
 Makefile           |   45 ++++++++++++++++++++++++++++-----------------
 scripts/mkmakefile |   47 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 17 deletions(-)
 create mode 100755 scripts/mkmakefile

diff --git a/CHANGES b/CHANGES
index b01da23..4fa011f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,6 +15,9 @@
 	Download handling reworked and support for git/svn downloads
 	added.
 
+	A convenience Makefile wrapper is created when using
+	out-of-tree building, similar to how it is done for the kernel.
+
 	New packages: xz
 
 	Updated/fixed packages: alsa-lib, at, avahi, axel, berkeleydb,
diff --git a/Makefile b/Makefile
index faa802b..aab346e 100644
--- a/Makefile
+++ b/Makefile
@@ -45,6 +45,7 @@ space:=$(empty) $(empty)
 ifneq ("$(origin O)", "command line")
 O:=output
 CONFIG_DIR:=$(TOPDIR)
+NEED_WRAPPER=
 else
 # other packages might also support Linux-style out of tree builds
 # with the O=<dir> syntax (E.G. Busybox does). As make automatically
@@ -60,6 +61,7 @@ override O:=$(O)
 CONFIG_DIR:=$(O)
 # we need to pass O= everywhere we call back into the toplevel makefile
 EXTRAMAKEARGS = O=$(O)
+NEED_WRAPPER=y
 endif
 
 # $(shell find . -name *_defconfig |sed 's/.*\///')
@@ -324,7 +326,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 
 
-.PHONY: all world dirs clean distclean source \
+.PHONY: all world dirs clean distclean source outputmakefile \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
@@ -463,52 +465,52 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
 
-xconfig: $(BUILD_DIR)/buildroot-config/qconf
+xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
-gconfig: $(BUILD_DIR)/buildroot-config/gconf
+gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@if ! $(COMMON_CONFIG_ENV) srctree=$(TOPDIR) \
 		$< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
-menuconfig: $(BUILD_DIR)/buildroot-config/mconf
+menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
-nconfig: $(BUILD_DIR)/buildroot-config/nconf
+nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
-config: $(BUILD_DIR)/buildroot-config/conf
+config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-oldconfig: $(BUILD_DIR)/buildroot-config/conf
+oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)
 
-randconfig: $(BUILD_DIR)/buildroot-config/conf
+randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
 
-allyesconfig: $(BUILD_DIR)/buildroot-config/conf
+allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)
 
-allnoconfig: $(BUILD_DIR)/buildroot-config/conf
+allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --allnoconfig $(CONFIG_CONFIG_IN)
 
-randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
+randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) \
@@ -516,7 +518,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
 		$< --randconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
+allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) \
@@ -524,7 +526,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
 		$< --allyesconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
+allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) \
@@ -532,19 +534,19 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
-silentoldconfig: $(BUILD_DIR)/buildroot-config/conf
+silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	$(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
 
-defconfig: $(BUILD_DIR)/buildroot-config/conf
+defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
 
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
-savedefconfig: $(BUILD_DIR)/buildroot-config/conf
+savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --savedefconfig=$(TOPDIR)/defconfig $(CONFIG_CONFIG_IN)
 
@@ -559,6 +561,15 @@ endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 # Cleanup and misc junk
 #
 #############################################################
+
+# outputmakefile generates a Makefile in the output directory, if using a
+# separate output directory. This allows convenient use of make in the
+# output directory.
+outputmakefile:
+ifeq ($(NEED_WRAPPER),y)
+	$(Q)$(TOPDIR)/scripts/mkmakefile $(TOPDIR) $(O)
+endif
+
 clean:
 	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(STAMP_DIR) $(BUILD_DIR) $(TOOLCHAIN_DIR)
diff --git a/scripts/mkmakefile b/scripts/mkmakefile
new file mode 100755
index 0000000..38d8268
--- /dev/null
+++ b/scripts/mkmakefile
@@ -0,0 +1,47 @@
+#!/bin/sh
+# Generates a small Makefile used in the root of the output
+# directory, to allow make to be started from there.
+# The Makefile also allow for more convinient build of external modules
+
+# Usage
+# $1 - Kernel src directory
+# $2 - Output directory
+
+
+test ! -r $2/Makefile -o -O $2/Makefile || exit 0
+# Only overwrite automatically generated Makefiles
+# (so we do not overwrite buildroot Makefile)
+if test -e $2/Makefile && ! grep -q Automatically $2/Makefile
+then
+	exit 0
+fi
+if [ "${quiet}" != "silent_" ]; then
+	echo "  GEN     $2/Makefile"
+fi
+
+cat << EOF > $2/Makefile
+# Automatically generated by $0: don't edit
+
+lastword = \$(word \$(words \$(1)),\$(1))
+makedir := \$(dir \$(call lastword,\$(MAKEFILE_LIST)))
+
+MAKEARGS := -C $1
+MAKEARGS += O=\$(if \$(patsubst /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst %/,%,\$(makedir))
+
+MAKEFLAGS += --no-print-directory
+
+.PHONY: all \$(MAKECMDGOALS)
+
+all	:= \$(filter-out all Makefile,\$(MAKECMDGOALS))
+
+all:
+	\$(MAKE) \$(MAKEARGS) \$(all)
+
+Makefile:;
+
+\$(all): all
+	@:
+
+%/: all
+	@:
+EOF
-- 
1.7.1
