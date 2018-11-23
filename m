From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 15:58:14 +0100
Subject: [Buildroot] [PATCH next v6 09/10] package/pkg-generic: make libtool
 .la files compatible with per-package directories
In-Reply-To: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181123145815.13008-10-thomas.petazzoni@bootlin.com>
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
 package/pkg-generic.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b1f0cdf34a..17909f4a61 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -222,6 +222,12 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
 	@$(call MESSAGE,"Configuring")
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+	# Make sure .la files only reference the current per-package
+	# directory
+	$(Q)find $(STAGING_DIR)/usr/lib* -name "*.la" | xargs --no-run-if-empty \
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]*/:$(PER_PACKAGE_DIR)/$(NAME)/:g"
+endif
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -875,6 +881,7 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
 $$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
 $$($(2)_TARGET_BUILD):			PKG=$(2)
 $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-- 
2.19.1
