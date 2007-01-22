From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 11:17:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/gmp package/mpfr
	toolchain/binut etc...
Message-ID: <20070122191724.BD3B74859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 11:17:23 -0800 (Mon, 22 Jan 2007)
New Revision: 17473

Log:
- don't rely on buggy gmp/mpfr on the host but use our own build iff we are about to build a somewhat current toolchain.


Added:
   trunk/buildroot/toolchain/gcc/4.2/900-gengtype-verbose-error.patch

Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-01-22 18:48:48 UTC (rev 17472)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-01-22 19:17:23 UTC (rev 17473)
@@ -9,7 +9,7 @@
 GMP_CAT:=$(BZCAT)
 GMP_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
-GMP_BINARY:=libgmp.a
+GMP_BINARY:=libgmp.so
 GMP_LIBVERSION:=3.4.1
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -27,7 +27,7 @@
 	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GMP_DIR) package/gmp/ \*.patch
 	$(CONFIG_UPDATE) $(GMP_DIR)
-	touch $(GMP_DIR)/.unpacked
+	touch $@
 
 $(GMP_TARGET_DIR)/.configured: $(GMP_DIR)/.unpacked
 	mkdir -p $(GMP_TARGET_DIR)
@@ -54,7 +54,7 @@
 		--enable-shared \
 		$(DISABLE_NLS) \
 	);
-	touch $(GMP_TARGET_DIR)/.configured
+	touch $@
 
 $(GMP_TARGET_DIR)/.libs/$(GMP_BINARY): $(GMP_TARGET_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(GMP_TARGET_DIR)
@@ -76,18 +76,18 @@
 	    mandir=$(STAGING_DIR)/man \
             -C $(GMP_TARGET_DIR) install
 
-$(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION): $(STAGING_DIR)/lib/$(GMP_BINARY)
-	cp -a $(STAGING_DIR)/lib/libgmp.so* $(STAGING_DIR)/lib/libgmp.a \
+$(TARGET_DIR)/lib/libgmp.so $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION) $(TARGET_DIR)/lib/libgmp.a: $(STAGING_DIR)/lib/$(GMP_BINARY)
+	cp -dpf $(STAGING_DIR)/lib/libgmp.so* $(STAGING_DIR)/lib/libgmp.a \
 		 $(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_LIBGMP_HEADERS),y)
 	test -d $(TARGET_DIR)/usr/include || mkdir -p $(TARGET_DIR)/usr/include
-	cp -a $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/usr/include/
+	cp -dpf $(STAGING_DIR)/include/gmp.h $(TARGET_DIR)/usr/include/
 endif
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libgmp.so* \
 		$(TARGET_DIR)/lib/libgmp.a
 
 libgmp: uclibc $(TARGET_DIR)/lib/libgmp.so.$(GMP_LIBVERSION)
-libgmp-stage: uclibc $(STAGING_DIR)/lib/$(GMP_BINARY)
+stage-libgmp: uclibc $(STAGING_DIR)/lib/$(GMP_BINARY)
 
 libgmp-clean:
 	rm -f $(TARGET_DIR)/lib/$(GMP_BINARY) $(TARGET_DIR)/lib/libgmp.so* \
@@ -113,7 +113,7 @@
 		--enable-static \
 		$(DISABLE_NLS) \
 	);
-	touch $(GMP_DIR2)/.configured
+	touch $@
 
 $(GMP_HOST_DIR)/lib/$(GMP_BINARY): $(GMP_DIR2)/.configured
 	$(MAKE) -C $(GMP_DIR2) install

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-01-22 18:48:48 UTC (rev 17472)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-01-22 19:17:23 UTC (rev 17473)
@@ -10,7 +10,7 @@
 MPFR_SITE:=http://www.mpfr.org/mpfr-current/
 MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
-MPFR_BINARY:=libmpfr.a
+MPFR_BINARY:=libmpfr.so
 MPFR_LIBVERSION:=1.0.1
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -33,7 +33,7 @@
 	$(WGET) -P $(MPFR_DIR) $(MPFR_SITE)/$(MPFR_PATCH)
 	( cd $(MPFR_DIR) ; patch -p1 < $(MPFR_PATCH) ; )
 endif
-	touch $(MPFR_DIR)/.unpacked
+	touch $@
 
 $(MPFR_TARGET_DIR)/.configured: $(MPFR_DIR)/.unpacked $(STAGING_DIR)/lib/$(GMP_BINARY)
 	mkdir -p $(MPFR_TARGET_DIR)
@@ -83,18 +83,18 @@
 	    mandir=$(STAGING_DIR)/man \
 	    -C $(MPFR_TARGET_DIR) install;
 
-$(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION): $(STAGING_DIR)/lib/$(MPFR_BINARY)
-	cp -a $(STAGING_DIR)/lib/libmpfr.so* $(STAGING_DIR)/lib/libmpfr.a \
+$(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION) $(TARGET_DIR)/lib/libmpfr.a: $(STAGING_DIR)/lib/$(MPFR_BINARY)
+	cp -dpf $(STAGING_DIR)/lib/libmpfr.so* $(STAGING_DIR)/lib/libmpfr.a \
 		$(TARGET_DIR)/lib/
 ifeq ($(BR2_PACKAGE_LIBMPFR_HEADERS),y)
-	cp -a $(STAGING_DIR)/include/mpfr.h $(STAGING_DIR)/include/mpf2mpfr.h \
+	cp -dpf $(STAGING_DIR)/include/mpfr.h $(STAGING_DIR)/include/mpf2mpfr.h \
 		$(TARGET_DIR)/usr/include/
 endif
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libmpfr.so* \
 		$(TARGET_DIR)/lib/libmpfr.a
 
-libmpfr: uclibc libgmp $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION)
-libmpfr-stage: uclibc $(STAGING_DIR)/lib/$(MPFR_BINARY)
+libmpfr: uclibc $(TARGET_DIR)/lib/libmpfr.so.$(MPFR_LIBVERSION)
+stage-libmpfr: uclibc $(STAGING_DIR)/lib/$(MPFR_BINARY)
 
 libmpfr-clean:
 	rm -f $(TARGET_DIR)/lib/$(MPFR_BINARY) $(TARGET_DIR)/lib/libmpfr.so* \
@@ -105,7 +105,7 @@
 libmpfr-dirclean:
 	rm -rf $(MPFR_TARGET_DIR)
 
-MPFR_DIR2:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
+MPFR_DIR2:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)-host
 MPFR_HOST_DIR:=$(TOOL_BUILD_DIR)/mpfr
 $(MPFR_DIR2)/.configured: $(MPFR_DIR)/.unpacked $(GMP_HOST_DIR)/lib/$(GMP_BINARY)
 	mkdir -p $(MPFR_DIR2)

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-01-22 18:48:48 UTC (rev 17472)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-01-22 19:17:23 UTC (rev 17473)
@@ -6,7 +6,7 @@
 BINUTILS_VERSION:=$(strip $(subst ",, $(BR2_BINUTILS_VERSION)))
 #"))
 
-EXTRA_BINUTILS_CONFIG_OPTIONS:=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
+EXTRA_BINUTILS_CONFIG_OPTIONS=$(strip $(subst ",, $(BR2_EXTRA_BINUTILS_CONFIG_OPTIONS)))
 #"))
 BINUTILS_SITE:=ftp://ftp.kernel.org/pub/linux/devel/binutils
 ifeq ($(BINUTILS_VERSION),2.17)
@@ -31,6 +31,23 @@
 BINUTILS_SITE:=ftp://sources.redhat.com/pub/binutils/snapshots/
 endif
 
+# We do not rely on the host's gmp/mpfr but use a known working one
+BINUTILS_HOST_PREREQ:= #nothing
+BINUTILS_TARGET_PREREQ:= #nothing
+ifeq ($(BR2_BINUTILS_VERSION_2_17_50_0_9),y)
+
+BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp.so \
+	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
+
+BINUTILS_TARGET_PREREQ:=$(TARGET_DIR)/lib/libgmp.so \
+	$(TARGET_DIR)/lib/libmpfr.so
+EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-gmp="$(GMP_HOST_DIR)"
+EXTRA_BINUTILS_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_HOST_DIR)"
+
+BINUTILS_TARGET_CONFIG_OPTIONS=--with-gmp="$(GMP_TARGET_DIR)"
+BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
+endif
+
 BINUTILS_SOURCE:=binutils-$(BINUTILS_VERSION).tar.bz2
 BINUTILS_DIR:=$(TOOL_BUILD_DIR)/binutils-$(BINUTILS_VERSION)
 BINUTILS_CAT:=$(BZCAT)
@@ -53,7 +70,7 @@
 	toolchain/patch-kernel.sh $(BINUTILS_DIR) toolchain/binutils/$(BINUTILS_VERSION) \*.patch
 	touch $(BINUTILS_DIR)/.patched
 
-$(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched
+$(BINUTILS_DIR1)/.configured: $(BINUTILS_DIR)/.patched $(BINUTILS_HOST_PREREQ)
 	mkdir -p $(BINUTILS_DIR1)
 	(cd $(BINUTILS_DIR1); \
 		CC="$(HOSTCC)" \
@@ -98,7 +115,7 @@
 #
 #############################################################
 BINUTILS_DIR2:=$(BUILD_DIR)/binutils-$(BINUTILS_VERSION)-target
-$(BINUTILS_DIR2)/.configured: $(BINUTILS_DIR)/.patched
+$(BINUTILS_DIR2)/.configured: $(BINUTILS_DIR)/.patched $(BINUTILS_TARGET_PREREQ)
 	mkdir -p $(BINUTILS_DIR2)
 	(cd $(BINUTILS_DIR2); \
 		CC_FOR_BUILD="$(HOSTCC)" \
@@ -113,6 +130,7 @@
 		--target=$(REAL_GNU_TARGET_NAME) \
 		$(DISABLE_NLS) \
 		$(MULTILIB) \
+		$(BINUTILS_TARGET_CONFIG_OPTIONS) \
 		--disable-werror \
 		$(SOFT_FLOAT_CONFIG_OPTION) );
 	touch $(BINUTILS_DIR2)/.configured
@@ -131,7 +149,7 @@
 	-$(STRIP) $(TARGET_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/* > /dev/null 2>&1
 	-$(STRIP) $(TARGET_DIR)/usr/bin/* > /dev/null 2>&1
 
-binutils_target: $(GCC_DEPENDANCY) $(TARGET_DIR)/usr/bin/ld
+binutils_target: $(TARGET_DIR)/usr/bin/ld
 
 binutils_target-clean:
 	(cd $(TARGET_DIR)/usr/bin; \

Added: trunk/buildroot/toolchain/gcc/4.2/900-gengtype-verbose-error.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/900-gengtype-verbose-error.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.2/900-gengtype-verbose-error.patch	2007-01-22 19:17:23 UTC (rev 17473)
@@ -0,0 +1,27 @@
+Index: gcc-4.2/gcc/gengtype-lex.l
+===================================================================
+--- gcc-4.2/gcc/gengtype-lex.l	(revision 121000)
++++ gcc-4.2/gcc/gengtype-lex.l	(working copy)
+@@ -535,13 +535,19 @@
+ macro_input (char *buffer, unsigned size)
+ {
+   unsigned result;
++  int old_errno;
+ 
+   result = fread (buffer, 1, size, yyin);
++  old_errno = errno;
+   if (result)
+     /*NOP*/;
+-  else if (ferror (yyin))
+-    YY_FATAL_ERROR ("read of source file failed");
+-  else if (macro_expns)
++  else if (ferror (yyin)) {
++    char *err_msg;
++    err_msg = xasprintf ("read of source file '%s:%d' failed",
++    			lexer_line.file,
++    			lexer_line.line);
++    YY_FATAL_ERROR (err_msg);
++  } else if (macro_expns)
+     {
+       const char *expn;
+       unsigned len;

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-01-22 18:48:48 UTC (rev 17472)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-01-22 19:17:23 UTC (rev 17473)
@@ -134,7 +134,11 @@
 	select BR2_PACKAGE_LIBMPFR
 	help
 	    Build/install Fortran compiler and runtime?
+	    Note that it is highly recommended NOT to use gfortran
+	    from gcc older than 4.2.0
 
+	    You have been warned..
+
 config BR2_GCC_SHARED_LIBGCC
 	bool "Build/install a shared libgcc?"
 	default y

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-01-22 18:48:48 UTC (rev 17472)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-01-22 19:17:23 UTC (rev 17473)
@@ -31,38 +31,52 @@
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=true
 
+
+ifeq ($(findstring 3.,$(GCC_VERSION)),3.)
+GCC_NO_MPFR:=y
+endif
+ifeq ($(findstring 4.0.,$(GCC_VERSION)),4.0.)
+GCC_NO_MPFR:=y
+endif
+#ifeq ($(findstring 4.1.,$(GCC_VERSION)),4.1.)
+#GCC_NO_MPFR:=y
+#endif
+
 #############################################################
 #
 # Setup some initial stuff
 #
 #############################################################
 
-TARGET_LANGUAGES:=c
+GCC_TARGET_LANGUAGES:=c
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-TARGET_LANGUAGES:=$(TARGET_LANGUAGES),c++
+GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
 endif
 
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
-TARGET_LANGUAGES:=$(TARGET_LANGUAGES),java
+GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),java
 endif
 
 ifeq ($(BR2_INSTALL_OBJC),y)
-TARGET_LANGUAGES:=$(TARGET_LANGUAGES),objc
+GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),objc
 endif
 
-TARGET_PREREQ =
-STAGING_PREREQ= $(STAGING_DIR)/lib/libc.a
+GCC_TARGET_PREREQ =
+GCC_STAGING_PREREQ= $(STAGING_DIR)/lib/libc.a
 
-ifeq ($(BR2_INSTALL_FORTRAN),y)
-TARGET_LANGUAGES:=$(TARGET_LANGUAGES),fortran
-TARGET_PREREQ += $(TARGET_DIR)/lib/libmpfr.so
-STAGING_PREREQ+= $(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.a
-GCC_WITH_TARGET_GMP:=--with-gmp=$(STAGING_DIR)
-GCC_WITH_TARGET_MPFR:=--with-mpfr=$(STAGING_DIR)
+ifndef $(GCC_NO_MPFR)
 GCC_WITH_HOST_GMP=--with-gmp=$(GMP_HOST_DIR)
 GCC_WITH_HOST_MPFR=--with-mpfr=$(MPFR_HOST_DIR)
+
+ifeq ($(BR2_INSTALL_FORTRAN),y)
+GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
+#GCC_TARGET_PREREQ += $(TARGET_DIR)/lib/libmpfr.so $(TARGET_DIR)/lib/libgmp.so
+#GCC_STAGING_PREREQ+= $(TOOL_BUILD_DIR)/mpfr/lib/libmpfr.so
+GCC_WITH_TARGET_GMP=--with-gmp="$(GMP_TARGET_DIR)"
+GCC_WITH_TARGET_MPFR=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
+endif # ifndef GCC_NO_MPFR
 
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 GCC_SHARED_LIBGCC:=--enable-shared
@@ -91,7 +105,7 @@
 	mkdir -p $(TOOL_BUILD_DIR)
 	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	$(CONFIG_UPDATE) $(GCC_DIR)
-	touch $(GCC_DIR)/.unpacked
+	touch $@
 
 gcc-patched: $(GCC_DIR)/.patched
 $(GCC_DIR)/.patched: $(GCC_DIR)/.unpacked
@@ -123,7 +137,7 @@
 	#toolchain/patch-kernel.sh $(GCC_DIR) toolchain/gcc i386-gcc-soft-float.patch
 	#endif
 endif
-	touch $(GCC_DIR)/.patched
+	touch $@
 
 # The --without-headers option stopped working with gcc 3.0 and has never been
 # fixed, so we need to actually have working C library header files prior to
@@ -144,17 +158,19 @@
 		--enable-target-optspace \
 		--with-gnu-ld \
 		--disable-shared \
+		$(GCC_WITH_HOST_GMP) \
+		$(GCC_WITH_HOST_MPFR) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
-	touch $(GCC_BUILD_DIR1)/.configured
+	touch $@
 
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
-	touch $(GCC_BUILD_DIR1)/.compiled
+	touch $@
 
 $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
@@ -183,7 +199,7 @@
 # guarantees.  mjn3
 
 GCC_BUILD_DIR2:=$(TOOL_BUILD_DIR)/gcc-$(GCC_VERSION)-final
-$(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(STAGING_PREREQ)
+$(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR2)
 	# Important!  Required for limits.h to be fixed.
 	ln -snf ../include $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/sys-include
@@ -194,7 +210,7 @@
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
-		--enable-languages=$(TARGET_LANGUAGES) \
+		--enable-languages=$(GCC_TARGET_LANGUAGES) \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
@@ -209,11 +225,11 @@
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
-	touch $(GCC_BUILD_DIR2)/.configured
+	touch $@
 
 $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) all
-	touch $(GCC_BUILD_DIR2)/.compiled
+	touch $@
 
 $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install
@@ -267,24 +283,24 @@
 	#
 	# Ok... that's enough of that.
 	#
-	touch $(GCC_BUILD_DIR2)/.installed
+	touch $@
 
 gcc-target-libs: $(GCC_BUILD_DIR2)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These are in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -a $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib/libgcc_s* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	-cp -a $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/lib/
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
-	-cp -a $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
-	-cp -a $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
-	-cp -a $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/lib/libgcj.so* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/lib/lib-org-w3c-dom.so* $(TARGET_DIR)/lib/
+	-cp -dpf $(STAGING_DIR)/lib/lib-org-xml-sax.so* $(TARGET_DIR)/lib/
 	-mkdir -p $(TARGET_DIR)/usr/lib/security
-	-cp -a $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
-	-cp -a $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
+	-cp -dpf $(STAGING_DIR)/usr/lib/security/libgcj.security $(TARGET_DIR)/usr/lib/security/
+	-cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security $(TARGET_DIR)/usr/lib/security/
 endif
 
 gcc: uclibc-configured binutils gcc_initial $(LIBFLOAT_TARGET) uclibc \
@@ -309,7 +325,7 @@
 #############################################################
 GCC_BUILD_DIR3:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
 
-$(GCC_BUILD_DIR3)/.prepared: $(GCC_BUILD_DIR2)/.installed $(TARGET_PREREQ)
+$(GCC_BUILD_DIR3)/.prepared: $(GCC_BUILD_DIR2)/.installed $(GCC_TARGET_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	touch $@
 
@@ -317,19 +333,20 @@
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache ; \
 		PATH=$(TARGET_PATH) \
 		CC_FOR_BUILD="$(HOSTCC)" \
+		BOOT_CFLAGS="$(TARGET_CFLAGS)" \
 		$(GCC_DIR)/configure \
 		--prefix=/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(REAL_GNU_TARGET_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
-		--enable-languages=$(TARGET_LANGUAGES) \
+		--enable-languages=$(GCC_TARGET_LANGUAGES) \
 		--with-gxx-include-dir=/usr/include/c++ \
 		--disable-__cxa_atexit \
 		--enable-target-optspace \
 		--with-gnu-ld \
 		$(GCC_SHARED_LIBGCC) \
-		$(GCC_WITH_HOST_GMP) \
-		$(GCC_WITH_HOST_MPFR) \
+		$(GCC_WITH_TARGET_GMP) \
+		$(GCC_WITH_TARGET_MPFR) \
 		$(DISABLE_NLS) \
 		$(THREADS) \
 		$(MULTILIB) \
@@ -338,12 +355,12 @@
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
-	touch $(GCC_BUILD_DIR3)/.configured
+	touch $@
 
 $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
 	PATH=$(TARGET_PATH) \
 	$(MAKE) $(TARGET_GCC_ARGS) -C $(GCC_BUILD_DIR3) all
-	touch $(GCC_BUILD_DIR3)/.compiled
+	touch $@
 
 #
 # gcc-lib dir changes names to gcc with 3.4.mumble
@@ -367,6 +384,9 @@
 else
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
+GCC_WITH_ARCH=--with-arch=$(BR2_ARCH)
+GCC_WITH_TUNE=--with-tune=$(BR2_ARCH)
+GCC_WITH_CPU=--with-cpu=$(BR2_ARCH)
 endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
