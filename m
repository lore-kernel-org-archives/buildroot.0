From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 5 Sep 2008 14:30:47 +1000
Subject: [Buildroot] Makefile.autotools.in stamp files breaks
	multiple	projects
In-Reply-To: <20080904025034.GA18148@cloud.net.au>
References: <20080904025034.GA18148@cloud.net.au>
Message-ID: <20080905043047.GA25440@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 04, 2008 at 12:50:35PM +1000, Hamish Moffatt wrote:
> 2. The .stamp_install files could be put somewhere under $(TARGET_DIR)
> instead of $(BUILD_DIR); they'd need to be stripped out by the various
> generators in target/.. though.

Here's my patch to move the target-installed and post-install-hook
stamps to $(PROJECT_BUILD_DIR)/.stamp/$(PKG)_xyz instead of
$(BUILD_DIR)/$(PKG)/.stamp_xyz, so that these actions will be repeated
for each project.

Any comments before I commit it?

The patch also fixes up the bridge-utils package, which is the only
package that overrides the uninstall target. I'm not sure how well
uninstall works with multiple projects, but this probably doesn't make
it any worse.


thanks
Hamish


Index: package/Makefile.autotools.in
===================================================================
--- package/Makefile.autotools.in	(revision 6342)
+++ package/Makefile.autotools.in	(working copy)
@@ -234,15 +234,16 @@
 	touch $@
 
 # Install to target dir
-$(BUILD_DIR)/%/.stamp_target_installed:
+$(PROJECT_BUILD_DIR)/.stamp/%_target_installed:
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
+	rm -f $(PROJECT_BUILD_DIR)/.stamp/$(PKG)_target_installed
 
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
@@ -302,7 +303,8 @@
 
 
 # define sub-target stamps
-$(2)_TARGET_INSTALL_TARGET =	$$($(2)_DIR)/.stamp_target_installed
+# targets which affect $(TARGET_DIR) must use a unique stamp for each $(PROJECT)
+$(2)_TARGET_INSTALL_TARGET =	$(PROJECT_BUILD_DIR)/.stamp/$(1)_target_installed
 $(2)_TARGET_INSTALL_STAGING =	$$($(2)_DIR)/.stamp_staging_installed
 $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
 $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
@@ -317,7 +319,7 @@
 $(2)_HOOK_POST_EXTRACT =	$$($(2)_DIR)/.stamp_hook_post_extract
 $(2)_HOOK_POST_CONFIGURE =	$$($(2)_DIR)/.stamp_hook_post_configure
 $(2)_HOOK_POST_BUILD =		$$($(2)_DIR)/.stamp_hook_post_build
-$(2)_HOOK_POST_INSTALL =	$$($(2)_DIR)/.stamp_hook_post_install
+$(2)_HOOK_POST_INSTALL =	$(PROJECT_BUILD_DIR)/.stamp/$(1)_hook_post_install
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
Index: package/bridge-utils/bridge.mk
===================================================================
--- package/bridge-utils/bridge.mk	(revision 6342)
+++ package/bridge-utils/bridge.mk	(working copy)
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
 

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
