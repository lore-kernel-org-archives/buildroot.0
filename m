From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon,  2 Feb 2015 16:34:46 +0100
Subject: [Buildroot] [PATCH] %_defconfig: save the path to the defconfig
Message-ID: <1422891286-521-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have the BR2_DEFCONFIG feature that saves the path to the defconfig
file that was specified on the command line, so that a later
savedefconfig would immediately save to the right location. This wasn't
done for the defconfigs in the configs/ directory, however, to avoid
accidentally overwriting them.

Now we decided that it would be more useful to overwrite the defconfigs
in the configs/ directory after all. To do this, we pass the path to
that defconfig in the environment.

Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index dd2b7b6..2192efd 100644
--- a/Makefile
+++ b/Makefile
@@ -781,13 +781,16 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
+# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(TOPDIR)/configs/$@ \
+		$< --defconfig=$(TOPDIR)/configs/$@ $(CONFIG_CONFIG_IN)
 
 %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-	@$(COMMON_CONFIG_ENV) $< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
+	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
+		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@mkdir -p $(BUILD_DIR)/buildroot-config
-- 
2.1.4
