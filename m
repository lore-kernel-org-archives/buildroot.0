From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 24 Jan 2007 07:56:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/gmp package/mpfr
	toolchain/binut etc...
Message-ID: <20070124155612.CD812485AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-24 07:56:11 -0800 (Wed, 24 Jan 2007)
New Revision: 17502

Log:
- fix prerequisites of binutils_target


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-01-24 15:52:46 UTC (rev 17501)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-01-24 15:56:11 UTC (rev 17502)
@@ -75,6 +75,7 @@
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \
             -C $(GMP_TARGET_DIR) install
+	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libgmp.{so*,a}
 
 $(TARGET_DIR)/lib/libgmp.so $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION) $(TARGET_DIR)/lib/libgmp.a: $(STAGING_DIR)/lib/$(GMP_BINARY)
 	cp -dpf $(STAGING_DIR)/lib/libgmp.so* $(STAGING_DIR)/lib/libgmp.a \
@@ -83,8 +84,6 @@
 	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/usr/include/
 endif
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmp.so* \
-		$(TARGET_DIR)/lib/libgmp.a
 
 libgmp: uclibc $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION)
 stage-libgmp: uclibc $(STAGING_DIR)/lib/$(GMP_BINARY)

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-01-24 15:52:46 UTC (rev 17501)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-01-24 15:56:11 UTC (rev 17502)
@@ -82,6 +82,7 @@
 	    infodir=$(STAGING_DIR)/info \
 	    mandir=$(STAGING_DIR)/man \
 	    -C $(MPFR_TARGET_DIR) install;
+	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libmpfr.{so*,a}
 
 $(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION) $(TARGET_DIR)/lib/libmpfr.a: $(STAGING_DIR)/lib/$(MPFR_BINARY)
 	cp -dpf $(STAGING_DIR)/lib/libmpfr.so* $(STAGING_DIR)/lib/libmpfr.a \
@@ -90,8 +91,6 @@
 	cp -dpf $(STAGING_DIR)/include/mpfr.h $(STAGING_DIR)/include/mpf2mpfr.h \
 		$(TARGET_DIR)/usr/include/
 endif
-	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libmpfr.so* \
-		$(TARGET_DIR)/lib/libmpfr.a
 
 libmpfr: uclibc $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION)
 stage-libmpfr: uclibc $(STAGING_DIR)/lib/$(MPFR_BINARY)

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-01-24 15:52:46 UTC (rev 17501)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-01-24 15:56:11 UTC (rev 17502)
@@ -63,14 +63,14 @@
 	mkdir -p $(TOOL_BUILD_DIR)
 	$(BINUTILS_CAT) $(DL_DIR)/$(BINUTILS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(BINUTILS_DIR)
-	touch $(BINUTILS_DIR)/.unpacked
+	touch $@
 
 $(BINUTILS_DIR)/.patched: $(BINUTILS_DIR)/.unpacked
 	# Apply appropriate binutils patches.
 	toolchain/patch-kernel.sh $(BINUTILS_DIR) toolchain/binutils/$(BINUTILS_VERSION) \*.patch
-	touch $(BINUTILS_DIR)/.patched
+	touch $@
 
-$(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched $(BINUTILS_HOST_PREREQ)
+$(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched
 	mkdir -p $(BINUTILS_DIR1)
 	(cd $(BINUTILS_DIR1); \
 		CC="$(HOSTCC)" \
@@ -86,7 +86,7 @@
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(EXTRA_BINUTILS_CONFIG_OPTIONS));
-	touch $(BINUTILS_DIR1)/.configured
+	touch $@
 
 $(BINUTILS_DIR1)/binutils/objdump: $(BINUTILS_DIR1)/.configured
 	$(MAKE) -C $(BINUTILS_DIR1) all
@@ -96,7 +96,7 @@
 $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/ld: $(BINUTILS_DIR1)/binutils/objdump
 	$(MAKE) -C $(BINUTILS_DIR1) install
 
-binutils: dependencies uclibc-configured $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/ld
+binutils: dependencies uclibc-configured $(BINUTILS_HOST_PREREQ) $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin/ld
 
 binutils-source: $(DL_DIR)/$(BINUTILS_SOURCE)
 
@@ -115,7 +115,7 @@
 #
 #############################################################
 BINUTILS_DIR2:=$(BUILD_DIR)/binutils-$(BINUTILS_VERSION)-target
-$(BINUTILS_DIR2)/.configured: $(BINUTILS_DIR)/.patched $(BINUTILS_TARGET_PREREQ)
+$(BINUTILS_DIR2)/.configured: $(BINUTILS_DIR)/.patched
 	mkdir -p $(BINUTILS_DIR2)
 	(cd $(BINUTILS_DIR2); \
 		CC_FOR_BUILD="$(HOSTCC)" \
@@ -133,7 +133,7 @@
 		$(BINUTILS_TARGET_CONFIG_OPTIONS) \
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) );
-	touch $(BINUTILS_DIR2)/.configured
+	touch $@
 
 $(BINUTILS_DIR2)/binutils/objdump: $(BINUTILS_DIR2)/.configured
 	PATH=$(TARGET_PATH) \
@@ -149,7 +149,7 @@
 	-$(STRIP) $(TARGET_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/* > /dev/null 2>&1
 	-$(STRIP) $(TARGET_DIR)/usr/bin/* > /dev/null 2>&1
 
-binutils_target: $(TARGET_DIR)/usr/bin/ld
+binutils_target: $(BINUTILS_TARGET_PREREQ) $(TARGET_DIR)/usr/bin/ld
 
 binutils_target-clean:
 	(cd $(TARGET_DIR)/usr/bin; \
