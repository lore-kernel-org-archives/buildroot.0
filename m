From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 13 Jan 2009 10:37:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/liberation
Message-ID: <20090113103749.5AC7B76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2009-01-13 10:37:48 +0000 (Tue, 13 Jan 2009)
New Revision: 24813

Log:
package/liberation/liberation.mk: A further tidy up.....

Use touch -c $@
Do not install fonts into staging dir.

Signed-off-by: Daniel Laird <daniel.j.laird@nxp.com>



Modified:
   trunk/buildroot/package/liberation/liberation.mk


Changeset:
Modified: trunk/buildroot/package/liberation/liberation.mk
===================================================================
--- trunk/buildroot/package/liberation/liberation.mk	2009-01-13 10:26:28 UTC (rev 24812)
+++ trunk/buildroot/package/liberation/liberation.mk	2009-01-13 10:37:48 UTC (rev 24813)
@@ -16,23 +16,17 @@
 
 $(LIBERATION_DIR)/.unpacked: $(DL_DIR)/$(LIBERATION_SOURCE)
 	$(LIBERATION_CAT) $(DL_DIR)/$(LIBERATION_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBERATION_DIR)/.unpacked
+	touch -c $@
 
-$(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
-	-mkdir -p $(STAGING_DIR)/usr/share/fonts/liberation
-	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(STAGING_DIR)/usr/share/fonts/liberation/
-	touch -c $(STAGING_DIR)/usr/share/fonts/.ttf
-
-$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf
+$(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: $(LIBERATION_DIR)/.unpacked
 	-mkdir -p $(TARGET_DIR)/usr/share/fonts/liberation
 	$(INSTALL) -m0644 $(LIBERATION_DIR)/*.ttf $(TARGET_DIR)/usr/share/fonts/liberation/
-	touch -c $(TARGET_DIR)/usr/share/fonts/.ttf
+	touch -c $@
 
 liberation: uclibc $(TARGET_DIR)/usr/share/fonts/LiberationMono-Bold.ttf
 
 liberation-clean:
 	rm -rf $(TARGET_DIR)/usr/share/fonts/liberation/
-	rm -rf $(STAGING_DIR)/usr/share/fonts/liberation/
 
 liberation-dirclean:
 	rm -rf $(LIBERATION_DIR)
