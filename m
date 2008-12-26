From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Fri, 26 Dec 2008 23:28:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb-examples
Message-ID: <20081226232816.9D58576F25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-12-26 23:28:15 +0000 (Fri, 26 Dec 2008)
New Revision: 24562

Log:
directfb-examples fixes

 * Do not install to the staging dir inside the target install target,
   since it has already been done in the staging install target.

 * Strip the binaries installed in the target.

 * Properly create the target installation stamp.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/directfb-examples/directfb-examples.mk


Changeset:
Modified: trunk/buildroot/package/directfb-examples/directfb-examples.mk
===================================================================
--- trunk/buildroot/package/directfb-examples/directfb-examples.mk	2008-12-26 22:29:26 UTC (rev 24561)
+++ trunk/buildroot/package/directfb-examples/directfb-examples.mk	2008-12-26 23:28:15 UTC (rev 24562)
@@ -42,14 +42,13 @@
 
 $(DIRECTFB_EXAMPLES_TARGET_INSTALL_TARGET): $(DIRECTFB_EXAMPLES_TARGET_INSTALL_STAGING)
 	$(call MESSAGE,"Installing to target")
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DIRECTFB_EXAMPLES_DIR) install
 	$(Q)mkdir -p $(TARGET_DIR)/usr/bin
 	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/
 	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/fonts/
 	for file in $(DIRECTFB_EXAMPLES_TARGETS_y); do \
 	        cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
+		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$$file; \
 	done
-
 	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/fonts/decker.ttf $(TARGET_DIR)/usr/share/directfb-examples/fonts/
 ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI),y)
 	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/destination_mask.png $(TARGET_DIR)/usr/share/directfb-examples/
@@ -101,5 +100,5 @@
 	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/desktop.png $(TARGET_DIR)/usr/share/directfb-examples/
 	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/dfblogo.png $(TARGET_DIR)/usr/share/directfb-examples/
 endif
-	$(Q)touch -c $@
+	touch $@
 
