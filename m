From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:14:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/jpeg
Message-ID: <20080306181416.BD8A9120217@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:14:14 -0800 (Thu, 06 Mar 2008)
New Revision: 21202

Log:
fixed jpeg makefile

Modified:
   trunk/buildroot/package/jpeg/jpeg.mk


Changeset:
Modified: trunk/buildroot/package/jpeg/jpeg.mk
===================================================================
--- trunk/buildroot/package/jpeg/jpeg.mk	2008-03-06 18:13:45 UTC (rev 21201)
+++ trunk/buildroot/package/jpeg/jpeg.mk	2008-03-06 18:14:14 UTC (rev 21202)
@@ -49,7 +49,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -67,14 +67,15 @@
 	$(MAKE) -C $(JPEG_DIR) all
 	touch -c $@
 
-$(STAGING_DIR)/lib/libjpeg.a: $(JPEG_DIR)/.libs/libjpeg.a
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(JPEG_DIR) install-headers install-lib
-	rm $(STAGING_DIR)/lib/libjpeg.la
+$(STAGING_DIR)/usr/lib/libjpeg.a: $(JPEG_DIR)/.libs/libjpeg.a
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(JPEG_DIR) install
+	cp -f $(JPEG_DIR)/libjpeg.la $(STAGING_DIR)/usr/lib
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libjpeg.la
 	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/lib/libjpeg.a
+$(TARGET_DIR)/usr/lib/libjpeg.so: $(STAGING_DIR)/usr/lib/libjpeg.a
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libjpeg.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libjpeg.so*
 	touch -c $@
 
