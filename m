From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 11:14:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  vpnc
Message-ID: <20070717181425.983EFA688E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 11:14:25 -0700 (Tue, 17 Jul 2007)
New Revision: 19142

Log:
Add vpnc package

Added:
   trunk/buildroot/package/vpnc/
   trunk/buildroot/package/vpnc/Config.in
   trunk/buildroot/package/vpnc/vpnc.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-07-17 18:11:55 UTC (rev 19141)
+++ trunk/buildroot/package/Config.in	2007-07-17 18:14:25 UTC (rev 19142)
@@ -66,6 +66,8 @@
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
+source "package/libgcrypt/Config.in"
+source "package/libgpg-error/Config.in"
 source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
 source "package/libxml2/Config.in"
@@ -181,6 +183,7 @@
 # ATTENTION! This was merged into busybox!
 #source "package/udhcp/Config.in"
 #endif
+source "package/vpnc/Config.in"
 source "package/vtun/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/wget/Config.in"

Added: trunk/buildroot/package/vpnc/Config.in
===================================================================
--- trunk/buildroot/package/vpnc/Config.in	                        (rev 0)
+++ trunk/buildroot/package/vpnc/Config.in	2007-07-17 18:14:25 UTC (rev 19142)
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_VPNC
+	bool "vpnc"
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBGPG_ERROR
+	default n
+	help
+	  Client for Cisco VPN concentrator
+	  3000 Series VPN Concentrator
+	  IOS Routers
+	  PIX/ASA Zecurity Appliances
+	  Juniper/Netscreen
+
+	  http://www.unix-ag.uni-kl.de/~massar/vpnc
+

Added: trunk/buildroot/package/vpnc/vpnc.mk
===================================================================
--- trunk/buildroot/package/vpnc/vpnc.mk	                        (rev 0)
+++ trunk/buildroot/package/vpnc/vpnc.mk	2007-07-17 18:14:25 UTC (rev 19142)
@@ -0,0 +1,68 @@
+#############################################################
+#
+# vpnc
+#
+#############################################################
+
+VPNC_VERSION=0.4.0
+VPNC_SOURCE=vpnc-$(VPNC_VERSION).tar.gz
+VPNC_SITE=http://www.unix-ag.uni-kl.de/~massar/vpnc
+VPNC_DIR=$(BUILD_DIR)/vpnc-$(VPNC_VERSION)
+VPNC_CAT:=$(ZCAT)
+VPNC_BINARY:=$(VPNC_DIR)/vpnc
+VPNC_DEST_DIR:=$(TARGET_DIR)/usr/local/sbin
+VPNC_TARGET_BINARY:=$(VPNC_DEST_DIR)/vpnc
+VPNC_TARGET_SCRIPT:=$(TARGET_DIR)/etc/vpnc/default.conf
+
+$(DL_DIR)/$(VPNC_SOURCE):
+	$(WGET) -P $(DL_DIR) $(VPNC_SITE)/$(VPNC_SOURCE)
+
+$(VPNC_DIR)/.unpacked: $(DL_DIR)/$(VPNC_SOURCE)
+	$(VPNC_CAT) $(DL_DIR)/$(VPNC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(VPNC_DIR) package/vpnc \*.patch
+	touch $(VPNC_DIR)/.unpacked
+
+$(VPNC_DIR)/.configured: $(VPNC_DIR)/.unpacked
+	touch $(VPNC_DIR)/.configured
+
+$(VPNC_BINARY): $(VPNC_DIR)/.configured
+	rm -f $@
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) INCLUDE=$(STAGING_DIR)/include	CC=$(TARGET_CC) -C $(VPNC_DIR)
+
+$(VPNC_TARGET_BINARY): $(VPNC_BINARY)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS)	\
+		DESTDIR=$(TARGET_DIR)		\
+		BINDIR=/usr/local/bin		\
+		SBINDIR=/usr/local/sbin		\
+		ETCDIR=/etc/vpnc		\
+		MANDIR=/usr/local/share/man	\
+		VERSION=$(VPNC_VERSION)		\
+		INCLUDE=$(STAGING_DIR)/include		\
+		LDFLAGS="-g -lgcrypt -lgpg-error"	\
+		-C $(VPNC_DIR) install
+	$(STRIP) --strip-unneeded $(VPNC_TARGET_BINARY)
+
+#		CFLAGS+="-W -Wall -O3 -Wmissing-declarations -Wwrite-strings -g -DVERSION=\"$(VPNC_VERSION)\" -c"	\
+
+
+
+vpnc:	uclibc $(VPNC_TARGET_BINARY) 
+
+vpnc-source: $(DL_DIR)/$(VPNC_SOURCE)
+
+vpnc-clean:
+	@if [ -d $(VPNC_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(VPNC_DIR) clean ; \
+	fi;
+	rm -f $(STAGING_DIR)/usr/bin/vpnc
+
+vpnc-dirclean:
+	rm -rf $(VPNC_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_VPNC)),y)
+TARGETS+=vpnc
+endif
