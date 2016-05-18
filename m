From: Patrick Williams <patrick@stwcx.xyz>
Date: Wed, 18 May 2016 14:25:30 -0500
Subject: [Buildroot] [PATCH 6/6] Makefile: Fix merge defconfig clobber of
	.config.old
In-Reply-To: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
References: <1463599530-28752-1-git-send-email-patrick@stwcx.xyz>
Message-ID: <1463599530-28752-7-git-send-email-patrick@stwcx.xyz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The merged defconfig support was using .config as a temporary file to
store the merged defconfig.  The result of then running the 'conf' tool
is that .config.old contains the contents of the merged defconfig
instead of the actual old .config.

Place the temporary merged defconfig into $(CONFIG_DIR)/.merge_config
instead to prevent this clobbering.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 2694339..7a675d6 100644
--- a/Makefile
+++ b/Makefile
@@ -850,9 +850,11 @@ define CREATE_DEFCONFIG_RECIPES
 		$$< --defconfig=$1/$$@ $$(CONFIG_CONFIG_IN)
 
 %_defconfig: $$(BUILD_DIR)/buildroot-config/conf $1/%_defconfig.merge outputmakefile
-	@cd $1 && xargs -a $$@.merge -x -P 1 $$(TOPDIR)/support/kconfig/merge_config.sh -m -O $$(CONFIG_DIR)
-	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(CONFIG_DIR)/.config \
-		$$< --defconfig=$$(CONFIG_DIR)/.config $$(CONFIG_CONFIG_IN)
+	@mkdir $$(CONFIG_DIR)/.merge_config
+	@cd $1 && xargs -a $$@.merge -x -P 1 $$(TOPDIR)/support/kconfig/merge_config.sh -m -O $$(CONFIG_DIR)/.merge_config
+	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$$(CONFIG_DIR)/.merge_config/.config \
+		$$< --defconfig=$$(CONFIG_DIR)/.merge_config/.config $$(CONFIG_CONFIG_IN)
+	@rm -rf $$(CONFIG_DIR)/.merge_config
 endef
 
 $(foreach path,$(BR2_DEFCONFIG_PATHS),$(eval $(call CREATE_DEFCONFIG_RECIPES,$(path))))
-- 
2.6.3
