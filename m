From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:39:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080306183943.2DDED120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:39:42 -0800 (Thu, 06 Mar 2008)
New Revision: 21247

Log:
fixed nasty makefile bugs

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-03-06 18:38:46 UTC (rev 21246)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-03-06 18:39:42 UTC (rev 21247)
@@ -45,7 +45,7 @@
 #	install the package to the target directory
 # FOO_INSTALL_STAGING_OPT [default DESTDIR=$(STAGING_DIR)/usr install]
 #	arguments passed to <make> while installing to the staging directory
-# FOO_INSTALL_TARGET_OPT [default DESTDIR=$(STAGING_DIR)/usr install-exec]
+# FOO_INSTALL_TARGET_OPT [default DESTDIR=$(TARGET_DIR)/usr install-exec]
 #	arguments passed to <make> while installing to the target directory
 # FOO_CLEAN_OPT [default clean]
 #	arguments passed to <make> while installing to the staging directory
@@ -142,6 +142,7 @@
 	$(Q)mkdir -p $(@D)
 	$(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+	chmod -R ug+rw $(@D)  
 	$(Q)touch $@
 
 # Patch
@@ -150,7 +151,7 @@
 # XXX: FIXME: "package/".
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(PKG)_NAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
-	$(call MESSAGE,"Patching")
+	$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)")
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
 	if test -d $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME); then \
@@ -212,7 +213,7 @@
 #	toolchain/replace.sh $(STAGING_DIR)/usr/lib ".*\.la" "\(['= ]\)/usr" "\\1$(STAGING_DIR)/usr"
 	for i in $$(find $(STAGING_DIR)/usr/lib/ -name "*.la"); do \
 		cp $$i $$i~; \
-		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:" $$i; \
+		$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$i; \
 	done
 	touch $@
 
@@ -367,7 +368,7 @@
 $$($(2)_HOOK_POST_BUILD):
 $$($(2)_HOOK_POST_INSTALL):
 
-# add package to the general list if targets if requested by the buildroot
+# add package to the general list of targets if requested by the buildroot
 # configuration
 ifeq ($$(BR2_PACKAGE_$(2)),y)
 TARGETS += $(1)
