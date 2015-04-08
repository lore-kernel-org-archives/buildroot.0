From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  8 Apr 2015 22:33:04 +0200
Subject: [Buildroot] [PATCHv2] *config: improve handling of BR2_LEGACY
Message-ID: <1428525184-20661-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle <arnout@mind.be>

In 8a46d4bf1f the randpackageconfig and allpackageyesconfig were
extended with disabling all the legacy options, otherwise the resulting
config couldn't be built. However, that didn't work for randconfig and
allyesconfig.

This commit reverts 8a46d4bf1f and replaces it with a different
approach: skipping of the legacy config options is passed explicitly
through the environment variable SKIP_LEGACY, which forces
BR2_SKIP_LEGACY to y.

We add a (silent) call to olddefconfig to set out the old legacy
options aside.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998 at free.fr: do not rely on a user-visible option, works
 perfectly well with only blind options set from the environment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v1 -> v2:
  - don't use a user-visible option  (Yann)
---
 Config.in.legacy | 12 ++++++++++++
 Makefile         | 18 ++++++------------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 445cab7..38fca09 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -52,6 +52,16 @@
 #
 # [End of example]
 
+config BR2_SKIP_LEGACY_ENV
+	bool
+	option env="SKIP_LEGACY"
+
+config BR2_SKIP_LEGACY
+	bool
+	default y if BR2_SKIP_LEGACY_ENV
+
+if !BR2_SKIP_LEGACY
+
 config BR2_LEGACY
 	bool
 	help
@@ -1281,3 +1291,5 @@ config BR2_BFIN_FLAT
 	select BR2_LEGACY
 
 endmenu
+
+endif # !SKIP_LEGACY
diff --git a/Makefile b/Makefile
index 2ad8832..390a9ab 100644
--- a/Makefile
+++ b/Makefile
@@ -728,23 +728,20 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --randconfig $(CONFIG_CONFIG_IN)
 
 allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allyesconfig $(CONFIG_CONFIG_IN)
 
 allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --allnoconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allnoconfig $(CONFIG_CONFIG_IN)
 
 randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
-	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
-		while read config pkg; do \
-		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
-	@$(COMMON_CONFIG_ENV) \
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --randconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
@@ -752,10 +749,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
-	@grep '^config BR2_PACKAGE_' Config.in.legacy | \
-		while read config pkg; do \
-		echo "# $$pkg is not set" >> $(CONFIG_DIR)/.config.nopkg; done
-	@$(COMMON_CONFIG_ENV) \
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allyesconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
@@ -763,7 +757,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
-	@$(COMMON_CONFIG_ENV) \
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
-- 
1.9.1
