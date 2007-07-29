From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 29 Jul 2007 00:14:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20070729071401.1232FA4682@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-29 00:14:01 -0700 (Sun, 29 Jul 2007)
New Revision: 19316

Log:
Cleanup of libpng

Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2007-07-29 07:11:20 UTC (rev 19315)
+++ trunk/buildroot/package/libpng/libpng.mk	2007-07-29 07:14:01 UTC (rev 19316)
@@ -35,7 +35,7 @@
 $(LIBPNG_DIR)/.unpacked: $(DL_DIR)/$(LIBPNG_SOURCE)
 	$(LIBPNG_CAT) $(DL_DIR)/$(LIBPNG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(LIBPNG_DIR)
-	touch $(LIBPNG_DIR)/.unpacked
+	touch $@
 
 $(LIBPNG_DIR)/.configured: $(LIBPNG_DIR)/.unpacked
 	(cd $(LIBPNG_DIR); rm -rf config.cache; \
@@ -51,35 +51,26 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
 		--without-libpng-compat \
 		--without-x \
 	);
-	touch $(LIBPNG_DIR)/.configured
+	touch $@
 
 $(LIBPNG_DIR)/.compiled: $(LIBPNG_DIR)/.configured
 	$(MAKE) -C $(LIBPNG_DIR)
-	touch $(LIBPNG_DIR)/.compiled
+	touch $@
 
 $(STAGING_DIR)/lib/libpng.so: $(LIBPNG_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBPNG_DIR) install;
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libpng12.la
-	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libpng12.la
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/include/libpng12\',g" \
-		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
+		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include/libpng12\',g" \
+		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/bin/libpng12-config
-	touch -c $(STAGING_DIR)/lib/libpng.so
+	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libpng.so: $(STAGING_DIR)/lib/libpng.so
 	cp -dpf $(STAGING_DIR)/lib/libpng*.so* $(TARGET_DIR)/usr/lib/
