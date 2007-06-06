From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Jun 2007 11:10:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltp-testsuite
Message-ID: <20070606181048.CB1754855E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-06 11:10:48 -0700 (Wed, 06 Jun 2007)
New Revision: 18756

Log:
- make sure to have the target-dir where we want to unpack ltp to


Modified:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk


Changeset:
Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-06-06 18:10:14 UTC (rev 18755)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-06-06 18:10:48 UTC (rev 18756)
@@ -28,14 +28,15 @@
 ltp-testsuite-source: $(DL_DIR)/$(LTP_TESTSUITE_SOURCE)
 
 $(LTP_TESTSUITE_DIR)/Makefile: $(DL_DIR)/$(LTP_TESTSUITE_SOURCE)
+	-mkdir -p $(LTP_TESTSUITE_ROOT)
 	$(LTP_TESTSUITE_CAT) $(DL_DIR)/$(LTP_TESTSUITE_SOURCE) | tar -C $(LTP_TESTSUITE_ROOT) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LTP_TESTSUITE_DIR) package/ltp-testsuite/ $(LTP_PATCHES)
-	touch -c $(LTP_TESTSUITE_DIR)/Makefile
+	touch -c $@
 
 $(LTP_TESTSUITE_DIR)/.compiled: $(LTP_TESTSUITE_DIR)/Makefile
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) \
 		-C $(LTP_TESTSUITE_DIR) all
-	touch $(LTP_TESTSUITE_DIR)/.compiled
+	touch $@
 
 sjh: $(LTP_TESTSUITE_DIR)/Makefile
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) \
@@ -46,7 +47,7 @@
 	echo "$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) " \
 			"-C $(LTP_TESTSUITE_DIR) install" \
 			> $(STAGING_DIR)/.fakeroot.ltp
-	touch $(LTP_TESTSUITE_DIR)/.installed
+	touch $@
 
 ltp-testsuite: uclibc host-fakeroot $(LTP_TESTSUITE_DIR)/.installed
 
