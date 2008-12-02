From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  2 Dec 2008 01:15:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/cramfs
Message-ID: <20081202091508.7E32B3C6D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-02 01:15:08 -0800 (Tue, 02 Dec 2008)
New Revision: 24228

Log:
target/cramfs/cramfs.mk: Fix device table not being passed to mkcramfs

While mkcramfs was being patched to support a device table, the target device table was not being passed to the mkcramfs options. This patch fixes that

Signed-off-by: Jared Holzman <j.holzman@genesysdesign.com.au>

Modified:
   trunk/buildroot/target/cramfs/cramfs.mk


Changeset:
Modified: trunk/buildroot/target/cramfs/cramfs.mk
===================================================================
--- trunk/buildroot/target/cramfs/cramfs.mk	2008-12-02 06:38:26 UTC (rev 24227)
+++ trunk/buildroot/target/cramfs/cramfs.mk	2008-12-02 09:15:08 UTC (rev 24228)
@@ -40,11 +40,15 @@
 #
 #############################################################
 ifeq ($(BR2_ENDIAN),"BIG")
-CRAMFS_ENDIANNESS=-b
+CRAMFS_OPTS=-b
 else
-CRAMFS_ENDIANNESS=-l
+CRAMFS_OPTS=-l
 endif
 
+ifneq ($(TARGET_DEVICE_TABLE),)
+CRAMFS_OPTS += -D $(TARGET_DEVICE_TABLE)
+endif
+
 CRAMFS_TARGET=$(IMAGE).cramfs
 
 cramfsroot: host-fakeroot makedevs cramfs
@@ -68,7 +72,7 @@
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 endif
 	# Use fakeroot so mkcramfs believes the previous fakery
-	echo "$(CRAMFS_DIR)/mkcramfs -q $(CRAMFS_ENDIANNESS) " \
+	echo "$(CRAMFS_DIR)/mkcramfs -q $(CRAMFS_OPTS) " \
 		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
