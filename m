From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:10 +0200
Subject: [Buildroot] [PATCH 15/21 RFC] core: no longer export the raw
	BR2_EXTERNAL to users
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <555f8af93f0739842d74c4139323114992183b96.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When we support multiple br2-external trees, BR2_EXTERNAL will contain
the paths to more than one directory, so it will not be possible to use
it to refer to files in those br2-external trees.

However, a br2-external tree should use the newly-introduced
BR2_EXTERNAL_ID variable, that is specific and unique to the
corresponding br2-external tree.

So, do not export the raw BR2_EXTERNAL variable to br2-external trees,
neither for consumption in external.mk nor in Config.in, by overriding
it to an empty string.

We rename non-user-facing variables to be prefixed with BR_ instead of
BR2_, and only keep the user-facing variables prefixed with BR2_
('users' being files in a br2-external tree):

  - BR2_EXTERNAL gets renamed for itnernal use to BR_EXTERNAL; however,
    we still save it as BR2_EXTERNAL in the cache file .br_external, so
    we can re-use it on future invocations;

  - BR2_EXTERNAL_ID is renamed to BR_EXTERNAL_ID because it should not
    be exposed to users;

  - BR2_EXTERNAL_MK is also renamed, to BR_EXTERNAL_MK, as it too is an
    internal variable not expoed to users.

The underlying reason is that BR2_EXTERNAL, as well as a few other
BR2_-prefixed variables, will no longer be meaningful when we support
multiple br2-external trees.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Config.in           |  4 ----
 Makefile            | 43 ++++++++++++++++++++++---------------------
 package/Makefile.in |  2 +-
 3 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/Config.in b/Config.in
index 491051e..5950da3 100644
--- a/Config.in
+++ b/Config.in
@@ -14,10 +14,6 @@ config BR2_HOSTARCH
 	string
 	option env="HOSTARCH"
 
-config BR2_EXTERNAL
-	string
-	option env="BR2_EXTERNAL"
-
 config BR2_BUILD_DIR
 	string
 	option env="BUILD_DIR"
diff --git a/Makefile b/Makefile
index 37e552d..1042192 100644
--- a/Makefile
+++ b/Makefile
@@ -151,23 +151,25 @@ BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
 ifeq ($(BR2_EXTERNAL),)
   $(shell rm -f $(BR2_EXTERNAL_FILE))
 else
-  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
-  ifeq ($(_BR2_EXTERNAL),)
+  BR_EXTERNAL := $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
+  ifeq ($(BR_EXTERNAL),)
     $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
   endif
-  override BR2_EXTERNAL := $(_BR2_EXTERNAL)
-  $(shell echo BR2_EXTERNAL ?= $(BR2_EXTERNAL) > $(BR2_EXTERNAL_FILE))
-  ifeq ($(wildcard $(BR2_EXTERNAL)/external.id),)
+  $(shell echo BR2_EXTERNAL ?= $(BR_EXTERNAL) > $(BR2_EXTERNAL_FILE))
+  ifeq ($(wildcard $(BR_EXTERNAL)/external.id),)
   $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' has no ID file 'external.id')
   endif
-  BR2_EXTERNAL_ID := $(shell cat $(BR2_EXTERNAL)/external.id 2>/dev/null)
-  ifeq ($(BR2_EXTERNAL_ID),)
+  BR_EXTERNAL_ID := $(shell cat $(BR_EXTERNAL)/external.id 2>/dev/null)
+  ifeq ($(BR_EXTERNAL_ID),)
   $(error $(BR2_EXTERNAL) has no ID (in file 'external.id'))
   endif
-  BR2_EXTERNAL_$(BR2_EXTERNAL_ID) = $(BR2_EXTERNAL)
-  BR2_EXTERNAL_MK = $(BR2_EXTERNAL)/external.mk
+  BR2_EXTERNAL_$(BR_EXTERNAL_ID) = $(BR_EXTERNAL)
+  BR_EXTERNAL_MK = $(BR2_EXTERNAL_$(BR_EXTERNAL_ID))/external.mk
 endif
 
+# Don't let users use that variable, they must use the ID-suffixed variant
+override BR2_EXTERNAL :=
+
 # To make sure that the environment variable overrides the .config option,
 # set this before including .config.
 ifneq ($(BR2_DL_DIR),)
@@ -422,9 +424,9 @@ include fs/common.mk
 
 # The BR2_EXTERNAL_$(ID) variable is also present in .config, so it is
 # quoted. We must unquote it before feeding it to the br2-external makefile.
-BR2_EXTERNAL_$(BR2_EXTERNAL_ID) := $(call qstrip,$(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)))
+BR2_EXTERNAL_$(BR_EXTERNAL_ID) := $(call qstrip,$(BR2_EXTERNAL_$(BR_EXTERNAL_ID)))
 # Nothing to include if no BR2_EXTERNAL tree in use
-include $(BR2_EXTERNAL_MK)
+include $(BR_EXTERNAL_MK)
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
@@ -705,7 +707,6 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BR2_CONFIG=$(BR2_CONFIG) \
-	BR2_EXTERNAL=$(BR2_EXTERNAL) \
 	BUILD_DIR=$(BUILD_DIR) \
 	SKIP_LEGACY=
 
@@ -783,7 +784,7 @@ define PERCENT_DEFCONFIG
 	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
 		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
 endef
-$(eval $(foreach d,$(TOPDIR) $(BR2_EXTERNAL),$(call PERCENT_DEFCONFIG,$(d))$(sep)))
+$(eval $(foreach d,$(TOPDIR) $(BR_EXTERNAL),$(call PERCENT_DEFCONFIG,$(d))$(sep)))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< \
@@ -808,13 +809,13 @@ endif
 
 .PHONY: $(BUILD_DIR)/.br2-external.in
 $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
-	$(Q)if [ -n '$(BR2_EXTERNAL)' ]; then \
+	$(Q)if [ -n '$(BR_EXTERNAL)' ]; then \
 		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
 		printf 'menu "User-provided options"\n\n'; \
-		printf 'comment "BR2_EXTERNAL_%s (%s)"\n\n' $(BR2_EXTERNAL_ID) $(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)); \
-		printf 'config BR2_EXTERNAL_%s\n' $(BR2_EXTERNAL_ID); \
-		printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(BR2_EXTERNAL_ID)); \
-		printf 'source "$$BR2_EXTERNAL_%s/Config.in"\n\n' $(BR2_EXTERNAL_ID); \
+		printf 'comment "BR2_EXTERNAL_%s (%s)"\n\n' $(BR_EXTERNAL_ID) $(BR2_EXTERNAL_$(BR_EXTERNAL_ID)); \
+		printf 'config BR2_EXTERNAL_%s\n' $(BR_EXTERNAL_ID); \
+		printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(BR_EXTERNAL_ID)); \
+		printf 'source "$$BR2_EXTERNAL_%s/Config.in"\n\n' $(BR_EXTERNAL_ID); \
 		printf 'endmenu\n'; \
 	fi >$@
 
@@ -926,10 +927,10 @@ list-defconfigs:
 	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
-ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
+ifneq ($(wildcard $(BR_EXTERNAL)/configs/*_defconfig),)
 	@echo
 	@echo 'User-provided configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
+	@$(foreach b, $(sort $(notdir $(wildcard $(BR_EXTERNAL)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
@@ -950,6 +951,6 @@ print-version:
 	@echo $(BR2_VERSION_FULL)
 
 include docs/manual/manual.mk
--include $(BR2_EXTERNAL)/docs/*/*.mk
+-include $(BR_EXTERNAL)/docs/*/*.mk
 
 .PHONY: $(noconfig_targets)
diff --git a/package/Makefile.in b/package/Makefile.in
index a0c5a7a..2dfc25f 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -323,7 +323,7 @@ EXTRA_ENV = \
 	PATH=$(BR_PATH) \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR) \
-	BR2_EXTERNAL=$(BR2_EXTERNAL)
+	BR2_EXTERNAL=$(BR_EXTERNAL)
 
 ################################################################################
 # settings we need to pass to configure
-- 
1.9.1
