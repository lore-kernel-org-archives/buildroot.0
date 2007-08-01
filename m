From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 01:35:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libungif
Message-ID: <20070801083514.45D15A493C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 01:35:13 -0700 (Wed, 01 Aug 2007)
New Revision: 19377

Log:
Cleanup libungif, use usr/lib

Modified:
   trunk/buildroot/package/libungif/libungif.mk


Changeset:
Modified: trunk/buildroot/package/libungif/libungif.mk
===================================================================
--- trunk/buildroot/package/libungif/libungif.mk	2007-08-01 08:15:44 UTC (rev 19376)
+++ trunk/buildroot/package/libungif/libungif.mk	2007-08-01 08:35:13 UTC (rev 19377)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(LIBUNGIF_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LIBUNGIF_SITE)/$(LIBUNGIF_SOURCE)
 
+libungif-source: $(DL_DIR)/$(LIBUNGIF_SOURCE)
+
 $(LIBUNGIF_DIR)/.unpacked: $(DL_DIR)/$(LIBUNGIF_SOURCE)
 	$(LIBUNGIF_CAT) $(DL_DIR)/$(LIBUNGIF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBUNGIF_DIR) package/libungif/ libungif-$(LIBUNGIF_VERSION)\*.patch\*
@@ -40,17 +42,14 @@
 
 $(LIBUNGIF_DIR)/lib/.libs/libungif.a: $(LIBUNGIF_DIR)/.configured
 	$(MAKE) -C $(LIBUNGIF_DIR)
-	touch -c $(LIBUNGIF_DIR)/lib/.libs/libungif.a
 
-$(STAGING_DIR)/lib/libungif.a: $(LIBUNGIF_DIR)/lib/.libs/libungif.a
+$(STAGING_DIR)/usr/lib/libungif.a: $(LIBUNGIF_DIR)/lib/.libs/libungif.a
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBUNGIF_DIR) install
-	rm $(STAGING_DIR)/lib/libungif.la
-	touch -c $(STAGING_DIR)/lib/libungif.a
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libungif.la
 
-$(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY): $(STAGING_DIR)/lib/libungif.a
+$(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY): $(STAGING_DIR)/usr/lib/libungif.a
 	cp -dpf $(STAGING_DIR)/$(LIBUNGIF_TARGET_BINARY)* $(TARGET_DIR)/usr/lib/
 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)*
-	touch -c $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)
 
 libungif: uclibc $(TARGET_DIR)/$(LIBUNGIF_TARGET_BINARY)
 
