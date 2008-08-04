From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl: haserl-0.8.0
Message-ID: <20080804190838.BB1DE3C903@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:38 -0700 (Mon, 04 Aug 2008)
New Revision: 23039

Log:
haserl: convert to Makefile.autotools.in format

Added:
   trunk/buildroot/package/haserl/haserl-0.8.0/
   trunk/buildroot/package/haserl/haserl-0.8.0/haserl-0.8.0-legacy.patch

Removed:
   trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch

Modified:
   trunk/buildroot/package/haserl/haserl.mk


Changeset:
Copied: trunk/buildroot/package/haserl/haserl-0.8.0/haserl-0.8.0-legacy.patch (from rev 23038, trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch)
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.8.0/haserl-0.8.0-legacy.patch	                        (rev 0)
+++ trunk/buildroot/package/haserl/haserl-0.8.0/haserl-0.8.0-legacy.patch	2008-08-04 19:08:38 UTC (rev 23039)
@@ -0,0 +1,12 @@
+diff -urN haserl-0.8.0-0rig/src/haserl.c haserl-0.8.0/src/haserl.c
+--- haserl-0.8.0-0rig/src/haserl.c	2004-11-10 18:59:35.000000000 +0100
++++ haserl-0.8.0/src/haserl.c	2007-10-12 14:36:28.000000000 +0200
+@@ -131,7 +131,7 @@
+ 	if (strlen(prefix)) { memcpy (entry, prefix, strlen(prefix)); }
+ 	memcpy ((char *) (entry + strlen(prefix)), newbuf, strlen(newbuf));
+ 
+-	keylen = (size_t) (index (entry, '=') - entry);
++	keylen = (size_t) (strchr (entry, '=') - entry);
+ 	
+ 	if ( keylen <= 0 ) {
+ 			free (entry);

Deleted: trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch
===================================================================
--- trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch	2008-08-04 19:08:35 UTC (rev 23038)
+++ trunk/buildroot/package/haserl/haserl-0.8.0-legacy.patch	2008-08-04 19:08:38 UTC (rev 23039)
@@ -1,12 +0,0 @@
-diff -urN haserl-0.8.0-0rig/src/haserl.c haserl-0.8.0/src/haserl.c
---- haserl-0.8.0-0rig/src/haserl.c	2004-11-10 18:59:35.000000000 +0100
-+++ haserl-0.8.0/src/haserl.c	2007-10-12 14:36:28.000000000 +0200
-@@ -131,7 +131,7 @@
- 	if (strlen(prefix)) { memcpy (entry, prefix, strlen(prefix)); }
- 	memcpy ((char *) (entry + strlen(prefix)), newbuf, strlen(newbuf));
- 
--	keylen = (size_t) (index (entry, '=') - entry);
-+	keylen = (size_t) (strchr (entry, '=') - entry);
- 	
- 	if ( keylen <= 0 ) {
- 			free (entry);

Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2008-08-04 19:08:35 UTC (rev 23038)
+++ trunk/buildroot/package/haserl/haserl.mk	2008-08-04 19:08:38 UTC (rev 23039)
@@ -8,54 +8,15 @@
 #"))
 HASERL_SOURCE:=haserl-$(HASERL_VERSION).tar.gz
 HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
-HASERL_DIR:=$(BUILD_DIR)/haserl-$(HASERL_VERSION)
-HASERL_CAT:=$(ZCAT)
-HASERL_BINARY:=usr/bin/haserl
+HASERL_AUTORECONF:=no
+HASERL_INSTALL_STAGING:=NO
+HASERL_INSTALL_TARGET:=YES
+HASERL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip
+HASERL_UNINSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) uninstall
 
-$(DL_DIR)/$(HASERL_SOURCE):
-	$(WGET) -P $(DL_DIR) $(HASERL_SITE)/$(HASERL_SOURCE)
+# force haserl 0.8.0 to use install-sh so stripping works
+HASERL_CONF_ENV = ac_cv_path_install=./install-sh
 
-$(HASERL_DIR)/.unpacked: $(DL_DIR)/$(HASERL_SOURCE)
-	$(HASERL_CAT) $(DL_DIR)/$(HASERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HASERL_DIR) package/haserl/ haserl-$(HASERL_VERSION)\*.patch
-	touch $@
+HASERL_DEPENDENCIES:=uclibc
 
-$(HASERL_DIR)/.configured: $(HASERL_DIR)/.unpacked
-	(cd $(HASERL_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-	)
-	touch $@
-
-$(HASERL_DIR)/src/haserl: $(HASERL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(HASERL_DIR)
-
-$(TARGET_DIR)/$(HASERL_BINARY): $(HASERL_DIR)/src/haserl
-	cp $^ $@
-
-haserl: uclibc $(TARGET_DIR)/$(HASERL_BINARY)
-
-haserl-source: $(DL_DIR)/$(HASERL_SOURCE)
-
-haserl-unpacked: $(HASERL_DIR)/.unpacked
-
-haserl-clean:
-	-$(MAKE) -C $(HASERL_DIR) clean
-	rm -f $(TARGET_DIR)/$(HASERL_BINARY)
-
-haserl-dirclean:
-	rm -rf $(HASERL_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_HASERL)),y)
-TARGETS+=haserl
-endif
+$(eval $(call AUTOTARGETS,package,haserl))
