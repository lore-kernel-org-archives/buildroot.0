From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 08:55:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  quagga
Message-ID: <20070628155501.06CBAA467C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 08:55:00 -0700 (Thu, 28 Jun 2007)
New Revision: 18966

Log:
- add quagga suite


Added:
   trunk/buildroot/package/quagga/
   trunk/buildroot/package/quagga/Config.in
   trunk/buildroot/package/quagga/quagga.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-06-28 14:07:13 UTC (rev 18965)
+++ trunk/buildroot/package/Config.in	2007-06-28 15:55:00 UTC (rev 18966)
@@ -163,6 +163,7 @@
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/proftpd/Config.in"
+source "package/quagga/Config.in"
 source "package/rsync/Config.in"
 source "package/samba/Config.in"
 source "package/socat/Config.in"

Added: trunk/buildroot/package/quagga/Config.in
===================================================================
--- trunk/buildroot/package/quagga/Config.in	                        (rev 0)
+++ trunk/buildroot/package/quagga/Config.in	2007-06-28 15:55:00 UTC (rev 18966)
@@ -0,0 +1,113 @@
+config BR2_PACKAGE_QUAGGA
+	bool
+	default n
+
+comment "quagga suite"
+
+config BR2_PACKAGE_QUAGGA_ZEBRA
+	bool "quagga zebra"
+	default n
+	select BR2_PACKAGE_QUAGGA
+	help
+	  routing software suite, providing implementations of
+	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+
+	  http://www.quagga.net/
+
+config BR2_PACKAGE_QUAGGA_BGPD
+	bool "quagga bgpd"
+	default n
+	select BR2_PACKAGE_QUAGGA
+	help
+	  routing software suite, providing implementations of
+	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+
+	  http://www.quagga.net/
+
+config BR2_PACKAGE_QUAGGA_RIPD
+	bool "quagga ripd"
+	default n
+	select BR2_PACKAGE_QUAGGA
+	help
+	  routing software suite, providing implementations of
+	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+
+	  http://www.quagga.net/
+
+config BR2_PACKAGE_QUAGGA_RIPNGD
+	bool "quagga ripngd"
+	default n
+	select BR2_PACKAGE_QUAGGA
+	help
+	  routing software suite, providing implementations of
+	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+
+	  http://www.quagga.net/
+
+config BR2_PACKAGE_QUAGGA_OSPFD
+	bool "quagga ospfd"
+	default n
+	select BR2_PACKAGE_QUAGGA
+	help
+	  routing software suite, providing implementations of
+	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+
+	  http://www.quagga.net/
+
+config BR2_PACKAGE_QUAGGA_OSPF6D
+	bool "quagga ospf6d"
+	default n
+	select BR2_PACKAGE_QUAGGA
+	depends BR2_INET_IPV6
+	help
+	  routing software suite, providing implementations of
+	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+
+	  http://www.quagga.net/
+
+config BR2_PACKAGE_QUAGGA_WATCHQUAGGA
+	bool "quagga watchquagga"
+	default n
+	select BR2_PACKAGE_QUAGGA
+	help
+	  routing software suite, providing implementations of
+	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+
+	  http://www.quagga.net/
+
+config BR2_PACKAGE_QUAGGA_ISISD
+	bool "isisd"
+	default n
+	select BR2_PACKAGE_QUAGGA
+	help
+	  routing software suite, providing implementations of
+	  OSPFv2, OSPFv3, RIP v1 and v2, RIPng and BGP-4.
+
+	  http://www.quagga.net/
+
+if BR2_PACKAGE_QUAGGA
+comment "common options for quagga suite"
+config BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE
+	bool "BGP route announcement"
+	default n
+
+config BR2_PACKAGE_QUAGGA_NETLINK
+	bool "quagga: use linux netlink interface"
+	default y
+
+config BR2_PACKAGE_QUAGGA_SNMP
+	bool "quagga: SNMP support"
+	default n
+
+config BR2_PACKAGE_QUAGGA_TCP_ZEBRA
+	bool "quagga: TCP/IP socket connection between zebra and proto daemon"
+	default n
+
+config BR2_PACKAGE_QUAGGA_OPAGUE_LSA
+	bool "quagga: OSPF Opaque-LSA with OSPFAPI support (RFC2370)"
+	default n
+
+config BR2_PACKAGE_QUAGGA_CONFIGURE
+	string "quagga: extra configure options"
+	default ""
+endif

Added: trunk/buildroot/package/quagga/quagga.mk
===================================================================
--- trunk/buildroot/package/quagga/quagga.mk	                        (rev 0)
+++ trunk/buildroot/package/quagga/quagga.mk	2007-06-28 15:55:00 UTC (rev 18966)
@@ -0,0 +1,181 @@
+#############################################################
+#
+# quagga suite
+#
+#############################################################
+QUAGGA_VER:=0.99.7
+QUAGGA_SOURCE:=quagga-$(QUAGGA_VER).tar.gz
+QUAGGA_SITE:=http://www.quagga.net/download
+QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VER)
+QUAGGA_CAT:=$(ZCAT)
+
+QUAGGA_CONFIGURE:=
+ifeq ($(BR2_PACKAGE_QUAGGA_ZEBRA),y)
+QUAGGA_CONFIGURE+=--enable-zebra
+ifndef QUAGGA_TARGET_BINARY
+QUAGGA_TARGET_BINARY=zebra
+QUAGGA_BINARY=$(QUAGGA_DIR)/zebra/.libs/zebra
+endif
+else
+QUAGGA_CONFIGURE+=--disable-zebra
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_BGPD),y)
+QUAGGA_CONFIGURE+=--enable-bgpd
+ifndef QUAGGA_TARGET_BINARY
+QUAGGA_TARGET_BINARY=bgpd
+QUAGGA_BINARY=$(QUAGGA_DIR)/bgpd/.libs/bgpd
+endif
+else
+QUAGGA_CONFIGURE+=--disable-bgpd
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_RIPD),y)
+QUAGGA_CONFIGURE+=--enable-ripd
+ifndef QUAGGA_TARGET_BINARY
+QUAGGA_TARGET_BINARY=ripd
+QUAGGA_BINARY=$(QUAGGA_DIR)/ripd/.libs/ripd
+endif
+else
+QUAGGA_CONFIGURE+=--disable-ripd
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_RIPNGD),y)
+QUAGGA_CONFIGURE+=--enable-ripngd
+ifndef QUAGGA_TARGET_BINARY
+QUAGGA_TARGET_BINARY=ripngd
+QUAGGA_BINARY=$(QUAGGA_DIR)/ripngd/.libs/ripngd
+endif
+else
+QUAGGA_CONFIGURE+=--disable-ripngd
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_OSPFD),y)
+QUAGGA_CONFIGURE+=--enable-ospfd
+ifndef QUAGGA_TARGET_BINARY
+QUAGGA_TARGET_BINARY=ospfd
+QUAGGA_BINARY=$(QUAGGA_DIR)/ospfd/.libs/ospfd
+endif
+else
+QUAGGA_CONFIGURE+=--disable-ospfd
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_OSPF6D),y)
+QUAGGA_CONFIGURE+=--enable-ospf6d
+ifndef QUAGGA_TARGET_BINARY
+QUAGGA_TARGET_BINARY=ospf6d
+QUAGGA_BINARY=$(QUAGGA_DIR)/ospf6d/.libs/ospf6d
+endif
+else
+QUAGGA_CONFIGURE+=--disable-ospf6d
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),y)
+QUAGGA_CONFIGURE+=--enable-watchquagga
+ifndef QUAGGA_TARGET_BINARY
+QUAGGA_TARGET_BINARY=watchquagga
+QUAGGA_BINARY=$(QUAGGA_DIR)/watchquagga/.libs/watchquagga
+endif
+else
+QUAGGA_CONFIGURE+=--disable-watchquagga
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_ISISD),y)
+QUAGGA_CONFIGURE+=--enable-isisd
+ifndef QUAGGA_TARGET_BINARY
+QUAGGA_TARGET_BINARY=isisd
+QUAGGA_BINARY=$(QUAGGA_DIR)/isisd/.libs/isisd
+endif
+else
+QUAGGA_CONFIGURE+=--disable-isisd
+endif
+
+
+ifeq ($(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),y)
+QUAGGA_CONFIGURE+=--enable-bgp-announce
+else
+QUAGGA_CONFIGURE+=--disable-bgp-announce
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_NETLINK),y)
+QUAGGA_CONFIGURE+=--enable-netlink
+else
+QUAGGA_CONFIGURE+=--disable-netlink
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
+QUAGGA_CONFIGURE+=--enable-snmp
+else
+QUAGGA_CONFIGURE+=--disable-snmp
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_TCP_ZEBRA),y)
+QUAGGA_CONFIGURE+=--enable-tcp-zebra
+else
+QUAGGA_CONFIGURE+=--disable-tcp-zebra
+endif
+ifeq ($(BR2_PACKAGE_QUAGGA_OPAGUE_LSA),y)
+QUAGGA_CONFIGURE+=--enable-opaque-lsa
+else
+QUAGGA_CONFIGURE+=--disable-opaque-lsa
+endif
+
+QUAGGA_CONFIGURE+=$(subst ",,$(BR2_PACKAGE_QUAGGA_CONFIGURE))
+# ")
+
+$(DL_DIR)/$(QUAGGA_SOURCE):
+	$(WGET) -P $(DL_DIR) $(QUAGGA_SITE)/$(QUAGGA_SOURCE)
+
+ifneq ($(QUAGGA_PATCH),)
+QUAGGA_PATCH_FILE=$(DL_DIR)/$(QUAGGA_PATCH)
+$(DL_DIR)/$(QUAGGA_PATCH):
+	$(WGET) -P $(DL_DIR) $(QUAGGA_SITE)/$(QUAGGA_PATCH)
+endif
+quagga-source: $(DL_DIR)/$(QUAGGA_SOURCE) $(QUAGGA_PATCH_FILE)
+
+$(QUAGGA_DIR)/.unpacked: $(DL_DIR)/$(QUAGGA_SOURCE) $(DL_DIR)/$(QUAGGA_PATCH)
+	$(QUAGGA_CAT) $(DL_DIR)/$(QUAGGA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(QUAGGA_DIR) package/quagga/ quagga\*.patch
+ifneq ($(QUAGGA_PATCH),)
+	(cd $(QUAGGA_DIR) && $(QUAGGA_CAT) $(DL_DIR)/$(QUAGGA_PATCH) | patch -p1)
+	if [ -d $(QUAGGA_DIR)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(QUAGGA_DIR) $(QUAGGA_DIR)/debian/patches \*.patch ; \
+	fi
+endif
+	touch $@
+
+$(QUAGGA_DIR)/.configured: $(QUAGGA_DIR)/.unpacked
+	(cd $(QUAGGA_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		$(DISABLE_LARGEFILE) \
+		$(DISABLE_IPV6) \
+		$(QUAGGA_CONFIGURE) \
+		--program-transform-name='' \
+	);
+	touch $@
+
+$(QUAGGA_BINARY): $(QUAGGA_DIR)/.configured
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(QUAGGA_DIR)
+
+$(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY): $(QUAGGA_BINARY)
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) install
+ifneq ($(BR2_PACKAGE_QUAGGA_HEADERS),y)
+	rm -rf $(TARGET_DIR)/usr/include/quagga
+endif
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/info
+endif
+
+quagga: uclibc $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY)
+
+quagga-clean:
+	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) uninstall
+	-$(MAKE) -C $(QUAGGA_DIR) clean
+
+quagga-dirclean:
+	rm -rf $(QUAGGA_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_QUAGGA)),y)
+TARGETS+=quagga
+endif
