From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Nov 2006 08:54:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20061128165431.BDDA048571@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-28 08:54:30 -0800 (Tue, 28 Nov 2006)
New Revision: 16706

Log:
- add "lib" prefix


Modified:
   trunk/buildroot/package/gmp/Config.in
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/Config.in
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/Config.in
===================================================================
--- trunk/buildroot/package/gmp/Config.in	2006-11-28 13:16:02 UTC (rev 16705)
+++ trunk/buildroot/package/gmp/Config.in	2006-11-28 16:54:30 UTC (rev 16706)
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_GMP
+config BR2_PACKAGE_LIBGMP
 	bool "gmp"
 	default n
 	help
@@ -7,10 +7,10 @@
 	  http://www.swox.com/gmp/
 
 
-config BR2_PACKAGE_GMP_HEADERS
+config BR2_PACKAGE_LIBGMP_HEADERS
 	bool "gmp headers for target"
 	default n
-	depends on BR2_PACKAGE_GMP
+	depends on BR2_PACKAGE_LIBGMP
 	help
 	  Install the gmp.h for the target.
 

Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2006-11-28 13:16:02 UTC (rev 16705)
+++ trunk/buildroot/package/gmp/gmp.mk	2006-11-28 16:54:30 UTC (rev 16706)
@@ -20,7 +20,7 @@
 $(DL_DIR)/$(GMP_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GMP_SITE)/$(GMP_SOURCE)
 
-gmp-source: $(DL_DIR)/$(GMP_SOURCE)
+libgmp-source: $(DL_DIR)/$(GMP_SOURCE)
 
 $(GMP_DIR)/.unpacked: $(DL_DIR)/$(GMP_SOURCE)
 	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
@@ -75,20 +75,20 @@
 $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION): $(STAGING_DIR)/lib/$(GMP_BINARY)
 	cp -a $(STAGING_DIR)/lib/libgmp.so* $(STAGING_DIR)/lib/libgmp.a \
 		 $(TARGET_DIR)/lib/
-ifeq ($(BR2_PACKAGE_GMP_HEADERS),y)
+ifeq ($(BR2_PACKAGE_LIBGMP_HEADERS),y)
 	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
 	cp -a $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/usr/include/
 endif
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmp.so* \
 		$(TARGET_DIR)/lib/libgmp.a
 
-gmp: uclibc $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION)
+libgmp: uclibc $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION)
 
-gmp-clean:
+libgmp-clean:
 	rm -f $(TARGET_DIR)/lib/$(GMP_BINARY)
 	-$(MAKE) -C $(GMP_DIR) clean
 
-gmp-dirclean:
+libgmp-dirclean:
 	rm -rf $(GMP_DIR)
 
 #############################################################
@@ -96,6 +96,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_GMP)),y)
-TARGETS+=gmp
+ifeq ($(strip $(BR2_PACKAGE_LIBGMP)),y)
+TARGETS+=libgmp
 endif

Modified: trunk/buildroot/package/mpfr/Config.in
===================================================================
--- trunk/buildroot/package/mpfr/Config.in	2006-11-28 13:16:02 UTC (rev 16705)
+++ trunk/buildroot/package/mpfr/Config.in	2006-11-28 16:54:30 UTC (rev 16706)
@@ -1,8 +1,8 @@
-config BR2_PACKAGE_MPFR
+config BR2_PACKAGE_LIBMPFR
 	bool "mpfr"
 	default n
 	default y if BR2_INSTALL_FORTRAN
-	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_LIBGMP
 	help
 	  C library for multiple-precision floating-point computations
 	  with exact rounding.
@@ -10,11 +10,11 @@
 	  http://www.mpfr.org/
 
 
-config BR2_PACKAGE_MPFR_HEADERS
+config BR2_PACKAGE_LIBMPFR_HEADERS
 	bool "mpfr headers for target"
 	default n
-	depends on BR2_PACKAGE_MPFR
-	select BR2_PACKAGE_GMP_HEADERS
+	depends on BR2_PACKAGE_LIBMPFR
+	select BR2_PACKAGE_LIBGMP_HEADERS
 	help
 	  Install the mpfr headers for the target.
 

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-11-28 13:16:02 UTC (rev 16705)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-11-28 16:54:30 UTC (rev 16706)
@@ -22,7 +22,7 @@
 	 $(WGET) -P $(DL_DIR) $(MPFR_SITE)/$(MPFR_SOURCE)
 
 
-mpfr-source: $(DL_DIR)/$(MPFR_SOURCE)
+libmpfr-source: $(DL_DIR)/$(MPFR_SOURCE)
 
 $(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE)
 	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
@@ -81,20 +81,20 @@
 $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION): $(STAGING_DIR)/lib/$(MPFR_BINARY)
 	cp -a $(STAGING_DIR)/lib/libmpfr.so* $(STAGING_DIR)/lib/libmpfr.a \
 		$(TARGET_DIR)/lib/
-ifeq ($(BR2_PACKAGE_MPFR_HEADERS),y)
+ifeq ($(BR2_PACKAGE_LIBMPFR_HEADERS),y)
 	cp -a $(STAGING_DIR)/include/mpfr.h $(STAGING_DIR)/include/mpf2mpfr.h \
 		$(TARGET_DIR)/usr/include/
 endif
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libmpfr.so* \
 		$(TARGET_DIR)/lib/libmpfr.a
 
-mpfr: uclibc $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION)
+libmpfr: uclibc libgmp $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION)
 
-mpfr-clean:
+libmpfr-clean:
 	rm -f $(TARGET_DIR)/lib/$(MPFR_BINARY)
 	-$(MAKE) -C $(MPFR_DIR) clean
 
-mpfr-dirclean:
+libmpfr-dirclean:
 	rm -rf $(MPFR_DIR)
 
 #############################################################
@@ -102,6 +102,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_MPFR)),y)
-TARGETS+=mpfr
+ifeq ($(strip $(BR2_PACKAGE_LIBMPFR)),y)
+TARGETS+=libmpfr
 endif
