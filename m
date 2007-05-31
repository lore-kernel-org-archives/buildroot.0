From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 31 May 2007 08:27:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ethtool
Message-ID: <20070531152705.C8459485B1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-31 08:27:05 -0700 (Thu, 31 May 2007)
New Revision: 18711

Log:
Cleanup, get rid of ETHTOOL_WORKDIR, use $@

Modified:
   trunk/buildroot/package/ethtool/ethtool.mk


Changeset:
Modified: trunk/buildroot/package/ethtool/ethtool.mk
===================================================================
--- trunk/buildroot/package/ethtool/ethtool.mk	2007-05-31 15:19:37 UTC (rev 18710)
+++ trunk/buildroot/package/ethtool/ethtool.mk	2007-05-31 15:27:05 UTC (rev 18711)
@@ -7,8 +7,7 @@
 ETHTOOL_VERSION=3
 ETHTOOL_SOURCE=ethtool-$(ETHTOOL_VERSION).tar.gz
 ETHTOOL_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
-ETHTOOL_DIR=$(BUILD_DIR)/${shell basename $(ETHTOOL_SOURCE) .tar.gz}
-ETHTOOL_WORKDIR=$(BUILD_DIR)/ethtool-$(ETHTOOL_VERSION)
+ETHTOOL_DIR=$(BUILD_DIR)/ethtool-$(ETHTOOL_VERSION)
 ETHTOOL_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(ETHTOOL_SOURCE):
@@ -16,7 +15,7 @@
 
 $(ETHTOOL_DIR)/.unpacked: $(DL_DIR)/$(ETHTOOL_SOURCE)
 	$(ETHTOOL_CAT) $(DL_DIR)/$(ETHTOOL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(ETHTOOL_DIR)/.unpacked
+	touch $@
 
 $(ETHTOOL_DIR)/.configured: $(ETHTOOL_DIR)/.unpacked
 	(cd $(ETHTOOL_DIR); rm -rf config.cache; \
@@ -30,26 +29,24 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 	);
-	touch $(ETHTOOL_DIR)/.configured
+	touch $@
 
-$(ETHTOOL_WORKDIR)/ethtool: $(ETHTOOL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(ETHTOOL_WORKDIR)
+$(ETHTOOL_DIR)/ethtool: $(ETHTOOL_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(ETHTOOL_DIR)
 
-$(ETHTOOL_WORKDIR)/.installed: $(ETHTOOL_WORKDIR)/ethtool
-	cp $(ETHTOOL_WORKDIR)/ethtool $(TARGET_DIR)/usr/sbin
-	touch $(ETHTOOL_WORKDIR)/.installed
+$(ETHTOOL_DIR)/.installed: $(ETHTOOL_DIR)/ethtool
+	cp $(ETHTOOL_DIR)/ethtool $(TARGET_DIR)/usr/sbin
+	touch $@
 
-ethtool:	uclibc $(ETHTOOL_WORKDIR)/.installed
+ethtool:	uclibc $(ETHTOOL_DIR)/.installed
 
 ethtool-source: $(DL_DIR)/$(ETHTOOL_SOURCE)
 
 ethtool-clean:
-	@if [ -d $(ETHTOOL_WORKDIR)/Makefile ] ; then \
-		$(MAKE) -C $(ETHTOOL_WORKDIR) clean ; \
-	fi;
+	-$(MAKE) -C $(ETHTOOL_DIR) clean
 
 ethtool-dirclean:
-	rm -rf $(ETHTOOL_DIR) $(ETHTOOL_WORKDIR)
+	rm -rf $(ETHTOOL_DIR)
 #############################################################
 #
 # Toplevel Makefile options
