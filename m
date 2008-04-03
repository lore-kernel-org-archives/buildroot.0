From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Apr 2008 04:44:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/diffutils
Message-ID: <20080403114409.A27513C47D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-03 04:44:09 -0700 (Thu, 03 Apr 2008)
New Revision: 21626

Log:
diffutils: cleanup makefile

Cleanup configure args, strip executables in TARGET_DIR and
honor BR2_ENABLE_LOCALE.


Modified:
   trunk/buildroot/package/diffutils/diffutils.mk


Changeset:
Modified: trunk/buildroot/package/diffutils/diffutils.mk
===================================================================
--- trunk/buildroot/package/diffutils/diffutils.mk	2008-04-03 11:30:13 UTC (rev 21625)
+++ trunk/buildroot/package/diffutils/diffutils.mk	2008-04-03 11:44:09 UTC (rev 21626)
@@ -83,14 +83,6 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
 		--mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		$(DISABLE_NLS) \
@@ -102,15 +94,16 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR)
 
 $(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY): $(DIFFUTILS_DIR)/$(DIFFUTILS_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR) install
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR) install-strip
 ifneq ($(BR2_HAVE_INFOPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/info
 endif
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/man
 endif
-	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
+ifneq ($(BR2_ENABLE_LOCALE),y)
+	rm -rf $(TARGET_DIR)/usr/share/locale
+endif
 
 diffutils: uclibc $(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY)
 
