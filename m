From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 16 Jul 2007 00:55:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/customize
Message-ID: <20070716075551.44315A65BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-16 00:55:50 -0700 (Mon, 16 Jul 2007)
New Revision: 19105

Log:
Get rid of repeated copy of 'customize'

Modified:
   trunk/buildroot/package/customize/customize.mk


Changeset:
Modified: trunk/buildroot/package/customize/customize.mk
===================================================================
--- trunk/buildroot/package/customize/customize.mk	2007-07-15 23:35:31 UTC (rev 19104)
+++ trunk/buildroot/package/customize/customize.mk	2007-07-16 07:55:50 UTC (rev 19105)
@@ -5,8 +5,23 @@
 #############################################################
 CUST_DIR:=package/customize/source
 
-customize:
-	-cp -af $(CUST_DIR)/* $(TARGET_DIR)/
+$(BUILD_DIR)/.customize:
+	rm -f $(PROJECT_BUILD_DIR)/series
+	(cd $(CUST_DIR) ; \
+	 /bin/ls -d * > $(PROJECT_BUILD_DIR)/series || \
+	 touch $(PROJECT_BUILD_DIR)/series )
+	for f in `cat $(PROJECT_BUILD_DIR)/series` ; do 	\
+		cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f ;	\
+	done
+	rm -f $(PROJECT_BUILD_DIR)/series
+	touch $@
+
+customize: $(BUILD_DIR)/.customize
+
+customize-clean:
+	rm -f $(BUILD_DIR)/.customize
+
+.PHONY:	customize
 #############################################################
 #
 # Toplevel Makefile options
