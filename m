From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 22 Jan 2007 10:16:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20070122181604.EC06648585@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-22 10:16:04 -0800 (Mon, 22 Jan 2007)
New Revision: 17471

Log:
fix dependancy to avoid needless rebuilds


Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-01-22 18:15:35 UTC (rev 17470)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-01-22 18:16:04 UTC (rev 17471)
@@ -44,12 +44,14 @@
 
 $(FAKEROOT_DIR1)/faked: $(FAKEROOT_DIR1)/.configured
 	$(MAKE) -C $(FAKEROOT_DIR1)
+	touch -c $(FAKEROOT_DIR1)/faked
 
 $(STAGING_DIR)/usr/bin/fakeroot: $(FAKEROOT_DIR1)/faked
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FAKEROOT_DIR1) install
 	$(SED) 's,^PREFIX=.*,PREFIX=$(STAGING_DIR)/usr,g' $(STAGING_DIR)/usr/bin/fakeroot
 	$(SED) 's,^BINDIR=.*,BINDIR=$(STAGING_DIR)/usr/bin,g' $(STAGING_DIR)/usr/bin/fakeroot
 	$(SED) 's,^PATHS=.*,PATHS=$(FAKEROOT_DIR1)/.libs:/lib:/usr/lib,g' $(STAGING_DIR)/usr/bin/fakeroot
+	touch -c $(STAGING_DIR)/usr/bin/fakeroot
 
 host-fakeroot: uclibc $(STAGING_DIR)/usr/bin/fakeroot
 
@@ -90,6 +92,7 @@
 
 $(FAKEROOT_DIR2)/faked: $(FAKEROOT_DIR2)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(FAKEROOT_DIR2)
+	touch -c $(FAKEROOT_DIR2)/faked
 
 $(TARGET_DIR)/usr/bin/fakeroot: $(FAKEROOT_DIR2)/faked
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(FAKEROOT_DIR2) install
@@ -97,6 +100,7 @@
 	-mv $(TARGET_DIR)/usr/bin/$(ARCH)-linux-fakeroot $(TARGET_DIR)/usr/bin/fakeroot
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+	touch -c $(TARGET_DIR)/usr/bin/fakeroot
 
 fakeroot: uclibc $(TARGET_DIR)/usr/bin/fakeroot
 
