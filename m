From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 28 Nov 2007 00:56:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgcrypt
Message-ID: <20071128085625.C12C530053@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-28 00:56:24 -0800 (Wed, 28 Nov 2007)
New Revision: 20559

Log:
Move libgcrypt from lib to usr/lib, update libgcrypt.la

Modified:
   trunk/buildroot/package/libgcrypt/libgcrypt.mk


Changeset:
Modified: trunk/buildroot/package/libgcrypt/libgcrypt.mk
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-11-28 08:55:40 UTC (rev 20558)
+++ trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-11-28 08:56:24 UTC (rev 20559)
@@ -8,7 +8,7 @@
 LIBGCRYPT_SITE:=ftp://gd.tuwien.ac.at/privacy/gnupg/libgcrypt/
 LIBGCRYPT_DIR:=$(BUILD_DIR)/libgcrypt-$(LIBGCRYPT_VERSION)
 LIBGCRYPT_LIBRARY:=src/libgcrypt.la
-LIBGCRYPT_DESTDIR:=lib
+LIBGCRYPT_DESTDIR:=usr/lib
 LIBGCRYPT_TARGET_LIBRARY=$(LIBGCRYPT_DESTDIR)/libgcrypt.so
 
 $(DL_DIR)/$(LIBGCRYPT_SOURCE):
@@ -36,7 +36,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/$(LIBGCRYPT_DESTDIR) \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -53,6 +53,7 @@
 
 $(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY): $(LIBGCRYPT_DIR)/$(LIBGCRYPT_LIBRARY)
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) -C $(LIBGCRYPT_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libgcrypt.la
 	touch -c $@
 
 $(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY): $(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)
@@ -68,6 +69,7 @@
 libgcrypt-clean:
 	rm -f $(TARGET_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)*
 	-$(MAKE) -C $(LIBGCRYPT_DIR) clean
+	rm -rf $(STAGING_DIR)/$(LIBGCRYPT_TARGET_LIBRARY)\*
 
 libgcrypt-dirclean:
 	rm -rf $(LIBGCRYPT_DIR)
