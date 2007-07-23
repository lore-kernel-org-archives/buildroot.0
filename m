From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 00:56:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/samba
Message-ID: <20070723075600.100C8A6110@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 00:56:00 -0700 (Mon, 23 Jul 2007)
New Revision: 19197

Log:
Update SAMBA configuration + cleanup

Modified:
   trunk/buildroot/package/samba/samba.mk


Changeset:
Modified: trunk/buildroot/package/samba/samba.mk
===================================================================
--- trunk/buildroot/package/samba/samba.mk	2007-07-23 07:54:13 UTC (rev 19196)
+++ trunk/buildroot/package/samba/samba.mk	2007-07-23 07:56:00 UTC (rev 19197)
@@ -19,7 +19,8 @@
 $(SAMBA_DIR)/.unpacked: $(DL_DIR)/$(SAMBA_SOURCE)
 	$(SAMBA_CAT) $(DL_DIR)/$(SAMBA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh `dirname $(SAMBA_DIR)` package/samba/ samba\*.patch
-	touch $(SAMBA_DIR)/.unpacked
+	$(CONFIG_UPDATE) $(SAMBA_DIR)
+	touch $@
 
 $(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.unpacked
 	(cd $(SAMBA_DIR); rm -rf config.cache; \
@@ -45,7 +46,7 @@
 		--disable-cups \
 		--disable-static \
 	);
-	touch $(SAMBA_DIR)/.configured
+	touch $@
 
 $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(SAMBA_DIR)
