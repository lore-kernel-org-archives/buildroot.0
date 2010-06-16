From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:14 +0800
Subject: [Buildroot] [PATCH 12/19] quagga : convert to autotools
	infrastructure & bump to 0.99.12
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-13-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/quagga/quagga.mk |  125 +++++++++++++---------------------------------
 1 files changed, 35 insertions(+), 90 deletions(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 30ebd35..4469395 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -3,176 +3,121 @@
 # quagga suite
 #
 #############################################################
-QUAGGA_VERSION:=0.99.9
+QUAGGA_VERSION:=0.99.12
 QUAGGA_SOURCE:=quagga-$(QUAGGA_VERSION).tar.gz
 QUAGGA_SITE:=http://www.quagga.net/download/attic
-QUAGGA_DIR:=$(BUILD_DIR)/quagga-$(QUAGGA_VERSION)
-QUAGGA_CAT:=$(ZCAT)
 
-QUAGGA_CONFIGURE:=
-QUAGGA_DEPENDENCIES:=
+QUAGGA_INSTALL_STAGING = NO
+QUAGGA_INSTALL_TARGET = YES
+QUAGGA_LIBTOOL_PATCH = NO
+QUAGGA_CONF_OPT = --program-transform-name=''
 
 ifeq ($(BR2_PACKAGE_QUAGGA_ZEBRA),y)
-QUAGGA_CONFIGURE+=--enable-zebra
+QUAGGA_CONF_OPT+=--enable-zebra
 ifndef QUAGGA_TARGET_BINARY
 QUAGGA_TARGET_BINARY=zebra
 QUAGGA_BINARY=$(QUAGGA_DIR)/zebra/.libs/zebra
 endif
 else
-QUAGGA_CONFIGURE+=--disable-zebra
+QUAGGA_CONF_OPT+=--disable-zebra
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_BGPD),y)
-QUAGGA_CONFIGURE+=--enable-bgpd
+QUAGGA_CONF_OPT+=--enable-bgpd
 ifndef QUAGGA_TARGET_BINARY
 QUAGGA_TARGET_BINARY=bgpd
 QUAGGA_BINARY=$(QUAGGA_DIR)/bgpd/.libs/bgpd
 endif
 else
-QUAGGA_CONFIGURE+=--disable-bgpd
+QUAGGA_CONF_OPT+=--disable-bgpd
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_RIPD),y)
-QUAGGA_CONFIGURE+=--enable-ripd
+QUAGGA_CONF_OPT+=--enable-ripd
 ifndef QUAGGA_TARGET_BINARY
 QUAGGA_TARGET_BINARY=ripd
 QUAGGA_BINARY=$(QUAGGA_DIR)/ripd/.libs/ripd
 endif
 else
-QUAGGA_CONFIGURE+=--disable-ripd
+QUAGGA_CONF_OPT+=--disable-ripd
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_RIPNGD),y)
-QUAGGA_CONFIGURE+=--enable-ripngd
+QUAGGA_CONF_OPT+=--enable-ripngd
 ifndef QUAGGA_TARGET_BINARY
 QUAGGA_TARGET_BINARY=ripngd
 QUAGGA_BINARY=$(QUAGGA_DIR)/ripngd/.libs/ripngd
 endif
 else
-QUAGGA_CONFIGURE+=--disable-ripngd
+QUAGGA_CONF_OPT+=--disable-ripngd
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_OSPFD),y)
-QUAGGA_CONFIGURE+=--enable-ospfd
+QUAGGA_CONF_OPT+=--enable-ospfd
 ifndef QUAGGA_TARGET_BINARY
 QUAGGA_TARGET_BINARY=ospfd
 QUAGGA_BINARY=$(QUAGGA_DIR)/ospfd/.libs/ospfd
 endif
 else
-QUAGGA_CONFIGURE+=--disable-ospfd
+QUAGGA_CONF_OPT+=--disable-ospfd
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_OSPF6D),y)
-QUAGGA_CONFIGURE+=--enable-ospf6d
+QUAGGA_CONF_OPT+=--enable-ospf6d
 ifndef QUAGGA_TARGET_BINARY
 QUAGGA_TARGET_BINARY=ospf6d
 QUAGGA_BINARY=$(QUAGGA_DIR)/ospf6d/.libs/ospf6d
 endif
 else
-QUAGGA_CONFIGURE+=--disable-ospf6d
+QUAGGA_CONF_OPT+=--disable-ospf6d
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_WATCHQUAGGA),y)
-QUAGGA_CONFIGURE+=--enable-watchquagga
+QUAGGA_CONF_OPT+=--enable-watchquagga
 ifndef QUAGGA_TARGET_BINARY
 QUAGGA_TARGET_BINARY=watchquagga
 QUAGGA_BINARY=$(QUAGGA_DIR)/watchquagga/.libs/watchquagga
 endif
 else
-QUAGGA_CONFIGURE+=--disable-watchquagga
+QUAGGA_CONF_OPT+=--disable-watchquagga
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_ISISD),y)
-QUAGGA_CONFIGURE+=--enable-isisd
+QUAGGA_CONF_OPT+=--enable-isisd
 ifndef QUAGGA_TARGET_BINARY
 QUAGGA_TARGET_BINARY=isisd
 QUAGGA_BINARY=$(QUAGGA_DIR)/isisd/.libs/isisd
 endif
 else
-QUAGGA_CONFIGURE+=--disable-isisd
+QUAGGA_CONF_OPT+=--disable-isisd
 endif
 
 
 ifeq ($(BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE),y)
-QUAGGA_CONFIGURE+=--enable-bgp-announce
+QUAGGA_CONF_OPT+=--enable-bgp-announce
 else
-QUAGGA_CONFIGURE+=--disable-bgp-announce
+QUAGGA_CONF_OPT+=--disable-bgp-announce
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_NETLINK),y)
-QUAGGA_CONFIGURE+=--enable-netlink
+QUAGGA_CONF_OPT+=--enable-netlink
 else
-QUAGGA_CONFIGURE+=--disable-netlink
+QUAGGA_CONF_OPT+=--disable-netlink
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
-QUAGGA_CONFIGURE+=--enable-snmp
+QUAGGA_CONF_OPT+=--enable-snmp
 QUAGGA_DEPENDENCIES+=netsnmp
 else
-QUAGGA_CONFIGURE+=--disable-snmp
+QUAGGA_CONF_OPT+=--disable-snmp
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_TCP_ZEBRA),y)
-QUAGGA_CONFIGURE+=--enable-tcp-zebra
+QUAGGA_CONF_OPT+=--enable-tcp-zebra
 else
-QUAGGA_CONFIGURE+=--disable-tcp-zebra
+QUAGGA_CONF_OPT+=--disable-tcp-zebra
 endif
 ifeq ($(BR2_PACKAGE_QUAGGA_OPAGUE_LSA),y)
-QUAGGA_CONFIGURE+=--enable-opaque-lsa
+QUAGGA_CONF_OPT+=--enable-opaque-lsa
 else
-QUAGGA_CONFIGURE+=--disable-opaque-lsa
+QUAGGA_CONF_OPT+=--disable-opaque-lsa
 endif
 
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
+define BOA_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
 ifneq ($(BR2_PACKAGE_QUAGGA_HEADERS),y)
 	rm -rf $(TARGET_DIR)/usr/include/quagga
 endif
+endef
 
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
1.7.0.4
