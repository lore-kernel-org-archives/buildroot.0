From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:16:51 +0200
Subject: [Buildroot] [git commit] Makefile: rename TARGETS to PACKAGES
Message-ID: <20150414081954.E454B7F9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a58e0238ef3099d31fdd01cbbcca6ae1421eea5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For clarity, this commit renames the TARGETS variable to the more
meaningful PACKAGES variable. Indeed, only packages (handled by one of
the package infrastructures) should be listed in this variable, and
not other random non-package targets.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile                      |   22 +++++++++++-----------
 package/matchbox/matchbox.mk  |    2 +-
 package/pkg-generic.mk        |    2 +-
 support/scripts/graph-depends |    2 +-
 system/system.mk              |    2 +-
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index bd60c2e..da261f2 100644
--- a/Makefile
+++ b/Makefile
@@ -297,7 +297,7 @@ unexport MACHINE
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-TARGETS :=
+PACKAGES :=
 
 # silent mode requested?
 QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
@@ -389,16 +389,16 @@ include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
-TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
+PACKAGES_SOURCE := $(patsubst %,%-source,$(PACKAGES))
 
 # host-* dependencies have to be handled specially, as those aren't
-# visible in Kconfig and hence not added to a variable like TARGETS.
+# visible in Kconfig and hence not added to a variable like PACKAGES.
 # instead, find all the host-* targets listed in each <PKG>_DEPENDENCIES
 # variable for each enabled target.
 # Notice: this only works for newstyle gentargets/autotargets packages
 TARGETS_HOST_DEPS = $(sort $(filter host-%,$(foreach dep,\
 		$(addsuffix _DEPENDENCIES,\
-			$(call UPPERCASE,$(TARGETS) $(TARGETS_ROOTFS))),\
+			$(call UPPERCASE,$(PACKAGES) $(TARGETS_ROOTFS))),\
 		$($(dep)))))
 # Host packages can in turn have their own dependencies. Likewise find
 # all the package names listed in the HOST_<PKG>_DEPENDENCIES for each
@@ -410,8 +410,8 @@ HOST_DEPS = $(sort $(foreach dep,\
 		$($(dep))))
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
-TARGETS_LEGAL_INFO := $(patsubst %,%-legal-info,\
-		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
+PACKAGES_LEGAL_INFO := $(patsubst %,%-legal-info,\
+		$(PACKAGES) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
@@ -505,7 +505,7 @@ endif
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 GLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
 ifneq ($(GLIBC_GENERATE_LOCALES),)
-TARGETS += host-localedef
+PACKAGES += host-localedef
 
 define GENERATE_GLIBC_LOCALES
 	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
@@ -549,7 +549,7 @@ endif
 
 $(TARGETS_ROOTFS): target-finalize
 
-target-finalize: $(TARGETS)
+target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
@@ -613,7 +613,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-source: $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
 
 external-deps:
 	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
@@ -631,7 +631,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call legal-warning,the toolchain has not been saved)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
-legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
+legal-info: dirs legal-info-clean legal-info-prepare $(PACKAGES_LEGAL_INFO) \
 		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
 	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
 	@if [ -r $(LEGAL_WARNINGS) ]; then \
@@ -642,7 +642,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(TARGETS) $(TARGETS_ROOTFS)
+	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(PACKAGES) $(TARGETS_ROOTFS)
 
 graph-build: $(O)/build/build-time.log
 	@install -d $(GRAPHS_DIR)
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index aec57c0..fe1a7db 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -1,4 +1,4 @@
 ifeq ($(BR2_PACKAGE_MATCHBOX),y)
 include $(sort $(wildcard package/matchbox/*/*.mk))
-TARGETS += matchbox-lib matchbox-wm
+PACKAGES += matchbox-lib matchbox-wm
 endif
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1d56f81..d1a1811 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -746,7 +746,7 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
 
-TARGETS += $(1)
+PACKAGES += $(1)
 
 ifneq ($$($(2)_PERMISSIONS),)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 08ecc5a..c26e1e0 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -116,7 +116,7 @@ def get_version(pkgs):
     return version
 
 # Execute the "make show-targets" command to get the list of the main
-# Buildroot TARGETS and return it formatted as a Python list. This
+# Buildroot PACKAGES and return it formatted as a Python list. This
 # list is used as the starting point for full dependency graphs
 def get_targets():
     sys.stderr.write("Getting targets\n")
diff --git a/system/system.mk b/system/system.mk
index 4a1eb4a..c95e436 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -35,7 +35,7 @@ TARGET_FINALIZE_HOOKS += SYSTEM_ISSUE
 endif
 
 ifneq ($(TARGET_GENERIC_ROOT_PASSWD),)
-TARGETS += host-mkpasswd
+PACKAGES += host-mkpasswd
 endif
 
 define SET_NETWORK_LOCALHOST
