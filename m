From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:15:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdrm
Message-ID: <20080306181506.845C4120207@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:15:06 -0800 (Thu, 06 Mar 2008)
New Revision: 21204

Log:
fixed libdrm makefile

Modified:
   trunk/buildroot/package/libdrm/libdrm.mk


Changeset:
Modified: trunk/buildroot/package/libdrm/libdrm.mk
===================================================================
--- trunk/buildroot/package/libdrm/libdrm.mk	2008-03-06 18:14:37 UTC (rev 21203)
+++ trunk/buildroot/package/libdrm/libdrm.mk	2008-03-06 18:15:06 UTC (rev 21204)
@@ -32,7 +32,7 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -47,21 +47,21 @@
 	$(MAKE) CCexe="$(HOSTCC)" -C $(LIBDRM_DIR)
 	touch $(LIBDRM_DIR)/.compiled
 
-$(STAGING_DIR)/lib/libdrm.so: $(LIBDRM_DIR)/.compiled
+$(STAGING_DIR)/usr/lib/libdrm.so: $(LIBDRM_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBDRM_DIR) install
-	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" $(STAGING_DIR)/lib/libdrm.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libdrm.la
 	#$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
 	# -e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
-	# -e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/include\',g" \
-	# -e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
+	# -e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/usr/include\',g" \
+	# -e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 	# $(STAGING_DIR)/usr/bin/libdrm-config
-	touch -c $(STAGING_DIR)/lib/libdrm.so
+	touch -c $(STAGING_DIR)/usr/lib/libdrm.so
 
-$(TARGET_DIR)/lib/libdrm.so: $(STAGING_DIR)/lib/libdrm.so
-	cp -dpf $(STAGING_DIR)/lib/libdrm.so* $(TARGET_DIR)/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libdrm.so
+$(TARGET_DIR)/usr/lib/libdrm.so: $(STAGING_DIR)/usr/lib/libdrm.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libdrm.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libdrm.so
 
-libdrm: uclibc pkgconfig $(TARGET_DIR)/lib/libdrm.so
+libdrm: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libdrm.so
 
 libdrm-clean:
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(LIBDRM_DIR) uninstall
