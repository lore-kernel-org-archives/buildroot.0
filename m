From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Sep 2010 22:52:22 +0200
Subject: [Buildroot] [git commit master 1/1] Ensure that all config-related
	files are generated before the build
Message-ID: <20100905213834.5A75E8A4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0b36880085f0c65286877853caccf0bde2dd7f0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous commit has removed calls to conf_write_autoconf(), which
is the function that generates the KCONFIG_AUTOCONF,
KCONFIG_AUTOHEADER, KCONFIG_TRISTATE files and the split config (with
one file per config item). Therefore, those things were not generated
anymore before the build.

In order to get them generated before the build, we use the same
mechanism as the kernel: run a silentoldconfig when the .config file
is newer than the KCONFIG_AUTOCONF file.

In Buildroot, all those elements are not really used today, except the
split config which is used a little bit in the toolchain build, in a
try to make sure the toolchain gets rebuilt properly when the
configuration changes. It does not seem that this work has been
completed.

However, as we want to keep the same behaviour as previously, we have
to generate all those elements before starting the build.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index c897db7..9cc3c7a 100644
--- a/Makefile
+++ b/Makefile
@@ -29,7 +29,7 @@ CONFIG=package/config
 DATE:=$(shell date +%Y%m%d)
 
 noconfig_targets:=menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig savedefconfig allyesconfig allnoconfig release \
+	defconfig %_defconfig savedefconfig allyesconfig allnoconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	source-check help
 
@@ -322,17 +322,17 @@ TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 # all targets depend on the crosscompiler and it's prerequisites
 $(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
 
-$(BR2_DEPENDS_DIR): $(CONFIG_DIR)/.config
-#	rm -rf $@
-#	mkdir -p $(@D)
-#	cp -dpRf $(CONFIG)/buildroot-config $@
-
 dirs: $(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
 $(BASE_TARGETS): dirs
 
-world: dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
+$(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
+	$(MAKE) $(EXTRAMAKEARGS) silentoldconfig
+
+prepare: $(BUILD_DIR)/buildroot-config/auto.conf
+
+world: prepare dependencies dirs $(BASE_TARGETS) $(TARGETS_ALL)
 
 
 .PHONY: all world dirs clean distclean source \
@@ -468,6 +468,7 @@ $(BUILD_DIR)/buildroot-config/%onf:
 COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
+	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf
@@ -539,6 +540,10 @@ allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
+silentoldconfig: $(BUILD_DIR)/buildroot-config/conf
+	@mkdir -p $(BUILD_DIR)/buildroot-config
+	$(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
+
 defconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
-- 
1.7.1
