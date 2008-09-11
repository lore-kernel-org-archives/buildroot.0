From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed, 10 Sep 2008 19:15:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  bridge-utils
Message-ID: <20080911021507.955463C642@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-10 19:15:07 -0700 (Wed, 10 Sep 2008)
New Revision: 23373

Log:
Move project-specific stamp files into a project-specific directory
$(PROJECT_BUILD_DIR)/autotools-stamps. Without this, autotools-using
packages won't be installed into any other projects than the first.


Modified:
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/package/bridge-utils/bridge.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-09-11 01:59:04 UTC (rev 23372)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-09-11 02:15:07 UTC (rev 23373)
@@ -234,15 +234,16 @@
 	touch $@
 
 # Install to target dir
-$(BUILD_DIR)/%/.stamp_target_installed:
+$(PROJECT_BUILD_DIR)/autotools-stamps/%_target_installed:
 	$(call MESSAGE,"Installing to target")
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $($(PKG)_DIR)/$($(PKG)_SUBDIR)
 	$(if $(BR2_HAVE_MANPAGES),,for d in man share/man; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
 	$(if $(BR2_HAVE_INFOPAGES),,for d in info share/info; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
+	$(Q)mkdir -p $(@D)
 	touch $@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
@@ -255,7 +256,7 @@
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_UNINSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	rm -f $(@D)/.stamp_staging_installed
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_UNINSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
-	rm -f $(@D)/.stamp_target_installed
+	rm -f $($(PKG)_TARGET_INSTALL_TARGET) $($(PKG)_HOOK_POST_INSTALL)
 
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
@@ -302,7 +303,8 @@
 
 
 # define sub-target stamps
-$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
+# targets which affect $(TARGET_DIR) must use a unique stamp for each $(PROJECT)
+$(2)_TARGET_INSTALL_TARGET =	$(PROJECT_BUILD_DIR)/autotools-stamps/$(1)_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
@@ -317,7 +319,7 @@
 $(2)_HOOK_POST_EXTRACT =	$$($(2)_DIR)/.stamp_hook_post_extract
 $(2)_HOOK_POST_CONFIGURE =	$$($(2)_DIR)/.stamp_hook_post_configure
 $(2)_HOOK_POST_BUILD =		$$($(2)_DIR)/.stamp_hook_post_build
-$(2)_HOOK_POST_INSTALL =	$$($(2)_DIR)/.stamp_hook_post_install
+$(2)_HOOK_POST_INSTALL =	$(PROJECT_BUILD_DIR)/autotools-stamps/$(1)_hook_post_install
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -383,7 +385,7 @@
 $$($(2)_TARGET_CLEAN):			PKG=$(2)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 $$($(2)_HOOK_POST_EXTRACT):		PKG=$(2)
-$$($(2)_HOOK_POST_CONFIGURE):	PKG=$(2)
+$$($(2)_HOOK_POST_CONFIGURE):		PKG=$(2)
 $$($(2)_HOOK_POST_BUILD):		PKG=$(2)
 $$($(2)_HOOK_POST_INSTALL):		PKG=$(2)
 

Modified: trunk/buildroot/package/bridge-utils/bridge.mk
===================================================================
--- trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-11 01:59:04 UTC (rev 23372)
+++ trunk/buildroot/package/bridge-utils/bridge.mk	2008-09-11 02:15:07 UTC (rev 23373)
@@ -22,9 +22,9 @@
 	touch $@
 
 # bridge has no uninstall target
-$(BUILD_DIR)/bridge-$(BRIDGE_VERSION)/.stamp_uninstalled:
+$(BRIDGE_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
 	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libbridge.a \
 		include/libbridge.h man/man8/brctl.8 sbin/brctl)
-	rm -f $(@D)/.stamp_target_installed
+	rm -f $(BRIDGE_TARGET_INSTALL_TARGET) $(BRIDGE_HOOK_POST_INSTALL)
 
