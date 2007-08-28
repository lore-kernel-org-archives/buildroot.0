From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 11:22:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pppd
Message-ID: <20070828182238.96B68A67F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 11:22:38 -0700 (Tue, 28 Aug 2007)
New Revision: 19715

Log:
This fixes make clean on pppd package (there is no rule uninstall in pppd's makefile) 
and does some small bits of cleanup.

Signed-off-by: Thiago A. Corr?\195?\170a <thiago.correa@gmail.com>


Modified:
   trunk/buildroot/package/pppd/pppd.mk


Changeset:
Modified: trunk/buildroot/package/pppd/pppd.mk
===================================================================
--- trunk/buildroot/package/pppd/pppd.mk	2007-08-28 18:21:00 UTC (rev 19714)
+++ trunk/buildroot/package/pppd/pppd.mk	2007-08-28 18:22:38 UTC (rev 19715)
@@ -26,7 +26,7 @@
 	$(SED) 's,(INSTALL) -s,(INSTALL),' $(PPPD_DIR)/pppd/plugins/*/Makefile.linux
 	$(SED) 's/ -o root//' $(PPPD_DIR)/*/Makefile.linux
 	$(SED) 's/ -g daemon//' $(PPPD_DIR)/*/Makefile.linux
-	touch $(PPPD_DIR)/.unpacked
+	touch $@
 
 $(PPPD_DIR)/.configured: $(PPPD_DIR)/.unpacked
 	(cd $(PPPD_DIR); rm -rf config.cache; \
@@ -49,7 +49,7 @@
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 	)
-	touch $(PPPD_DIR)/.configured
+	touch $@
 
 $(PPPD_DIR)/$(PPPD_BINARY): $(PPPD_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR)
@@ -65,7 +65,6 @@
 	rm -f $(TARGET_DIR)/usr/sbin/pppd
 	rm -f $(TARGET_DIR)/usr/sbin/chat
 	rm -rf $(TARGET_DIR)/etc/ppp
-	$(MAKE) DESTDIR=$(TARGET_DIR)/usr CC=$(TARGET_CC) -C $(PPPD_DIR) uninstall
 	-$(MAKE) -C $(PPPD_DIR) clean
 
 pppd-dirclean:
