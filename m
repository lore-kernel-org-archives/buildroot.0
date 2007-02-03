From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sat,  3 Feb 2007 13:07:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20070203210743.8820B48634@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-03 13:07:43 -0800 (Sat, 03 Feb 2007)
New Revision: 17745

Log:
patch from rick68:
make certain uninstall works more than once.


Modified:
   trunk/buildroot/toolchain/ccache/ccache.mk


Changeset:
Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2007-02-03 21:05:53 UTC (rev 17744)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2007-02-03 21:07:43 UTC (rev 17745)
@@ -84,18 +84,21 @@
 	rm -rf  $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-gcc
 	rm -rf  $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-cc
 	rm -rf  $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-gcc
-	[ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc ] && \
-		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/bin/
-	(cd $(STAGING_DIR)/bin; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc;)
-	[ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ ] && \
+	if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc ] ; then \
+		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/bin/; \
+		(cd $(STAGING_DIR)/bin; \
+		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc; \
+		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
+		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc); \
+	fi;
+	if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ ] ; then \
 		rm -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-c++; \
-		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/bin/
-	[ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ ] && \
+		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/bin/; \
+	fi;
+	if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ ] ; then \
 		rm -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-g++; \
-		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/bin/
+		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/bin/; \
+	fi;
 	rm -rf  $(STAGING_DIR)/bin-ccache/*
 	(cd $(STAGING_DIR)/bin; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-c++; \
