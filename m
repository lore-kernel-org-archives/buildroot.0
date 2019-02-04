From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Feb 2019 14:35:17 +0100
Subject: [Buildroot] [git commit] Makefile: add update-defconfig target
Message-ID: <20190204133400.80EE5814EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45f03959719b4b7c06818a82d9830db7f9d23d96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For symmetry with the Kconfig-based packages offering comprehensive
targets like linux-update-defconfig, barebox-update-defconfig and so
on, add a new top level update-defconfig target to run savedefconfig.

Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a382a5defb..74240ab895 100644
--- a/Makefile
+++ b/Makefile
@@ -135,7 +135,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig printvars
+	savedefconfig update-defconfig printvars
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -964,13 +964,15 @@ define percent_defconfig
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
@@ -1052,6 +1054,7 @@ help:
 	@echo '  defconfig              - New config with default answer to all options;'
 	@echo '                             BR2_DEFCONFIG, if set on the command line, is used as input'
 	@echo '  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)'
+	@echo '  update-defconfig       - Same as savedefconfig'
 	@echo '  allyesconfig           - New config where all options are accepted with yes'
 	@echo '  allnoconfig            - New config where all options are answered with no'
 	@echo '  alldefconfig           - New config where all options are set to default'
