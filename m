From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 16 Jan 2007 05:26:33 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: gmp mpfr
Message-ID: <20070116132633.9CA934859B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-16 05:26:32 -0800 (Tue, 16 Jan 2007)
New Revision: 17326

Log:
- provide host-libgmp and host-libmpfr


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-01-16 13:24:47 UTC (rev 17325)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-01-16 13:26:32 UTC (rev 17326)
@@ -7,7 +7,8 @@
 GMP_SOURCE:=gmp-$(GMP_VERSION).tar.bz2
 GMP_SITE:=http://ftp.sunet.se/pub/gnu/gmp/
 GMP_CAT:=$(BZCAT)
-GMP_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
+GMP_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
+GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_BINARY:=libgmp.a
 GMP_LIBVERSION:=3.4.1
 
@@ -23,13 +24,14 @@
 libgmp-source: $(DL_DIR)/$(GMP_SOURCE)
 
 $(GMP_DIR)/.unpacked: $(DL_DIR)/$(GMP_SOURCE)
-	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GMP_DIR) package/gmp/ \*.patch
 	$(CONFIG_UPDATE) $(GMP_DIR)
 	touch $(GMP_DIR)/.unpacked
 
-$(GMP_DIR)/.configured: $(GMP_DIR)/.unpacked
-	(cd $(GMP_DIR); rm -rf config.cache; \
+$(GMP_TARGET_DIR)/.configured: $(GMP_DIR)/.unpacked
+	mkdir -p $(GMP_TARGET_DIR)
+	(cd $(GMP_TARGET_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(GMP_BE) \
@@ -52,12 +54,12 @@
 		--enable-shared \
 		$(DISABLE_NLS) \
 	);
-	touch $(GMP_DIR)/.configured
+	touch $(GMP_TARGET_DIR)/.configured
 
-$(GMP_DIR)/.libs/$(GMP_BINARY): $(GMP_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(GMP_DIR)
+$(GMP_TARGET_DIR)/.libs/$(GMP_BINARY): $(GMP_TARGET_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(GMP_TARGET_DIR)
 
-$(STAGING_DIR)/lib/$(GMP_BINARY): $(GMP_DIR)/.libs/$(GMP_BINARY)
+$(STAGING_DIR)/lib/$(GMP_BINARY): $(GMP_TARGET_DIR)/.libs/$(GMP_BINARY)
 	$(MAKE) prefix=$(STAGING_DIR) \
 	    exec_prefix=$(STAGING_DIR) \
 	    bindir=$(STAGING_DIR)/bin \
@@ -72,7 +74,7 @@
 	    oldincludedir=$(STAGING_DIR)/include \
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \
-            -C $(GMP_DIR) install
+            -C $(GMP_TARGET_DIR) install
 
 $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION): $(STAGING_DIR)/lib/$(GMP_BINARY)
 	cp -a $(STAGING_DIR)/lib/libgmp.so* $(STAGING_DIR)/lib/libgmp.a \
@@ -90,48 +92,38 @@
 libgmp-clean:
 	rm -f $(TARGET_DIR)/lib/$(GMP_BINARY) $(TARGET_DIR)/lib/libgmp.so* \
 		$(TARGET_DIR)/usr/include/gmp.h
-	-$(MAKE) -C $(GMP_DIR) clean
+	-$(MAKE) -C $(GMP_TARGET_DIR) clean
 
 libgmp-dirclean:
-	rm -rf $(GMP_DIR)
+	rm -rf $(GMP_TARGET_DIR) $(GMP_DIR)
 
-GMP_DIR2:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
+GMP_DIR2:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)-host
+GMP_HOST_DIR:=$(TOOL_BUILD_DIR)/gmp
 $(GMP_DIR2)/.configured: $(GMP_DIR)/.unpacked
-	[ -d $(GMP_DIR2) ] || mkdir $(GMP_DIR2)
+	mkdir -p $(GMP_DIR2)
 	(cd $(GMP_DIR2); \
 		CC_FOR_BUILD="$(HOSTCC)" \
 		CC="$(HOSTCC)" \
 		CFLAGS="$(HOST_CFLAGS)" \
 		$(GMP_DIR)/configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
+		--prefix="$(GMP_HOST_DIR)" \
 		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--host=$(GNU_HOST_NAME) \
 		--enable-shared \
 		--enable-static \
 		$(DISABLE_NLS) \
 	);
 	touch $(GMP_DIR2)/.configured
 
-$(GMP_DIR2)/.libs/$(GMP_BINARY): $(GMP_DIR2)/.configured
-	$(MAKE) -C $(GMP_DIR2)
+$(GMP_HOST_DIR)/lib/$(GMP_BINARY): $(GMP_DIR2)/.configured
+	$(MAKE) -C $(GMP_DIR2) install
 
-GMP_HOST_DIR:=$(TOOL_BUILD_DIR)/gmp
-$(GMP_HOST_DIR)/lib/$(GMP_BINARY): $(GMP_DIR2)/.libs/$(GMP_BINARY)
-	mkdir -p $(GMP_HOST_DIR)/lib $(GMP_HOST_DIR)/include
-	cp -a $(GMP_DIR2)/.libs/libgmp.* $(GMP_HOST_DIR)/lib
-	cp -a $(GMP_DIR2)/gmp.h $(GMP_HOST_DIR)/include
+host-libgmp: $(GMP_HOST_DIR)/lib/$(GMP_BINARY)
+host-libgmp-clean:
+	rm -rf $(GMP_HOST_DIR)
+	-$(MAKE) -C $(GMP_DIR2) clean
+host-libgmp-dirclean:
+	rm -rf $(GMP_HOST_DIR) $(GMP_DIR2)
 
 #############################################################
 #

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-01-16 13:24:47 UTC (rev 17325)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-01-16 13:26:32 UTC (rev 17326)
@@ -8,7 +8,7 @@
 MPFR_SOURCE:=mpfr-$(MPFR_VERSION).tar.bz2
 MPFR_CAT:=$(BZCAT)
 MPFR_SITE:=http://www.mpfr.org/mpfr-current/
-MPFR_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
+MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr.a
 MPFR_LIBVERSION:=1.0.1
 
@@ -25,7 +25,7 @@
 libmpfr-source: $(DL_DIR)/$(MPFR_SOURCE)
 
 $(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE)
-	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
 	$(CONFIG_UPDATE) $(MPFR_DIR)
 ifneq ($(MPFR_PATCH),)
@@ -34,8 +34,9 @@
 endif
 	touch $(MPFR_DIR)/.unpacked
 
-$(MPFR_DIR)/.configured: $(MPFR_DIR)/.unpacked $(STAGING_DIR)/lib/$(GMP_BINARY)
-	(cd $(MPFR_DIR); rm -rf config.cache; \
+MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
+$(MPFR_TARGET_DIR)/.configured: $(MPFR_DIR)/.unpacked $(STAGING_DIR)/lib/$(GMP_BINARY)
+	(cd $(MPFR_TARGET_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_c_bigendian=$(MPFR_BE) \
@@ -61,10 +62,10 @@
 	);
 	touch $@
 
-$(MPFR_DIR)/.libs/$(MPFR_BINARY): $(MPFR_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(MPFR_DIR)
+$(MPFR_TARGET_DIR)/.libs/$(MPFR_BINARY): $(MPFR_TARGET_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(MPFR_TARGET_DIR)
 
-$(STAGING_DIR)/lib/$(MPFR_BINARY): $(MPFR_DIR)/.libs/$(MPFR_BINARY)
+$(STAGING_DIR)/lib/$(MPFR_BINARY): $(MPFR_TARGET_DIR)/.libs/$(MPFR_BINARY)
 	$(MAKE) prefix=$(STAGING_DIR) \
 	    exec_prefix=$(STAGING_DIR) \
 	    bindir=$(STAGING_DIR)/bin \
@@ -79,7 +80,7 @@
 	    oldincludedir=$(STAGING_DIR)/include \
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \
-	    -C $(MPFR_DIR) install;
+	    -C $(MPFR_TARGET_DIR) install;
 
 $(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION): $(STAGING_DIR)/lib/$(MPFR_BINARY)
 	cp -a $(STAGING_DIR)/lib/libmpfr.so* $(STAGING_DIR)/lib/libmpfr.a \
@@ -98,46 +99,39 @@
 	rm -f $(TARGET_DIR)/lib/$(MPFR_BINARY) $(TARGET_DIR)/lib/libmpfr.so* \
 		$(TARGET_DIR)/usr/include/mpfr.h \
 		$(TARGET_DIR)/usr/include/mpf2mpfr.h
-	-$(MAKE) -C $(MPFR_DIR) clean
+	-$(MAKE) -C $(MPFR_TARGET_DIR) clean
 
 libmpfr-dirclean:
-	rm -rf $(MPFR_DIR)
+	rm -rf $(MPFR_TARGET_DIR)
 
 MPFR_DIR2:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
+MPFR_HOST_DIR:=$(TOOL_BUILD_DIR)/mpfr
 $(MPFR_DIR2)/.configured: $(MPFR_DIR)/.unpacked $(GMP_HOST_DIR)/lib/$(GMP_BINARY)
-	[ -d $(MPFR_DIR2) ] || mkdir $(MPFR_DIR2)
+	mkdir -p $(MPFR_DIR2)
 	(cd $(MPFR_DIR2); \
-		CC="$(HOSTCC)" \
+		CC="$(HOSTCC)" CC_FOR_BUILD="$(HOSTCC)" \
 		CXX="$(HOSTCXX)" \
 		$(MPFR_DIR)/configure \
-		--prefix=$(STAGING_DIR) \
-		--exec_prefix=$(STAGING_DIR) \
-		--libdir=$(STAGING_DIR)/lib \
-		--includedir=$(STAGING_DIR)/include \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--prefix="$(MPFR_HOST_DIR)" \
+		--build=$(GNU_HOST_NAME) \
+		--host=$(GNU_HOST_NAME) \
+		--target=$(REAL_GNU_TARGET_NAME) \
 		--enable-shared \
 		--enable-static \
-		--with-gmp-build=$(GMP_DIR2) \
+		--with-gmp=$(GMP_HOST_DIR) \
 		$(DISABLE_NLS) \
 	);
 	touch $@
 
-$(MPFR_DIR2)/.libs/$(MPFR_BINARY): $(MPFR_DIR2)/.configured
-	$(MAKE) -C $(MPFR_DIR2)
+$(MPFR_HOST_DIR)/lib/$(MPFR_BINARY): $(MPFR_DIR2)/.configured
+	$(MAKE) -C $(MPFR_DIR2) install
 
-MPFR_HOST_DIR:=$(TOOL_BUILD_DIR)/mpfr
-$(MPFR_HOST_DIR)/lib/libmpfr.a: $(MPFR_DIR2)/.libs/$(MPFR_BINARY)
-	mkdir -p $(MPFR_HOST_DIR)/lib $(MPFR_HOST_DIR)/include
-	cp -a $(MPFR_DIR2)/.libs/libmpfr.* $(MPFR_HOST_DIR)/lib
-	cp -a $(MPFR_DIR)/mpfr.h $(MPFR_DIR)/mpf2mpfr.h $(MPFR_HOST_DIR)/include
+host-libmpfr: $(MPFR_HOST_DIR)/lib/$(MPFR_BINARY)
+host-libmpfr-clean:
+	rm -rf $(MPFR_HOST_DIR)
+	-$(MAKE) -C $(MPFR_DIR2) clean
+host-libmpfr-dirclean:
+	rm -rf $(MPFR_HOST_DIR) $(MPFR_DIR2)
 
 #############################################################
 #
