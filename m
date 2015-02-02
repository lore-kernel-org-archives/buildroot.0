From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Feb 2015 21:42:47 +0100
Subject: [Buildroot] [git commit] %_defconfig: save the path to the defconfig
Message-ID: <20150202204306.7C63E80800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32babbf9744d09e3612150971b7121033b4b9925
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6cee027..9c870d9 100644
--- a/Makefile
+++ b/Makefile
@@ -786,13 +786,16 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
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
