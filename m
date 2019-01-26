From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Fri, 25 Jan 2019 19:34:06 -0500
Subject: [Buildroot] [PATCH] Makefile: add update-defconfig target
Message-ID: <20190126003406.7723-1-vivien.didelot@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For symmetry with the Kconfig-based packages offering comprehensive
targets like linux-update-defconfig, barebox-update-defconfig and so
on, add a new top level update-defconfig target to run savedefconfig.

Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index dd8cc7a9ae..3a2f74be69 100644
--- a/Makefile
+++ b/Makefile
@@ -151,7 +151,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig printvars
+	savedefconfig update-defconfig printvars
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -959,13 +959,15 @@ define percent_defconfig
 endef
 $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
 
+update-defconfig: savedefconfig
+
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
 	@$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
 
-.PHONY: defconfig savedefconfig
+.PHONY: defconfig savedefconfig update-defconfig
 
 ################################################################################
 #
@@ -1047,6 +1049,7 @@ help:
 	@echo '  defconfig              - New config with default answer to all options;'
 	@echo '                             BR2_DEFCONFIG, if set on the command line, is used as input'
 	@echo '  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)'
+	@echo '  update-defconfig       - Same as savedefconfig'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
 	@echo '  alldefconfig           - New config where all options are set to default'
-- 
2.20.1
