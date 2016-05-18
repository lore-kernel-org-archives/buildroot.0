From: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 18 May 2016 14:25:28 -0500
Subject: [Buildroot] [PATCH 4/6] Makefile: Add nested config dirs to
	list-defconfigs
In-Reply-To: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
References: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <1463599530-28752-5-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index c9b6030..8a9bb2b 100644
--- a/Makefile
+++ b/Makefile
@@ -201,6 +201,10 @@ LEGAL_LICENSES_TXT_HOST = $(LEGAL_INFO_DIR)/host-licenses.txt
 LEGAL_WARNINGS = $(LEGAL_INFO_DIR)/.warnings
 LEGAL_REPORT = $(LEGAL_INFO_DIR)/README
 
+BR2_DEFCONFIG_PATHS_LOCAL=$(sort $(dir $(wildcard $(TOPDIR)/configs/*/)))
+BR2_DEFCONFIG_PATHS_USER=$(sort $(dir $(wildcard $(BR2_EXTERNAL)/configs/*/)))
+BR2_DEFCONFIG_PATHS=$(BR2_DEFCONFIG_PATHS_LOCAL) $(BR2_DEFCONFIG_PATHS_USER)
+
 BR2_CONFIG = $(CONFIG_DIR)/.config
 
 # Pull in the user's configuration file
@@ -851,8 +855,6 @@ define CREATE_DEFCONFIG_RECIPES
 		$$< --defconfig=$$(CONFIG_DIR)/.config $$(CONFIG_CONFIG_IN)
 endef
 
-BR2_DEFCONFIG_PATHS=$(sort $(dir $(wildcard $(TOPDIR)/configs/*/))) \
-		$(sort $(dir $(wildcard $(BR2_EXTERNAL)/configs/*/)))
 $(foreach path,$(BR2_DEFCONFIG_PATHS),$(eval $(call CREATE_DEFCONFIG_RECIPES,$(path))))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
@@ -986,12 +988,12 @@ endif
 
 list-defconfigs:
 	@echo 'Built-in configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
+	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_LOCAL),$(wildcard $(path)/*_defconfig)))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
 	@echo
 	@echo 'User-provided configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
+	@$(foreach b, $(sort $(notdir $(foreach path,$(BR2_DEFCONFIG_PATHS_USER),$(wildcard $(path)/*_defconfig)))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
-- 
2.6.3
