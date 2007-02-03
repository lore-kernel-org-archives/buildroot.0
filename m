From: andersen at uclibc.org <andersen@uclibc.org>
Date: Fri,  2 Feb 2007 16:52:40 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20070203005240.1A54948638@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-02 16:52:39 -0800 (Fri, 02 Feb 2007)
New Revision: 17730

Log:
There is no 'make uninstall' for ccache.
Attempt to manually make uninstall work....


Modified:
   trunk/buildroot/toolchain/ccache/ccache.mk


Changeset:
Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2007-02-03 00:52:17 UTC (rev 17729)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2007-02-03 00:52:39 UTC (rev 17730)
@@ -80,7 +80,27 @@
 ccache: gcc $(STAGING_DIR)/$(CCACHE_TARGET_BINARY)
 
 ccache-clean:
-	$(MAKE) -C $(CCACHE_DIR1) uninstall
+	rm -rf  $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-cc
+	rm -rf  $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-gcc
+	rm -rf  $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-cc
+	rm -rf  $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-gcc
+	[ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc ] && \
+		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/bin/
+	(cd $(STAGING_DIR)/bin; \
+		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc; \
+		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
+		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc;)
+	[ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ ] && \
+		rm -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-c++; \
+		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/bin/
+	[ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ ] && \
+		rm -f $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-g++; \
+		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/bin/
+	rm -rf  $(STAGING_DIR)/bin-ccache/*
+	(cd $(STAGING_DIR)/bin; \
+		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-c++; \
+		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++;\
+		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(REAL_GNU_TARGET_NAME)-c++);
 	-$(MAKE) -C $(CCACHE_DIR1) clean
 
 ccache-dirclean:
