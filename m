From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu,  4 Dec 2008 08:43:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20081204164354.DA97D3C8B6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-04 08:43:54 -0800 (Thu, 04 Dec 2008)
New Revision: 24273

Log:
tslib: use more robust $@ when touching target instead of explisit name



Modified:
   trunk/buildroot/package/tslib/tslib.mk


Changeset:
Modified: trunk/buildroot/package/tslib/tslib.mk
===================================================================
--- trunk/buildroot/package/tslib/tslib.mk	2008-12-04 16:13:08 UTC (rev 24272)
+++ trunk/buildroot/package/tslib/tslib.mk	2008-12-04 16:43:54 UTC (rev 24273)
@@ -17,7 +17,7 @@
 $(TSLIB_DIR)/.patched: $(DL_DIR)/$(TSLIB_SOURCE)
 	$(TSLIB_CAT) $(DL_DIR)/$(TSLIB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(TSLIB_DIR) package/tslib/ tslib\*.patch
-	touch $(TSLIB_DIR)/.patched
+	touch $@
 
 $(TSLIB_DIR)/.configured: $(TSLIB_DIR)/.patched
 	(cd $(TSLIB_DIR); rm -rf config.cache; ./autogen.sh)
@@ -47,11 +47,11 @@
 	--enable-input \
 	)
 	$(SED) 's:rpl\_malloc:malloc:g' $(TSLIB_DIR)/config.h
-	touch $(TSLIB_DIR)/.configured
+	touch $@
 
 $(TSLIB_DIR)/.compiled: $(TSLIB_DIR)/.configured
 	$(MAKE) -C $(TSLIB_DIR)
-	touch $(TSLIB_DIR)/.compiled
+	touch $@
 
 $(STAGING_DIR)/usr/lib/libts.so: $(TSLIB_DIR)/.compiled
 	$(MAKE) -C $(TSLIB_DIR) \
