From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Sep 2007 12:53:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070928195314.9BD793007B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-28 12:53:13 -0700 (Fri, 28 Sep 2007)
New Revision: 20092

Log:
Add bells and whistles to allow gcc-4.1.2-AVR32 buildprocess to progress further, not home yet though

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-28 19:51:06 UTC (rev 20091)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-28 19:53:13 UTC (rev 20092)
@@ -176,7 +176,7 @@
 $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); PATH=$(TARGET_PATH) \
-		CC="$(HOSTCC)" \
+		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_DIR)/configure \
 		--prefix=$(STAGING_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
@@ -187,6 +187,7 @@
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
+		--with-as=$(TARGET_CROSS)as \
 		--disable-shared \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
@@ -230,6 +231,7 @@
 # have something to do with "path translations" and possibly doesn't
 # affect gcc-target. However, I haven't tested gcc-target yet so no
 # guarantees. mjn3
+
 comma:=,
 GCC_BUILD_DIR2:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(GCC_STAGING_PREREQ)
@@ -240,6 +242,7 @@
 	#ln -snf ../lib/ $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
+		GCC=$(TARGET_CROSS)gcc \
 		LDFLAGS_FOR_TARGET="$(patsubst %,LDFLAGS+=-Wl$(comma)%,$(TARGET_LDFLAGS)) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
 		$(GCC_DIR)/configure \
 		--prefix=$(STAGING_DIR) \
@@ -250,6 +253,7 @@
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
+		--with-as=$(TARGET_CROSS)as \
 		$(GCC_WITH_HOST_GMP) \
 		$(GCC_WITH_HOST_MPFR) \
 		$(GCC_SHARED_LIBGCC) \
@@ -265,11 +269,14 @@
 	touch $@
 
 $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
-	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) all
+	PATH=$(TARGET_PATH) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(GCC_BUILD_DIR2) all
 	touch $@
 
 $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
-	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install
+	PATH=$(TARGET_PATH) \
+	$(MAKE) $(HOST_CONFIGURE_OPTS) \
+	LDFLAGS_FOR_TARGET="$(patsubst %,LDFLAGS+=-Wl$(comma)%,$(TARGET_LDFLAGS)) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
+	-C $(GCC_BUILD_DIR2) install
 	if [ -d "$(STAGING_DIR)/usr/lib64" ]; then \
 		if [ ! -e "$(STAGING_DIR)/usr/lib" ]; then \
 			mkdir "$(STAGING_DIR)/usr/lib"; \
@@ -390,6 +397,7 @@
 		--with-gxx-include-dir=/usr/include/c++ \
 		--disable-__cxa_atexit \
 		--with-gnu-ld \
+		--with-gnu-as \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_TARGET_GMP) \
 		$(GCC_WITH_TARGET_MPFR) \
@@ -407,7 +415,10 @@
 
 $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
 	PATH=$(TARGET_PATH) \
-	$(MAKE) -C $(GCC_BUILD_DIR3) all
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \
+	$(TARGET_GCC_FLAGS) \
+	-C $(GCC_BUILD_DIR3) all
 	touch $@
 
 #
@@ -436,7 +447,11 @@
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
 	PATH=$(TARGET_PATH) \
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GCC_BUILD_DIR3) install
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+	CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \
+	$(TARGET_GCC_FLAGS) \
+	DESTDIR=$(TARGET_DIR) \
+	-C $(GCC_BUILD_DIR3) install
 	# Remove broken specs file (cross compile flag is set).
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
 	#
