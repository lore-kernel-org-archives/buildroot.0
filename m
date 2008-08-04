From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20080804190804.75F7D3C8D2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:04 -0700 (Mon, 04 Aug 2008)
New Revision: 23031

Log:
ccache: cleanup configure args and respect BR2_HAVE_MANPAGES

Modified:
   trunk/buildroot/toolchain/ccache/ccache.mk


Changeset:
Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2008-08-04 19:08:01 UTC (rev 23030)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2008-08-04 19:08:04 UTC (rev 23031)
@@ -149,15 +149,7 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 	)
 	touch $@
@@ -167,8 +159,9 @@
 
 $(TARGET_DIR)/$(CCACHE_TARGET_BINARY): $(CCACHE_DIR2)/$(CCACHE_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(CCACHE_DIR2) install
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
+ifneq ($(BR2_HAVE_MANPAGES),y)
+	rm -rf $(TARGET_DIR)/usr/man
+endif
 	# put a bunch of symlinks into /bin, since that is earlier
 	# in the default PATH than /usr/bin where gcc lives
 	(cd $(TARGET_DIR)/bin; \
