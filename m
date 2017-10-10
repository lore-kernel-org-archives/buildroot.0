From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 10 Oct 2017 22:43:29 +0200
Subject: [Buildroot] [RFC 2/3] Makefile: add handling of software stacks
In-Reply-To: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1507668210-5427-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Software stacks are a new way to express a bundle of configuration
options that should be used togheter.
A software stack is orthogonal to a classic buildroot config: a software
stack indeed could be shared beetween multiple configs.

A software stack could be used with standard buildroot tools, like:

make qt5-fb_stack

The fragment called qt5-fb_stack is merged inside current .config and
everithing is checked to produce a valid configurationqt5-fb_stack is
merged inside current .config and everithing is checked to produce a
valid configuration.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 Makefile | 40 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 02f7cda..27283b8 100644
--- a/Makefile
+++ b/Makefile
@@ -128,7 +128,7 @@ export BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlo
 
 # List of targets and target patterns for which .config doesn't need to be read in
 noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
-	defconfig %_defconfig allyesconfig allnoconfig alldefconfig silentoldconfig release \
+	defconfig %_defconfig %_stack allyesconfig allnoconfig alldefconfig silentoldconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	print-version olddefconfig distclean manual manual-%
 
@@ -146,7 +146,7 @@ nobuild_targets := source %-source source-check \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig printvars
+	list-stacks savedefconfig printvars
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -919,6 +919,12 @@ define percent_defconfig
 endef
 $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
 
+define percent_stack
+%_stack: $(1)/stacks/%_stack
+	$(TOPDIR)/support/kconfig/merge_config.sh -b -O $(BASE_DIR) $(BR2_CONFIG) $(1)/stacks/$$@
+endef
+$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_stack,$(d))$(sep)))
+
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
@@ -1039,6 +1045,7 @@ help:
 	@echo '  graph-depends          - generate graph of the dependency tree'
 	@echo '  graph-size             - generate stats of the filesystem size'
 	@echo '  list-defconfigs        - list all defconfigs (pre-configured minimal systems)'
+	@echo '  list-stacks            - list all stacks (pre-configured group of packages)'
 	@echo
 	@echo 'Miscellaneous:'
 	@echo '  source                 - download all sources needed for offline-build'
@@ -1075,6 +1082,26 @@ define list-defconfigs
 	$${first} || printf "\n"
 endef
 
+# List the stacks files
+# $(1): base directory
+# $(2): br2-external name, empty for bundled
+define list-stacks
+	@first=true; \
+	for stack in $(1)/stacks/*_stack; do \
+		[ -f "$${stack}" ] || continue; \
+		if $${first}; then \
+			if [ "$(2)" ]; then \
+				printf 'External stacks in "$(call qstrip,$(2))":\n'; \
+			else \
+				printf "Built-in stacks:\n"; \
+			fi; \
+			first=false; \
+		fi; \
+		printf "  %-35s - %s\n" ""$${stack##*/}"" "$$(head -n1 $${stack} | sed 's/^##*//' )"; \
+	done; \
+	$${first} || printf "\n"
+endef
+
 # We iterate over BR2_EXTERNAL_NAMES rather than BR2_EXTERNAL_DIRS,
 # because we want to display the name of the br2-external tree.
 .PHONY: list-defconfigs
@@ -1084,6 +1111,15 @@ list-defconfigs:
 		$(call list-defconfigs,$(BR2_EXTERNAL_$(name)_PATH),\
 			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
 
+# We iterate over BR2_EXTERNAL_NAMES rather than BR2_EXTERNAL_DIRS,
+# because we want to display the name of the br2-external tree.
+.PHONY: list-stacks
+list-stacks:
+	$(call list-stacks,$(TOPDIR))
+	$(foreach name,$(BR2_EXTERNAL_NAMES),\
+		$(call list-stacks,$(BR2_EXTERNAL_$(name)_PATH),\
+			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
+
 release: OUT = buildroot-$(BR2_VERSION)
 
 # Create release tarballs. We need to fiddle a bit to add the generated
-- 
2.7.4
