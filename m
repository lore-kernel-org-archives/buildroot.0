From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 18:50:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061214025059.9C7A048573@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 18:50:58 -0800 (Wed, 13 Dec 2006)
New Revision: 16916

Log:
don't error out when asm-generic is absent


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-14 00:37:57 UTC (rev 16915)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-14 02:50:58 UTC (rev 16916)
@@ -178,8 +178,10 @@
 	if [ ! -f $(STAGING_DIR)/include/linux/version.h ] ; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
-		[ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] && \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic $(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
+		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] ; then \
+			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
+				$(TOOL_BUILD_DIR)/uClibc_dev/usr/include/ ; \
+		fi; \
 	fi;
 	touch $(UCLIBC_DIR)/.configured
 
@@ -212,8 +214,10 @@
 	if [ ! -f $(STAGING_DIR)/include/linux/version.h ] ; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(STAGING_DIR)/include/ ; \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(STAGING_DIR)/include/ ; \
-		[ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] && \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic $(STAGING_DIR)/include/ ; \
+		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] ; then \
+			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
+				$(STAGING_DIR)/include/ ; \
+		fi; \
 	fi;
 	# Build the host utils.  Need to add an install target...
 	$(MAKE1) -C $(UCLIBC_DIR)/utils \
@@ -280,8 +284,10 @@
 	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ] ; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TARGET_DIR)/usr/include/ ; \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TARGET_DIR)/usr/include/ ; \
-		[ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] && \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic $(TARGET_DIR)/usr/include/ ; \
+		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] ; then \
+			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
+				$(TARGET_DIR)/usr/include/ ; \
+		fi; \
 	fi;
 	touch -c $(TARGET_DIR)/usr/lib/libc.a
 
