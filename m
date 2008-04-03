From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  3 Apr 2008 04:30:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gzip
Message-ID: <20080403113014.2A9133C467@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-03 04:30:13 -0700 (Thu, 03 Apr 2008)
New Revision: 21625

Log:
gzip: cleanup makefile

Cleanup configure args, strip executables in TARGET_DIR, install
info / manpages into TARGET_DIR/usr/share/ and fixup
convenience aliases (gunzip, zcat, zdiff, ..)


Modified:
   trunk/buildroot/package/gzip/gzip.mk


Changeset:
Modified: trunk/buildroot/package/gzip/gzip.mk
===================================================================
--- trunk/buildroot/package/gzip/gzip.mk	2008-04-03 09:32:52 UTC (rev 21624)
+++ trunk/buildroot/package/gzip/gzip.mk	2008-04-03 11:30:13 UTC (rev 21625)
@@ -30,15 +30,6 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/ \
-		--bindir=/bin \
-		--sbindir=/bin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share/misc \
-		--localstatedir=/var \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	)
@@ -48,22 +39,13 @@
 	$(MAKE) CC=$(TARGET_CC) -C $(GZIP_DIR)
 
 $(GZIP_TARGET_BINARY): $(GZIP_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GZIP_DIR) install
+	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GZIP_DIR) install-strip
 ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
+	rm -rf $(TARGET_DIR)/usr/share/info
 endif
 ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
+	rm -rf $(TARGET_DIR)/usr/share/man
 endif
-	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
-	(cd $(TARGET_DIR)/bin; \
-		$(HOSTLN) -snf gzip gunzip; \
-		$(HOSTLN) -snf gzip zcat; \
-		$(HOSTLN) -snf zdiff zcmp; \
-		$(HOSTLN) -snf zgrep zegrep; \
-		$(HOSTLN) -snf zgrep zfgrep; \
-	)
 
 gzip: uclibc $(GZIP_TARGET_BINARY)
 
