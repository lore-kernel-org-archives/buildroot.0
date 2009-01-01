From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Thu,  1 Jan 2009 14:00:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lvm2
Message-ID: <20090101140036.CAC1176C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-01 14:00:35 +0000 (Thu, 01 Jan 2009)
New Revision: 24633

Log:
* Bumped lvm2 to 2.02.43
- By default the build uses host ar/ranlib to generate the static lvm library used, force the target tools to be used instead


Modified:
   trunk/buildroot/package/lvm2/lvm2.mk


Changeset:
Modified: trunk/buildroot/package/lvm2/lvm2.mk
===================================================================
--- trunk/buildroot/package/lvm2/lvm2.mk	2008-12-31 18:28:59 UTC (rev 24632)
+++ trunk/buildroot/package/lvm2/lvm2.mk	2009-01-01 14:00:35 UTC (rev 24633)
@@ -24,7 +24,7 @@
 # USA
 
 LVM2_BASEVER=2.02
-LVM2_PATCH=28
+LVM2_PATCH=43
 LVM2_VERSION=$(LVM2_BASEVER).$(LVM2_PATCH)
 LVM2_SOURCE:=LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE:=ftp://sources.redhat.com/pub/lvm2
@@ -62,14 +62,14 @@
 	touch $(LVM2_DIR)/.configured
 
 $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
-	$(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
+	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
+	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
 	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
 
 lvm2: uclibc dm $(LVM2_TARGET_SBINS)
 
 lvm2-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LVM2_DIR) uninstall
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) uninstall
 	-$(MAKE) -C $(LVM2_DIR) clean
 
 lvm2-dirclean:
