From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 11:07:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pppd
Message-ID: <20070919180759.577043004D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 11:07:58 -0700 (Wed, 19 Sep 2007)
New Revision: 19895

Log:
- take MANPAGES and INFOPAGES into account


Modified:
   trunk/buildroot/package/pppd/pppd.mk


Changeset:
Modified: trunk/buildroot/package/pppd/pppd.mk
===================================================================
--- trunk/buildroot/package/pppd/pppd.mk	2007-09-19 17:32:21 UTC (rev 19894)
+++ trunk/buildroot/package/pppd/pppd.mk	2007-09-19 18:07:58 UTC (rev 19895)
@@ -56,8 +56,17 @@
 
 $(TARGET_DIR)/$(PPPD_TARGET_BINARY): $(PPPD_DIR)/$(PPPD_BINARY)
 	$(MAKE1) DESTDIR=$(TARGET_DIR)/usr CC=$(TARGET_CC) -C $(PPPD_DIR) install
-	rm -rf $(TARGET_DIR)/usr/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+ifneq ($(BR2_ENABLE_LOCALE),y)
+	rm -rf $(TARGET_DIR)/usr/share/locale
+endif
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/man
+endif
+ifneq ($(BR2_HAVE_INFOPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/info
+endif
+	rm -rf $(TARGET_DIR)/usr/share/doc
+	rm -rf $(TARGET_DIR)/usr/include/pppd
 
 pppd: uclibc $(TARGET_DIR)/$(PPPD_TARGET_BINARY)
 
@@ -67,6 +76,7 @@
 	rm -f $(TARGET_DIR)/usr/sbin/pppstatus
 	rm -f $(TARGET_DIR)/usr/sbin/pppdump
 	rm -rf $(TARGET_DIR)/etc/ppp
+	rm -rf $(TARGET_DIR)/usr/include/pppd
 	-$(MAKE) -C $(PPPD_DIR) clean
 
 pppd-dirclean:
