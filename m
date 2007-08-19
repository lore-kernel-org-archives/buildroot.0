From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 14:13:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openntpd
Message-ID: <20070819211309.2F199A60E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 14:13:08 -0700 (Sun, 19 Aug 2007)
New Revision: 19569

Log:
openntpd cleanup

Modified:
   trunk/buildroot/package/openntpd/openntpd.mk


Changeset:
Modified: trunk/buildroot/package/openntpd/openntpd.mk
===================================================================
--- trunk/buildroot/package/openntpd/openntpd.mk	2007-08-19 21:11:15 UTC (rev 19568)
+++ trunk/buildroot/package/openntpd/openntpd.mk	2007-08-19 21:13:08 UTC (rev 19569)
@@ -29,9 +29,11 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--mandir=/usr/share/man \
 		--with-builtin-arc4random \
-	);
-	touch $(OPENNTPD_DIR)/.configured;
+	)
+	touch $@
 
 $(OPENNTPD_DIR)/$(OPENNTPD_BINARY): $(OPENNTPD_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(OPENNTPD_DIR)
@@ -45,22 +47,24 @@
 	#	ntpd.c buffer.c log.c imsg.c ntp.c ntp_msg.c y.tab.c config.c \
 	#	server.c client.c sensors.c util.c ; \
 	#)
-	$(STRIP) -s $@
+	$(STRIP) $@
 
 $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY): $(OPENNTPD_DIR)/$(OPENNTPD_BINARY)
 	rm -f $(TARGET_DIR)/etc/ntpd.conf
 	$(MAKE) DESTDIR=$(TARGET_DIR) STRIP_OPT="" -C $(OPENNTPD_DIR) install
 	-$(STRIP) $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY)
 	cp -af $(OPENNTPD_DIR)/ntpd.conf $(TARGET_DIR)/etc/ntpd.conf
-	rm -Rf $(TARGET_DIR)/usr/man
+	# Why in earth do we wipe the whole man directory here?
+	#rm -Rf $(TARGET_DIR)/usr/man
 
 ntpd: uclibc $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY)
 
 ntpd-source: $(DL_DIR)/$(OPENNTPD_SOURCE)
 
 ntpd-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(OPENNTPD_DIR) uninstall
-	rm -f $(TARGET_DIR)/etc/ntpd.conf $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY)
+	rm -f $(addprefix $(TARGET_DIR)/,etc/ntpd.conf \
+					 usr/share/man/man?/ntpd.conf* \
+					 $(OPENNTPD_TARGET_BINARY))
 	-$(MAKE) -C $(OPENNTPD_DIR) clean
 
 ntpd-dirclean:
