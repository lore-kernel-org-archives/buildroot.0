From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 01:37:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbv
Message-ID: <20070801083715.75F87A493C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 01:37:14 -0700 (Wed, 01 Aug 2007)
New Revision: 19379

Log:
Cleanup fbv

Modified:
   trunk/buildroot/package/fbv/fbv.mk


Changeset:
Modified: trunk/buildroot/package/fbv/fbv.mk
===================================================================
--- trunk/buildroot/package/fbv/fbv.mk	2007-08-01 08:36:11 UTC (rev 19378)
+++ trunk/buildroot/package/fbv/fbv.mk	2007-08-01 08:37:14 UTC (rev 19379)
@@ -14,6 +14,8 @@
 $(DL_DIR)/$(FBV_SOURCE):
 	$(WGET) -P $(DL_DIR) $(FBV_SITE)/$(FBV_SOURCE)
 
+fbv-source: $(DL_DIR)/$(FBV_SOURCE)
+
 $(FBV_DIR)/.unpacked: $(DL_DIR)/$(FBV_SOURCE)
 	$(FBV_CAT) $(DL_DIR)/$(FBV_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(FBV_DIR) package/fbv/ fbv-$(FBV_VERSION)\*.patch\*
@@ -21,7 +23,7 @@
 
 $(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
 	(cd $(FBV_DIR); \
-		($(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--prefix=/usr \
@@ -31,7 +33,7 @@
 	touch $@
 
 $(FBV_DIR)/$(FBV_BINARY): $(FBV_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(FBV_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(FBV_DIR)
 
 $(TARGET_DIR)/$(FBV_TARGET_BINARY): $(FBV_DIR)/$(FBV_BINARY)
 	install -D $(FBV_DIR)/$(FBV_BINARY) $(TARGET_DIR)/$(FBV_TARGET_BINARY)
