From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Jan 2012 01:01:12 +0100
Subject: [Buildroot] [PATCH] pkg-infra: improve reliability of foo-install
Message-ID: <1327104072-6202-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Running foo-uninstall has a high likelyhood of failing, because we
remove a lot of directories from the target.  To improve the reliability,
remove the stamp files before calling the uninstall commands, and add
the -k option to the sub-make.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Makefile.autotools.in |    5 ++++-
 package/Makefile.package.in   |    5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 0f9b2c6..cf1e8ef 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -285,10 +285,13 @@ endif
 #
 # Uninstall from target step. Only define it if not already defined
 # by the package .mk file.
+# Autotools Makefiles do uninstall with ( cd ...; rm -f ... )
+# Since we remove a lot of directories in target-finalize, this is likely
+# to fail.  Therefore add -k flag.
 #
 ifndef $(2)_UNINSTALL_TARGET_CMDS
 define $(2)_UNINSTALL_TARGET_CMDS
-	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -k $$($$(PKG)_UNINSTALL_TARGET_OPT) -C $$($$(PKG)_SRCDIR)
 endef
 endif
 
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 0f6bcd2..cd801ed 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -442,12 +442,13 @@ $(BUILD_DIR)/%/.stamp_cleaned:
 	rm -f $(@D)/.stamp_built
 
 # Uninstall package from target and staging
+# Uninstall commands tend to fail, so remove the stamp files first
 $(BUILD_DIR)/%/.stamp_uninstalled:
 	@$(call MESSAGE,"Uninstalling")
-	$($(PKG)_UNINSTALL_STAGING_CMDS)
 	rm -f $($(PKG)_TARGET_INSTALL_STAGING)
-	$($(PKG)_UNINSTALL_TARGET_CMDS)
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET)
+	$($(PKG)_UNINSTALL_STAGING_CMDS)
+	$($(PKG)_UNINSTALL_TARGET_CMDS)
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
-- 
1.7.8.3
