From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 05:20:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbv
Message-ID: <20070723122000.87D12A687C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 05:19:59 -0700 (Mon, 23 Jul 2007)
New Revision: 19225

Log:
cleanup fbv package

Modified:
   trunk/buildroot/package/fbv/fbv.mk


Changeset:
Modified: trunk/buildroot/package/fbv/fbv.mk
===================================================================
--- trunk/buildroot/package/fbv/fbv.mk	2007-07-23 12:03:24 UTC (rev 19224)
+++ trunk/buildroot/package/fbv/fbv.mk	2007-07-23 12:19:59 UTC (rev 19225)
@@ -3,10 +3,10 @@
 # fbv
 #
 #############################################################
-FBV_VER:=1.0b
-FBV_SOURCE:=fbv-$(FBV_VER).tar.gz
+FBV_VERSION:=1.0b
+FBV_SOURCE:=fbv-$(FBV_VERSION).tar.gz
 FBV_SITE:=http://s-tech.elsat.net.pl/fbv
-FBV_DIR:=$(BUILD_DIR)/fbv-$(FBV_VER)
+FBV_DIR:=$(BUILD_DIR)/fbv-$(FBV_VERSION)
 FBV_CAT:=$(ZCAT)
 FBV_BINARY:=fbv
 FBV_TARGET_BINARY:=usr/bin/$(FBV_BINARY)
@@ -16,19 +16,19 @@
 
 $(FBV_DIR)/.unpacked: $(DL_DIR)/$(FBV_SOURCE)
 	$(FBV_CAT) $(DL_DIR)/$(FBV_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(FBV_DIR) package/fbv/ fbv-$(FBV_VER)\*.patch\*
-	@touch $@
+	toolchain/patch-kernel.sh $(FBV_DIR) package/fbv/ fbv-$(FBV_VERSION)\*.patch\*
+	touch $@
 
 $(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
 	(cd $(FBV_DIR); \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
+		($(TARGET_CONFIGURE_OPTS) \
+		($(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--prefix=/usr \
 		--cc=$(TARGET_CC) \
 		--libs="-lz -lm" \
 	);
-	@touch $@
+	touch $@
 
 $(FBV_DIR)/$(FBV_BINARY): $(FBV_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(FBV_DIR)
