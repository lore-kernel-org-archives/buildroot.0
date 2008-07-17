From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 17 Jul 2008 06:20:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20080717132041.355413C86E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-17 06:20:37 -0700 (Thu, 17 Jul 2008)
New Revision: 22863

Log:
freetype: fix target install and clean / dirclean

- target install didn't strip library
- clean didn't uninstall from staging / target
- dirclean target missing

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-07-17 13:20:23 UTC (rev 22862)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-07-17 13:20:37 UTC (rev 22863)
@@ -48,13 +48,19 @@
 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/freetype-config
 	$(SED) "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" $(STAGING_DIR)/usr/bin/freetype-config
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/bin/freetype-config
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libfreetype.so
 	touch $@
 
 freetype: uclibc pkgconfig $(FREETYPE_DIR)/.installed
 
 freetype-clean:
+	-$(MAKE) -C $(FREETYPE_DIR) DESTDIR=$(STAGING_DIR) uninstall
+	-$(MAKE) -C $(FREETYPE_DIR) DESTDIR=$(TARGET_DIR) uninstall
 	-$(MAKE) -C $(FREETYPE_DIR) clean
 
+freetype-dirclean:
+	rm -rf $(FREETYPE_DIR)
+
 #############################################################
 #
 # Toplevel Makefile options
