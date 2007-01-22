From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 12:26:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20070122202639.F014D4857D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 12:26:38 -0800 (Mon, 22 Jan 2007)
New Revision: 17476

Log:
- bump version


Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-01-22 19:33:58 UTC (rev 17475)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-01-22 20:26:38 UTC (rev 17476)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.5.8
+FAKEROOT_VERSION:=1.5.12
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
@@ -23,7 +23,7 @@
 	$(SED) "s,getopt --version,getopt --version 2>/dev/null," \
 		$(FAKEROOT_SOURCE_DIR)/scripts/fakeroot.in
 	toolchain/patch-kernel.sh $(FAKEROOT_SOURCE_DIR) package/fakeroot/ \*.patch
-	touch $(FAKEROOT_SOURCE_DIR)/.unpacked
+	touch $@
 
 
 #############################################################
@@ -40,18 +40,18 @@
 		--prefix=/usr \
 		$(DISABLE_NLS) \
 	);
-	touch $(FAKEROOT_DIR1)/.configured
+	touch $@
 
 $(FAKEROOT_DIR1)/faked: $(FAKEROOT_DIR1)/.configured
 	$(MAKE) -C $(FAKEROOT_DIR1)
-	touch -c $(FAKEROOT_DIR1)/faked
+	touch -c $@
 
 $(STAGING_DIR)/usr/bin/fakeroot: $(FAKEROOT_DIR1)/faked
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(FAKEROOT_DIR1) install
 	$(SED) 's,^PREFIX=.*,PREFIX=$(STAGING_DIR)/usr,g' $(STAGING_DIR)/usr/bin/fakeroot
 	$(SED) 's,^BINDIR=.*,BINDIR=$(STAGING_DIR)/usr/bin,g' $(STAGING_DIR)/usr/bin/fakeroot
 	$(SED) 's,^PATHS=.*,PATHS=$(FAKEROOT_DIR1)/.libs:/lib:/usr/lib,g' $(STAGING_DIR)/usr/bin/fakeroot
-	touch -c $(STAGING_DIR)/usr/bin/fakeroot
+	touch -c $@
 
 host-fakeroot: uclibc $(STAGING_DIR)/usr/bin/fakeroot
 
@@ -88,11 +88,11 @@
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 	);
-	touch $(FAKEROOT_DIR2)/.configured
+	touch $@
 
 $(FAKEROOT_DIR2)/faked: $(FAKEROOT_DIR2)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(FAKEROOT_DIR2)
-	touch -c $(FAKEROOT_DIR2)/faked
+	touch -c $@
 
 $(TARGET_DIR)/usr/bin/fakeroot: $(FAKEROOT_DIR2)/faked
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(FAKEROOT_DIR2) install
@@ -100,7 +100,7 @@
 	-mv $(TARGET_DIR)/usr/bin/$(ARCH)-linux-fakeroot $(TARGET_DIR)/usr/bin/fakeroot
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-	touch -c $(TARGET_DIR)/usr/bin/fakeroot
+	touch -c $@
 
 fakeroot: uclibc $(TARGET_DIR)/usr/bin/fakeroot
 
