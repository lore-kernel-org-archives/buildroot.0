From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2013 22:52:21 +0100
Subject: [Buildroot] [PATCH 2/4] Makefile: use newly-introduced
	BUILDROOT_CONFIG
In-Reply-To: <cover.1358113846.git.yann.morin.1998@free.fr>
References: <cover.1358113846.git.yann.morin.1998@free.fr>
Message-ID: <1c417924f9e150ec0f24699cb60d27ed0331ab13.1358113846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 5a83251..16b5ef4 100644
--- a/Makefile
+++ b/Makefile
@@ -95,7 +95,7 @@ BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
--include $(CONFIG_DIR)/.config
+-include $(BUILDROOT_CONFIG)
 endif
 
 # To put more focus on warnings, be less verbose as default
@@ -383,7 +383,7 @@ dirs: $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 
 $(BASE_TARGETS): dirs $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
 
-$(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
+$(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
 	$(MAKE) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
@@ -557,7 +557,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPLv2+,COPYING,not saved)
 	@$(call legal-warning,the Buildroot source code has not been saved)
 	@$(call legal-warning,the toolchain has not been saved)
-	@cp $(CONFIG_DIR)/.config $(LEGAL_INFO_DIR)/buildroot.config
+	@cp $(BUILDROOT_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
 legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
 		$(TARGETS_LEGAL_INFO)
@@ -590,7 +590,7 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
-	BUILDROOT_CONFIG=$(CONFIG_DIR)/.config
+	BUILDROOT_CONFIG=$(BUILDROOT_CONFIG)
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -630,7 +630,7 @@ allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
 		while read config pkg; do \
 		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
@@ -641,7 +641,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
 		while read config pkg; do \
 		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
@@ -652,7 +652,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@grep -v BR2_PACKAGE_ $(CONFIG_DIR)/.config > $(CONFIG_DIR)/.config.nopkg
+	@grep -v BR2_PACKAGE_ $(BUILDROOT_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
@@ -706,7 +706,7 @@ endif
 ifeq ($(O),output)
 	rm -rf $(O)
 endif
-	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
+	rm -rf $(BUILDROOT_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
 
 cross: $(BASE_TARGETS)
 
-- 
1.7.2.5
