From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Jun 2007 04:22:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/gmp package/mpfr
	toolchain/binu etc...
Message-ID: <20070602112218.1A137C8055@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-02 04:22:17 -0700 (Sat, 02 Jun 2007)
New Revision: 18726

Log:
- fixup the extension for the host and start to honor BR2_PREFER_STATIC_LIB


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-02 09:05:40 UTC (rev 18725)
+++ trunk/buildroot/Makefile	2007-06-02 11:22:17 UTC (rev 18726)
@@ -48,38 +48,38 @@
 
 #############################################################
 #
-# Setup the proper filename extensions for the target
+# Setup the proper filename extensions for the host
 #
 ##############################################################
 ifneq ($(findstring linux,$(BR2_GNU_BUILD_SUFFIX)),)
-EXEEXT:=
-LIBEXT:=.a
-SHREXT:=.so
+HOST_EXEEXT:=
+HOST_LIBEXT:=.a
+HOST_SHREXT:=.so
 endif
 ifneq ($(findstring apple,$(BR2_GNU_BUILD_SUFFIX)),)
-EXEEXT:=
-LIBEXT:=.a
-SHREXT:=.dylib
+HOST_EXEEXT:=
+HOST_LIBEXT:=.a
+HOST_SHREXT:=.dylib
 endif
 ifneq ($(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)),)
-EXEEXT:=.exe
-LIBEXT:=.lib
-SHREXT:=.dll
+HOST_EXEEXT:=.exe
+HOST_LIBEXT:=.lib
+HOST_SHREXT:=.dll
 endif
 ifneq ($(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)),)
-EXEEXT:=.exe
-LIBEXT:=.lib
-SHREXT:=.dll
+HOST_EXEEXT:=.exe
+HOST_LIBEXT:=.lib
+HOST_SHREXT:=.dll
 endif
 
+# The preferred type of libs we build for the target
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBTGTEXT=$(LIBEXT)
+LIBTGTEXT=.a
 else
-LIBTGTEXT=$(SHREXT)
+LIBTGTEXT=.so
 endif
 
 
-
 #############################################################
 #
 # The list of stuff to build for the target toolchain

Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-06-02 09:05:40 UTC (rev 18725)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-06-02 11:22:17 UTC (rev 18726)
@@ -9,7 +9,8 @@
 GMP_CAT:=$(BZCAT)
 GMP_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
-GMP_BINARY:=libgmp.so
+GMP_BINARY:=libgmp$(LIBTGTEXT)
+GMP_HOST_BINARY:=libgmp$(HOST_LIBEXT)
 GMP_LIBVERSION:=3.4.1
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -20,7 +21,7 @@
 
 # this is a workaround for a bug in GMP, please see 
 # http://gmplib.org/list-archives/gmp-devel/2006-April/000618.html
-ifeq ($(EXEEXT),.exe)
+ifeq ($(HOST_EXEEXT),.exe)
 GMP_CPP_FLAGS:=-DDLL_EXPORT
 else
 GMP_CPP_FLAGS:=
@@ -88,19 +89,17 @@
 	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libgmp.{so*,a}
 
 $(TARGET_DIR)/lib/libgmp.so $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION) $(TARGET_DIR)/lib/libgmp.a: $(STAGING_DIR)/lib/$(GMP_BINARY)
-	cp -dpf $(STAGING_DIR)/lib/libgmp.so* $(STAGING_DIR)/lib/libgmp.a \
-		 $(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libgmp$(LIBTGTEXT) $(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_LIBGMP_HEADERS),y)
 	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
 	cp -dpf $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/usr/include/
 endif
 
-libgmp: uclibc $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION)
+libgmp: uclibc $(TARGET_DIR)/lib/libgmp$(LIBTGTEXT)
 stage-libgmp: uclibc $(STAGING_DIR)/lib/$(GMP_BINARY)
 
 libgmp-clean:
-	rm -f $(TARGET_DIR)/lib/$(GMP_BINARY) $(TARGET_DIR)/lib/libgmp.so* \
-		$(TARGET_DIR)/usr/include/gmp.h
+	rm -f $(TARGET_DIR)/lib/libgmp.* $(TARGET_DIR)/usr/include/gmp.h
 	-$(MAKE) -C $(GMP_TARGET_DIR) clean
 
 libgmp-dirclean:
@@ -124,10 +123,10 @@
 	);
 	touch $@
 
-$(GMP_HOST_DIR)/lib/$(GMP_BINARY): $(GMP_DIR2)/.configured
+$(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY): $(GMP_DIR2)/.configured
 	$(MAKE) -C $(GMP_DIR2) install
 
-host-libgmp: $(GMP_HOST_DIR)/lib/$(GMP_BINARY)
+host-libgmp: $(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY)
 host-libgmp-clean:
 	rm -rf $(GMP_HOST_DIR)
 	-$(MAKE) -C $(GMP_DIR2) clean

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-06-02 09:05:40 UTC (rev 18725)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-06-02 11:22:17 UTC (rev 18726)
@@ -11,7 +11,8 @@
 MPFR_SITE:=http://www.mpfr.org/mpfr-current/
 MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
-MPFR_BINARY:=libmpfr.so
+MPFR_BINARY:=libmpfr$(LIBTGTEXT)
+MPFR_HOST_BINARY:=libmpfr$(HOST_LIBEXT)
 MPFR_LIBVERSION:=1.0.1
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -102,18 +103,17 @@
 	$(STRIP) --strip-unneeded $(STAGING_DIR)/lib/libmpfr.{so*,a}
 
 $(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION) $(TARGET_DIR)/lib/libmpfr.a: $(STAGING_DIR)/lib/$(MPFR_BINARY)
-	cp -dpf $(STAGING_DIR)/lib/libmpfr.so* $(STAGING_DIR)/lib/libmpfr.a \
-		$(TARGET_DIR)/lib/
+	cp -dpf $(STAGING_DIR)/lib/libmpfr$(LIBTGTEXT) $(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_LIBMPFR_HEADERS),y)
 	cp -dpf $(STAGING_DIR)/include/mpfr.h $(STAGING_DIR)/include/mpf2mpfr.h \
 		$(TARGET_DIR)/usr/include/
 endif
 
-libmpfr: uclibc $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION)
+libmpfr: uclibc $(TARGET_DIR)/lib/libmpfr$(LIBTGTEXT)
 stage-libmpfr: uclibc $(STAGING_DIR)/lib/$(MPFR_BINARY)
 
 libmpfr-clean:
-	rm -f $(TARGET_DIR)/lib/$(MPFR_BINARY) $(TARGET_DIR)/lib/libmpfr.so* \
+	rm -f $(TARGET_DIR)/lib/libmpfr.* \
 		$(TARGET_DIR)/usr/include/mpfr.h \
 		$(TARGET_DIR)/usr/include/mpf2mpfr.h
 	-$(MAKE) -C $(MPFR_TARGET_DIR) clean
@@ -123,7 +123,7 @@
 
 MPFR_DIR2:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)-host
 MPFR_HOST_DIR:=$(TOOL_BUILD_DIR)/mpfr
-$(MPFR_DIR2)/.configured: $(MPFR_DIR)/.unpacked $(GMP_HOST_DIR)/lib/$(GMP_BINARY)
+$(MPFR_DIR2)/.configured: $(MPFR_DIR)/.unpacked $(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY)
 	mkdir -p $(MPFR_DIR2)
 	(cd $(MPFR_DIR2); \
 		CC="$(HOSTCC)" CC_FOR_BUILD="$(HOSTCC)" \
@@ -140,10 +140,10 @@
 	);
 	touch $@
 
-$(MPFR_HOST_DIR)/lib/$(MPFR_BINARY): $(MPFR_DIR2)/.configured
+$(MPFR_HOST_DIR)/lib/$(MPFR_HOST_BINARY): $(MPFR_DIR2)/.configured
 	$(MAKE) -C $(MPFR_DIR2) install
 
-host-libmpfr: $(MPFR_HOST_DIR)/lib/$(MPFR_BINARY)
+host-libmpfr: $(MPFR_HOST_DIR)/lib/$(MPFR_HOST_BINARY)
 host-libmpfr-clean:
 	rm -rf $(MPFR_HOST_DIR)
 	-$(MAKE) -C $(MPFR_DIR2) clean

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-06-02 09:05:40 UTC (rev 18725)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-06-02 11:22:17 UTC (rev 18726)
@@ -49,11 +49,11 @@
 endif
 
 ifndef BINUTILS_NO_MPFR
-BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp.so \
-	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
+BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_LIBEXT) \
+	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
 
-BINUTILS_TARGET_PREREQ:=$(TARGET_DIR)/lib/libgmp.so \
-	$(TARGET_DIR)/lib/libmpfr.so
+BINUTILS_TARGET_PREREQ:=$(TARGET_DIR)/lib/libgmp$(LIBTGTEXT) \
+	$(TARGET_DIR)/lib/libmpfr$(LIBTGTEXT)
 EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-gmp="$(GMP_HOST_DIR)"
 EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_HOST_DIR)"
 
