From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 15:49:59 +0200
Subject: [Buildroot] [git commit] infra: /usr support: STAGING_DIR can be
	outside BASE_DIR
Message-ID: <20140704144657.913AA9D11E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f638ea9c9c7bacc646430a74ad3dd2740eae676
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the user sets a custom BR2_HOST_DIR, then STAGING_DIR is not under
BASE_DIR. The .pc/.la file fixup commands incorrectly made this assumption
and thus should be corrected.

Additionally, this patch:
- rewords the comment in pkg-autotools that explains the replacements.
- removes a for statement in favor of xargs

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |   23 ++++++++++++-----------
 package/pkg-generic.mk   |    1 +
 package/qt5/qt5.mk       |    1 +
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 8527314..432b27f 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -267,25 +267,26 @@ endif
 # Most autotools packages install libtool .la files alongside any
 # installed libraries. These .la files sometimes refer to paths
 # relative to the sysroot, which libtool will interpret as absolute
-# paths to host libraries instead of the target libraries. Since we
-# configure with --prefix=/usr, such absolute paths start with
-# /usr. So we add $(STAGING_DIR) in front of any path that starts with
-# /usr.
+# paths to host libraries instead of the target libraries. Since this
+# is not what we want, these paths are fixed by prefixing them with
+# $(STAGING_DIR).  As we configure with --prefix=/usr, this fix
+# needs to be applied to any path that starts with /usr.
 #
-# To protect against the case that the output directory itself is
-# under /usr, we first substitute away any occurences of the output
-# directory to @BASE_DIR at .
+# To protect against the case that the output or staging directories
+# themselves are under /usr, we first substitute away any occurrences
+# of these directories as @BASE_DIR@ and @STAGING_DIR at . Note that
+# STAGING_DIR can be outside BASE_DIR when the user sets BR2_HOST_DIR
+# to a custom value.
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-	for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
+	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs \
 		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
+			-e "s:$$(STAGING_DIR):@STAGING_DIR@:g" \
 			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
 			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
-			-e "s:@BASE_DIR@:$$(BASE_DIR):g" \
-			$$$$i; \
-	done
+			-e "s:@BASE_DIR@:$$(BASE_DIR):g"
 endef
 endif
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ab1f8d2..b7f50a5 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -202,6 +202,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
+				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
 				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
 				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 5f90eb5..a88b593 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -6,6 +6,7 @@ include $(sort $(wildcard package/qt5/*/*.mk))
 define QT5_LA_PRL_FILES_FIXUP
 	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
 		$(SED)  "s:$(BASE_DIR):@BASE_DIR@:g" \
+			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
 			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
 			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
 			-e "s:@BASE_DIR@:$(BASE_DIR):g" \
