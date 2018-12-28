From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:43:32 +0100
Subject: [Buildroot] [PATCH v7 5/8] package/pkg-generic: make libtool .la
 files compatible with per-package directories
In-Reply-To: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
References: <20181228104335.22379-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181228104335.22379-6-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libtool .la files unfortunately contain a number of absolute paths,
which now refer to per-package directories. Due to this, when building
package A, .la files may contain absolute paths referring to
directories in package B per-package sysroot. This causes some -L
flags referring to other sysroot from being added, which doesn't work
as the linker no longer realizes that such paths are within its
sysroot.

To fix this, we introduce a replacement step of .la files in the
configure step, to make sure all paths refer to this package
per-package directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8ea86514d7..9575639b43 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -126,6 +126,21 @@ endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_user
 endif
 
+#######################################
+# Helper functions
+
+# Make sure .la files only reference the current per-package
+# directory.
+
+# $1: package name (lower case)
+# $2: staging directory of the package
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define fixup-libtool-files
+	$(Q)find $(2)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]*/:$(PER_PACKAGE_DIR)/$(1)/:g"
+endef
+endif
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -222,6 +237,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
+	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -879,6 +895,7 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-- 
2.20.1
