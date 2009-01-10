From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 Jan 2009 00:23:58 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntfs-3g
Message-ID: <20090110002358.DA5667697D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-10 00:23:58 +0000 (Sat, 10 Jan 2009)
New Revision: 24738

Log:
Bump version of ntfs-3g to 1-5130, This will build in lib regardless of prefix=

Modified:
   trunk/buildroot/package/ntfs-3g/ntfs-3g.mk


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/ntfs-3g.mk
===================================================================
--- trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2009-01-10 00:21:35 UTC (rev 24737)
+++ trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2009-01-10 00:23:58 UTC (rev 24738)
@@ -3,13 +3,14 @@
 # ntfs-3g
 #
 #############################################################
-NTFS-3G_VERSION:=1.2506
+#NTFS-3G_VERSION:=1.2506
+NTFS-3G_VERSION:=1.5130
 NTFS-3G_SOURCE:=ntfs-3g-$(NTFS-3G_VERSION).tgz
 NTFS-3G_SITE:=www.ntfs-3g.org
 NTFS-3G_DIR:=$(BUILD_DIR)/ntfs-3g-$(NTFS-3G_VERSION)
 NTFS-3G_BINARY:=ntfs-3g
 
-
+http://www.ntfs-3g.org/ntfs-3g-1.5130.tgz
 $(DL_DIR)/$(NTFS-3G_SOURCE):
 	$(WGET) -P $(DL_DIR) $(NTFS-3G_SITE)/$(NTFS-3G_SOURCE)
 
@@ -55,8 +56,11 @@
 	touch -c $@
 
 $(TARGET_DIR)/usr/bin/ntfs-3g: $(STAGING_DIR)/usr/bin/ntfs-3g
-	cp -dpf $(STAGING_DIR)/usr/lib/libntfs-3g.so.* $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/bin/ntfs-3g $(TARGET_DIR)/usr/bin/
+	rm -f $(TARGET_DIR)/lib/libntfs-3g.so.*
+	cp -dpf $(STAGING_DIR)/lib/libntfs-3g.so.* $(TARGET_DIR)/lib/
+	-unlink $(TARGET_DIR)/usr/lib/libntfs-3g*
+	ln -s /lib/libntfs-3g.so  $(TARGET_DIR)/usr/lib/libntfs-3g.so
+	cp -dpf $(STAGING_DIR)/bin/ntfs-3g $(TARGET_DIR)/bin/
 	touch -c $@
 
 ntfs-3g: uclibc pkgconfig libfuse $(TARGET_DIR)/usr/bin/ntfs-3g
@@ -64,9 +68,10 @@
 ntfs-3g-source: $(DL_DIR)/$(NTFS-3G_SOURCE)
 
 ntfs-3g-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(NTFS-3G_DIR) uninstall
-	rm -f $(TARGET_DIR)/usr/lib/libntfs-3g*
-	rm -f $(TARGET_DIR)/usr/bin/ntfs-3g
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(NTFS-3G_DIR) uninstall
+	unlink $(TARGET_DIR)/usr/lib/libntfs-3g*
+	rm -f $(TARGET_DIR)/lib/libntfs-3g*
+	rm -f $(TARGET_DIR)/bin/ntfs-3g
 	-$(MAKE) -C $(NTFS-3G_DIR) clean
 
 ntfs-3g-dirclean:
