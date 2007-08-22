From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 06:30:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdrm
Message-ID: <20070822133051.32E0EA4965@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 06:30:49 -0700 (Wed, 22 Aug 2007)
New Revision: 19646

Log:
- use proper include dir (Simon Pasch)
- cleanup a little while at it


Modified:
   trunk/buildroot/package/libdrm/libdrm.mk


Changeset:
Modified: trunk/buildroot/package/libdrm/libdrm.mk
===================================================================
--- trunk/buildroot/package/libdrm/libdrm.mk	2007-08-22 12:35:41 UTC (rev 19645)
+++ trunk/buildroot/package/libdrm/libdrm.mk	2007-08-22 13:30:49 UTC (rev 19646)
@@ -16,10 +16,10 @@
 
 $(LIBDRM_DIR)/.unpacked: $(DL_DIR)/$(LIBDRM_SOURCE)
 	$(LIBDRM_CAT) $(DL_DIR)/$(LIBDRM_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LIBDRM_DIR)/.unpacked
+	touch $@
 
 $(LIBDRM_DIR)/.configured: $(LIBDRM_DIR)/.unpacked
-	(cd $(LIBDRM_DIR); \
+	(cd $(LIBDRM_DIR); rm -f config.cache; \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) " \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -36,11 +36,11 @@
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 	)
-	touch $(LIBDRM_DIR)/.configured
+	touch $@
 
 $(LIBDRM_DIR)/.compiled: $(LIBDRM_DIR)/.configured
 	$(MAKE) CCexe="$(HOSTCC)" -C $(LIBDRM_DIR)
