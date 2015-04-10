From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 11 Apr 2015 01:49:02 +0200
Subject: [Buildroot] [PATCH v4] *config: improve handling of BR2_LEGACY
Message-ID: <1428709742-4787-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 8a46d4bf1f the randpackageconfig and allpackageyesconfig were
extended with disabling all the legacy options, otherwise the resulting
config couldn't be built. However, that didn't work for randconfig and
allyesconfig.

This commit reverts 8a46d4bf1f and replaces it with a different
approach: skipping of the legacy config options is passed explicitly
through the environment variable SKIP_LEGACY, which forces
BR2_SKIP_LEGACY to y. The new option BR2_SKIP_LEGACY completely
disables the legacy handling, which effectively removes all the legacy
options from the .config.

However, in that case no values are set for the legacy options so a
subsequent oldconfig will query them. Therefore, run an additional
olddefconfig.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998 at free.fr: do not rely on a user-visible option, works
 perfectly well with only blind options set from the environment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v3 -> v4: (Arnout)
  - remove redundant BR2_SKIP_LEGACY_ENV
  - improve commit message
  - add an explanatory comment

Changes v2 -> v3: (Yann)
  - add the missing pieces (calling olddefconfig)

Changes v1 -> v2: (Yann)
  - don't use a user-visible option

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy |  8 ++++++++
 Makefile         | 32 +++++++++++++++++++-------------
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0fc794f..97bc939 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -52,6 +52,12 @@
 #
 # [End of example]
 
+config BR2_SKIP_LEGACY
+	bool
+	option env="SKIP_LEGACY"
+
+if !BR2_SKIP_LEGACY
+
 config BR2_LEGACY
 	bool
 	help
@@ -1288,3 +1294,5 @@ config BR2_BFIN_FLAT
 	select BR2_LEGACY
 
 endmenu
+
+endif # !SKIP_LEGACY
diff --git a/Makefile b/Makefile
index 5f9a2c3..23fd6da 100644
--- a/Makefile
+++ b/Makefile
@@ -696,7 +696,8 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BR2_CONFIG=$(BR2_CONFIG) \
-	BR2_EXTERNAL=$(BR2_EXTERNAL)
+	BR2_EXTERNAL=$(BR2_EXTERNAL) \
+	SKIP_LEGACY=
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -718,51 +719,56 @@ config: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
+# For the config targets that automatically select options, we pass
+# BR2_LEGACY=y to disable the legacy options. However, in that case
+# no values are set for the legacy options so a subsequent oldconfig
+# will query them. Therefore, run an additional olddefconfig.
+
 oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --oldconfig $(CONFIG_CONFIG_IN)
 
 randconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --randconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --randconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 allyesconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --allyesconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allyesconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 allnoconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --allnoconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y $< --allnoconfig $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
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
+	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
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
+	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
-	@$(COMMON_CONFIG_ENV) \
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
+	@$(COMMON_CONFIG_ENV) $< --olddefconfig $(CONFIG_CONFIG_IN) >/dev/null
 
 silentoldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
2.1.4
