From: Pavel Roskin <proski@gnu.org>
Date: Tue, 28 Nov 2006 23:29:21 -0500
Subject: [Buildroot] [PATCH] Update version of device-mapper,
	add alternate location
Message-ID: <1164774561.4016.87.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Old versions of device-mapper are moved to the "old" directory.  Since
new versions are released very often, tracking them would require
frequent changes.

To avoid the breakage, look in the "old" directory if the package is not
found.

Index: package/dm/dm.mk
===================================================================
--- package/dm/dm.mk	(revision 16710)
+++ package/dm/dm.mk	(working copy)
@@ -24,10 +24,11 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=12
+DM_PATCH=13
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
+DM_SITE_OLD:=ftp://sources.redhat.com/pub/dm/old
 DM_CAT:=$(ZCAT)
 DM_DIR:=$(BUILD_DIR)/device-mapper.$(DM_VERSION)
 DM_STAGING_BINARY:=$(STAGING_DIR)/sbin/dmsetup
@@ -36,7 +37,8 @@
 DM_TARGET_LIBRARY:=$(TARGET_DIR)/usr/lib/libdevmapper.so
 
 $(DL_DIR)/$(DM_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(DM_SITE)/$(DM_SOURCE)
+	$(WGET) -P $(DL_DIR) $(DM_SITE)/$(DM_SOURCE) || \
+		$(WGET) -P $(DL_DIR) $(DM_SITE_OLD)/$(DM_SOURCE)
 
 $(DM_DIR)/.unpacked: $(DL_DIR)/$(DM_SOURCE)
 	$(DM_CAT) $(DL_DIR)/$(DM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -

 
-- 
Regards,
Pavel Roskin
