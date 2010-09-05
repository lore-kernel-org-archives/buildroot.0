From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Sep 2010 22:52:22 +0200
Subject: [Buildroot] [git commit master 1/1] Factorize environment variables
	for config utilities
Message-ID: <20100905213834.094128A4A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1039eb74faf82369c6d71dfecfd23f2432d396ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of duplicating the definition of KCONFIG_AUTOCONFIG,
KCONFIG_AUTOHEADER and BUILDROOT_CONFIG, let's define them in a
COMMON_CONFIG_ENV variable, which is used by all the xconfig, gconfig,
menuconfig, nconfig, config, oldconfig, randconfig, allyesconfig,
allnoconfig, randpackageconfig, allyespackageconfig,
allnopackageconfig, defconfig, %_defconfig targets.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   66 +++++++++++++++++++++----------------------------------------
 1 files changed, 23 insertions(+), 43 deletions(-)

diff --git a/Makefile b/Makefile
index 77e0fc7..abe1aa0 100644
--- a/Makefile
+++ b/Makefile
@@ -465,107 +465,87 @@ $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
 	$(MAKE) CC="$(HOSTCC)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
 
+COMMON_CONFIG_ENV = \
+	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
+	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
+	BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
+
 xconfig: $(BUILD_DIR)/buildroot-config/qconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@if ! KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN); then \
+	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
 gconfig: $(BUILD_DIR)/buildroot-config/gconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@if ! KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		srctree=$(TOPDIR) \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN); then \
+	@if ! $(COMMON_CONFIG_ENV) srctree=$(TOPDIR) \
+		$< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
 menuconfig: $(BUILD_DIR)/buildroot-config/mconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@if ! KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN); then \
+	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
 nconfig: $(BUILD_DIR)/buildroot-config/nconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@if ! KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN); then \
+	@if ! $(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN); then \
 		test -f $(CONFIG_DIR)/.config.cmd || rm -f $(CONFIG_DIR)/.config; \
 	fi
 
 config: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 oldconfig: $(BUILD_DIR)/buildroot-config/conf
 	mkdir -p $(BUILD_DIR)/buildroot-config
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --oldconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)
 
 randconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --randconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
 
 allyesconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --allyesconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)
 
 allnoconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --allnoconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --allnoconfig $(CONFIG_CONFIG_IN)
 
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
+	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --randconfig $(CONFIG_CONFIG_IN)
+		$< --randconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
+	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --allyesconfig $(CONFIG_CONFIG_IN)
+		$< --allyesconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
+	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --allnoconfig $(CONFIG_CONFIG_IN)
+		$< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --defconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
-		KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
-		BUILDROOT_CONFIG=$(CONFIG_DIR)/.config $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
 # check if download URLs are outdated
 source-check: allyesconfig
-- 
1.7.1
