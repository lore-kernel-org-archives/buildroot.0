From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 28 Sep 2006 03:19:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  nbd
Message-ID: <20060928101944.6EFD94858D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-28 03:19:43 -0700 (Thu, 28 Sep 2006)
New Revision: 16245

Log:
Network block device package (client only)

Added:
   trunk/buildroot/package/nbd/
   trunk/buildroot/package/nbd/Config.in
   trunk/buildroot/package/nbd/nbd.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-09-28 00:29:00 UTC (rev 16244)
+++ trunk/buildroot/package/Config.in	2006-09-28 10:19:43 UTC (rev 16245)
@@ -97,6 +97,7 @@
 source "package/mrouted/Config.in"
 source "package/mtd/Config.in"
 source "package/nano/Config.in"
+source "package/nbd/Config.in"
 source "package/ncurses/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"

Added: trunk/buildroot/package/nbd/Config.in
===================================================================
--- trunk/buildroot/package/nbd/Config.in	2006-09-28 00:29:00 UTC (rev 16244)
+++ trunk/buildroot/package/nbd/Config.in	2006-09-28 10:19:43 UTC (rev 16245)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NBD
+	bool "nbd"
+	default n
+	help
+	  NBD is a set of utilities to configure network block devices,
+	  allowing access to remote block devices over TCP/IP network.
+	  Notice: This package only provides the NBD client.
+
+	  http://nbd.sf.net/

Added: trunk/buildroot/package/nbd/nbd.mk
===================================================================
--- trunk/buildroot/package/nbd/nbd.mk	2006-09-28 00:29:00 UTC (rev 16244)
+++ trunk/buildroot/package/nbd/nbd.mk	2006-09-28 10:19:43 UTC (rev 16245)
@@ -0,0 +1,57 @@
+#############################################################
+#
+# nbd (client only)
+#
+#############################################################
+
+NBD_VERSION=2.8.6
+NBD_SOURCE=nbd-$(NBD_VERSION).tar.bz2
+NBD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
+NBD_DIR=$(BUILD_DIR)/nbd-$(NBD_VERSION)
+NBD_CAT:=bzcat
+
+$(DL_DIR)/$(NBD_SOURCE):
+	$(WGET) -P $(DL_DIR) $(NBD_SITE)/$(NBD_SOURCE)
+
+$(NBD_DIR)/.unpacked: $(DL_DIR)/$(NBD_SOURCE)
+	$(NBD_CAT) $(DL_DIR)/$(NBD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(NBD_DIR)/.unpacked
+
+$(NBD_DIR)/.configured: $(NBD_DIR)/.unpacked
+	(cd $(NBD_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CC=$(TARGET_CC) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+	);
+	touch $(NBD_DIR)/.configured
+
+$(NBD_DIR)/nbd-client: $(NBD_DIR)/.configured
+	$(MAKE) -C $(NBD_DIR) nbd-client
+
+$(TARGET_DIR)/sbin/nbd-client: $(NBD_DIR)/nbd-client
+	cp $< $@
+	$(STRIP) $@
+
+nbd:	uclibc $(TARGET_DIR)/sbin/nbd-client
+
+nbd-source: $(DL_DIR)/$(NBD_SOURCE)
+
+nbd-clean:
+	@if [ -d $(NBD_DIR)/Makefile ] ; then \
+		$(MAKE) -C $(NBD_DIR) clean ; \
+	fi;
+
+nbd-dirclean:
+	rm -rf $(NBD_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_NBD)),y)
+TARGETS+=nbd
+endif
