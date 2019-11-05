From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  5 Nov 2019 17:46:42 +0100
Subject: [Buildroot] [PATCH next v8 3/6] package/pkg-generic: make libtool
 .la files compatible with per-package directories
In-Reply-To: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
References: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191105164646.23820-4-thomas.petazzoni@bootlin.com>
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
index b7b211e6e4..71792d58a9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -134,6 +134,21 @@ endef
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
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]+/:$(PER_PACKAGE_DIR)/$(1)/:g"
+endef
+endif
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -230,6 +245,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
+	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -919,6 +935,7 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-- 
2.21.0
