From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 03 Jul 2014 21:58:43 +0200
Subject: [Buildroot] [PATCH v2] infra: /usr support: STAGING_DIR can be
	outside BASE_DIR
Message-ID: <a6e2d2ad27e8a662e8db.1404417523@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If the user sets a custom BR2_HOST_DIR, then STAGING_DIR is not under
BASE_DIR. The .pc/.la file fixup commands incorrectly made this assumption
and thus should be corrected.

Additionally, this patch:
- rewords the comment in pkg-autotools that explains the replacements.
- removes a for statement in favor of xargs

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2:
- update commit message with for->xargs change (Arnout)
- apply fix to qt5.mk (Arnout)
- fix bad change in pkg-generic.mk (missing @)

 package/pkg-autotools.mk |  23 ++++++++++++-----------
 package/pkg-generic.mk   |   1 +
 package/qt5/qt5.mk       |   1 +
 3 files changed, 14 insertions(+), 11 deletions(-)

diff -r 5471dd6af081 -r a6e2d2ad27e8 package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Sun Jun 29 12:39:06 2014 -0300
+++ b/package/pkg-autotools.mk	Thu Jul 03 21:58:14 2014 +0200
@@ -267,25 +267,26 @@
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
 
diff -r 5471dd6af081 -r a6e2d2ad27e8 package/pkg-generic.mk
--- a/package/pkg-generic.mk	Sun Jun 29 12:39:06 2014 -0300
+++ b/package/pkg-generic.mk	Thu Jul 03 21:58:14 2014 +0200
@@ -202,6 +202,7 @@
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
+				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
 				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
 				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
diff -r 5471dd6af081 -r a6e2d2ad27e8 package/qt5/qt5.mk
--- a/package/qt5/qt5.mk	Sun Jun 29 12:39:06 2014 -0300
+++ b/package/qt5/qt5.mk	Thu Jul 03 21:58:14 2014 +0200
@@ -6,6 +6,7 @@
 define QT5_LA_PRL_FILES_FIXUP
 	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
 		$(SED)  "s:$(BASE_DIR):@BASE_DIR@:g" \
+			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
 			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
 			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
 			-e "s:@BASE_DIR@:$(BASE_DIR):g" \
