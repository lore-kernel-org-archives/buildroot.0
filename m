From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 28 Nov 2007 00:57:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgpg-error
Message-ID: <20071128085700.147623005E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-28 00:57:00 -0800 (Wed, 28 Nov 2007)
New Revision: 20560

Log:
Move libgpg-error from lib to usr/lib, update libgpg-error.la

Modified:
   trunk/buildroot/package/libgpg-error/libgpg-error.mk


Changeset:
Modified: trunk/buildroot/package/libgpg-error/libgpg-error.mk
===================================================================
--- trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-11-28 08:56:24 UTC (rev 20559)
+++ trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-11-28 08:57:00 UTC (rev 20560)
@@ -8,7 +8,7 @@
 LIBGPG_ERROR_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgpg-error
 LIBGPG_ERROR_DIR:=$(BUILD_DIR)/libgpg-error-$(LIBGPG_ERROR_VERSION)
 LIBGPG_ERROR_LIBRARY:=src/libgpg-error.la
-LIBGPG_ERROR_DESTDIR:=lib
+LIBGPG_ERROR_DESTDIR:=usr/lib
 LIBGPG_ERROR_TARGET_LIBRARY=$(LIBGPG_ERROR_DESTDIR)/libgpg-error.so
 
 $(DL_DIR)/$(LIBGPG_ERROR_SOURCE):
@@ -32,7 +32,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/$(LIBGPG_ERROR_DESTDIR) \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -49,8 +49,8 @@
 
 $(STAGING_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY): $(LIBGPG_ERROR_DIR)/$(LIBGPG_ERROR_LIBRARY)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBGPG_ERROR_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgpg-error.la
 
-
 $(TARGET_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY)
 	cp -dpf $<* $(TARGET_DIR)/$(LIBGPG_ERROR_DESTDIR)
 
@@ -61,6 +61,7 @@
 libgpg-error-clean:
 	rm -f $(TARGET_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY)*
 	-$(MAKE) -C $(LIBGPG_ERROR_DIR) clean
+	rm -f $(STAGING_DIR)/$(LIBGPG_ERROR_TARGET_LIBRARY)\*
 
 libgpg-error-dirclean:
 	rm -rf $(LIBGPG_ERROR_DIR)
