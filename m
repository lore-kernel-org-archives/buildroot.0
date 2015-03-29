From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:32 +0200
Subject: [Buildroot] [PATCH 18/35] Makefile: rename TARGETS to PACKAGES
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For clarity, this commit renames the TARGETS variable to the more
meaningful PACKAGES variable. Indeed, only packages (handled by one of
the package infrastructures) should be list in this variable, and not
other random non-package targets.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile               | 22 +++++++++++-----------
 package/pkg-generic.mk |  2 +-
 system/system.mk       |  2 +-
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 15341be..0577b3f 100644
--- a/Makefile
+++ b/Makefile
@@ -302,7 +302,7 @@ unexport MACHINE
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-TARGETS :=
+PACKAGES :=
 
 # silent mode requested?
 QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
@@ -394,16 +394,16 @@ include fs/common.mk
 
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
@@ -415,8 +415,8 @@ HOST_DEPS = $(sort $(foreach dep,\
 		$($(dep))))
 HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 
-TARGETS_LEGAL_INFO := $(patsubst %,%-legal-info,\
-		$(TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
+PACKAGES_LEGAL_INFO := $(patsubst %,%-legal-info,\
+		$(PACKAGES) $(TARGETS_HOST_DEPS) $(HOST_DEPS))
 
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR)
@@ -510,7 +510,7 @@ endif
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 GLIBC_GENERATE_LOCALES = $(call qstrip,$(BR2_GENERATE_LOCALE))
 ifneq ($(GLIBC_GENERATE_LOCALES),)
-TARGETS += host-localedef
+PACKAGES += host-localedef
 
 define GENERATE_GLIBC_LOCALES
 	$(Q)mkdir -p $(TARGET_DIR)/usr/lib/locale/
@@ -554,7 +554,7 @@ endif
 
 $(TARGETS_ROOTFS): target-finalize
 
-target-finalize: $(TARGETS)
+target-finalize: $(PACKAGES)
 	@$(call MESSAGE,"Finalizing target directory")
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
@@ -618,7 +618,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
 		$(call MESSAGE,"Executing post-image script $(s)"); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
-source: $(TARGETS_SOURCE) $(HOST_SOURCE)
+source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
 
 external-deps:
 	@$(MAKE1) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
@@ -636,7 +636,7 @@ legal-info-prepare: $(LEGAL_INFO_DIR)
 	@$(call legal-warning,the toolchain has not been saved)
 	@cp $(BR2_CONFIG) $(LEGAL_INFO_DIR)/buildroot.config
 
-legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
+legal-info: dirs legal-info-clean legal-info-prepare $(PACKAGES_LEGAL_INFO) \
 		$(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST)
 	@cat support/legal-info/README.header >>$(LEGAL_REPORT)
 	@if [ -r $(LEGAL_WARNINGS) ]; then \
@@ -647,7 +647,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
 	@rm -f $(LEGAL_WARNINGS)
 
 show-targets:
-	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(TARGETS) $(TARGETS_ROOTFS)
+	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(PACKAGES) $(TARGETS_ROOTFS)
 
 graph-build: $(O)/build/build-time.log
 	@install -d $(O)/graphs
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e1a51e4..f87ef0b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -743,7 +743,7 @@ $(eval $(call check-deprecated-variable,$(2)_BUILD_OPT,$(2)_BUILD_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_GETTEXTIZE_OPT,$(2)_GETTEXTIZE_OPTS))
 $(eval $(call check-deprecated-variable,$(2)_KCONFIG_OPT,$(2)_KCONFIG_OPTS))
 
-TARGETS += $(1)
+PACKAGES += $(1)
 
 ifneq ($$($(2)_PERMISSIONS),)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
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
-- 
2.1.0
