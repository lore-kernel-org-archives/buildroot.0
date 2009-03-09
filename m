From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Mar 2009 09:53:42 +0000 (UTC)
Subject: [Buildroot] svn commit: [25583] trunk/buildroot/package/e2fsprogs
Message-ID: <20090309095342.27793764AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-09 09:53:41 +0000 (Mon, 09 Mar 2009)
New Revision: 25583

Log:
e2fsprogs: install into staging so other stuff can find the libs/includes

And explicitly install the libuuid headers. Needed for the gupnp stuff in #35.

Modified:
   trunk/buildroot/package/e2fsprogs/e2fsprogs.mk


Changeset:
Modified: trunk/buildroot/package/e2fsprogs/e2fsprogs.mk
===================================================================
--- trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2009-03-09 09:53:37 UTC (rev 25582)
+++ trunk/buildroot/package/e2fsprogs/e2fsprogs.mk	2009-03-09 09:53:41 UTC (rev 25583)
@@ -41,7 +41,7 @@
 		--exec-prefix=/usr \
 		--bindir=/bin \
 		--sbindir=/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
@@ -69,6 +69,12 @@
 	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
 	touch -c $@
 
+$(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
+	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
+		-C $(E2FSPROGS_DIR) install
+	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(STAGING_DIR) LDCONFIG=true \
+		-C $(E2FSPROGS_DIR)/lib/uuid install
+
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BADBLOCKS) += ${TARGET_DIR}/sbin/badblocks
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_BLKID) += ${TARGET_DIR}/sbin/blkid
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_CHATTR) += ${TARGET_DIR}/bin/chattr
@@ -83,7 +89,7 @@
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_MKLOSTFOUND) += ${TARGET_DIR}/sbin/mklost+found
 E2FSPROGS_RM$(BR2_PACKAGE_E2FSPROGS_UUIDGEN) += ${TARGET_DIR}/bin/uuidgen
 
-$(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(E2FSPROGS_DIR)/$(E2FSPROGS_BINARY)
+$(TARGET_DIR)/$(E2FSPROGS_TARGET_BINARY): $(STAGING_DIR)/$(E2FSPROGS_TARGET_BINARY)
 	$(MAKE1) PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) LDCONFIG=true \
 		-C $(E2FSPROGS_DIR) install
 	rm -rf ${TARGET_DIR}/sbin/mkfs.ext[234] \
