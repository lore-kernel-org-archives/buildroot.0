From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 18:32:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20070821013237.256CCA470E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 18:32:37 -0700 (Mon, 20 Aug 2007)
New Revision: 19595

Log:
Fix configure problem with libdaemon, by patching result from autotools

Added:
   trunk/buildroot/package/libdaemon/libdaemon-0.10.patch.bz2

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Added: trunk/buildroot/package/libdaemon/libdaemon-0.10.patch.bz2
===================================================================
(Binary files differ)


Property changes on: trunk/buildroot/package/libdaemon/libdaemon-0.10.patch.bz2
___________________________________________________________________
Name: svn:mime-type
   + application/octet-stream

Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-08-21 01:28:12 UTC (rev 19594)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-08-21 01:32:37 UTC (rev 19595)
@@ -12,9 +12,10 @@
 # later version.
 
 LIBDAEMON_VERSION:=0.10
-LIBDAEMON_DIR:=$(BUILD_DIR)/libdaemon-$(LIBDAEMON_VERSION)
+LIBDAEMON_NAME:=libdaemon-$(LIBDAEMON_VERSION)
+LIBDAEMON_DIR:=$(BUILD_DIR)/$(LIBDAEMON_NAME)
 LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
-LIBDAEMON_SOURCE:=libdaemon-$(LIBDAEMON_VERSION).tar.gz
+LIBDAEMON_SOURCE:=$(LIBDAEMON_NAME).tar.gz
 LIBDAEMON_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(LIBDAEMON_SOURCE):
@@ -25,6 +26,10 @@
 $(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
 	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
+	mkdir	-p $(PROJECT_BUILD_DIR)/patches
+	bzcat package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \
+		> $(PROJECT_BUILD_DIR)/patches/$(LIBDAEMON_NAME).patch
+	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) $(PROJECT_BUILD_DIR)/patches/ $(LIBDAEMON_NAME)\*.patch
 	$(CONFIG_UPDATE) $(LIBDAEMON_DIR)
 	touch $(LIBDAEMON_DIR)/.unpacked
 
@@ -57,7 +62,7 @@
 	touch $(LIBDAEMON_DIR)/.configured
 
 $(LIBDAEMON_DIR)/.compiled: $(LIBDAEMON_DIR)/.configured
-	$(MAKE) -C $(LIBDAEMON_DIR)
+	$(MAKE) LIBTOOL=$(LIBDAEMON_DIR)/libtool -C $(LIBDAEMON_DIR)
 	touch $(LIBDAEMON_DIR)/.compiled
 
 $(STAGING_DIR)/lib/libdaemon.a: $(LIBDAEMON_DIR)/.compiled
@@ -65,15 +70,25 @@
 	touch -c $(STAGING_DIR)/lib/libdaemon.a
 
 #$(TARGET_DIR)/usr/lib/libdaemon.a: $(STAGING_DIR)/lib/libdaemon.a
-#	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libdaemon.a
+#	-$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdaemon.a
 
 libdaemon: uclibc pkgconfig $(STAGING_DIR)/lib/libdaemon.a
 
+libdaemon-unpacked: $(LIBDAEMON_DIR)/.unpacked
+
 libdaemon-clean:
 	-$(MAKE) -C $(LIBDAEMON_DIR) clean
 
+libdaemon-patch-prep: libdaemon-dirclean libdaemon-unpacked
+	cp -af $(LIBDAEMON_DIR) $(LIBDAEMON_DIR)-0rig
+
+libdaemon-patch: 
+	(cd $(BUILD_DIR); \
+	diff -urN $(LIBDAEMON_NAME)-0rig $(LIBDAEMON_NAME) > ../../$(LIBDAEMON_NAME)-$(DATE).patch || echo)
+
 libdaemon-dirclean:
 	rm -rf $(LIBDAEMON_DIR)
+	rm -rf $(LIBDAEMON_DIR)-0rig
 
 #############################################################
 #
