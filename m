From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 13:22:38 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dmraid
Message-ID: <20090304132238.E86437626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 13:22:38 +0000 (Wed, 04 Mar 2009)
New Revision: 25522

Log:
dmraid: fix build & convert to Makefile.autotools.in

Patch by Olaf Rempel <razzor@kopf-tisch.de>

- was not building at all (x86 uclibc)
- adding devicemapper dependency

Modified:
   trunk/buildroot/package/dmraid/Config.in
   trunk/buildroot/package/dmraid/dmraid.init
   trunk/buildroot/package/dmraid/dmraid.mk
   trunk/buildroot/package/dmraid/dmraid.patch


Changeset:
Modified: trunk/buildroot/package/dmraid/Config.in
===================================================================
--- trunk/buildroot/package/dmraid/Config.in	2009-03-04 11:14:40 UTC (rev 25521)
+++ trunk/buildroot/package/dmraid/Config.in	2009-03-04 13:22:38 UTC (rev 25522)
@@ -5,4 +5,8 @@
 	bool "dmraid"
 	select BR2_PACKAGE_DM
 	help
-	  Device-Mapper Software RAID support tool/
+	  dmraid discovers, activates, deactivates and displays properties
+	  of software RAID sets (eg, ATARAID) and contained DOS partitions.
+
+	  dmraid uses the Linux device-mapper to create devices with
+	  respective mappings for the ATARAID sets discovered.

Modified: trunk/buildroot/package/dmraid/dmraid.init
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.init	2009-03-04 11:14:40 UTC (rev 25521)
+++ trunk/buildroot/package/dmraid/dmraid.init	2009-03-04 13:22:38 UTC (rev 25522)
@@ -1,12 +1,12 @@
 #!/bin/sh
 
-# try to load module in case that hasn't been done yet
-modprobe dm-mod >/dev/null 2>&1
-
 set -e
 
 [ -x /sbin/dmraid ] || exit 0
 
+# try to load module in case that hasn't been done yet
+modprobe dm-mod >/dev/null 2>&1
+
 case "$1" in
 	start|"")
 		echo "Setting up DMRAID devices..."

Modified: trunk/buildroot/package/dmraid/dmraid.mk
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.mk	2009-03-04 11:14:40 UTC (rev 25521)
+++ trunk/buildroot/package/dmraid/dmraid.mk	2009-03-04 13:22:38 UTC (rev 25522)
@@ -3,65 +3,30 @@
 # dmraid
 #
 #############################################################
-
-DMRAID_VERSION=1.0.0.rc15
+DMRAID_VERSION:=1.0.0.rc15
 DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
-DMRAID_DIR:=$(BUILD_DIR)/dmraid/$(DMRAID_VERSION)
-DMRAID_CAT:=$(BZCAT)
-DMRAID_BINARY:=dmraid
-DMRAID_STAGING_BINARY:=$(DMRAID_DIR)/STAGING_DIR)/tools/$(DMRAID_BINARY)
-DMRAID_TARGET_BINARY:=$(TARGET_DIR)/sbin/$(DMRAID_BINARY)
+DMRAID_SUBDIR:=$(DMRAID_VERSION)
+DMRAID_DEPENDENCIES:=dm
+DMRAID_INSTALL_STAGING:=yes
 
-$(DL_DIR)/$(DMRAID_SOURCE):
-	 $(call DOWNLOAD,$(DMRAID_SITE),$(DMRAID_SOURCE))
+$(eval $(call AUTOTARGETS,package,dmraid))
 
-dmraid-source: $(DL_DIR)/$(DMRAID_SOURCE)
-
-$(DMRAID_DIR)/.unpacked: $(DL_DIR)/$(DMRAID_SOURCE)
-	$(DMRAID_CAT) $(DL_DIR)/$(DMRAID_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(DMRAID_DIR) package/dmraid \*.patch
-	touch $(DMRAID_DIR)/.unpacked
-
-$(DMRAID_DIR)/.configured: $(DMRAID_DIR)/.unpacked
-	(cd $(DMRAID_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-		--with-user=$(shell id -un) --with-group=$(shell id -gn) \
-	)
-	touch $(DMRAID_DIR)/.configured
-
-$(DMRAID_DIR)/tools/$(DMRAID_BINARY): $(DMRAID_DIR)/.configured
-	$(MAKE1) -C $(DMRAID_DIR)
-	-$(STRIPCMD) $(DMRAID_DIR)/tools/$(DMRAID_BINARY)
-	-$(UPX) --best $(DMRAID_DIR)/tools/$(DMRAID_BINARY)
-	touch -c $(DMRAID_DIR)/tools/$(DMRAID_BINARY)
-
-$(DMRAID_TARGET_BINARY): $(DMRAID_DIR)/tools/$(DMRAID_BINARY)
-	$(INSTALL) -m 0755 $? $@
+$(DMRAID_TARGET_INSTALL_TARGET): $(DMRAID_TARGET_INSTALL_STAGING)
+	$(call MESSAGE,"Installing to target")
+	$(INSTALL) -m 0755 $(STAGING_DIR)/usr/sbin/dmraid $(TARGET_DIR)/usr/sbin
 	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/dmraid
+	touch $@
 
-dmraid: uclibc dm zlib $(DMRAID_TARGET_BINARY)
-
-dmraid-clean:
-	rm -f $(DMRAID_TARGET_BINARY) $(TARGET_DIR)/etc/init.d/dmraid
-	-$(MAKE) -C $(DMRAID_DIR) clean
-
-dmraid-dirclean:
-	rm -rf $(DMRAID_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DMRAID),y)
-TARGETS+=dmraid
+ifeq ($(BR2_ENABLE_DEBUG),)
+$(DMRAID_HOOK_POST_INSTALL): $(DMRAID_TARGET_INSTALL_TARGET)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/dmraid
+	touch $@
 endif
+
+$(DMRAID_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+#	makefile has no uninstall target..
+#	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DMRAID_DIR) uninstall
+	rm -f $(TARGET_DIR)/usr/sbin/dmraid $(TARGET_DIR)/etc/init.d/dmraid
+	rm -f $(DMRAID_TARGET_INSTALL_TARGET) $(DMRAID_HOOK_POST_INSTALL)

Modified: trunk/buildroot/package/dmraid/dmraid.patch
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.patch	2009-03-04 11:14:40 UTC (rev 25521)
+++ trunk/buildroot/package/dmraid/dmraid.patch	2009-03-04 13:22:38 UTC (rev 25522)
@@ -1,5 +1,5 @@
---- 1.0.0.rc15/lib/device/scan.c.orig	2008-06-20 09:32:05.000000000 -0500
-+++ 1.0.0.rc15/lib/device/scan.c	2008-12-01 17:15:25.000000000 -0600
+--- a/1.0.0.rc15/lib/device/scan.c.orig	2008-06-20 09:32:05.000000000 -0500
++++ b/1.0.0.rc15/lib/device/scan.c	2008-12-01 17:15:25.000000000 -0600
 @@ -69,7 +69,7 @@
  	static char *ret = NULL, *sysfs_mp;
  
