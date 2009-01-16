From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 16 Jan 2009 09:02:53 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20090116090253.9B23B768D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-16 09:02:51 +0000 (Fri, 16 Jan 2009)
New Revision: 24865

Log:
package/freetype/freetype.mk: Fix editing of freetype-config

Found that the editing of freetypr-config was not quite enough.
Changed it and looked at freetype-config --cflags, --libs and got the values
I expected.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2009-01-15 23:19:28 UTC (rev 24864)
+++ trunk/buildroot/package/freetype/freetype.mk	2009-01-16 09:02:51 UTC (rev 24865)
@@ -17,7 +17,10 @@
 $(FREETYPE_TARGET_INSTALL_TARGET):
 	-cp -a $(FREETYPE_DIR)/objs/.libs/libfreetype.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
-	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(FREETYPE_DIR)/builds/unix/freetype-config
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
+		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/freetype2\',g" \
+		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
+		$(STAGING_DIR)/usr/bin/freetype-config
 	touch $@
 
