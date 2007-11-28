From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 28 Nov 2007 00:55:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
Message-ID: <20071128085541.543F6A685A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-28 00:55:40 -0800 (Wed, 28 Nov 2007)
New Revision: 20558

Log:
Move libdaemon from lib to usr/lib, update libdaemon.la

Modified:
   trunk/buildroot/package/libdaemon/libdaemon.mk


Changeset:
Modified: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2007-11-28 07:09:57 UTC (rev 20557)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2007-11-28 08:55:40 UTC (rev 20558)
@@ -16,6 +16,7 @@
 LIBDAEMON_DIR:=$(BUILD_DIR)/$(LIBDAEMON_NAME)
 LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
 LIBDAEMON_SOURCE:=$(LIBDAEMON_NAME).tar.gz
+LIBDAEMON_DESTDIR:=$(STAGING_DIR)/usr/lib
 LIBDAEMON_CAT:=$(ZCAT)
 
 $(DL_DIR)/$(LIBDAEMON_SOURCE):
@@ -42,7 +43,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -58,17 +59,18 @@
 	touch $@
 
 $(LIBDAEMON_DIR)/.compiled: $(LIBDAEMON_DIR)/.configured
-	$(MAKE) LIBTOOL=$(LIBDAEMON_DIR)/libtool -C $(LIBDAEMON_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBTOOL=$(LIBDAEMON_DIR)/libtool -C $(LIBDAEMON_DIR)
 	touch $@
 
-$(STAGING_DIR)/lib/libdaemon.a: $(LIBDAEMON_DIR)/.compiled
+$(LIBDAEMON_DESTDIR)/libdaemon.a: $(LIBDAEMON_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBDAEMON_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libdaemon.la
 	touch -c $@
 
-#$(TARGET_DIR)/usr/lib/libdaemon.a: $(STAGING_DIR)/lib/libdaemon.a
+#$(TARGET_DIR)/usr/lib/libdaemon.a: $(LIBDAEMON_DESTDIR)/libdaemon.a
 # -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdaemon.a
 
-libdaemon: uclibc pkgconfig $(STAGING_DIR)/lib/libdaemon.a
+libdaemon: uclibc pkgconfig $(LIBDAEMON_DESTDIR)/libdaemon.a
 
 libdaemon-unpacked: $(LIBDAEMON_DIR)/.unpacked
 
