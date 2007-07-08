From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 12:07:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20070708190749.0D2773005A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 12:07:46 -0700 (Sun, 08 Jul 2007)
New Revision: 19044

Log:
- bump version
- misc adjustments while at it


Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2007-07-08 18:58:48 UTC (rev 19043)
+++ trunk/buildroot/package/iptables/iptables.mk	2007-07-08 19:07:46 UTC (rev 19044)
@@ -3,38 +3,36 @@
 # iptables
 #
 #############################################################
-IPTABLES_VER:=1.3.7
+IPTABLES_VERSION:=1.3.8
 IPTABLES_SOURCE_URL:=ftp.netfilter.org/pub/iptables
-IPTABLES_SOURCE:=iptables-$(IPTABLES_VER).tar.bz2
+IPTABLES_SOURCE:=iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_CAT:=$(BZCAT)
-IPTABLES_BUILD_DIR:=$(BUILD_DIR)/iptables-$(IPTABLES_VER)
+IPTABLES_BUILD_DIR:=$(BUILD_DIR)/iptables-$(IPTABLES_VERSION)
 
 $(DL_DIR)/$(IPTABLES_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(IPTABLES_SOURCE_URL)/$(IPTABLES_SOURCE) 
 
 $(IPTABLES_BUILD_DIR)/.unpacked: $(DL_DIR)/$(IPTABLES_SOURCE)
 	$(IPTABLES_CAT) $(DL_DIR)/$(IPTABLES_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(IPTABLES_BUILD_DIR)/.unpacked
+	touch $@
 
 $(IPTABLES_BUILD_DIR)/.configured: $(IPTABLES_BUILD_DIR)/.unpacked
 	# Allow patches.  Needed for openwrt for instance.
 	toolchain/patch-kernel.sh $(IPTABLES_BUILD_DIR) package/iptables/ iptables\*.patch
 	#
 	$(SED) "s;\[ -f /usr/include/netinet/ip6.h \];grep -q '__UCLIBC_HAS_IPV6__ 1' \
-		$(STAGING_DIR)/include/bits/uClibc_config.h;" $(IPTABLES_BUILD_DIR)/Makefile
-	touch $(IPTABLES_BUILD_DIR)/.configured
+		$(STAGING_DIR)/usr/include/bits/uClibc_config.h;" $(IPTABLES_BUILD_DIR)/Makefile
+	touch $@
 
 $(IPTABLES_BUILD_DIR)/iptables: $(IPTABLES_BUILD_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE1) -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS)  -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_HEADERS_DIR) PREFIX=/usr \
-		CC=$(TARGET_CC) COPT_FLAGS="$(TARGET_CFLAGS)"
+		COPT_FLAGS="$(TARGET_CFLAGS)"
 
 $(TARGET_DIR)/usr/sbin/iptables: $(IPTABLES_BUILD_DIR)/iptables
-	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE1) -C $(IPTABLES_BUILD_DIR) \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(IPTABLES_BUILD_DIR) \
 		KERNEL_DIR=$(LINUX_HEADERS_DIR) PREFIX=/usr \
-		CC=$(TARGET_CC) COPT_FLAGS="$(TARGET_CFLAGS)" \
+		COPT_FLAGS="$(TARGET_CFLAGS)" \
 		DESTDIR=$(TARGET_DIR) install
 	$(STRIP) $(TARGET_DIR)/usr/sbin/iptables*
 	$(STRIP) $(TARGET_DIR)/usr/lib/iptables/*.so
