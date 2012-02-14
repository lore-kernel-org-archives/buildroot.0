From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 15 Feb 2012 00:48:57 +0100
Subject: [Buildroot] [PATCH] tcl: replace option to install library only
	with positive option to install tclsh
In-Reply-To: <201202150046.57364.arnout@mind.be>
References: <201202150046.57364.arnout@mind.be>
Message-ID: <1329263337-14994-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Without this patch, it was impossible for a package that relies on
the tclsh interpreter to select it.  This patch replaces the
negative BR2_PACKAGE_TCL_SHLIB_ONLY config with the positive
BR2_PACKAGE_TCL_TCLSH config.

Also a few minor fixes to the mk-file:

- Stripping the library didn't work because it was installed read-only.

- Create a symlink tclsh -> tclsh8.4.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I didn't think the minor fixes were relevant to send as separate patches.
If I should split them up, please tell me which one should come first.

Regards,
Arnout
---
 package/tcl/Config.in |   20 ++++++++++----------
 package/tcl/tcl.mk    |   29 ++++++++++++++++++++---------
 2 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/package/tcl/Config.in b/package/tcl/Config.in
index 7a4d887..e5d377b 100644
--- a/package/tcl/Config.in
+++ b/package/tcl/Config.in
@@ -5,10 +5,18 @@ config BR2_PACKAGE_TCL
 
 	  http://www.tcl.tk
 
+if BR2_PACKAGE_TCL
+
+config BR2_PACKAGE_TCL_TCLSH
+	bool "install tclsh"
+	help
+	  Install tclsh, the TCL interpreter.
+
+	  Takes ~14kb on top of the libraries.
+
 config BR2_PACKAGE_TCL_DEL_ENCODINGS
 	bool "delete encodings (saves 1.4Mb)"
 	default y
-	depends on BR2_PACKAGE_TCL
 	help
 	  Delete encoding files for TCL. If your programs do not use
 	  various tcl character recoding functions, you may safely
@@ -16,12 +24,4 @@ config BR2_PACKAGE_TCL_DEL_ENCODINGS
 
 	  It saves approx. 1.4 Mb of space.
 
-config BR2_PACKAGE_TCL_SHLIB_ONLY
-	bool "install only shared library"
-	default y
-	depends on BR2_PACKAGE_TCL
-	help
-	  Install only TCL shared library and not binary tcl
-	  interpreter(tclsh8.4).
-
-	  Saves ~14kb.
+endif
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 8ed81ab..6883619 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -19,17 +19,28 @@ HOST_TCL_CONF_OPT = \
 		--disable-langinfo \
 		--disable-framework
 
-define TCL_POST_INSTALL_CLEANUP
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
-	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" = "y" ]; then \
-	rm -Rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*; \
-	fi
-	-if [ "$(BR2_PACKAGE_TCL_SHLIB_ONLY)" = "y" ]; then \
-	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR); \
-	fi
+# libtcl is installed with mode 444, so correct that first.
+define TCL_POST_INSTALL_STRIP
+	chmod +w $(TARGET_DIR)/usr/lib/libtcl$(TCL_VERSION_MAJOR).so
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl$(TCL_VERSION_MAJOR).so
 endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_STRIP
+
+define TCL_POST_INSTALL_RM_ENCODINGS-y
+	rm -Rf $(TARGET_DIR)/usr/lib/tcl$(TCL_VERSION_MAJOR)/encoding/*
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_RM_ENCODINGS-$(BR2_PACKAGE_TCL_DEL_ENCODINGS)
+
+define TCL_POST_INSTALL_RM_TCLSH-
+	rm -f $(TARGET_DIR)/usr/bin/tclsh$(TCL_VERSION_MAJOR)
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_RM_TCLSH-$(BR2_PACKAGE_TCL_TCLSH)
+
+define TCL_POST_INSTALL_LN_TCLSH-y
+	ln -snf tclsh$(TCL_VERSION_MAJOR) $(TARGET_DIR)/usr/bin/tclsh
+endef
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_LN_TCLSH-$(BR2_PACKAGE_TCL_TCLSH)
 
-TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.8.3
