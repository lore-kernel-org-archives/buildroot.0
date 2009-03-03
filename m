From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:27 +0100
Subject: [Buildroot] dmraid: fix build & convert to Makefile.autotools.in
In-Reply-To: <1236077910-15674-5-git-send-email-razzor@kopf-tisch.de>
References: <> <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-4-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-5-git-send-email-razzor@kopf-tisch.de>
Message-ID: <1236077910-15674-6-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- was not building at all (x86 uclibc)
- adding devicemapper dependency
---
 package/dmraid/Config.in    |    6 +++-
 package/dmraid/dmraid.init  |    6 ++--
 package/dmraid/dmraid.mk    |   75 +++++++++++-------------------------------
 package/dmraid/dmraid.patch |    4 +-
 4 files changed, 30 insertions(+), 61 deletions(-)

diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 48496b7..a06b381 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -5,4 +5,8 @@ config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	select BR2_PACKAGE_DM
 	help
-	  Device-Mapper Software RAID support tool/
+	  dmraid discovers, activates, deactivates and displays properties
+	  of software RAID sets (eg, ATARAID) and contained DOS partitions.
+
+	  dmraid uses the Linux device-mapper to create devices with
+	  respective mappings for the ATARAID sets discovered.
diff --git a/package/dmraid/dmraid.init b/package/dmraid/dmraid.init
index 43240e2..970d47d 100644
--- a/package/dmraid/dmraid.init
+++ b/package/dmraid/dmraid.init
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
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
index 7db7d84..b5f96b5 100644
--- a/package/dmraid/dmraid.mk
+++ b/package/dmraid/dmraid.mk
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
-
-$(DL_DIR)/$(DMRAID_SOURCE):
-	 $(call DOWNLOAD,$(DMRAID_SITE),$(DMRAID_SOURCE))
-
-dmraid-source: $(DL_DIR)/$(DMRAID_SOURCE)
-
-$(DMRAID_DIR)/.unpacked: $(DL_DIR)/$(DMRAID_SOURCE)
-	$(DMRAID_CAT) $(DL_DIR)/$(DMRAID_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(DMRAID_DIR) package/dmraid \*.patch
-	touch $(DMRAID_DIR)/.unpacked
+DMRAID_SUBDIR:=$(DMRAID_VERSION)
+DMRAID_DEPENDENCIES:=dm
+DMRAID_INSTALL_STAGING:=yes
 
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
+$(eval $(call AUTOTARGETS,package,dmraid))
 
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
diff --git a/package/dmraid/dmraid.patch b/package/dmraid/dmraid.patch
index 55bfcd5..fbe2894 100644
--- a/package/dmraid/dmraid.patch
+++ b/package/dmraid/dmraid.patch
@@ -1,5 +1,5 @@
---- 1.0.0.rc15/lib/device/scan.c.orig	2008-06-20 09:32:05.000000000 -0500
-+++ 1.0.0.rc15/lib/device/scan.c	2008-12-01 17:15:25.000000000 -0600
+--- a/1.0.0.rc15/lib/device/scan.c.orig	2008-06-20 09:32:05.000000000 -0500
++++ b/1.0.0.rc15/lib/device/scan.c	2008-12-01 17:15:25.000000000 -0600
 @@ -69,7 +69,7 @@
  	static char *ret = NULL, *sysfs_mp;
  
-- 
1.5.4.3
