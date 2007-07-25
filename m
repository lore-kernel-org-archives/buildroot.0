From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 25 Jul 2007 04:40:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/portage
Message-ID: <20070725114011.70573A45F2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-25 04:40:09 -0700 (Wed, 25 Jul 2007)
New Revision: 19257

Log:
Bump version of portage/sandbox to allow build

Modified:
   trunk/buildroot/package/portage/portage.mk


Changeset:
Modified: trunk/buildroot/package/portage/portage.mk
===================================================================
--- trunk/buildroot/package/portage/portage.mk	2007-07-24 18:20:46 UTC (rev 19256)
+++ trunk/buildroot/package/portage/portage.mk	2007-07-25 11:40:09 UTC (rev 19257)
@@ -3,15 +3,19 @@
 # portage
 #
 #############################################################
-PORTAGE_VERSION:=2.0.51.22
-PORTAGE_SOURCE:=portage-$(PORTAGE_VERSION).tar.bz2
+PORTAGE_DOWNLOAD_VERSION:=2.1.2
+PORTAGE_PATCH_VERSION:=.9
+PORTAGE_VERSION:=$(PORTAGE_DOWNLOAD_VERSION)$(PORTAGE_PATCH_VERSION)
+PORTAGE_PATCH:=portage-$(PORTAGE_VERSION).patch.bz2
+
+PORTAGE_SOURCE:=portage-$(PORTAGE_DOWNLOAD_VERSION).tar.bz2
 PORTAGE_SITE:=http://gentoo.osuosl.org/distfiles
 PORTAGE_CAT:=$(BZCAT)
 PORTAGE_DIR:=$(BUILD_DIR)/portage-$(PORTAGE_VERSION)
 PORTAGE_TARGET_DIR:=$(TARGET_DIR)/usr/lib/portage
 PORTAGE_TARGET_BINARY:=usr/bin/emerge
 
-SANDBOX_VERSION:=1.2.13
+SANDBOX_VERSION:=1.2.18.1
 SANDBOX_SOURCE:=sandbox-$(SANDBOX_VERSION).tar.bz2
 SANDBOX_SITE:=$(PORTAGE_SITE)
 SANDBOX_CAT:=$(PORTAGE_CAT)
@@ -42,6 +46,8 @@
 
 $(DL_DIR)/$(PORTAGE_SOURCE):
 	$(WGET) -P $(DL_DIR) $(PORTAGE_SITE)/$(PORTAGE_SOURCE)
+$(DL_DIR)/$(PORTAGE_PATCH):
+	$(WGET) -P $(DL_DIR) $(PORTAGE_SITE)/$(PORTAGE_PATCH)
 $(DL_DIR)/$(SANDBOX_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SANDBOX_SITE)/$(SANDBOX_SOURCE)
 
@@ -50,17 +56,24 @@
 
 $(PORTAGE_DIR)/.unpacked: $(DL_DIR)/$(PORTAGE_SOURCE)
 	$(PORTAGE_CAT) $(DL_DIR)/$(PORTAGE_SOURCE) | tar -C $(BUILD_DIR) -xf -
+	mv -f $(BUILD_DIR)/portage-$(PORTAGE_DOWNLOAD_VERSION) $(PORTAGE_DIR)
 	rm -f $(PORTAGE_DIR)/bin/tbz2tool
-	touch $(PORTAGE_DIR)/.unpacked
+	touch $@
+
+$(PORTAGE_DIR)/.patched: $(PORTAGE_DIR)/.unpacked $(DL_DIR)/$(PORTAGE_PATCH)
+	(cd $(PORTAGE_DIR);  $(PORTAGE_CAT) $(DL_DIR)/$(PORTAGE_PATCH) | patch -p0)
+	touch $@
+
 $(SANDBOX_DIR)/.unpacked: $(DL_DIR)/$(SANDBOX_SOURCE)
 	$(SANDBOX_CAT) $(DL_DIR)/$(SANDBOX_SOURCE) | tar -C $(BUILD_DIR) -xf -
-	touch $(SANDBOX_DIR)/.unpacked
+	touch $@
 
-$(PORTAGE_DIR)/.compiled: $(PORTAGE_DIR)/.unpacked
+$(PORTAGE_DIR)/.compiled: $(PORTAGE_DIR)/.patched
 	$(TARGET_CC) $(TARGET_CFLAGS) $(PORTAGE_DIR)/src/tbz2tool.c -o $(PORTAGE_DIR)/src/tbz2tool
-	touch $(PORTAGE_DIR)/.compiled
+	touch $@
+
 $(SANDBOX_DIR)/.compiled: $(SANDBOX_DIR)/.unpacked
-	touch $(SANDBOX_DIR)/.compiled
+	touch $@
 
 newins=install -D
 doins=install
@@ -70,14 +83,20 @@
 $(TARGET_DIR)/$(PORTAGE_TARGET_BINARY): $(PORTAGE_DIR)/.compiled
 	(cd $(PORTAGE_DIR)/cnf; \
 		$(newins) make.globals $(TARGET_DIR)/etc/make.globals; \
-		$(newins) make.globals.$(PORTAGE_ARCH) $(TARGET_DIR)/etc/make.globals; \
 		$(newins) make.conf $(TARGET_DIR)/etc/make.conf; \
-		$(newins) make.conf.$(PORTAGE_ARCH) $(TARGET_DIR)/etc/make.conf; \
+		cp $(TARGET_DIR)/etc/make.conf $(TARGET_DIR)/etc/make.conf.$(PORTAGE_ARCH); \
+		patch $(TARGET_DIR)/etc/make.conf.$(PORTAGE_ARCH) $(PORTAGE_DIR)/cnf/make.conf.$(PORTAGE_ARCH).diff; \
 		$(doins) etc-update.conf dispatch-conf.conf $(TARGET_DIR)/etc; \
 	)
+#		$(newins) make.globals.$(PORTAGE_ARCH) $(TARGET_DIR)/etc/make.globals; \
+#		$(newins) make.conf.$(PORTAGE_ARCH) $(TARGET_DIR)/etc/make.conf; \
 
 	$(dodir) $(PORTAGE_TARGET_DIR)/pym
-	$(doins) $(PORTAGE_DIR)/pym/* $(PORTAGE_TARGET_DIR)/pym/
+	$(doins) $(PORTAGE_DIR)/pym/*.py $(PORTAGE_TARGET_DIR)/pym/
+	mkdir -p $(PORTAGE_TARGET_DIR)/pym/cache
+	$(doins) $(PORTAGE_DIR)/pym/cache/*.py $(PORTAGE_TARGET_DIR)/pym
+	mkdir -p $(PORTAGE_TARGET_DIR)/pym/elog_modules
+	$(doins) $(PORTAGE_DIR)/pym/elog_modules/*.py $(PORTAGE_TARGET_DIR)/pym/elog_modules
 
 	$(dodir) $(PORTAGE_TARGET_DIR)/bin
 	$(doexe) $(PORTAGE_DIR)/bin/* $(PORTAGE_DIR)/src/tbz2tool $(PORTAGE_TARGET_DIR)/bin/
