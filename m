From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:19:24 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  raidtools2
Message-ID: <20090111201924.F249A76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:19:24 +0000 (Sun, 11 Jan 2009)
New Revision: 24759

Log:
Change name from raidtools to raidtools2

Added:
   trunk/buildroot/package/raidtools2/
   trunk/buildroot/package/raidtools2/raidtools2.mk

Removed:
   trunk/buildroot/package/raidtools/
   trunk/buildroot/package/raidtools2/raidtools.mk

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/package/raidtools2/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-01-11 20:15:35 UTC (rev 24758)
+++ trunk/buildroot/package/Config.in	2009-01-11 20:19:24 UTC (rev 24759)
@@ -254,7 +254,7 @@
 source "package/ntfs-3g/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
-source "package/raidtools/Config.in"
+source "package/raidtools2/Config.in"
 source "package/setserial/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # busybox has fdisk


Property changes on: trunk/buildroot/package/raidtools2
___________________________________________________________________
Added: svn:mergeinfo
   + 

Modified: trunk/buildroot/package/raidtools2/Config.in
===================================================================
--- trunk/buildroot/package/raidtools/Config.in	2009-01-10 00:27:34 UTC (rev 24740)
+++ trunk/buildroot/package/raidtools2/Config.in	2009-01-11 20:19:24 UTC (rev 24759)
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_RAIDTOOLS
-	bool "raidtools"
+	bool "raidtools2"
 	help
 	  Utilities to support 'old-style' RAID disks.
 

Deleted: trunk/buildroot/package/raidtools2/raidtools.mk
===================================================================
--- trunk/buildroot/package/raidtools/raidtools.mk	2009-01-10 00:27:34 UTC (rev 24740)
+++ trunk/buildroot/package/raidtools2/raidtools.mk	2009-01-11 20:19:24 UTC (rev 24759)
@@ -1,70 +0,0 @@
-#############################################################
-#
-# raidtools2
-#
-#############################################################
-RAIDTOOLS2_VERSION:=1.00.3
-RAIDTOOLS2_SOURCE:=raidtools2-$(RAIDTOOLS2_VERSION).tar.gz
-RAIDTOOLS2_SITE:=
-RAIDTOOLS2_DIR:=$(BUILD_DIR)/raidtools2-$(RAIDTOOLS2_VERSION)
-RAIDTOOLS2_CAT:=$(ZCAT)
-RAIDTOOLS2_BINARY:=mkraid
-RAIDTOOLS2_TARGET_BINARY:=sbin/mkraid
-
-$(DL_DIR)/$(RAIDTOOLS2_SOURCE):
-	$(WGET) -P $(DL_DIR) $(RAIDTOOLS2_SITE)/$(RAIDTOOLS2_SOURCE)
-
-raidtools2-source: $(DL_DIR)/$(RAIDTOOLS2_SOURCE)
-
-$(RAIDTOOLS2_DIR)/.unpacked: $(DL_DIR)/$(RAIDTOOLS2_SOURCE)
-	$(RAIDTOOLS2_CAT) $(DL_DIR)/$(RAIDTOOLS2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(RAIDTOOLS2_DIR)/.unpacked
-
-$(RAIDTOOLS2_DIR)/.configured: $(RAIDTOOLS2_DIR)/.unpacked
-	(cd $(RAIDTOOLS2_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-	        ./configure \
-	        --target=$(GNU_TARGET_NAME) \
-	        --host=$(GNU_TARGET_NAME) \
-	        --build=$(GNU_HOST_NAME) \
-	        --prefix=/usr \
-	        --exec-prefix=/usr \
-	        --bindir=/usr/bin \
-	        --sbindir=/usr/sbin \
-		--libdir=/lib \
-	        --libexecdir=/usr/lib \
-	        --sysconfdir=/etc \
-	        --datadir=/usr/share/misc \
-	        --localstatedir=/var \
-	        --mandir=/usr/man \
-	        --infodir=/usr/info \
-		$(DISABLE_NLS) \
-	        --enable-fsect-man5 \
-	)
-	touch $(RAIDTOOLS2_DIR)/.configured
-
-$(RAIDTOOLS2_DIR)/$(RAIDTOOLS2_BINARY): $(RAIDTOOLS2_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR)
-
-$(TARGET_DIR)/$(RAIDTOOLS2_TARGET_BINARY): $(RAIDTOOLS2_DIR)/$(RAIDTOOLS2_BINARY)
-	$(MAKE) ROOTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR) install
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-
-raidtools2: zlib uclibc $(TARGET_DIR)/$(RAIDTOOLS2_TARGET_BINARY)
-
-raidtools2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR) uninstall
-	-$(MAKE) -C $(RAIDTOOLS2_DIR) clean
-
-raidtools2-dirclean:
-	rm -rf $(RAIDTOOLS2_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_RAIDTOOLS),y)
-TARGETS+=raidtools
-endif

Added: trunk/buildroot/package/raidtools2/raidtools2.mk
===================================================================
--- trunk/buildroot/package/raidtools2/raidtools2.mk	                        (rev 0)
+++ trunk/buildroot/package/raidtools2/raidtools2.mk	2009-01-11 20:19:24 UTC (rev 24759)
@@ -0,0 +1,70 @@
+#############################################################
+#
+# raidtools2
+#
+#############################################################
+RAIDTOOLS2_VERSION:=1.00.3
+RAIDTOOLS2_SOURCE:=raidtools2-$(RAIDTOOLS2_VERSION).tar.gz
+RAIDTOOLS2_SITE:=
+RAIDTOOLS2_DIR:=$(BUILD_DIR)/raidtools2-$(RAIDTOOLS2_VERSION)
+RAIDTOOLS2_CAT:=$(ZCAT)
+RAIDTOOLS2_BINARY:=mkraid
+RAIDTOOLS2_TARGET_BINARY:=sbin/mkraid
+
+$(DL_DIR)/$(RAIDTOOLS2_SOURCE):
+	$(WGET) -P $(DL_DIR) $(RAIDTOOLS2_SITE)/$(RAIDTOOLS2_SOURCE)
+
+raidtools2-source: $(DL_DIR)/$(RAIDTOOLS2_SOURCE)
+
+$(RAIDTOOLS2_DIR)/.unpacked: $(DL_DIR)/$(RAIDTOOLS2_SOURCE)
+	$(RAIDTOOLS2_CAT) $(DL_DIR)/$(RAIDTOOLS2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(RAIDTOOLS2_DIR)/.unpacked
+
+$(RAIDTOOLS2_DIR)/.configured: $(RAIDTOOLS2_DIR)/.unpacked
+	(cd $(RAIDTOOLS2_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+	        ./configure \
+	        --target=$(GNU_TARGET_NAME) \
+	        --host=$(GNU_TARGET_NAME) \
+	        --build=$(GNU_HOST_NAME) \
+	        --prefix=/usr \
+	        --exec-prefix=/usr \
+	        --bindir=/usr/bin \
+	        --sbindir=/usr/sbin \
+		--libdir=/lib \
+	        --libexecdir=/usr/lib \
+	        --sysconfdir=/etc \
+	        --datadir=/usr/share/misc \
+	        --localstatedir=/var \
+	        --mandir=/usr/man \
+	        --infodir=/usr/info \
+		$(DISABLE_NLS) \
+	        --enable-fsect-man5 \
+	)
+	touch $(RAIDTOOLS2_DIR)/.configured
+
+$(RAIDTOOLS2_DIR)/$(RAIDTOOLS2_BINARY): $(RAIDTOOLS2_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR)
+
+$(TARGET_DIR)/$(RAIDTOOLS2_TARGET_BINARY): $(RAIDTOOLS2_DIR)/$(RAIDTOOLS2_BINARY)
+	$(MAKE) ROOTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR) install
+	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
+		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+
+raidtools2: zlib uclibc $(TARGET_DIR)/$(RAIDTOOLS2_TARGET_BINARY)
+
+raidtools2-clean:
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(RAIDTOOLS2_DIR) uninstall
+	-$(MAKE) -C $(RAIDTOOLS2_DIR) clean
+
+raidtools2-dirclean:
+	rm -rf $(RAIDTOOLS2_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_RAIDTOOLS),y)
+TARGETS+=raidtools2
+endif
