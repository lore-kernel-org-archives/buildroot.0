From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 12 Apr 2008 06:26:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/haserl
Message-ID: <20080412132658.2BBDC3C573@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-12 06:26:57 -0700 (Sat, 12 Apr 2008)
New Revision: 21718

Log:
haserl: depend on haserl binary in TARGET_DIR and also cleanup TARGET_DIR.


Modified:
   trunk/buildroot/package/haserl/haserl.mk


Changeset:
Modified: trunk/buildroot/package/haserl/haserl.mk
===================================================================
--- trunk/buildroot/package/haserl/haserl.mk	2008-04-12 09:56:15 UTC (rev 21717)
+++ trunk/buildroot/package/haserl/haserl.mk	2008-04-12 13:26:57 UTC (rev 21718)
@@ -10,6 +10,7 @@
 HASERL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/haserl/
 HASERL_DIR:=$(BUILD_DIR)/haserl-$(HASERL_VERSION)
 HASERL_CAT:=$(ZCAT)
+HASERL_BINARY:=usr/bin/haserl
 
 $(DL_DIR)/$(HASERL_SOURCE):
 	$(WGET) -P $(DL_DIR) $(HASERL_SITE)/$(HASERL_SOURCE)
@@ -35,11 +36,10 @@
 $(HASERL_DIR)/src/haserl: $(HASERL_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(HASERL_DIR)
 
-$(HASERL_DIR)/.installed: $(HASERL_DIR)/src/haserl
-	cp $(HASERL_DIR)/src/haserl $(TARGET_DIR)/usr/bin
-	touch $@
+$(TARGET_DIR)/$(HASERL_BINARY): $(HASERL_DIR)/src/haserl
+	cp $^ $@
 
-haserl: uclibc $(HASERL_DIR)/.installed
+haserl: uclibc $(TARGET_DIR)/$(HASERL_BINARY)
 
 haserl-source: $(DL_DIR)/$(HASERL_SOURCE)
 
@@ -47,6 +47,7 @@
 
 haserl-clean:
 	-$(MAKE) -C $(HASERL_DIR) clean
+	rm -f $(TARGET_DIR)/$(HASERL_BINARY)
 
 haserl-dirclean:
 	rm -rf $(HASERL_DIR)
