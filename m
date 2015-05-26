From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2015 01:42:13 +0200
Subject: [Buildroot] [PATCH 18/21 RFC] core: add support for multiple
	br2-external trees
In-Reply-To: <cover.1432681414.git.yann.morin.1998@free.fr>
References: <cover.1432681414.git.yann.morin.1998@free.fr>
Message-ID: <7de571799e3b327d459d61e72910d131ef4eba16.1432681414.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Being able to use more than one br2-external tree can be very useful.

The main use-case is to be able to add FLOSS packages in a br2-external
tree, and proprietary packages in another. This allows to not touch the
Buildroot tree at all, and still be able to get in compliance by
providing only that br2-external tree(s) that contains FLOSS packages,
leaving aside the br2-external tree(s) with the proprietary bits.

Of course, upstreaming those packages is the best course ultimately, but
it is sometimes not possible to get those packages upstreamed quickly
enough and keep up with the project's planning.

Another use-case would be for third-parties to provide their own
Buildroot packaging in a br2-external tree, along-side the archives for
their stuff.

What we do is to treat BR2_EXTERNAL as a space-separated list of paths,
which we iterate to construct:

  - the list of all br2-external IDs, BR2_EXTERNAL_IDS

  - the per-br2-external tree BR2_EXTERNAL_$(ID) variables, which points
    to the actual location of the corresponding tree,

  - the internal BR_EXTERNAL variable containing the paths made
    canonical (e.g not relative),

  - EXTRA_ENV which now needs to contain all BR2_EXTERNAL_$(ID)
    variables is thus set early.

Once we have all those variables, we replace references to BR_EXTERNAL
with either;

  - a $(patsubst ...) to include the external.mk files (and docs), or

  - a $(foreach ...) iteration to generate other Makefile code.

To be noted: we also use $(foreach ...) in the kconfig-snippet
generating rule, because it is cleaner than doing so in the shell

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile            | 78 ++++++++++++++++++++++++++++++++++-------------------
 package/Makefile.in |  3 +--
 2 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/Makefile b/Makefile
index ca87e57..2d01110 100644
--- a/Makefile
+++ b/Makefile
@@ -134,26 +134,46 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # The value of BR2_EXTERNAL is stored in .br-external in the output directory.
 # On subsequent invocations of make, it is read in. It can still be overridden
 # on the command line, therefore the file is re-created every time make is run.
-#
-# Ensure the BR2_EXTERNAL tree defines its ID, and set its top-level path.
 
 BR2_EXTERNAL_FILE = $(BASE_DIR)/.br-external
 -include $(BR2_EXTERNAL_FILE)
-ifneq ($(BR2_EXTERNAL),)
-  BR_EXTERNAL := $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
-  ifeq ($(BR_EXTERNAL),)
-    $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relative to $(TOPDIR))
-  endif
-  ifeq ($(wildcard $(BR_EXTERNAL)/external.id),)
-  $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' has no ID file 'external.id')
-  endif
-  BR_EXTERNAL_ID := $(shell cat $(BR_EXTERNAL)/external.id 2>/dev/null)
-  ifeq ($(BR_EXTERNAL_ID),)
-  $(error $(BR2_EXTERNAL) has no ID (in file 'external.id'))
-  endif
-  BR2_EXTERNAL_$(BR_EXTERNAL_ID) = $(BR_EXTERNAL)
-  BR_EXTERNAL_MK = $(BR2_EXTERNAL_$(BR_EXTERNAL_ID))/external.mk
+
+# Those three variables need to be defined as simply-expanded variables, they
+# can't be recursively-expanded, because the values they are assigned change
+# with each iteration of the foreach, below.
+BR_EXTERNAL_IDS :=
+BR_EXTERNAL :=
+EXTRA_ENV :=
+
+# Validate the br2-external tree passed as $(1):
+# - check the directory actually exists
+# - check there is a non-empty ID file
+# - check the ID is not a duplicate
+# - set variables for later use
+define BR2_EXTERNAL_VALIDATE
+_BR_EXT_DIR := $$(shell cd $(1) >/dev/null 2>&1 && pwd)
+ifeq ($$(_BR_EXT_DIR),)
+$$(error BR2_EXTERNAL='$(1)' does not exist, relative to $$(TOPDIR))
+endif
+
+ifeq ($$(wildcard $$(_BR_EXT_DIR)/external.id),)
+$$(error BR2_EXTERNAL='$(1)' has no ID file 'external.id')
 endif
+_BR_EXT_ID := $$(shell cat $$(_BR_EXT_DIR)/external.id 2>/dev/null)
+ifeq ($$(_BR_EXT_ID),)
+$$(error BR2_EXTERNAL='$(1)' has no ID (in file 'external.id'))
+endif
+ifneq ($$(filter $$(_BR_EXT_ID),$$(BR_EXTERNAL_IDS)),)
+$$(error Duplicate ID '$$(_BR_EXT_ID)' in '$(1)', previously defined in '$$(BR2_EXTERNAL_$$(_BR_EXT_ID))')
+endif
+
+BR2_EXTERNAL_$$(_BR_EXT_ID) := $$(_BR_EXT_DIR)
+BR_EXTERNAL_IDS += $$(_BR_EXT_ID)
+BR_EXTERNAL += $$(_BR_EXT_DIR)
+EXTRA_ENV += BR2_EXTERNAL_$$(_BR_EXT_ID)=$$(_BR_EXT_DIR)
+endef
+
+$(eval $(foreach d,$(BR2_EXTERNAL),$(call BR2_EXTERNAL_VALIDATE,$(d))$(sep)))
 
 # This needs to be *after* we compute BR_EXTERNAL, above.
 .PHONY: $(BR2_EXTERNAL_FILE)
@@ -414,11 +434,11 @@ include linux/linux.mk
 include system/system.mk
 include fs/common.mk
 
-# The BR2_EXTERNAL_$(ID) variable is also present in .config, so it is
-# quoted. We must unquote it before feeding it to the br2-external makefile.
-BR2_EXTERNAL_$(BR_EXTERNAL_ID) := $(call qstrip,$(BR2_EXTERNAL_$(BR_EXTERNAL_ID)))
-# Nothing to include if no BR2_EXTERNAL tree in use
-include $(BR_EXTERNAL_MK)
+# The BR2_EXTERNAL_$(ID) variables are also present in .config, so they
+# are quoted. We must unquote them before feeding them to the br2-external
+# makefiles.
+$(eval $(foreach id,$(BR_EXTERNAL_IDS),BR2_EXTERNAL_$(id) := $(call qstrip,$(BR2_EXTERNAL_$(id)))$(sep)))
+include $(patsubst %,%/external.mk,$(BR_EXTERNAL))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
@@ -804,10 +824,12 @@ $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
 	$(Q)if [ -n '$(BR_EXTERNAL)' ]; then \
 		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
 		printf 'menu "User-provided options"\n\n'; \
-		printf 'comment "BR2_EXTERNAL_%s (%s)"\n\n' $(BR_EXTERNAL_ID) $(BR2_EXTERNAL_$(BR_EXTERNAL_ID)); \
-		printf 'config BR2_EXTERNAL_%s\n' $(BR_EXTERNAL_ID); \
-		printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(BR_EXTERNAL_ID)); \
-		printf 'source "$$BR2_EXTERNAL_%s/Config.in"\n\n' $(BR_EXTERNAL_ID); \
+		$(foreach id,$(BR_EXTERNAL_IDS),\
+			for i in $$(seq 1 80); do printf '#'; done; printf '\n\n'; \
+			printf 'comment "BR2_EXTERNAL_%s (%s)"\n\n' $(id) $(BR2_EXTERNAL_$(id)); \
+			printf 'config BR2_EXTERNAL_%s\n' $(id); \
+			printf '\tstring\n\tdefault "%s"\n\n' $(BR2_EXTERNAL_$(id)); \
+			printf 'source "$$BR2_EXTERNAL_%s/Config.in"\n\n' $(id);) \
 		printf 'endmenu\n'; \
 	fi >$@
 
@@ -919,10 +941,10 @@ list-defconfigs:
 	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
-ifneq ($(wildcard $(BR_EXTERNAL)/configs/*_defconfig),)
+ifneq ($(wildcard $(patsubst %,%/configs/*_defconfig,$(BR_EXTERNAL))),)
 	@echo
 	@echo 'User-provided configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(BR_EXTERNAL)/configs/*_defconfig))), \
+	@$(foreach b, $(sort $(notdir $(wildcard $(patsubst %,%/configs/*_defconfig,$(BR_EXTERNAL))))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
 	@echo
@@ -943,6 +965,6 @@ print-version:
 	@echo $(BR2_VERSION_FULL)
 
 include docs/manual/manual.mk
--include $(BR_EXTERNAL)/docs/*/*.mk
+-include $(patsubst %,%/docs/*/*.mk,$(BR_EXTERNAL))
 
 .PHONY: $(noconfig_targets)
diff --git a/package/Makefile.in b/package/Makefile.in
index 2dfc25f..5e65dd9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -319,11 +319,10 @@ HOST_MAKE_ENV = \
 # packages use that variable internally, eg. uboot), so we have to
 # explicitly pass it to user-supplied external hooks (eg. post-build,
 # post-images)
-EXTRA_ENV = \
+EXTRA_ENV += \
 	PATH=$(BR_PATH) \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR) \
-	BR2_EXTERNAL=$(BR_EXTERNAL)
 
 ################################################################################
 # settings we need to pass to configure
-- 
1.9.1
