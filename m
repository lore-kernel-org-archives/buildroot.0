From: cmchao <cmchao@gmail.com>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] quagga : convert to autotools
	infrastructure & bump to 0.99.12
Message-ID: <20100625103242.2C79281DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2a10e22d1eb49f76483251f1ecace78cf069cd64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * Installation to target is the default
 * No installation to staging is the default
 * The QUAGGA_HEADERS option does not exist
 * BOA_INSTALL_TARGETS_CMDS wouldn't work in the Quagga package, and
   was anyway doing the default action
 * The QUAGGA_BINARY/QUAGGA_TARGET_BINARY variables were not used
 * Bump to 0.99.16, which fixes a problem when IPv6 is not enabled

Signed-off-by: cmchao <cmchao@gmail.com>

merge quagga
---
 .../quagga-0.99.16-fix-ipctl-forwarding.patch      |   27 +++
 package/quagga/quagga.mk                           |  171 +++++---------------
 2 files changed, 70 insertions(+), 128 deletions(-)
 create mode 100644 package/quagga/quagga-0.99.16-fix-ipctl-forwarding.patch

diff --git a/package/quagga/quagga-0.99.16-fix-ipctl-forwarding.patch b/package/quagga/quagga-0.99.16-fix-ipctl-forwarding.patch
new file mode 100644
index 0000000..e2e3421
--- /dev/null
+++ b/package/quagga/quagga-0.99.16-fix-ipctl-forwarding.patch
@@ -0,0 +1,27 @@
+Add definitions for IPCTL_FORWARDING and IP6CTL_FORWARDING.
+
+Inspired from
+http://svn.gnumonks.org/trunk/grouter/build/src/quagga/quagga/quagga-0.99.1-forward_sysctl-2.6.14.patch
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: quagga-0.99.16/zebra/ipforward_sysctl.c
+===================================================================
+--- quagga-0.99.16.orig/zebra/ipforward_sysctl.c	2010-06-20 23:40:45.000000000 +0200
++++ quagga-0.99.16/zebra/ipforward_sysctl.c	2010-06-20 23:41:37.000000000 +0200
+@@ -31,6 +31,15 @@
+ 
+ #define MIB_SIZ 4
+ 
++/* Fix for recent (2.6.14) kernel headers */
++#ifndef IPCTL_FORWARDING
++#define IPCTL_FORWARDING NET_IPV4_FORWARD
++#endif
++
++#ifndef IP6CTL_FORWARDING
++#define IP6CTL_FORWARDING NET_IPV6_FORWARDING
++#endif
++
+ extern struct zebra_privs_t zserv_privs;
+ 
+ /* IPv4 forwarding control MIB. */
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 30ebd35..79c0b71 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -3,176 +3,91 @@
 # quagga suite
 #
 #############################################################
-QUAGGA_VERSION:=0.99.9
+QUAGGA_VERSION:=0.99.16
 QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
-QUAGGA_SITE:=http://www.quagga.net/download/attic
-QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VERSION)
-QUAGGA_CAT:=$(ZCAT)
+QUAGGA_SITE:=http://www.quagga.net/download/
 
-QUAGGA_CONFIGURE:=
-QUAGGA_DEPENDENCIES:=
+QUAGGA_DEPENDENCIES = host-gawk
+QUAGGA_LIBTOOL_PATCH = NO
+QUAGGA_CONF_OPT = --program-transform-name=''
 
 ifeq ($(BR2_PACKAGE_QUAGGA_ZEBRA),y)
-QUAGGA_CONFIGURE+=--enable-zebra
-ifndef QUAGGA_TARGET_BINARY
-QUAGGA_TARGET_BINARY=zebra
-QUAGGA_BINARY=$(QUAGGA_DIR)/zebra/.libs/zebra
-endif
+QUAGGA_CONF_OPT+=--enable-zebra
 else
-QUAGGA_CONFIGURE+=--disable-zebra
+QUAGGA_CONF_OPT+=--disable-zebra
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_BGPD),y)
-QUAGGA_CONFIGURE+=--enable-bgpd
-ifndef QUAGGA_TARGET_BINARY
-QUAGGA_TARGET_BINARY=bgpd
-QUAGGA_BINARY=$(QUAGGA_DIR)/bgpd/.libs/bgpd
-endif
+QUAGGA_CONF_OPT+=--enable-bgpd
 else
-QUAGGA_CONFIGURE+=--disable-bgpd
+QUAGGA_CONF_OPT+=--disable-bgpd
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_RIPD),y)
-QUAGGA_CONFIGURE+=--enable-ripd
-ifndef QUAGGA_TARGET_BINARY
-QUAGGA_TARGET_BINARY=ripd
-QUAGGA_BINARY=$(QUAGGA_DIR)/ripd/.libs/ripd
-endif
+QUAGGA_CONF_OPT+=--enable-ripd
 else
-QUAGGA_CONFIGURE+=--disable-ripd
+QUAGGA_CONF_OPT+=--disable-ripd
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_RIPNGD),y)
-QUAGGA_CONFIGURE+=--enable-ripngd
-ifndef QUAGGA_TARGET_BINARY
-QUAGGA_TARGET_BINARY=ripngd
-QUAGGA_BINARY=$(QUAGGA_DIR)/ripngd/.libs/ripngd
-endif
+QUAGGA_CONF_OPT+=--enable-ripngd
 else
-QUAGGA_CONFIGURE+=--disable-ripngd
+QUAGGA_CONF_OPT+=--disable-ripngd
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_OSPFD),y)
-QUAGGA_CONFIGURE+=--enable-ospfd
-ifndef QUAGGA_TARGET_BINARY
-QUAGGA_TARGET_BINARY=ospfd
-QUAGGA_BINARY=$(QUAGGA_DIR)/ospfd/.libs/ospfd
-endif
+QUAGGA_CONF_OPT+=--enable-ospfd
 else
-QUAGGA_CONFIGURE+=--disable-ospfd
+QUAGGA_CONF_OPT+=--disable-ospfd
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_OSPF6D),y)
-QUAGGA_CONFIGURE+=--enable-ospf6d
-ifndef QUAGGA_TARGET_BINARY
-QUAGGA_TARGET_BINARY=ospf6d
-QUAGGA_BINARY=$(QUAGGA_DIR)/ospf6d/.libs/ospf6d
-endif
+QUAGGA_CONF_OPT+=--enable-ospf6d
 else
-QUAGGA_CONFIGURE+=--disable-ospf6d
+QUAGGA_CONF_OPT+=--disable-ospf6d
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),y)
-QUAGGA_CONFIGURE+=--enable-watchquagga
-ifndef QUAGGA_TARGET_BINARY
-QUAGGA_TARGET_BINARY=watchquagga
-QUAGGA_BINARY=$(QUAGGA_DIR)/watchquagga/.libs/watchquagga
-endif
+QUAGGA_CONF_OPT+=--enable-watchquagga
 else
-QUAGGA_CONFIGURE+=--disable-watchquagga
+QUAGGA_CONF_OPT+=--disable-watchquagga
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_ISISD),y)
-QUAGGA_CONFIGURE+=--enable-isisd
-ifndef QUAGGA_TARGET_BINARY
-QUAGGA_TARGET_BINARY=isisd
-QUAGGA_BINARY=$(QUAGGA_DIR)/isisd/.libs/isisd
-endif
+QUAGGA_CONF_OPT+=--enable-isisd
 else
-QUAGGA_CONFIGURE+=--disable-isisd
+QUAGGA_CONF_OPT+=--disable-isisd
 endif
 
-
 ifeq ($(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),y)
-QUAGGA_CONFIGURE+=--enable-bgp-announce
+QUAGGA_CONF_OPT+=--enable-bgp-announce
 else
-QUAGGA_CONFIGURE+=--disable-bgp-announce
+QUAGGA_CONF_OPT+=--disable-bgp-announce
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_NETLINK),y)
-QUAGGA_CONFIGURE+=--enable-netlink
+QUAGGA_CONF_OPT+=--enable-netlink
 else
-QUAGGA_CONFIGURE+=--disable-netlink
+QUAGGA_CONF_OPT+=--disable-netlink
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
-QUAGGA_CONFIGURE+=--enable-snmp
+QUAGGA_CONF_OPT+=--enable-snmp
 QUAGGA_DEPENDENCIES+=netsnmp
 else
-QUAGGA_CONFIGURE+=--disable-snmp
+QUAGGA_CONF_OPT+=--disable-snmp
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_TCP_ZEBRA),y)
-QUAGGA_CONFIGURE+=--enable-tcp-zebra
+QUAGGA_CONF_OPT+=--enable-tcp-zebra
 else
-QUAGGA_CONFIGURE+=--disable-tcp-zebra
+QUAGGA_CONF_OPT+=--disable-tcp-zebra
 endif
+
 ifeq ($(BR2_PACKAGE_QUAGGA_OPAGUE_LSA),y)
-QUAGGA_CONFIGURE+=--enable-opaque-lsa
+QUAGGA_CONF_OPT+=--enable-opaque-lsa
 else
-QUAGGA_CONFIGURE+=--disable-opaque-lsa
-endif
-
-$(DL_DIR)/$(QUAGGA_SOURCE):
-	$(call DOWNLOAD,$(QUAGGA_SITE),$(QUAGGA_SOURCE))
-
-ifneq ($(QUAGGA_PATCH),)
-QUAGGA_PATCH_FILE=$(DL_DIR)/$(QUAGGA_PATCH)
-$(DL_DIR)/$(QUAGGA_PATCH):
-	$(call DOWNLOAD,$(QUAGGA_SITE),$(QUAGGA_PATCH))
-endif
-quagga-source: $(DL_DIR)/$(QUAGGA_SOURCE) $(QUAGGA_PATCH_FILE)
-
-$(QUAGGA_DIR)/.unpacked: $(DL_DIR)/$(QUAGGA_SOURCE) $(DL_DIR)/$(QUAGGA_PATCH)
-	$(QUAGGA_CAT) $(DL_DIR)/$(QUAGGA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(QUAGGA_DIR) package/quagga/ quagga\*.patch
-ifneq ($(QUAGGA_PATCH),)
-	(cd $(QUAGGA_DIR) && $(QUAGGA_CAT) $(DL_DIR)/$(QUAGGA_PATCH) | patch -p1)
-	if [ -d $(QUAGGA_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(QUAGGA_DIR) $(QUAGGA_DIR)/debian/patches \*.patch; \
-	fi
-endif
-	touch $@
-
-$(QUAGGA_DIR)/.configured: $(QUAGGA_DIR)/.unpacked
-	(cd $(QUAGGA_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		$(DISABLE_LARGEFILE) \
-		$(DISABLE_IPV6) \
-		$(QUAGGA_CONFIGURE) \
-		--program-transform-name='' \
-	)
-	touch $@
-
-$(QUAGGA_BINARY): $(QUAGGA_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QUAGGA_DIR)
-
-$(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY): $(QUAGGA_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) install
-ifneq ($(BR2_PACKAGE_QUAGGA_HEADERS),y)
-	rm -rf $(TARGET_DIR)/usr/include/quagga
+QUAGGA_CONF_OPT+=--disable-opaque-lsa
 endif
 
-quagga: $(QUAGGA_DEPENDENCIES) $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY)
-
-quagga-clean:
-	-$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) uninstall
-	-$(MAKE) -C $(QUAGGA_DIR) clean
-
-quagga-dirclean:
-	rm -rf $(QUAGGA_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_QUAGGA),y)
-TARGETS+=quagga
-endif
+$(eval $(call AUTOTARGETS,package,quagga))
-- 
1.7.1
