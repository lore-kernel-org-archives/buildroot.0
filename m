From: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 18 May 2016 14:25:25 -0500
Subject: [Buildroot] [PATCH 1/6] Makefile: Support merged defconfigs
In-Reply-To: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
References: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <1463599530-28752-2-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Bobroff <sam.bobroff@au1.ibm.com>

Within the Linux kernel, and several other packages, it's currently
possible to maintain defconfigs as diffs (fragments) against other
configs but this is not possible with buildroot itself.

This patch adds the capability, although using a slightly different
implementation. Files may be added in the normal config directories
($TOPDIR/configs or $BR2_EXTERNAL/configs) with the format
"xxx_defconfig.merge" that contain, one per line, the files to be
passed to merge_config.sh to create the matching xxx_defconfig file
(the first line should contain the base config followed by the
fragments).  The generated defconfig file is then handled as it would
normally be.

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Tested-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Makefile b/Makefile
index ffbacfc..035d0ab 100644
--- a/Makefile
+++ b/Makefile
@@ -848,6 +848,16 @@ defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(BR2_EXTERNAL)/configs/$@ \
 		$< --defconfig=$(BR2_EXTERNAL)/configs/$@ $(CONFIG_CONFIG_IN)
 
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(TOPDIR)/configs/%_defconfig.merge outputmakefile
+	@cd $(TOPDIR)/configs && xargs -a $@.merge -x -P 1 $(TOPDIR)/support/kconfig/merge_config.sh -m -O $(CONFIG_DIR)
+	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(CONFIG_DIR)/.config \
+		$< --defconfig=$(CONFIG_DIR)/.config $(CONFIG_CONFIG_IN)
+
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(BR2_EXTERNAL)/configs/%_defconfig.merge outputmakefile
+	@cd $(BR2_EXTERNAL)/configs && xargs -a $@.merge -x -P 1 $(TOPDIR)/support/kconfig/merge_config.sh -m -O $(CONFIG_DIR)
+	@$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(CONFIG_DIR)/.config \
+		$< --defconfig=$(CONFIG_DIR)/.config $(CONFIG_CONFIG_IN)
+
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
-- 
2.6.3
