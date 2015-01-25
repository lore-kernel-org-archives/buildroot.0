From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 25 Jan 2015 16:31:19 +0100
Subject: [Buildroot] [PATCH 2/2] *config: improve handling of BR2_LEGACY
In-Reply-To: <1422199879-7825-1-git-send-email-arnout@mind.be>
References: <1422199879-7825-1-git-send-email-arnout@mind.be>
Message-ID: <1422199879-7825-2-git-send-email-arnout@mind.be>
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
BR2_SKIP_LEGACY to y.

Note that it is necessary for BR2_SKIP_LEGACY to be user-visible,
otherwise it will not be taken into account by 'make oldconfig' and
you would be questioned about the legacy options. Also, because
randconfig may randomly turn this option off or on, it is necessary
to select it and not simply default to BR2_SKIP_LEGACY_FROM_ENV.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I ran into a lot of corner cases while developing this, so it will
require testing!

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 11 ++++++++++-
 Makefile         | 21 ++++++++-------------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fbe0b88..801315b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -52,8 +52,17 @@
 #
 # [End of example]
 
+# Allow the non-interactive configurations (randconfig, allpackageyesconfig,
+# ...) to disable the legacy handling completely since it is not relevant.
+# Otherwise allpackageyesconfig will also select all legacy options which
+# means it cannot be built.
+config BR2_SKIP_LEGACY_FROM_ENV
+	bool
+	select BR2_SKIP_LEGACY
+	option env=SKIP_LEGACY
+
 # BR2_SKIP_LEGACY is defined at the end of the file: it looks nicer in the menu
-if !BR2_SKIP_LEGACY
+if !BR2_SKIP_LEGACY && !BR2_SKIP_LEGACY_FROM_ENV
 
 config BR2_LEGACY
 	bool
diff --git a/Makefile b/Makefile
index 6cee027..dd2b7b6 100644
--- a/Makefile
+++ b/Makefile
@@ -706,7 +706,8 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BR2_CONFIG=$(BR2_CONFIG) \
-	BR2_EXTERNAL=$(BR2_EXTERNAL)
+	BR2_EXTERNAL=$(BR2_EXTERNAL) \
+	SKIP_LEGACY=
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
@@ -734,23 +735,20 @@ oldconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
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
@@ -758,10 +756,7 @@ randpackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
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
@@ -769,7 +764,7 @@ allyespackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 allnopackageconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@grep -v BR2_PACKAGE_ $(BR2_CONFIG) > $(CONFIG_DIR)/.config.nopkg
-	@$(COMMON_CONFIG_ENV) \
+	@$(COMMON_CONFIG_ENV) SKIP_LEGACY=y \
 		KCONFIG_ALLCONFIG=$(CONFIG_DIR)/.config.nopkg \
 		$< --allnoconfig $(CONFIG_CONFIG_IN)
 	@rm -f $(CONFIG_DIR)/.config.nopkg
-- 
2.1.4
