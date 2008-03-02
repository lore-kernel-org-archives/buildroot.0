From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Mar 2008 06:36:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20080302143643.7AE9B12C68F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-02 06:36:43 -0800 (Sun, 02 Mar 2008)
New Revision: 21153

Log:
dnsmasq: Enable dbus support if available


Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-03-02 14:36:40 UTC (rev 21152)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-03-02 14:36:43 UTC (rev 21153)
@@ -21,6 +21,12 @@
 DNSMASQ_COPTS+=-DNO_TFTP
 endif
 
+ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
+DNSMASQ_DBUS:=$(TARGET_DIR)/usr/bin/dbus-daemon
+else
+DNSMASQ_DBUS:=
+endif
+
 $(DL_DIR)/$(DNSMASQ_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DNSMASQ_SITE)/$(DNSMASQ_SOURCE)
 
@@ -29,7 +35,14 @@
 	toolchain/patch-kernel.sh $(DNSMASQ_DIR) package/dnsmasq/ \*.patch
 	touch $@
 
-$(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY): $(DNSMASQ_DIR)/.source
+$(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY): $(DNSMASQ_DIR)/.source $(DNSMASQ_DBUS)
+ifeq ($(strip $(BR2_PACKAGE_DBUS)),y)
+	$(SED) 's^.*#define HAVE_DBUS.*^#define HAVE_DBUS^' \
+		$(DNSMASQ_DIR)/src/config.h
+else
+	$(SED) 's^.*#define HAVE_DBUS.*^/* #define HAVE_DBUS */^' \
+		$(DNSMASQ_DIR)/src/config.h
+endif
 	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
 		COPTS='$(DNSMASQ_COPTS)' PREFIX=/usr -C $(DNSMASQ_DIR)
 
