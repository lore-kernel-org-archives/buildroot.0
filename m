From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Tue, 30 Oct 2007 02:16:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  kismet
Message-ID: <20071030091652.2D272A67F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2007-10-30 02:16:51 -0700 (Tue, 30 Oct 2007)
New Revision: 20329

Log:
Adding Kismet, closing #1557


Added:
   trunk/buildroot/package/kismet/
   trunk/buildroot/package/kismet/Config.in
   trunk/buildroot/package/kismet/kismet.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-10-29 21:21:27 UTC (rev 20328)
+++ trunk/buildroot/package/Config.in	2007-10-30 09:16:51 UTC (rev 20329)
@@ -148,6 +148,7 @@
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/iptables/Config.in"
+source "package/kismet/Config.in"
 source "package/l2tp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"

Added: trunk/buildroot/package/kismet/Config.in
===================================================================
--- trunk/buildroot/package/kismet/Config.in	                        (rev 0)
+++ trunk/buildroot/package/kismet/Config.in	2007-10-30 09:16:51 UTC (rev 20329)
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_KISMET
+	bool "kismet"
+	select BR2_PACKAGE_NCURSES 
+	select BR2_PACKAGE_LIBPCAP
+	default n
+	help
+		Kismet - 802.11 layer2 wireless network detector, sniffer, and intrusion detection system
+
+		Kismet will work with any wireless card which supports raw monitoring (rfmon) mode, and can
+		sniff 802.11b, 802.11a, and 802.11g traffic.
+		
+		Kismet identifies networks by passively collecting packets and detecting standard named
+		networks, detecting (and given time, decloaking) hidden networks, and infering the presence
+		of nonbeaconing networks via data traffic. 
+

Added: trunk/buildroot/package/kismet/kismet.mk
===================================================================
--- trunk/buildroot/package/kismet/kismet.mk	                        (rev 0)
+++ trunk/buildroot/package/kismet/kismet.mk	2007-10-30 09:16:51 UTC (rev 20329)
@@ -0,0 +1,79 @@
+#############################################################
+#
+# kismet
+#
+#############################################################
+KISMET_VERSION:=2007-10-R1
+KISMET_SOURCE:=kismet-$(KISMET_VERSION).tar.gz
+KISMET_SITE:=http://www.kismetwireless.net/code/
+KISMET_DIR:=$(BUILD_DIR)/kismet-$(KISMET_VERSION)
+KISMET_CAT:=$(ZCAT)
+KISMET_BINARY:=kismet
+KISMET_TARGET_DIRECTORY=usr/bin/
+
+$(DL_DIR)/$(KISMET_SOURCE):
+	$(WGET) -P $(DL_DIR) $(KISMET_SITE)/$(KISMET_SOURCE)
+
+kismet-source: $(DL_DIR)/$(KISMET_SOURCE)
+
+$(KISMET_DIR)/.patched: $(DL_DIR)/$(KISMET_SOURCE)
+	$(KISMET_CAT) $(DL_DIR)/$(KISMET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(KISMET_DIR) package/kismet/ kismet\*.patch
+	touch $@
+
+$(KISMET_DIR)/.configured: $(KISMET_DIR)/.patched
+	(cd $(KISMET_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/lib \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+	)
+	touch $@
+
+$(KISMET_DIR)/$(KISMET_BINARY): $(KISMET_DIR)/.configured
+	$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
+		-C $(KISMET_DIR)
+
+$(TARGET_DIR)/$(KISMET_TARGET_BINARY): $(KISMET_DIR)/$(KISMET_BINARY)
+	install -m 755 $(KISMET_DIR)/kismet $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet
+	install -m 755 $(KISMET_DIR)/kismet_client $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_client
+	install -m 755 $(KISMET_DIR)/kismet_drone $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_drone
+	install -m 755 $(KISMET_DIR)/kismet_server $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_server
+	install -m 755 $(KISMET_DIR)/conf/kismet.conf $(TARGET_DIR)/etc/kismet.conf
+
+kismet: uclibc ncurses libpcap $(TARGET_DIR)/$(KISMET_TARGET_BINARY)
+
+kismet-clean:
+	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet
+	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_client
+	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_drone
+	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_server
+	rm -f $(KISMET_DIR)/conf/kismet.conf $(TARGET_DIR)/etc/kismet.conf
+
+
+	-$(MAKE) -C $(KISMET_DIR) clean
+
+kismet-dirclean:
+	rm -rf $(KISMET_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_KISMET)),y)
+TARGETS+=kismet
+endif
