From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 15 Nov 2007 02:16:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20071115101656.9ADB5A688A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-15 02:16:55 -0800 (Thu, 15 Nov 2007)
New Revision: 20427

Log:
install ldconfig stuff only if it was built, fix for systems without shared libraries support (nios2)

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-11-15 09:02:12 UTC (rev 20426)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-11-15 10:16:55 UTC (rev 20427)
@@ -450,11 +450,15 @@
 		PREFIX=$(STAGING_DIR) \
 		HOSTCC="$(HOSTCC)" \
 		hostutils
-	install -c $(UCLIBC_DIR)/utils/ldd.host $(STAGING_DIR)/usr/bin/ldd
-	ln -sf ldd $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldd
-	install -c $(UCLIBC_DIR)/utils/ldconfig.host $(STAGING_DIR)/usr/bin/ldconfig
-	ln -sf ldconfig $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldconfig
-	ln -sf ldconfig $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
+	if [ -f $(UCLIBC_DIR)/utils/ldd.host ]; then \
+		install -c $(UCLIBC_DIR)/utils/ldd.host $(STAGING_DIR)/usr/bin/ldd; \
+		ln -sf ldd $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldd; \
+	fi
+	if [ -f $(UCLIBC_DIR)/utils/ldconfig.host ]; then \
+		install -c $(UCLIBC_DIR)/utils/ldconfig.host $(STAGING_DIR)/usr/bin/ldconfig; \
+		ln -sf ldconfig $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldconfig; \
+		ln -sf ldconfig $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
+	fi
 	touch -c $@
 
 ifneq ($(TARGET_DIR),)
