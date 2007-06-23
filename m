From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 23 Jun 2007 06:49:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20070623134934.6B3D4485CC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-23 06:49:33 -0700 (Sat, 23 Jun 2007)
New Revision: 18900

Log:
- "Keep the actual toolchain binaries in a directory at the same level".


Modified:
   trunk/buildroot/toolchain/ccache/ccache.mk


Changeset:
Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2007-06-23 13:43:39 UTC (rev 18899)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2007-06-23 13:49:33 UTC (rev 18900)
@@ -17,18 +17,18 @@
 
 $(CCACHE_DIR1)/.unpacked: $(DL_DIR)/$(CCACHE_SOURCE)
 	$(CCACHE_CAT) $(DL_DIR)/$(CCACHE_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(CCACHE_DIR1)/.unpacked
+	touch $@
 
 $(CCACHE_DIR1)/.patched: $(CCACHE_DIR1)/.unpacked
 	# WARNING - this will break if the toolchain is moved.
 	# Should probably patch things to use a relative path.
-	$(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/bin-ccache\",g" \
+	$(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/usr/bin-ccache\",g" \
 		$(CCACHE_DIR1)/execute.c
 	# WARNING - this will break if the toolchain build dir is deleted.
 	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(CCACHE_DIR1)/cache\",g" \
 		$(CCACHE_DIR1)/ccache.c
 	mkdir -p $(CCACHE_DIR1)/cache
-	touch $(CCACHE_DIR1)/.patched
+	touch $@
 
 $(CCACHE_DIR1)/.configured: $(CCACHE_DIR1)/.patched
 	mkdir -p $(CCACHE_DIR1)
@@ -40,7 +40,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 	);
-	touch $(CCACHE_DIR1)/.configured
+	touch $@
 
 $(CCACHE_DIR1)/$(CCACHE_BINARY): $(CCACHE_DIR1)/.configured
 	$(MAKE) CC="$(HOSTCC)" -C $(CCACHE_DIR1)
@@ -50,13 +50,13 @@
 	cp $(CCACHE_DIR1)/ccache $(STAGING_DIR)/usr/bin
 	# Keep the actual toolchain binaries in a directory at the same level.
 	# Otherwise, relative paths for include dirs break.
-	mkdir -p $(STAGING_DIR)/bin-ccache;
-	(cd $(STAGING_DIR)/bin-ccache; \
+	mkdir -p $(STAGING_DIR)/usr/bin-ccache;
+	(cd $(STAGING_DIR)/usr/bin-ccache; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc);
 	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/bin-ccache/
+		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/bin-ccache/
 	(cd $(STAGING_DIR)/usr/bin; \
 		ln -fs ccache $(GNU_TARGET_NAME)-cc; \
 		ln -fs ccache $(GNU_TARGET_NAME)-gcc; \
@@ -64,15 +64,15 @@
 		ln -fs ccache $(REAL_GNU_TARGET_NAME)-gcc);
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/bin-ccache/
+		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/usr/bin-ccache/
 	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++ ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/bin-ccache/
+		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/usr/bin-ccache/
 	(cd $(STAGING_DIR)/usr/bin; \
 		ln -fs ccache $(GNU_TARGET_NAME)-c++; \
 		ln -fs ccache $(GNU_TARGET_NAME)-g++;\
 		ln -fs ccache $(REAL_GNU_TARGET_NAME)-c++; \
 		ln -fs ccache $(REAL_GNU_TARGET_NAME)-g++);
-	(cd $(STAGING_DIR)/bin-ccache; \
+	(cd $(STAGING_DIR)/usr/bin-ccache; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-c++ $(GNU_TARGET_NAME)-c++; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++);
 endif
@@ -84,22 +84,22 @@
 	rm -rf  $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
 	rm -rf  $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc
 	rm -rf  $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
-	if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc ] ; then \
-		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/bin/; \
+	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc ] ; then \
+		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/usr/bin/; \
 		(cd $(STAGING_DIR)/usr/bin; \
 		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc; \
 		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
 		    ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc); \
 	fi;
-	if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ ] ; then \
+	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ ] ; then \
 		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++; \
-		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/usr/bin/; \
+		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ $(STAGING_DIR)/usr/bin/; \
 	fi;
-	if [ -f $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ ] ; then \
+	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ ] ; then \
 		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++; \
-		mv $(STAGING_DIR)/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/usr/bin/; \
+		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++  $(STAGING_DIR)/usr/bin/; \
 	fi;
-	rm -rf  $(STAGING_DIR)/bin-ccache/*
+	rm -rf  $(STAGING_DIR)/usr/bin-ccache/*
 	(cd $(STAGING_DIR)/usr/bin; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-c++; \
 		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++;\
@@ -120,10 +120,10 @@
 
 $(CCACHE_DIR2)/.unpacked: $(DL_DIR)/$(CCACHE_SOURCE)
 	$(CCACHE_CAT) $(DL_DIR)/$(CCACHE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(CCACHE_DIR2)/.unpacked
+	touch $@
 
 $(CCACHE_DIR2)/.patched: $(CCACHE_DIR2)/.unpacked
-	touch $(CCACHE_DIR2)/.patched
+	touch $@
 
 $(CCACHE_DIR2)/.configured: $(CCACHE_DIR2)/.patched
 	mkdir -p $(CCACHE_DIR2)
@@ -145,7 +145,7 @@
 		--infodir=/usr/info \
 		$(DISABLE_NLS) \
 	);
-	touch $(CCACHE_DIR2)/.configured
+	touch $@
 
 $(CCACHE_DIR2)/$(CCACHE_BINARY): $(CCACHE_DIR2)/.configured
 	$(MAKE) -C $(CCACHE_DIR2) CFLAGS="$(TARGET_CFLAGS)"
