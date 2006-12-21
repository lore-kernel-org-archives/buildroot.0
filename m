From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 21 Dec 2006 05:51:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libsysfs mpfr
Message-ID: <20061221135154.DD7A74859E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-21 05:51:53 -0800 (Thu, 21 Dec 2006)
New Revision: 17030

Log:
- use centralized DISABLE_LARGEFILE
- nil CXX if there isn't one


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/libsysfs/libsysfs.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2006-12-21 13:26:54 UTC (rev 17029)
+++ trunk/buildroot/package/Makefile.in	2006-12-21 13:51:53 UTC (rev 17030)
@@ -16,11 +16,6 @@
 #")
 
 
-
-
-ifneq ($(BR2_LARGEFILE),y)
-DISABLE_LARGEFILE= --disable-largefile
-endif
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 HOSTCC:=gcc
 HOSTCXX:=g++
@@ -101,4 +96,11 @@
 DISABLE_NLS:=--disable-nls
 endif
 
+ifneq ($(BR2_LARGEFILE),y)
+DISABLE_LARGEFILE= --disable-largefile
+endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),)
+TARGET_CONFIGURE_OPTS+=CXX=""
+endif
+

Modified: trunk/buildroot/package/libsysfs/libsysfs.mk
===================================================================
--- trunk/buildroot/package/libsysfs/libsysfs.mk	2006-12-21 13:26:54 UTC (rev 17029)
+++ trunk/buildroot/package/libsysfs/libsysfs.mk	2006-12-21 13:51:53 UTC (rev 17030)
@@ -36,14 +36,10 @@
 	$(LIBSYSFS_CAT) $(DL_DIR)/$(LIBSYSFS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	touch $(LIBSYSFS_DIR)/.unpacked
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),)
-LIBSYSFS_CXX:=CXX=""
-endif
 $(LIBSYSFS_DIR)/.configured: $(LIBSYSFS_DIR)/.unpacked
 	(cd $(LIBSYSFS_DIR); \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) " \
-	$(LIBSYSFS_CXX) \
 	./configure \
 	--target=$(GNU_TARGET_NAME) \
 	--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-12-21 13:26:54 UTC (rev 17029)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-12-21 13:51:53 UTC (rev 17030)
@@ -34,15 +34,11 @@
 endif
 	touch $(MPFR_DIR)/.unpacked
 
-ifeq ($(BR2_INSTALL_LIBSTDCPP),)
-MPFR_CXX:=CXX=""
-endif
 $(MPFR_DIR)/.configured: $(MPFR_DIR)/.unpacked $(STAGING_DIR)/lib/$(GMP_BINARY)
 	(cd $(MPFR_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(MPFR_BE) \
-		$(MPFR_CXX) \
 		./configure \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
