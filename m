From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 04:59:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20070812115952.A73BCA65D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 04:59:51 -0700 (Sun, 12 Aug 2007)
New Revision: 19458

Log:
install libdevmapper.h to allow dm to build

Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2007-08-12 11:34:03 UTC (rev 19457)
+++ trunk/buildroot/package/dm/dm.mk	2007-08-12 11:59:51 UTC (rev 19458)
@@ -24,7 +24,7 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=13
+DM_PATCH=20
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
@@ -35,6 +35,7 @@
 DM_TARGET_BINARY:=$(TARGET_DIR)/usr/sbin/dmsetup
 DM_STAGING_LIBRARY:=$(STAGING_DIR)/lib/libdevmapper.so
 DM_TARGET_LIBRARY:=$(TARGET_DIR)/usr/lib/libdevmapper.so
+DM_TARGET_HEADER:=$(TARGET_DIR)/usr/include/libdevmapper.h
 
 $(DL_DIR)/$(DM_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DM_SITE)/$(DM_SOURCE) || \
@@ -85,6 +86,7 @@
 $(DM_STAGING_BINARY) $(DM_STAGING_LIBRARY): $(DM_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(DM_DIR)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DM_DIR) install
+	mv $(STAGING_DIR)/include/libdevmapper.h $(STAGING_DIR)/usr/include/libdevmapper.h
 
 # Install dmsetup from staging to target
 $(DM_TARGET_BINARY): $(DM_STAGING_BINARY)
@@ -104,10 +106,15 @@
 	ln -s $(<F) $@
 	touch -c $(DM_TARGET_LIBRARY)
 
-dm: uclibc $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY)
+# Install header file
+$(DM_TARGET_HEADER): $(DM_TARGET_LIBRARY)
+	rm -f $@
+	$(INSTALL) -m 0644 $(STAGING_DIR)/usr/include/libdevmapper.h $@
 
+dm: uclibc $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) $(DM_TARGET_HEADER)
+
 dm-clean:
-	rm $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) $(DM_TARGET_LIBRARY).$(DM_BASEVER)
+	rm $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) $(DM_TARGET_LIBRARY).$(DM_BASEVER) $(DM_TARGET_HEADER)
 	$(MAKE) -C $(DM_DIR) clean
 
 dm-dirclean:
