From: Denis THULIN <denis.thulin@openwide.fr>
Date: Tue,  4 Aug 2015 14:27:06 +0200
Subject: [Buildroot] [PATCH 1/2] kconfig: Can now use variables outside of
	package
In-Reply-To: <1438691227-23379-1-git-send-email-denis.thulin@openwide.fr>
References: <1438691227-23379-1-git-send-email-denis.thulin@openwide.fr>
Message-ID: <1438691227-23379-2-git-send-email-denis.thulin@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a small modification of pkg-kconfig.mk that saves the .config
file of a kconfig package and that loads it in order to use its
variables inside other packages' makefiles. (e.g. it can be used to
check if i2c is enabled in the kernel before building i2c-tools).

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---

It uses sed to prepends the .config variables with
<PACKAGE_NAME>_KCONFIG_.
sed output is in the $(BASE_DIR)/kconfigs directory. The .config file
are then included in the make environnment

Signed-off-by: Denis THULIN <denis.thulin@openwide.fr>
---
 Makefile               |  4 +++-
 package/pkg-kconfig.mk | 24 +++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9059884..984fec1 100644
--- a/Makefile
+++ b/Makefile
@@ -196,6 +196,7 @@ TARGET_DIR := $(BASE_DIR)/target
 # .config. HOST_DIR will be overwritten later when .config is included.
 HOST_DIR := $(BASE_DIR)/host
 GRAPHS_DIR := $(BASE_DIR)/graphs
+KCONFIG_OUTPUT_DIR := $(BASE_DIR)/kconfigs
 
 LEGAL_INFO_DIR = $(BASE_DIR)/legal-info
 REDIST_SOURCES_DIR_TARGET = $(LEGAL_INFO_DIR)/sources
@@ -825,7 +826,8 @@ printvars:
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
 		$(BUILD_DIR) $(BASE_DIR)/staging \
-		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
+		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) \
+		$(KCONFIG_OUTPUT_DIR)
 
 distclean: clean
 ifeq ($(DL_DIR),$(TOPDIR)/dl)
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 375607f..55a1493 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -83,6 +83,7 @@ $$($(2)_DIR)/.stamp_kconfig_fixup_done: $$($(2)_DIR)/.config
 # Before running configure, the configuration file should be present and fixed
 $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 
+
 # Only enable the foo-*config targets when the package is actually enabled.
 # Note: the variable $(2)_KCONFIG_VAR is not related to the kconfig
 # infrastructure, but defined by pkg-generic.mk. The generic infrastructure is
@@ -96,6 +97,7 @@ $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 endif
 
+
 # Configuration editors (menuconfig, ...)
 #
 # We need to apply the configuration fixups right after a configuration
@@ -118,6 +120,25 @@ $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
 	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
 	$$(call $(2)_FIXUP_DOT_CONFIG)
 
+# Before building the package, we want to load the .config file prepended with
+# the packages' name in order to use it in other packages.
+# For instance, we want to check if LINUX_CONFIG_I2C is selected before
+# building i2c-tools.
+$$($(2)_TARGET_CONFIGURE): | $(2)_LOAD_KCONFIG
+
+# In order to load the .config file
+$(2)_LOAD_KCONFIG: $$(KCONFIG_OUTPUT_DIR)/$(1).config
+	@echo Loading $$(KCONFIG_OUTPUT_DIR)/$(1).config
+	$$(eval include $$(KCONFIG_OUTPUT_DIR)/$(1).config)
+
+# We also need to be sure the configuration is correct before prefixing it with
+# <PKG_NAME>_KCONFIG and saving it to KCONFIG_OUTPUT_DIR.
+# As the <package>.config file is not meant to be read by humans, this also
+# removes blank lines and commented lines.
+$$(KCONFIG_OUTPUT_DIR)/$(1).config: $$($(2)_DIR)/.stamp_kconfig_fixup_done
+	$(Q)mkdir -p $$(KCONFIG_OUTPUT_DIR)
+	$(Q)sed -n 's/^\(\w\)/$(2)_KCONFIG_\1/p' $$($(2)_DIR)/.config > $$(KCONFIG_OUTPUT_DIR)/$(1).config
+
 # Saving back the configuration
 #
 # Ideally, that should directly depend on $$($(2)_DIR)/.stamp_kconfig_fixup_done,
@@ -171,7 +192,8 @@ endif # package enabled
 	$(1)-savedefconfig \
 	$(1)-check-configuration-done \
 	$$($(2)_DIR)/.kconfig_editor_% \
-	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
+	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)) \
+	$(2)_LOAD_KCONFIG
 
 endef # inner-kconfig-package
 
-- 
2.5.0
