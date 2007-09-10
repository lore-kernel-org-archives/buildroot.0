From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 10 Sep 2007 02:04:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20070910090403.1C5ACA688F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-09-10 02:04:03 -0700 (Mon, 10 Sep 2007)
New Revision: 19809

Log:
Use BR2_INET_IPV6 and BR2_HAVE_MANPAGES options.
Use := instead of =


Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2007-09-10 07:38:03 UTC (rev 19808)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2007-09-10 09:04:03 UTC (rev 19809)
@@ -4,19 +4,25 @@
 #
 #############################################################
 
-DNSMASQ_SITE=http://thekelleys.org.uk/dnsmasq
+DNSMASQ_SITE:=http://thekelleys.org.uk/dnsmasq
 ifeq ($(filter $(TARGETS),dnsmasq1),)
-DNSMASQ_UPVER=2.39
-DNSMASQ_VERSION=dnsmasq2
+DNSMASQ_UPVER:=2.39
+DNSMASQ_VERSION:=dnsmasq2
 else
-DNSMASQ_UPVER=1.18
-DNSMASQ_VERSION=dnsmasq1
+DNSMASQ_UPVER:=1.18
+DNSMASQ_VERSION:=dnsmasq1
 endif
-DNSMASQ_SOURCE=dnsmasq-$(DNSMASQ_UPVER).tar.gz
-DNSMASQ_DIR=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
-DNSMASQ_BINARY=dnsmasq
-DNSMASQ_TARGET_BINARY=usr/sbin/dnsmasq
+DNSMASQ_SOURCE:=dnsmasq-$(DNSMASQ_UPVER).tar.gz
+DNSMASQ_DIR:=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
+DNSMASQ_BINARY:=dnsmasq
+DNSMASQ_TARGET_BINARY:=usr/sbin/dnsmasq
 
+ifneq ($(BR2_INET_IPV6),y)
+DNSMASQ_COPTS:=-DNO_IPV6
+else
+DNSMASQ_COPTS:=
+endif
+
 $(DL_DIR)/$(DNSMASQ_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DNSMASQ_SITE)/$(DNSMASQ_SOURCE)
 
@@ -28,7 +34,7 @@
 
 $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY): $(DNSMASQ_DIR)/.source
 	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
-		PREFIX=/usr -C $(DNSMASQ_DIR)
+		COPTS=$(DNSMASQ_COPTS) PREFIX=/usr -C $(DNSMASQ_DIR)
 
 $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY): $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(DNSMASQ_DIR) install
@@ -36,8 +42,9 @@
 	mkdir -p $(TARGET_DIR)/var/lib/misc
 	# Isn't this vulverable to symlink attacks?
 	ln -sf /tmp/dnsmasq.leases $(TARGET_DIR)/var/lib/misc/dnsmasq.leases
-	# Another questionable wipe out :(
-	#rm -rf $(TARGET_DIR)/usr/share/man
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/share/man
+endif
 
 dnsmasq: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
 
