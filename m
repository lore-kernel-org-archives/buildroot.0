From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 29 Jun 2014 14:16:25 +0200
Subject: [Buildroot] [PATCH] infra: simplify .la/.pc fixup commands
Message-ID: <6d38fb9f8bb567d8a4a2.1404044185@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commands fixing up .la and .pc files in the pkg-generic and
pkg-autotools infrastructures can be simplified a little, since STAGING_DIR
already contains BASE_DIR.

Additionally, this patch rewords the comment in pkg-autotools that explains
the replacements.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-autotools.mk |  19 ++++++++-----------
 package/pkg-generic.mk   |   7 +++----
 2 files changed, 11 insertions(+), 15 deletions(-)

diff -r 4d6d2ac6a601 -r 6d38fb9f8bb5 package/pkg-autotools.mk
--- a/package/pkg-autotools.mk	Thu Jun 19 18:13:36 2014 +0200
+++ b/package/pkg-autotools.mk	Sun Jun 29 13:44:48 2014 +0200
@@ -267,25 +267,22 @@
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
 # To protect against the case that the output directory itself is
 # under /usr, we first substitute away any occurences of the output
-# directory to @BASE_DIR at .
+# directory as @BASE_DIR at .
 #
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
-	for i in $$$$(find $$(STAGING_DIR)/usr/lib* -name "*.la"); do \
+	find $$(STAGING_DIR)/usr/lib* -name "*.la" | xargs \
 		$$(SED) "s:$$(BASE_DIR):@BASE_DIR@:g" \
-			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
-			-e "s:@STAGING_DIR@:$$(STAGING_DIR):g" \
-			-e "s:@BASE_DIR@:$$(BASE_DIR):g" \
-			$$$$i; \
-	done
+			-e "s:\(['= ]\)/usr:\\1$$(STAGING_DIR)/usr:g" \
+			-e "s:@BASE_DIR@:$$(BASE_DIR):g"
 endef
 endif
 
diff -r 4d6d2ac6a601 -r 6d38fb9f8bb5 package/pkg-generic.mk
--- a/package/pkg-generic.mk	Thu Jun 19 18:13:36 2014 +0200
+++ b/package/pkg-generic.mk	Sun Jun 29 13:44:48 2014 +0200
@@ -202,10 +202,9 @@
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(call MESSAGE,"Fixing package configuration files") ;\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
-				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
-				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
-				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
-				-e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
+				-e "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
+				-e "s,-I/usr/,-I$(STAGING_DIR)/usr/,g" \
+				-e "s,-L/usr/,-L$(STAGING_DIR)/usr/,g" \
 				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
