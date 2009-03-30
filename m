From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 13:59:23 +0000 (UTC)
Subject: [Buildroot] svn commit: [25896] trunk/buildroot/package/freetype
Message-ID: <20090330135923.66387775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 13:59:22 +0000 (Mon, 30 Mar 2009)
New Revision: 25896

Log:
freetype: strip target library and remove freetype-config if not needed

As noticed by Thomas Petazzoni.

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-03-30 11:53:48 UTC (rev 25895)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-03-30 13:59:22 UTC (rev 25896)
@@ -21,6 +21,10 @@
 		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/freetype2\',g" \
 		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/bin/freetype-config
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
+ifneq ($(BR2_HAVE_DEVFILES),y)
+	rm -f $(TARGET_DIR)/usr/bin/freetype-config
+endif
 	touch $@
 
 # freetype for the host
