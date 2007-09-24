From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 24 Sep 2007 02:00:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hdparm
Message-ID: <20070924090040.9AD8130046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-24 02:00:39 -0700 (Mon, 24 Sep 2007)
New Revision: 19985

Log:
- bump version. Cleanup while at it


Modified:
   trunk/buildroot/package/hdparm/hdparm.mk


Changeset:
Modified: trunk/buildroot/package/hdparm/hdparm.mk
===================================================================
--- trunk/buildroot/package/hdparm/hdparm.mk	2007-09-24 07:34:48 UTC (rev 19984)
+++ trunk/buildroot/package/hdparm/hdparm.mk	2007-09-24 09:00:39 UTC (rev 19985)
@@ -3,9 +3,9 @@
 # hdparm
 #
 #############################################################
-HDPARM_VERSION:=7.6
+HDPARM_VERSION:=7.7
 HDPARM_SOURCE:=hdparm-$(HDPARM_VERSION).tar.gz
-HDPARM_SITE:=http://www.ibiblio.org/pub/Linux/system/hardware/
+HDPARM_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/hdparm
 HDPARM_CAT:=$(ZCAT)
 HDPARM_DIR:=$(BUILD_DIR)/hdparm-$(HDPARM_VERSION)
 HDPARM_BINARY:=hdparm
@@ -16,27 +16,29 @@
 
 hdparm-source: $(DL_DIR)/$(HDPARM_SOURCE)
 
-hdparm-unpacked: $(HDPARM_DIR)/.unpacked
 $(HDPARM_DIR)/.unpacked: $(DL_DIR)/$(HDPARM_SOURCE)
 	$(HDPARM_CAT) $(DL_DIR)/$(HDPARM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(HDPARM_DIR) package/hdparm hdparm.patch
-	touch $(HDPARM_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(HDPARM_DIR) package/hdparm \*.patch
+	touch $@
 
-$(HDPARM_DIR)/.configured: $(HDPARM_DIR)/.unpacked
-	touch $(HDPARM_DIR)/.configured
+$(HDPARM_DIR)/$(HDPARM_BINARY): $(HDPARM_DIR)/.unpacked
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(HDPARM_DIR) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
 
-$(HDPARM_DIR)/$(HDPARM_BINARY): $(HDPARM_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(HDPARM_DIR)
-
 $(TARGET_DIR)/$(HDPARM_TARGET_BINARY): $(HDPARM_DIR)/$(HDPARM_BINARY)
 	rm -f $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
-	cp -a $(HDPARM_DIR)/$(HDPARM_BINARY) $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
+	$(INSTALL) -D -m 0755 $(HDPARM_DIR)/$(HDPARM_BINARY) $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
+ifeq ($(BR2_HAVE_MANPAGES),y)
+	$(INSTALL) -D $(HDPARM_DIR)/hdparm.8 $(TARGET_DIR)/usr/share/man/man8/hdparm.8
+endif
+	$(STRIP) $(STRIP_STRIP_ALL) $@
 
 hdparm: uclibc $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
 
 hdparm-clean:
+	-$(MAKE) -C $(HDPARM_DIR) clean
 	rm -f $(TARGET_DIR)/$(HDPARM_TARGET_BINARY)
-	-$(MAKE) -C $(HDPARM_DIR) clean
 
 hdparm-dirclean:
 	rm -rf $(HDPARM_DIR)
