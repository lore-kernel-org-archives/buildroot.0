From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Apr 2009 09:21:22 +0000 (UTC)
Subject: [Buildroot] svn commit: [25974] trunk/buildroot
Message-ID: <20090406092122.E795577182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-06 09:21:22 +0000 (Mon, 06 Apr 2009)
New Revision: 25974

Log:
Makefile: target-devfiles: combine .a / .la find invocation

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-04-06 08:15:49 UTC (rev 25973)
+++ trunk/buildroot/Makefile	2009-04-06 09:21:22 UTC (rev 25974)
@@ -331,7 +331,7 @@
 		touch $(STAGING_DIR)/.fakeroot.00000; \
 	fi
 	-find $(TARGET_DIR) -type d -name CVS -o -name .svn | xargs rm -rf
-	-find $(TARGET_DIR) -type f -name .empty | xargs rm -rf	
+	-find $(TARGET_DIR) -type f -name .empty | xargs rm -rf
 	touch $@
 
 $(TARGET_DIR): $(PROJECT_BUILD_DIR)/.root
@@ -344,10 +344,8 @@
 	( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig
-	find $(TARGET_DIR)/usr/lib -name '*.a' -delete
-	find $(TARGET_DIR)/lib -name '*.a' -delete
-	find $(TARGET_DIR)/usr/lib -name '*.la' -delete
-	find $(TARGET_DIR)/lib -name '*.la' -delete
+	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -delete
+	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -delete
 endif
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
