From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 09:18:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openntpd
Message-ID: <20070626161803.BDCB6A45E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 09:18:00 -0700 (Tue, 26 Jun 2007)
New Revision: 18942

Log:
- bump version


Modified:
   trunk/buildroot/package/openntpd/openntpd.mk


Changeset:
Modified: trunk/buildroot/package/openntpd/openntpd.mk
===================================================================
--- trunk/buildroot/package/openntpd/openntpd.mk	2007-06-26 15:59:37 UTC (rev 18941)
+++ trunk/buildroot/package/openntpd/openntpd.mk	2007-06-26 16:18:00 UTC (rev 18942)
@@ -3,7 +3,7 @@
 # OpenNTPD
 #
 #############################################################
-OPENNTPD_VERSION:=3.6.1p1
+OPENNTPD_VERSION:=3.9p1
 OPENNTPD_SOURCE:=openntpd-$(OPENNTPD_VERSION).tar.gz
 OPENNTPD_SITE:=ftp://ftp.openbsd.org/pub/OpenBSD/OpenNTPD
 OPENNTPD_DIR:=$(BUILD_DIR)/openntpd-$(OPENNTPD_VERSION)
@@ -16,13 +16,12 @@
 
 $(OPENNTPD_DIR)/.source: $(DL_DIR)/$(OPENNTPD_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(OPENNTPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(OPENNTPD_DIR)/.source
+	#mv $(BUILD_DIR)/ntpd $(OPENNTPD_DIR)
+	touch $@
 
 $(OPENNTPD_DIR)/.configured: $(OPENNTPD_DIR)/.source
 	(cd $(OPENNTPD_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -35,6 +34,17 @@
 
 $(OPENNTPD_DIR)/$(OPENNTPD_BINARY): $(OPENNTPD_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(OPENNTPD_DIR)
+	#(cd $(OPENNTPD_DIR) ; \
+	# $(YACC) parse.y ; \
+	# $(TARGET_CC) $(TARGET_CFLAGS) $(CFLAGS_COMBINE) \
+	# 	$(CFLAGS_WHOLE_PROGRAM) -I$(OPENNTPD_DIR) \
+	#	-D__dead="__attribute((__noreturn__))" -DHAVE_INTXX_T=1 \
+	#	-include defines.h \
+	#	-o $@ \
+	#	ntpd.c buffer.c log.c imsg.c ntp.c ntp_msg.c y.tab.c config.c \
+	#	server.c client.c sensors.c util.c ; \
+	#)
+	$(STRIP) -s $@
 
 $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY): $(OPENNTPD_DIR)/$(OPENNTPD_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) STRIP_OPT="" -C $(OPENNTPD_DIR) install
@@ -47,8 +57,8 @@
 ntpd-source: $(DL_DIR)/$(OPENNTPD_SOURCE)
 
 ntpd-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(OPENNTPD_DIR) uninstall
-	rm -f $(TARGET_DIR)/etc/ntpd.conf
+	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(OPENNTPD_DIR) uninstall
+	rm -f $(TARGET_DIR)/etc/ntpd.conf $(TARGET_DIR)/$(OPENNTPD_TARGET_BINARY)
 	-$(MAKE) -C $(OPENNTPD_DIR) clean
 
 ntpd-dirclean:
