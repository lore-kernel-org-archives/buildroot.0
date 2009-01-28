From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 06:32:29 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20090128063229.B3347769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 06:32:28 +0000 (Wed, 28 Jan 2009)
New Revision: 25084

Log:
Makefile.autotools.in: add FOO_MAKE for packages needing to use $(MAKE1)

As requested on irc.

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2009-01-28 01:04:49 UTC (rev 25083)
+++ trunk/buildroot/package/Makefile.autotools.in	2009-01-28 06:32:28 UTC (rev 25084)
@@ -38,6 +38,8 @@
 #	environment passed to the <configure> script
 # FOO_CONF_OPT [default empty]
 #	arguments passed to the <configure> script
+# FOO_MAKE [default $(MAKE)]
+#	command to use to execute <make>
 # FOO_MAKE_ENV [default empty]
 #	environment passed to all calls to <make> in the package source
 #	directory
@@ -257,13 +259,13 @@
 # Build
 $(BUILD_DIR)/%/.stamp_built:
 	$(call MESSAGE,"Building")
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	$($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	$(Q)touch $@
 
 # Install to staging dir
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	$(call MESSAGE,'Installing to host (staging directory)')
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	$($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_INSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 #	toolchain/replace.sh $(STAGING_DIR)/usr/lib ".*\.la" "\(['= ]\)/usr" "\\1$(STAGING_DIR)/usr"
 	for i in $$(find $(STAGING_DIR)/usr/lib/ -name "*.la"); do \
 		cp $$i $$i~; \
@@ -274,7 +276,7 @@
 # Install to target dir
 $(PROJECT_BUILD_DIR)/autotools-stamps/%_target_installed:
 	$(call MESSAGE,"Installing to target")
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $($(PKG)_DIR)/$($(PKG)_SUBDIR)
+	$($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $($(PKG)_DIR)/$($(PKG)_SUBDIR)
 	$(if $(BR2_HAVE_MANPAGES),,for d in man share/man; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
@@ -288,14 +290,14 @@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
 	$(call MESSAGE,"Cleaning up")
-	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_CLEAN_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	-$($(PKG)_MAKE_ENV) $($(PKG)_MAKE)  $($(PKG)_CLEAN_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	rm -f $(@D)/.stamp_built
 
 $(BUILD_DIR)/%/.stamp_uninstalled:
 	$(call MESSAGE,"Uninstalling")
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_UNINSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	$($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_UNINSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	rm -f $(@D)/.stamp_staging_installed
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_UNINSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	$($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_UNINSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	rm -f $($(PKG)_TARGET_INSTALL_TARGET) $($(PKG)_HOOK_POST_INSTALL)
 
 $(BUILD_DIR)/%/.stamp_dircleaned:
@@ -331,6 +333,7 @@
 $(2)_USE_CONFIG_CACHE   ?= $(if $(BR2_CONFIG_CACHE),YES,NO)
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
+$(2)_MAKE			?= $(MAKE)
 $(2)_MAKE_ENV			?=
 $(2)_MAKE_OPT			?=
 $(2)_INSTALL_STAGING		?= NO
