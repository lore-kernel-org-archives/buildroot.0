From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 12 Sep 2007 01:52:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20070912085246.67D3BA6811@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-09-12 01:52:44 -0700 (Wed, 12 Sep 2007)
New Revision: 19827

Log:
bump version, fixup some brokenness


Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2007-09-12 07:05:52 UTC (rev 19826)
+++ trunk/buildroot/package/dm/dm.mk	2007-09-12 08:52:44 UTC (rev 19827)
@@ -24,7 +24,7 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=20
+DM_PATCH=22
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
@@ -35,7 +35,7 @@
 DM_TARGET_BINARY:=$(TARGET_DIR)/usr/sbin/dmsetup
 DM_STAGING_LIBRARY:=$(STAGING_DIR)/lib/libdevmapper.so
 DM_TARGET_LIBRARY:=$(TARGET_DIR)/usr/lib/libdevmapper.so
-DM_TARGET_HEADER:=$(TARGET_DIR)/usr/include/libdevmapper.h
+DM_TARGET_HEADER:=$(TARGET_DIR)/include/libdevmapper.h
 
 $(DL_DIR)/$(DM_SOURCE):
 	$(WGET) -P $(DL_DIR) $(DM_SITE)/$(DM_SOURCE) || \
@@ -86,7 +86,6 @@
 $(DM_STAGING_BINARY) $(DM_STAGING_LIBRARY): $(DM_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(DM_DIR)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DM_DIR) install
-	mv $(STAGING_DIR)/include/libdevmapper.h $(STAGING_DIR)/usr/include/libdevmapper.h
 
 # Install dmsetup from staging to target
 $(DM_TARGET_BINARY): $(DM_STAGING_BINARY)
@@ -109,9 +108,10 @@
 # Install header file
 $(DM_TARGET_HEADER): $(DM_TARGET_LIBRARY)
 	rm -f $@
-	$(INSTALL) -m 0644 $(STAGING_DIR)/usr/include/libdevmapper.h $@
+	mkdir -p $(STAGING_DIR)/include
+	$(INSTALL) -m 0644 $(STAGING_DIR)/include/libdevmapper.h $@
 
-dm: uclibc $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) $(DM_TARGET_HEADER)
+dm: uclibc $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) #$(DM_TARGET_HEADER)
 
 dm-clean:
 	rm $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) $(DM_TARGET_LIBRARY).$(DM_BASEVER) $(DM_TARGET_HEADER)
