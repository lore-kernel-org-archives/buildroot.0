From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 03:58:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openntpd
Message-ID: <20070716105859.CD7C5A6131@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 03:58:58 -0700 (Mon, 16 Jul 2007)
New Revision: 19110

Log:
Avoid rebuild of openntpd

Modified:
   trunk/buildroot/package/openntpd/openntpd.mk


Changeset:
Modified: trunk/buildroot/package/openntpd/openntpd.mk
===================================================================
--- trunk/buildroot/package/openntpd/openntpd.mk	2007-07-16 10:00:29 UTC (rev 19109)
+++ trunk/buildroot/package/openntpd/openntpd.mk	2007-07-16 10:58:58 UTC (rev 19110)
@@ -9,7 +9,7 @@
 OPENNTPD_DIR:=$(BUILD_DIR)/openntpd-$(OPENNTPD_VERSION)
 OPENNTPD_CAT:=$(ZCAT)
 OPENNTPD_BINARY:=ntpd
-OPENNTPD_TARGET_BINARY:=usr/sbin/foo
+OPENNTPD_TARGET_BINARY:=usr/sbin/ntpd
 
 $(DL_DIR)/$(OPENNTPD_SOURCE):
 	$(WGET) -P $(DL_DIR) $(OPENNTPD_SITE)/$(OPENNTPD_SOURCE)
@@ -48,9 +48,10 @@
 	$(STRIP) -s $@
 
 $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY): $(OPENNTPD_DIR)/$(OPENNTPD_BINARY)
+	rm -f $(TARGET_DIR)/etc/ntpd.conf
 	$(MAKE) DESTDIR=$(TARGET_DIR) STRIP_OPT="" -C $(OPENNTPD_DIR) install
-	-$(STRIP) $(TARGET_DIR)/usr/sbin/ntpd
-	cp $(OPENNTPD_DIR)/ntpd.conf $(TARGET_DIR)/etc
+	-$(STRIP) $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY)
+	cp -af $(OPENNTPD_DIR)/ntpd.conf $(TARGET_DIR)/etc/ntpd.conf
 	rm -Rf $(TARGET_DIR)/usr/man
 
 ntpd: uclibc $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY)
