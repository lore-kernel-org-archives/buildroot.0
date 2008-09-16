From: correa at uclibc.org <correa@uclibc.org>
Date: Mon, 15 Sep 2008 19:12:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iptables
Message-ID: <20080916021224.761813C697@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-09-15 19:12:23 -0700 (Mon, 15 Sep 2008)
New Revision: 23403

Log:
Fix iptables compile error by updating to Makefile.autotools.in and bumping version to 1.4.1

Modified:
   trunk/buildroot/package/iptables/iptables.mk


Changeset:
Modified: trunk/buildroot/package/iptables/iptables.mk
===================================================================
--- trunk/buildroot/package/iptables/iptables.mk	2008-09-15 16:36:11 UTC (rev 23402)
+++ trunk/buildroot/package/iptables/iptables.mk	2008-09-16 02:12:23 UTC (rev 23403)
@@ -3,64 +3,18 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION:=1.3.8
-IPTABLES_SOURCE_URL:=http://ftp.netfilter.org/pub/iptables
-IPTABLES_SOURCE:=iptables-$(IPTABLES_VERSION).tar.bz2
-IPTABLES_CAT:=$(BZCAT)
-IPTABLES_BUILD_DIR:=$(BUILD_DIR)/iptables-$(IPTABLES_VERSION)
+IPTABLES_VERSION = 1.4.1
+IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
+IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
-$(DL_DIR)/$(IPTABLES_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(IPTABLES_SOURCE_URL)/$(IPTABLES_SOURCE)
+IPTABLES_INSTALL_STAGING = NO
+IPTABLES_INSTALL_TARGET = YES
+IPTABLES_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec-am
 
-$(IPTABLES_BUILD_DIR)/.unpacked: $(DL_DIR)/$(IPTABLES_SOURCE)
-	$(IPTABLES_CAT) $(DL_DIR)/$(IPTABLES_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
+IPTABLES_AUTORECONF = YES
+IPTABLES_DEPENDENCIES = 
+IPTABLES_CONFIGURE_OPT = --with-kernel=$(LINUX_HEADERS_DIR) 
+IPTABLES_MAKE_OPT = GLIB_GENMARSHAL=/usr/bin/glib-genmarshal GLIB_MKENUMS=/usr/bin
 
-$(IPTABLES_BUILD_DIR)/.configured: $(IPTABLES_BUILD_DIR)/.unpacked
-	# Allow patches. Needed for openwrt for instance.
-	toolchain/patch-kernel.sh $(IPTABLES_BUILD_DIR) package/iptables/ iptables\*.patch
-	#
-	$(SED) "s;\[ -f /usr/include/netinet/ip6.h \];grep -q '__UCLIBC_HAS_IPV6__ 1' \
-		$(STAGING_DIR)/usr/include/bits/uClibc_config.h;" $(IPTABLES_BUILD_DIR)/Makefile
-	touch $@
+$(eval $(call AUTOTARGETS,package,iptables))
 
-$(IPTABLES_BUILD_DIR)/iptables: $(IPTABLES_BUILD_DIR)/.configured
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(IPTABLES_BUILD_DIR) \
-		KERNEL_DIR=$(LINUX_HEADERS_DIR) \
-		COPT_FLAGS="$(TARGET_CFLAGS)" \
-		PREFIX=/usr \
-		INCDIR="\$$(PREFIX)/include" \
-		MANDIR="\$$(PREFIX)/share/man"
-
-$(TARGET_DIR)/usr/sbin/iptables: $(IPTABLES_BUILD_DIR)/iptables
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(IPTABLES_BUILD_DIR) \
-		KERNEL_DIR=$(LINUX_HEADERS_DIR) \
-		COPT_FLAGS="$(TARGET_CFLAGS)" \
-		PREFIX=/usr \
-		INCDIR="\$$(PREFIX)/include" \
-		MANDIR="\$$(PREFIX)/share/man" \
-		DESTDIR=$(TARGET_DIR) install
-	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/iptables*
-	$(STRIPCMD) $(TARGET_DIR)/usr/lib/iptables/*.so
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-
-iptables: $(TARGET_DIR)/usr/sbin/iptables
-
-iptables-source: $(DL_DIR)/$(IPTABLES_SOURCE)
-
-iptables-clean:
-	-$(MAKE1) -C $(IPTABLES_BUILD_DIR) clean
-	rm -rf $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/lib/iptables
-
-iptables-dirclean:
-	rm -rf $(IPTABLES_BUILD_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_IPTABLES)),y)
-TARGETS+=iptables
-endif
