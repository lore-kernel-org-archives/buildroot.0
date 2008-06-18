From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 08:03:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/nbd
Message-ID: <20080618150310.1113C3C721@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 08:03:07 -0700 (Wed, 18 Jun 2008)
New Revision: 22421

Log:
nbd: bump version and depend on glib2

Patch by Thiago A. Correa.


Modified:
   trunk/buildroot/package/nbd/Config.in
   trunk/buildroot/package/nbd/nbd.mk


Changeset:
Modified: trunk/buildroot/package/nbd/Config.in
===================================================================
--- trunk/buildroot/package/nbd/Config.in	2008-06-18 15:02:24 UTC (rev 22420)
+++ trunk/buildroot/package/nbd/Config.in	2008-06-18 15:03:07 UTC (rev 22421)
@@ -1,9 +1,12 @@
 config BR2_PACKAGE_NBD
 	bool "nbd"
 	default n
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  NBD is a set of utilities to configure network block devices,
 	  allowing access to remote block devices over TCP/IP network.
 	  Notice: This package only provides the NBD client.
 
+	  Depends on glib.
+
 	  http://nbd.sf.net/

Modified: trunk/buildroot/package/nbd/nbd.mk
===================================================================
--- trunk/buildroot/package/nbd/nbd.mk	2008-06-18 15:02:24 UTC (rev 22420)
+++ trunk/buildroot/package/nbd/nbd.mk	2008-06-18 15:03:07 UTC (rev 22421)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NBD_VERSION=2.8.6
+NBD_VERSION=2.9.11
 NBD_SOURCE=nbd-$(NBD_VERSION).tar.bz2
 NBD_CAT:=$(BZCAT)
 NBD_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/nbd/
@@ -15,7 +15,7 @@
 
 $(NBD_DIR)/.unpacked: $(DL_DIR)/$(NBD_SOURCE)
 	$(NBD_CAT) $(DL_DIR)/$(NBD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(NBD_DIR)/.unpacked
+	touch $@
 
 $(NBD_DIR)/.configured: $(NBD_DIR)/.unpacked
 	(cd $(NBD_DIR); rm -rf config.cache; \
@@ -28,7 +28,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 	)
-	touch $(NBD_DIR)/.configured
+	touch $@
 
 $(NBD_DIR)/nbd-client: $(NBD_DIR)/.configured
 	$(MAKE) -C $(NBD_DIR) nbd-client
@@ -37,7 +37,7 @@
 	cp $< $@
 	$(STRIPCMD) $@
 
-nbd: uclibc $(TARGET_DIR)/sbin/nbd-client
+nbd: uclibc libglib2 $(TARGET_DIR)/sbin/nbd-client
 
 nbd-source: $(DL_DIR)/$(NBD_SOURCE)
 
