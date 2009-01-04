From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sun,  4 Jan 2009 06:02:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lvm2
Message-ID: <20090104060231.340EA769EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-04 06:02:30 +0000 (Sun, 04 Jan 2009)
New Revision: 24682

Log:
We don't need to set CC, AR, RANLIB when installing and uninstalling


Modified:
   trunk/buildroot/package/lvm2/lvm2.mk


Changeset:
Modified: trunk/buildroot/package/lvm2/lvm2.mk
===================================================================
--- trunk/buildroot/package/lvm2/lvm2.mk	2009-01-04 05:59:54 UTC (rev 24681)
+++ trunk/buildroot/package/lvm2/lvm2.mk	2009-01-04 06:02:30 UTC (rev 24682)
@@ -63,13 +63,13 @@
 
 $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
 	$(MAKE1) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
-	$(MAKE1) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
+	$(MAKE1) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
 	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
 
 lvm2: uclibc dm $(LVM2_TARGET_SBINS)
 
 lvm2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LVM2_DIR) uninstall
 	-$(MAKE) -C $(LVM2_DIR) clean
 
 lvm2-dirclean:
