From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 14 Dec 2006 00:12:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20061214081219.488FA48577@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-14 00:12:18 -0800 (Thu, 14 Dec 2006)
New Revision: 16918

Log:
- small tweaks to the gmp and mpfr -clean targets to uninstall them frmo the target.
- minor adjustments.


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2006-12-14 05:40:06 UTC (rev 16917)
+++ trunk/buildroot/package/gmp/gmp.mk	2006-12-14 08:12:18 UTC (rev 16918)
@@ -88,16 +88,17 @@
 libgmp-stage: uclibc $(STAGING_DIR)/lib/$(GMP_BINARY)
 
 libgmp-clean:
-	rm -f $(TARGET_DIR)/lib/$(GMP_BINARY)
+	rm -f $(TARGET_DIR)/lib/$(GMP_BINARY) $(TARGET_DIR)/lib/libgmp.so* \
+		$(TARGET_DIR)/usr/include/gmp.h
 	-$(MAKE) -C $(GMP_DIR) clean
 
 libgmp-dirclean:
 	rm -rf $(GMP_DIR)
 
-GMP_HOST_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
-$(GMP_HOST_DIR)/.configured: $(GMP_DIR)/.unpacked
-	[ -d $(GMP_HOST_DIR) ] || mkdir $(GMP_HOST_DIR)
-	(cd $(GMP_HOST_DIR); \
+GMP_DIR2:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
+$(GMP_DIR2)/.configured: $(GMP_DIR)/.unpacked
+	[ -d $(GMP_DIR2) ] || mkdir $(GMP_DIR2)
+	(cd $(GMP_DIR2); \
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CC="$(HOSTCC)" \
 		CFLAGS="$(HOST_CFLAGS)" \
@@ -117,13 +118,17 @@
 		--enable-shared \
 		--enable-static \
 		$(DISABLE_NLS) \
-	) && \
-	touch $(GMP_HOST_DIR)/.configured
+	);
+	touch $(GMP_DIR2)/.configured
 
-$(GMP_HOST_DIR)/.libs/$(GMP_BINARY): $(GMP_HOST_DIR)/.configured
-	$(MAKE) -C $(GMP_HOST_DIR)
+$(GMP_DIR2)/.libs/$(GMP_BINARY): $(GMP_DIR2)/.configured
+	$(MAKE) -C $(GMP_DIR2)
 
-libgmp-host: $(GMP_HOST_DIR)/.libs/$(GMP_BINARY)
+GMP_HOST_DIR:=$(TOOL_BUILD_DIR)/gmp
+$(GMP_HOST_DIR)/lib/$(GMP_BINARY): $(GMP_DIR2)/.libs/$(GMP_BINARY)
+	mkdir -p $(GMP_HOST_DIR)/lib $(GMP_HOST_DIR)/include
+	cp -a $(GMP_DIR2)/.libs/libgmp.* $(GMP_HOST_DIR)/lib
+	cp -a $(GMP_DIR2)/gmp.h $(GMP_HOST_DIR)/include
 
 #############################################################
 #

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2006-12-14 05:40:06 UTC (rev 16917)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2006-12-14 08:12:18 UTC (rev 16918)
@@ -95,16 +95,18 @@
 libmpfr-stage: uclibc $(STAGING_DIR)/lib/$(MPFR_BINARY)
 
 libmpfr-clean:
-	rm -f $(TARGET_DIR)/lib/$(MPFR_BINARY)
+	rm -f $(TARGET_DIR)/lib/$(MPFR_BINARY) $(TARGET_DIR)/lib/libmpfr.so* \
+		$(TARGET_DIR)/usr/include/mpfr.h \
+		$(TARGET_DIR)/usr/include/mpf2mpfr.h
 	-$(MAKE) -C $(MPFR_DIR) clean
 
 libmpfr-dirclean:
 	rm -rf $(MPFR_DIR)
 
-MPFR_HOST_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
-$(MPFR_HOST_DIR)/.configured: $(MPFR_DIR)/.unpacked libgmp-host
-	[ -d $(MPFR_HOST_DIR) ] || mkdir $(MPFR_HOST_DIR)
-	(cd $(MPFR_HOST_DIR); \
+MPFR_DIR2:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
+$(MPFR_DIR2)/.configured: $(MPFR_DIR)/.unpacked $(GMP_HOST_DIR)/lib/$(GMP_BINARY)
+	[ -d $(MPFR_DIR2) ] || mkdir $(MPFR_DIR2)
+	(cd $(MPFR_DIR2); \
 		CC="$(HOSTCC)" \
 		CXX="$(HOSTCXX)" \
 		$(MPFR_DIR)/configure \
@@ -122,15 +124,19 @@
 		--infodir=/usr/info \
 		--enable-shared \
 		--enable-static \
-		--with-gmp-build=$(GMP_HOST_DIR) \
+		--with-gmp-build=$(GMP_DIR2) \
 		$(DISABLE_NLS) \
-	) && \
+	);
 	touch $@
 
-$(MPFR_HOST_DIR)/.libs/$(MPFR_BINARY): $(MPFR_HOST_DIR)/.configured
-	$(MAKE) -C $(MPFR_HOST_DIR)
+$(MPFR_DIR2)/.libs/$(MPFR_BINARY): $(MPFR_DIR2)/.configured
+	$(MAKE) -C $(MPFR_DIR2)
 
-libmpfr-host: $(MPFR_HOST_DIR)/.libs/$(MPFR_BINARY)
+MPFR_HOST_DIR:=$(TOOL_BUILD_DIR)/mpfr
+$(MPFR_HOST_DIR)/lib/libmpfr.a: $(MPFR_DIR2)/.libs/$(MPFR_BINARY)
+	mkdir -p $(MPFR_HOST_DIR)/lib $(MPFR_HOST_DIR)/include
+	cp -a $(MPFR_DIR2)/.libs/libmpfr.* $(MPFR_HOST_DIR)/lib
+	cp -a $(MPFR_DIR)/mpfr.h $(MPFR_DIR)/mpf2mpfr.h $(MPFR_HOST_DIR)/include
 
 #############################################################
 #
