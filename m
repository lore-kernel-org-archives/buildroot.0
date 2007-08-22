From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 08:18:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/e2fsprogs
Message-ID: <20070822151803.7ACBDA4656@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 08:18:02 -0700 (Wed, 22 Aug 2007)
New Revision: 19647

Log:
- was broken by the patch omitting the CFLAGS for configure
- misc cleanup while at it


Modified:
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk


Changeset:
Modified: trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2007-08-22 13:30:49 UTC (rev 19646)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2007-08-22 15:18:02 UTC (rev 19647)
@@ -30,6 +30,7 @@
 	(cd $(E2FSPROGS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -54,16 +55,19 @@
 		--without-catgets $(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	)
+	# do away with hiding the commands
+	find $(E2FSPROGS_DIR) -name Makefile \
+		| xargs $(SED) '/^[[:space:]]*@/s/@/$$\(Q\)/'
 	touch $@
 
 $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY): $(E2FSPROGS_DIR)/.configured
-	$(MAKE1) PATH=$(TARGET_PATH) -C $(E2FSPROGS_DIR)
+	$(MAKE1) -C $(E2FSPROGS_DIR)
 	( \
 		cd $(E2FSPROGS_DIR)/misc; \
 		$(STRIP) $(E2FSPROGS_MISC_STRIP); \
 	)
-	$(STRIP) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
-	touch -c $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
+	#$(STRIP) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
+	touch -c $@
 
 $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) -C $(E2FSPROGS_DIR) install
@@ -77,7 +81,7 @@
 	ln -sf e2label ${TARGET_DIR}/sbin/findfs
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-	touch -c $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
+	touch -c $@
 
 e2fsprogs: uclibc $(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY)
 
