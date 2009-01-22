From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 22 Jan 2009 10:04:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20090122100431.C1D4B765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-22 10:04:30 +0000 (Thu, 22 Jan 2009)
New Revision: 24957

Log:
toolchain/gcc: fix target-gcc for 4.3.x

Includes are in include-fixed and GCC_LIB_SUBDIR needs to be set like for
the rest of 4.x

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-22 09:50:29 UTC (rev 24956)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-22 10:04:30 UTC (rev 24957)
@@ -484,6 +484,11 @@
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
 endif
+GCC_INCLUDE_DIR:=include
+ifeq ($(findstring 4.3,$(GCC_VERSION)),4.3)
+GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
+GCC_INCLUDE_DIR:=include-fixed
+endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
 	PATH=$(TARGET_PATH) DESTDIR=$(TARGET_DIR) \
@@ -514,10 +519,10 @@
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	# Work around problem of missing syslimits.h
-	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/include/syslimits.h ]; then \
+	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
 		echo "warning: working around missing syslimits.h"; \
-		cp -f $(STAGING_DIR)/$(GCC_LIB_SUBDIR)/include/syslimits.h \
-			$(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/include/; \
+		cp -f $(STAGING_DIR)/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
+			$(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/; \
 	fi
 	# Make sure we have 'cc'.
 	if [ ! -e $(TARGET_DIR)/usr/bin/cc ]; then \
