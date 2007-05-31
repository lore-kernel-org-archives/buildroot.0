From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 31 May 2007 08:19:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20070531151938.826BB4859B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-31 08:19:37 -0700 (Thu, 31 May 2007)
New Revision: 18710

Log:
Cleanup, get rid of HASERL_WORKDIR, use $@

Modified:
   trunk/buildroot/package/haserl/haserl.mk


Changeset:
Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2007-05-31 08:26:29 UTC (rev 18709)
+++ trunk/buildroot/package/haserl/haserl.mk	2007-05-31 15:19:37 UTC (rev 18710)
@@ -7,8 +7,7 @@
 HASERL_VERSION=0.8.0
 HASERL_SOURCE=haserl-$(HASERL_VERSION).tar.gz
 HASERL_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
-HASERL_DIR=$(BUILD_DIR)/${shell basename $(HASERL_SOURCE) .tar.gz}
-HASERL_WORKDIR=$(BUILD_DIR)/haserl-$(HASERL_VERSION)
+HASERL_DIR=$(BUILD_DIR)/haserl-$(HASERL_VERSION)
 HASERL_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(HASERL_SOURCE):
@@ -16,7 +15,7 @@
 
 $(HASERL_DIR)/.unpacked: $(DL_DIR)/$(HASERL_SOURCE)
 	$(HASERL_CAT) $(DL_DIR)/$(HASERL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(HASERL_DIR)/.unpacked
+	touch $@
 
 $(HASERL_DIR)/.configured: $(HASERL_DIR)/.unpacked
 	(cd $(HASERL_DIR); rm -rf config.cache; \
@@ -30,26 +29,24 @@
 		--prefix=/usr \
 		--sysconfdir=/etc \
 	);
-	touch $(HASERL_DIR)/.configured
+	touch $@
 
-$(HASERL_WORKDIR)/src/haserl: $(HASERL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(HASERL_WORKDIR)
+$(HASERL_DIR)/src/haserl: $(HASERL_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(HASERL_DIR)
 
-$(HASERL_WORKDIR)/.installed: $(HASERL_WORKDIR)/src/haserl
-	cp $(HASERL_WORKDIR)/src/haserl $(TARGET_DIR)/usr/bin
-	touch $(HASERL_WORKDIR)/.installed
+$(HASERL_DIR)/.installed: $(HASERL_DIR)/src/haserl
+	cp $(HASERL_DIR)/src/haserl $(TARGET_DIR)/usr/bin
+	touch $@
 
-haserl:	uclibc $(HASERL_WORKDIR)/.installed
+haserl:	uclibc $(HASERL_DIR)/.installed
 
 haserl-source: $(DL_DIR)/$(HASERL_SOURCE)
 
 haserl-clean:
-	@if [ -d $(HASERL_WORKDIR)/Makefile ] ; then \
-		$(MAKE) -C $(HASERL_WORKDIR) clean ; \
-	fi;
+	-$(MAKE) -C $(HASERL_DIR) clean
 
 haserl-dirclean:
-	rm -rf $(HASERL_DIR) $(HASERL_WORKDIR)
+	rm -rf $(HASERL_DIR)
 #############################################################
 #
 # Toplevel Makefile options
