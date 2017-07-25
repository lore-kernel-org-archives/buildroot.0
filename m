From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 23:06:49 +0200
Subject: [Buildroot] [git commit] Makefile: refactor *config targets
Message-ID: <20170725210435.A21F6801B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2607051e1b3dd4a2f1ed36a56868f8727b8a2a6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rules for the *config targets are all very similar, so factor them
together using $@.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 42 ++++++------------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/Makefile b/Makefile
index 7cab6fa..3712e47 100644
--- a/Makefile
+++ b/Makefile
@@ -886,50 +886,20 @@ config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 # no values are set for the legacy options so a subsequent oldconfig
 # will query them. Therefore, run an additional olddefconfig.
 
-oldconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
-	@$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)
-
-randconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
-	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --randconfig $(CONFIG_CONFIG_IN)
-	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
-
-allyesconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
-	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allyesconfig $(CONFIG_CONFIG_IN)
-	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
-
-allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
-	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allnoconfig $(CONFIG_CONFIG_IN)
-	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
-
-randpackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
-	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
-	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
-		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		$< --randconfig $(CONFIG_CONFIG_IN)
-	@rm -f $(CONFIG_DIR)/.config.nopkg
+randconfig allyesconfig allnoconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --$@ $(CONFIG_CONFIG_IN)
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+randpackageconfig allyespackageconfig allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		$< --allyesconfig $(CONFIG_CONFIG_IN)
+		$< --$(subst package,,$@) $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
 	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
-allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
-	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
-	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
-		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
-		$< --allnoconfig $(CONFIG_CONFIG_IN)
-	@rm -f $(CONFIG_DIR)/.config.nopkg
-	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
-
-silentoldconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
-	$(COMMON_CONFIG_ENV) $< --silentoldconfig $(CONFIG_CONFIG_IN)
-
-olddefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
-	$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN)
+oldconfig silentoldconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+	@$(COMMON_CONFIG_ENV) $< --$@ $(CONFIG_CONFIG_IN)
 
 defconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
