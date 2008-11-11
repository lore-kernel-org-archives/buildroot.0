From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Tue, 11 Nov 2008 11:00:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd: 20061007
	mtd-utils mtd-utils.git
Message-ID: <20081111190033.0E0C73C9BE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-11-11 11:00:32 -0800 (Tue, 11 Nov 2008)
New Revision: 24002

Log:
Fix the mtd package with regard to external toolchain use.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/mtd/20061007/mtd.mk
   trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk
   trunk/buildroot/package/mtd/mtd-utils/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/20061007/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/20061007/mtd.mk	2008-11-11 18:35:43 UTC (rev 24001)
+++ trunk/buildroot/package/mtd/20061007/mtd.mk	2008-11-11 19:00:32 UTC (rev 24002)
@@ -90,6 +90,7 @@
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS= CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))

Modified: trunk/buildroot/package/mtd/mtd-utils/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2008-11-11 18:35:43 UTC (rev 24001)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2008-11-11 19:00:32 UTC (rev 24002)
@@ -97,6 +97,7 @@
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		BUILDDIR=$(MTD_DIR) \
 		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
 

Modified: trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk	2008-11-11 18:35:43 UTC (rev 24001)
+++ trunk/buildroot/package/mtd/mtd-utils.git/mtd.mk	2008-11-11 19:00:32 UTC (rev 24002)
@@ -109,6 +109,7 @@
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(MAKE1) OPTFLAGS="-DNEED_BCOPY -Dbcmp=memcmp -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 	       BUILDDIR=$(MTD_DIR) \
 	       CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
