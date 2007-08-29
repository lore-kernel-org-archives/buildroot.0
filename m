From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 29 Aug 2007 08:44:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/distcc
Message-ID: <20070829154402.69CADA5E30@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-08-29 08:43:59 -0700 (Wed, 29 Aug 2007)
New Revision: 19731

Log:
Use DISTCC_BUILDDIR instead of DISTCC_DIR as that environment variable is
used by distcc itself, causing havoc if you compile buildroot under distcc.


Modified:
   trunk/buildroot/package/distcc/distcc.mk


Changeset:
Modified: trunk/buildroot/package/distcc/distcc.mk
===================================================================
--- trunk/buildroot/package/distcc/distcc.mk	2007-08-29 11:49:41 UTC (rev 19730)
+++ trunk/buildroot/package/distcc/distcc.mk	2007-08-29 15:43:59 UTC (rev 19731)
@@ -7,7 +7,7 @@
 DISTCC_SOURCE:=distcc-$(DISTCC_VERSION).tar.bz2
 DISTCC_CAT:=$(BZCAT)
 DISTCC_SITE:=http://distcc.samba.org/ftp/distcc/
-DISTCC_DIR:=$(BUILD_DIR)/distcc-$(DISTCC_VERSION)
+DISTCC_BUILDDIR:=$(BUILD_DIR)/distcc-$(DISTCC_VERSION)
 DISTCC_BINARY:=distcc
 DISTCC_TARGET_BINARY:=usr/bin/distcc
 
@@ -16,13 +16,13 @@
 
 distcc-source: $(DL_DIR)/$(CVS_SOURCE)
 
-$(DISTCC_DIR)/.unpacked: $(DL_DIR)/$(DISTCC_SOURCE)
+$(DISTCC_BUILDDIR)/.unpacked: $(DL_DIR)/$(DISTCC_SOURCE)
 	$(DISTCC_CAT) $(DL_DIR)/$(DISTCC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(DISTCC_DIR)
-	touch $(DISTCC_DIR)/.unpacked
+	$(CONFIG_UPDATE) $(DISTCC_BUILDDIR)
+	touch $(DISTCC_BUILDDIR)/.unpacked
 
-$(DISTCC_DIR)/.configured: $(DISTCC_DIR)/.unpacked
-	(cd $(DISTCC_DIR); rm -rf config.cache; \
+$(DISTCC_BUILDDIR)/.configured: $(DISTCC_BUILDDIR)/.unpacked
+	(cd $(DISTCC_BUILDDIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
@@ -43,24 +43,24 @@
 		--without-gtk \
 		--without-gnome \
 	)
-	touch $(DISTCC_DIR)/.configured
+	touch $(DISTCC_BUILDDIR)/.configured
 
-$(DISTCC_DIR)/$(DISTCC_BINARY): $(DISTCC_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DISTCC_DIR)
+$(DISTCC_BUILDDIR)/$(DISTCC_BINARY): $(DISTCC_BUILDDIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DISTCC_BUILDDIR)
 
-$(TARGET_DIR)/$(DISTCC_TARGET_BINARY): $(DISTCC_DIR)/$(DISTCC_BINARY)
-	install -D $(DISTCC_DIR)/$(DISTCC_BINARY)d $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)d
-	install -D $(DISTCC_DIR)/$(DISTCC_BINARY) $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)
+$(TARGET_DIR)/$(DISTCC_TARGET_BINARY): $(DISTCC_BUILDDIR)/$(DISTCC_BINARY)
+	install -D $(DISTCC_BUILDDIR)/$(DISTCC_BINARY)d $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)d
+	install -D $(DISTCC_BUILDDIR)/$(DISTCC_BINARY) $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)
 
 distcc: uclibc $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)
 
 distcc-clean:
 	rm -f $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)
 	rm -f $(TARGET_DIR)/$(DISTCC_TARGET_BINARY)d
-	-$(MAKE) -C $(DISTCC_DIR) clean
+	-$(MAKE) -C $(DISTCC_BUILDDIR) clean
 
 distcc-dirclean:
-	rm -rf $(DISTCC_DIR)
+	rm -rf $(DISTCC_BUILDDIR)
 #############################################################
 #
 # Toplevel Makefile options
