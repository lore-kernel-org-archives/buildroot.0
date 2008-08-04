From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ethtool
Message-ID: <20080804190745.CE8A63C8AE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:45 -0700 (Mon, 04 Aug 2008)
New Revision: 23026

Log:
ethtool: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/ethtool/ethtool.mk


Changeset:
Modified: trunk/buildroot/package/ethtool/ethtool.mk
===================================================================
--- trunk/buildroot/package/ethtool/ethtool.mk	2008-08-04 19:07:41 UTC (rev 23025)
+++ trunk/buildroot/package/ethtool/ethtool.mk	2008-08-04 19:07:45 UTC (rev 23026)
@@ -7,51 +7,12 @@
 ETHTOOL_VERSION:=6
 ETHTOOL_SOURCE:=ethtool-$(ETHTOOL_VERSION).tar.gz
 ETHTOOL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
-ETHTOOL_DIR:=$(BUILD_DIR)/ethtool-$(ETHTOOL_VERSION)
-ETHTOOL_CAT:=$(ZCAT)
-ETHTOOL_BINARY=usr/sbin/ethtool
+ETHTOOL_AUTORECONF:=no
+ETHTOOL_INSTALL_STAGING:=NO
+ETHTOOL_INSTALL_TARGET:=YES
+ETHTOOL_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) STRIPPROG='$(STRIPCMD)' install-strip
+ETHTOOL_UNINSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) uninstall
 
-$(DL_DIR)/$(ETHTOOL_SOURCE):
-	$(WGET) -P $(DL_DIR) $(ETHTOOL_SITE)/$(ETHTOOL_SOURCE)
+ETHTOOL_DEPENDENCIES:=uclibc
 
-$(ETHTOOL_DIR)/.unpacked: $(DL_DIR)/$(ETHTOOL_SOURCE)
-	$(ETHTOOL_CAT) $(DL_DIR)/$(ETHTOOL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(ETHTOOL_DIR)/.configured: $(ETHTOOL_DIR)/.unpacked
-	(cd $(ETHTOOL_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-	)
-	touch $@
-
-$(ETHTOOL_DIR)/ethtool: $(ETHTOOL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(ETHTOOL_DIR)
-
-$(TARGET_DIR)/$(ETHTOOL_BINARY): $(ETHTOOL_DIR)/ethtool
-	cp $(ETHTOOL_DIR)/ethtool $@
-	$(STRIPCMD) $@
-
-ethtool: uclibc $(TARGET_DIR)/$(ETHTOOL_BINARY)
-
-ethtool-source: $(DL_DIR)/$(ETHTOOL_SOURCE)
-
-ethtool-clean:
-	-$(MAKE) -C $(ETHTOOL_DIR) clean
-
-ethtool-dirclean:
-	rm -rf $(ETHTOOL_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_ETHTOOL)),y)
-TARGETS+=ethtool
-endif
+$(eval $(call AUTOTARGETS,package,ethtool))
