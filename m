From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 29 Jun 2016 15:06:38 +1000
Subject: [Buildroot] [PATCH v3 1/6] Add support for merged defconfigs
In-Reply-To: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
References: <cover.1467176798.git.sam.bobroff@au1.ibm.com>
Message-ID: <0fddd32d7ed356b943e1372df20a0d9948ab29ed.1467176798.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
v3:

* Documentation moved to separate patch.
* Fixed "make savedefconfig".

 Makefile | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Makefile b/Makefile
index 78b44c5..9f3fc92 100644
--- a/Makefile
+++ b/Makefile
@@ -858,6 +858,44 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 .PHONY: defconfig savedefconfig
 
+# Find the path of a config file that may be either in TOPDIR or BR2_EXTERNAL.
+# Missing or duplicate matches must be checked for elsewhere.
+define FIND_CONFIG_FILE =
+$(foreach d,$(TOPDIR)/configs $(BR2_EXTERNAL)/configs,$(wildcard $(d)/$(1)))
+endef
+
+define CONFIG_FILE_LIST =
+$(foreach f,$1,$(call FIND_CONFIG_FILE,$f))
+endef
+
+# Check that each config file is found once and only once.
+define CHECK_CONFIG_FILE_LIST =
+$(foreach f,$(1),
+ifeq "$(words $(call FIND_CONFIG_FILE,$(f)))" "0"
+$$(error ERROR: Missing input file: $(f))
+else
+ifneq "$(words $(call FIND_CONFIG_FILE,$(f)))" "1"
+$$(error ERROR: Duplicate input file: $(f))
+endif
+endif
+)
+endef
+
+# To be called by configuration fragments (*.mk) to set up defconfigs built
+# by merge_config.sh, via the include that follows:
+define merge_config =
+$(call CHECK_CONFIG_FILE_LIST,$2 $3)
+$(1): $$(BUILD_DIR)/buildroot-config/conf $(call CONFIG_FILE_LIST,$2 $3) outputmakefile
+	@mkdir $$(CONFIG_DIR)/.merge_config
+	@$$(TOPDIR)/support/kconfig/merge_config.sh -m -O $$(CONFIG_DIR)/.merge_config \
+		$(call CONFIG_FILE_LIST,$2 $3)
+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(CONFIG_DIR)/.merge_config/.config \
+		$$< --defconfig=$$(CONFIG_DIR)/.merge_config/.config $$(CONFIG_CONFIG_IN)
+	@rm -rf $$(CONFIG_DIR)/.merge_config
+endef
+
+$(foreach d,$(TOPDIR)/configs $(BR2_EXTERNAL)/configs,$(eval -include $(d)/*.mk))
+
 ################################################################################
 #
 # Cleanup and misc junk
-- 
2.1.0
