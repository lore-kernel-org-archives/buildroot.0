From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:17:16 +0200
Subject: [Buildroot] [PATCHv3 19/20] package: package-based implementation
	of source, external-deps and legal-info
In-Reply-To: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381256237-27948-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the make source, make external-deps and make legal-info
where relying on enumerating the packages by looking at $(TARGETS)
which contains only the target packages and not the host
packages. Thanks to the TARGET_HOST_DEPS and HOST_DEPS variables, it
was doing a two-level resolution of host package dependencies, but it
was not entirely correct since the dependency chain might be deeper
than that: some packages could be missed.

From an idea of Arnout, this patch introduces in each package
additional targets <pkg>-all-source, <pkg>-all-legal-info and
<pkg>-all-external-deps that executes the 'source', 'legal-info' and
'external-deps' targets for this package and all its dependencies, be
they target or host dependencies.

This provides a much cleaner implementation of this mechanism, which
is also more robust.

In order to achieve this, this patch also separates the "package"
targets from other targets: instead of mixing them both in the global
TARGETS variable, the new PACKAGES variable contains the name of all
packages that are enabled in the configuration, while TARGETS is only
used for additional things to be done (target-finalize, etc.). This
separation is needed so that we don't try to use targets (such as
<foo>-all-external-deps) on things that are not packages. Some further
cleanups in this direction are possible, this commit takes a
relatively minimal approach for now.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 53 +++++++++++++-------------------------------------
 package/pkg-generic.mk | 16 ++++++++++++++-
 2 files changed, 28 insertions(+), 41 deletions(-)

diff --git a/Makefile b/Makefile
index f266e2d..702e7d4 100644
--- a/Makefile
+++ b/Makefile
@@ -238,8 +238,6 @@ GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
 BASE_TARGETS = toolchain
 
-TARGETS:=
-
 # silent mode requested?
 QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q)
 
@@ -310,9 +308,6 @@ endif
 include package/Makefile.in
 include support/dependencies/dependencies.mk
 
-# We also need the various per-package makefiles, which also add
-# each selected package to TARGETS if that package was selected
-# in the .config file.
 include toolchain/helpers.mk
 include toolchain/*/*.mk
 
@@ -349,34 +344,11 @@ include fs/common.mk
 
 TARGETS+=target-post-image
 
-TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
-TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
-TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
-TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
-
-# host-* dependencies have to be handled specially, as those aren't
-# visible in Kconfig and hence not added to a variable like TARGETS.
-# instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
-# variable for each enabled target.
-# Notice: this only works for newstyle gentargets/autotargets packages
-TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
-		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS))),\
-		$($(dep)))))
-# Host packages can in turn have their own dependencies. Likewise find
-# all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
-# host package found above. Ideally this should be done recursively until
-# no more packages are found, but that's hard to do in make, so limit to
-# 1 level for now.
-HOST_DEPS = $(sort $(foreach dep,\
-		$(addsuffix _DEPENDENCIES,$(call UPPERCASE,$(TARGETS_HOST_DEPS))),\
-		$($(dep))))
-HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
-
-TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
-		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
-
-# all targets depend on the crosscompiler and it's prerequisites
-$(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
+PACKAGES_CLEAN:=$(patsubst %,%-clean,$(PACKAGES))
+PACKAGES_SOURCE:=$(patsubst %,%-all-source,$(PACKAGES) $(BASE_TARGETS))
+PACKAGES_EXTERNAL_DEPS:=$(patsubst %,%-all-external-deps,$(PACKAGES) $(BASE_TARGETS))
+PACKAGES_DIRCLEAN:=$(patsubst %,%-dirclean,$(PACKAGES))
+PACKAGES_LEGAL_INFO:=$(patsubst %,%-all-legal-info,$(PACKAGES) $(BASE_TARGETS))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
@@ -386,12 +358,13 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: $(BASE_TARGETS) $(TARGETS_ALL)
+world: $(BASE_TARGETS) $(PACKAGES) $(TARGETS)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
-	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
-	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
+	$(BASE_TARGETS) $(PACKAGES) $(TARGETS) \
+	$(PACKAGES_CLEAN) $(PACKAGES_DIRCLEAN) $(PACKAGES_SOURCE) $(PACKAGES_LEGAL_INFO) \
+	$(PACKAGES_EXTERNAL_DEPS) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
@@ -562,10 +535,10 @@ target-post-image:
 toolchain-eclipse-register:
 	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
 
-source: dirs $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: dirs $(PACKAGES_SOURCE)
 
 external-deps:
-	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
+	@$(MAKE) -s $(EXTRAMAKEARGS) $(PACKAGES_EXTERNAL_DEPS) | sort -u
 
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
@@ -580,7 +553,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@cp $(BUILDROOT_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
 legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
-		$(TARGETS_LEGAL_INFO)
+		$(PACKAGES_LEGAL_INFO)
 	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
 	@if [ -r $(LEGAL_WARNINGS) ]; then \
 		cat support/legal-info/README.warnings-header \
@@ -590,7 +563,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(REDIST_SOURCES_DIR) \
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(TARGETS)
+	@echo $(BASE_TARGETS) $(PACKAGES) $(TARGETS)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a46457c..bd6169c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -424,6 +424,20 @@ endif
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
 
+$(1)-all-source: 	$(foreach p,$($(2)_DEPENDENCIES),$(p)-all-source) $(1)-source
+
+$(1)-external-deps:
+ifneq ($$($(2)_SOURCE),)
+			@echo $$($(2)_SOURCE)
+endif
+ifneq ($$($(2)_EXTRA_DOWNLOADS),y)
+			@echo $$($(2)_EXTRA_DOWNLOADS)
+endif
+
+$(1)-all-external-deps:	$(foreach p,$($(2)_DEPENDENCIES),$(p)-all-external-deps) $(1)-external-deps
+
+$(1)-all-legal-info:	$(foreach p,$($(2)_DEPENDENCIES),$(p)-all-legal-info) $(1)-legal-info
+
 $(1)-uninstall:		$(1)-configure $$($(2)_TARGET_UNINSTALL)
 
 $(1)-clean:		$(1)-uninstall \
@@ -528,7 +542,7 @@ endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
-TARGETS += $(1)
+PACKAGES += $(1)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
 PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
 PACKAGES_USERS += $$($(2)_USERS)$$(sep)
-- 
1.8.1.2
