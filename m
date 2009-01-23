From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 23 Jan 2009 20:38:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package package/raidtools2
	scripts
Message-ID: <20090123203806.47FF5769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-23 20:38:05 +0000 (Fri, 23 Jan 2009)
New Revision: 24987

Log:
package/: remove deprecated and broken raidtool2 package

Removed:
   trunk/buildroot/package/raidtools2/Config.in
   trunk/buildroot/package/raidtools2/raidtools2.mk

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/scripts/buildall.sh


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-01-23 19:41:42 UTC (rev 24986)
+++ trunk/buildroot/package/Config.in	2009-01-23 20:38:05 UTC (rev 24987)
@@ -255,7 +255,6 @@
 source "package/ntfs-3g/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
-source "package/raidtools2/Config.in"
 source "package/setserial/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # busybox has fdisk

Deleted: trunk/buildroot/package/raidtools2/Config.in
===================================================================
--- trunk/buildroot/package/raidtools2/Config.in	2009-01-23 19:41:42 UTC (rev 24986)
+++ trunk/buildroot/package/raidtools2/Config.in	2009-01-23 20:38:05 UTC (rev 24987)
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_RAIDTOOLS
-	bool "raidtools2"
-	help
-	  Utilities to support 'old-style' RAID disks.
-
-	  http://people.redhat.com/mingo/raidtools/

Deleted: trunk/buildroot/package/raidtools2/raidtools2.mk
===================================================================
--- trunk/buildroot/package/raidtools2/raidtools2.mk	2009-01-23 19:41:42 UTC (rev 24986)
+++ trunk/buildroot/package/raidtools2/raidtools2.mk	2009-01-23 20:38:05 UTC (rev 24987)
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
-	$(call DOWNLOAD,$(RAIDTOOLS2_SITE),$(RAIDTOOLS2_SOURCE))
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
-TARGETS+=raidtools2
-endif

Modified: trunk/buildroot/scripts/buildall.sh
===================================================================
--- trunk/buildroot/scripts/buildall.sh	2009-01-23 19:41:42 UTC (rev 24986)
+++ trunk/buildroot/scripts/buildall.sh	2009-01-23 20:38:05 UTC (rev 24987)
@@ -189,7 +189,6 @@
 AVR	mk	ntfs-3g                        FAIL	"Machine avr32 not recognized"
 EXE	mk	pciutils                       FAIL	"Compile Error"
 skip	mk	pcmcia                         DISABLED	""
-skip	mk	raidtools2                     DISABLED	""
 EXE	mk	setserial                      OK	
 bb	mk	sfdisk
 AVR	mk	smartmontools                  FAIL	"Machine avr32 not recognized"
