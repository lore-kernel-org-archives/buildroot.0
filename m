From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 03:43:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061222114306.0460B4858E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 03:43:06 -0800 (Fri, 22 Dec 2006)
New Revision: 17045

Log:
- fix building the target-compiler by passing the correct HOSTCC in.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-22 11:38:07 UTC (rev 17044)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-22 11:43:06 UTC (rev 17045)
@@ -292,9 +292,14 @@
 #############################################################
 GCC_BUILD_DIR3:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
-$(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR2)/.installed
+$(GCC_BUILD_DIR3)/.prepared: $(GCC_BUILD_DIR2)/.installed $(TARGET_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
-	(cd $(GCC_BUILD_DIR3); PATH=$(TARGET_PATH) \
+	touch $@
+
+$(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
+	(cd $(GCC_BUILD_DIR3); rm -rf config.cache ; \
+		PATH=$(TARGET_PATH) \
+		CC_FOR_BUILD="$(HOSTCC)" \
 		$(GCC_DIR)/configure \
 		--prefix=/usr \
 		--build=$(GNU_HOST_NAME) \
