From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 13:34:42 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package/strace
	package/stunnel toolchain etc...
Message-ID: <20090130133442.D304F765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 13:34:42 +0000 (Fri, 30 Jan 2009)
New Revision: 25166

Log:
toolchain: fix up GNU_TARGET_NAME link and target_utils location

The GNU_TARGET_NAME symlink and target_utils location were not correctly
adjusted to match the move of the toolchain to $(STAGING_DIR)/usr,
creating dangling symlinks.

Modified:
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/stunnel/stunnel.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2009-01-30 13:34:35 UTC (rev 25165)
+++ trunk/buildroot/package/strace/strace.mk	2009-01-30 13:34:42 UTC (rev 25166)
@@ -22,8 +22,8 @@
 	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/strace
 	rm -f $(TARGET_DIR)/usr/bin/strace-graph
 ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
+	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
 	install -c $(TARGET_DIR)/usr/bin/strace \
-		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/strace
+		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/strace
 endif
 	touch $@

Modified: trunk/buildroot/package/stunnel/stunnel.mk
===================================================================
--- trunk/buildroot/package/stunnel/stunnel.mk	2009-01-30 13:34:35 UTC (rev 25165)
+++ trunk/buildroot/package/stunnel/stunnel.mk	2009-01-30 13:34:42 UTC (rev 25166)
@@ -57,9 +57,9 @@
 	install -c $(STUNNEL_DIR)/src/stunnel $(TARGET_DIR)/usr/bin/stunnel
 	$(STRIPCMD) $(TARGET_DIR)/usr/bin/stunnel > /dev/null 2>&1
 ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
+	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
 	install -c $(TARGET_DIR)/usr/bin/stunnel \
-		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/stunnel
+		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/stunnel
 endif
 
 stunnel: uclibc $(TARGET_DIR)/usr/bin/stunnel

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-30 13:34:35 UTC (rev 25165)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-30 13:34:42 UTC (rev 25166)
@@ -319,14 +319,14 @@
 		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
 			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(STAGING_DIR)/usr/bin/cc ]; then \
-		ln -snf gcc $(STAGING_DIR)/usr/bin/cc; \
+	if [ ! -e $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
+		ln -snf gcc $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc; \
 	fi
 	# Set up the symlinks to enable lying about target name.
 	set -e; \
-	(cd $(STAGING_DIR); \
+	(cd $(STAGING_DIR)/usr; \
 		ln -snf $(REAL_GNU_TARGET_NAME) $(GNU_TARGET_NAME); \
-		cd usr/bin; \
+		cd bin; \
 		for app in $(REAL_GNU_TARGET_NAME)-*; do \
 			ln -snf $${app} \
 			$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2009-01-30 13:34:35 UTC (rev 25165)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2009-01-30 13:34:42 UTC (rev 25166)
@@ -169,9 +169,9 @@
 
 $(TARGET_DIR)/usr/bin/gdbserver: $(GDB_SERVER_DIR)/gdbserver
 ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
+	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
 	install -c $(GDB_SERVER_DIR)/gdbserver \
-		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/gdbserver
+		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/gdbserver
 endif
 	install -c -D $(GDB_SERVER_DIR)/gdbserver $(TARGET_DIR)/usr/bin/gdbserver
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-30 13:34:35 UTC (rev 25165)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-30 13:34:42 UTC (rev 25166)
@@ -548,9 +548,9 @@
 		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
 		PREFIX=$(TARGET_DIR) utils install_utils
 ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
+	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
 	install -c $(TARGET_DIR)/usr/bin/ldd \
-		$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils/ldd
+		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/ldd
 endif
 	touch -c $@
 
