From: andersen at uclibc.org <andersen@uclibc.org>
Date: Fri, 17 Nov 2006 15:44:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dm dmraid
Message-ID: <20061117234445.CE94E48636@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-11-17 15:44:45 -0800 (Fri, 17 Nov 2006)
New Revision: 16574

Log:
minor version bumps


Added:
   trunk/buildroot/package/dmraid/dmraid.patch

Modified:
   trunk/buildroot/package/dm/dm.mk
   trunk/buildroot/package/dmraid/dmraid.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2006-11-17 23:17:02 UTC (rev 16573)
+++ trunk/buildroot/package/dm/dm.mk	2006-11-17 23:44:45 UTC (rev 16574)
@@ -24,7 +24,7 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=10
+DM_PATCH=12
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
@@ -40,6 +40,7 @@
 
 $(DM_DIR)/.unpacked: $(DL_DIR)/$(DM_SOURCE)
 	$(DM_CAT) $(DL_DIR)/$(DM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(DM_DIR) package/dm/ \*.patch
 	touch $(DM_DIR)/.unpacked
 
 $(DM_DIR)/.configured: $(DM_DIR)/.unpacked
@@ -67,7 +68,7 @@
 $(DM_DIR)/$(DM_LIBRARY): dm-build
 
 $(DM_STAGING_BINARY) $(DM_STAGING_LIBRARY): $(DM_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(DM_DIR) DESTDIR=$(STAGING_DIR)
+	$(MAKE) CC=$(TARGET_CC) DESTDIR=$(STAGING_DIR) -C $(DM_DIR)
 	$(MAKE) -C $(DM_DIR) install prefix=$(STAGING_DIR)
 
 # Install dmsetup from staging to target

Modified: trunk/buildroot/package/dmraid/dmraid.mk
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.mk	2006-11-17 23:17:02 UTC (rev 16573)
+++ trunk/buildroot/package/dmraid/dmraid.mk	2006-11-17 23:44:45 UTC (rev 16574)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DMRAID_VERSION=1.0.0.rc11
+DMRAID_VERSION=1.0.0.rc13
 DMRAID_SOURCE:=dmraid-$(DMRAID_VERSION).tar.bz2
 DMRAID_SITE:=http://people.redhat.com/~heinzm/sw/dmraid/src
 DMRAID_DIR:=$(BUILD_DIR)/dmraid/$(DMRAID_VERSION)
@@ -46,7 +46,7 @@
 	$(INSTALL) -m 0755 $? $@
 	$(INSTALL) -m 0755 package/dmraid/dmraid.init $(TARGET_DIR)/etc/init.d/dmraid
 
-dmraid: uclibc dm $(DMRAID_TARGET_BINARY)
+dmraid: uclibc dm zlib $(DMRAID_TARGET_BINARY)
 
 dmraid-clean:
 	rm $(DMRAID_TARGET_BINARY)

Added: trunk/buildroot/package/dmraid/dmraid.patch
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.patch	2006-11-17 23:17:02 UTC (rev 16573)
+++ trunk/buildroot/package/dmraid/dmraid.patch	2006-11-17 23:44:45 UTC (rev 16574)
@@ -0,0 +1,20 @@
+--- 1.0.0.rc10/lib/device/scan.c.orig	2006-04-20 18:20:24.000000000 -0600
++++ 1.0.0.rc10/lib/device/scan.c	2006-04-20 18:21:00.000000000 -0600
+@@ -66,7 +66,7 @@
+ 	static char *ret = NULL, *sysfs_mp;
+ 
+ 	if (!(sysfs_mp = find_sysfs_mp(lc)))
+-		LOG_ERR(lc, NULL, "finding sysfs mount point");
++		{ log_notice(lc, "finding sysfs mount point"); return NULL; }
+ 
+ 	if ((ret = dbg_malloc(strlen(sysfs_mp) + strlen(path) + 1)))
+ 		sprintf(ret, "%s%s", sysfs_mp, path);
+@@ -308,7 +308,7 @@
+ 	} else {
+ 		sysfs = 0;
+ 		path = (char*) _PATH_DEV;
+-		log_print(lc, "carrying on with %s", path);
++		log_notice(lc, "carrying on with %s", path);
+ 	}
+ 
+ 	if (!(d = opendir(path))) {
