From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 26 Jan 2007 06:51:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070126145139.CC2834856E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-26 06:51:38 -0800 (Fri, 26 Jan 2007)
New Revision: 17541

Log:
- for the native target gcc, drop --enable-optspace in favour of using the configured flags (that default to -Os anyway).
  Saves about 20% size without additional configure args:
   text    data     bss     dec     hex filename
4685000   17280  566360 5268640  5064a0 optspace/i586-linux-uclibc/4.2.0/cc1
3630655   15184  562172 4208011  40358b usrflags/i586-linux-uclibc/4.2.0/cc1
4853646   23532  568528 5445706  53184a optspace/i586-linux-uclibc/4.2.0/f951
3772121   21292  564148 4357561  427db9 usrflags/i586-linux-uclibc/4.2.0/f951


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-01-26 09:07:26 UTC (rev 17540)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-01-26 14:51:38 UTC (rev 17541)
@@ -30,18 +30,30 @@
 else
 SOFT_FLOAT_CONFIG_OPTION:=--without-float
 endif
+
 # again... there must be a better way
 ifeq ($(findstring 4.,$(GCC_VERSION)),4.)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
+ifeq ($(BR2_SOFT_FLOAT_FP),y)
+TARGET_SOFT_FLOAT:=-mfloat-abi=softfp
+else # no fp at all
+TARGET_SOFT_FLOAT:=-mfloat-abi=soft
 endif
+else # not gcc-4.x
 TARGET_SOFT_FLOAT:=-msoft-float
+endif
 ARCH_FPU_SUFFIX:=_nofpu
-else
+else # no softfloat support
 SOFT_FLOAT_CONFIG_OPTION:=
 TARGET_SOFT_FLOAT:=
 ARCH_FPU_SUFFIX:=
 endif
 
+TARGET_GCC_FLAGS= CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
+	CXXFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
+	CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
+	BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)"
+
 ifeq ($(strip $(BR2_PACKAGE_GCC_TARGET)),y)
 TARGETS+=gcc_target
 endif

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-01-26 09:07:26 UTC (rev 17540)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-01-26 14:51:38 UTC (rev 17541)
@@ -333,7 +333,8 @@
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache ; \
 		PATH=$(TARGET_PATH) \
 		CC_FOR_BUILD="$(HOSTCC)" \
-		BOOT_CFLAGS="$(TARGET_CFLAGS)" \
+		CFLAGS_FOR_BUILD="-g -O2" \
+		$(TARGET_GCC_FLAGS) \
 		$(GCC_DIR)/configure \
 		--prefix=/usr \
 		--build=$(GNU_HOST_NAME) \
@@ -342,7 +343,6 @@
 		--enable-languages=$(GCC_TARGET_LANGUAGES) \
 		--with-gxx-include-dir=/usr/include/c++ \
 		--disable-__cxa_atexit \
-		--enable-target-optspace \
 		--with-gnu-ld \
 		$(GCC_SHARED_LIBGCC) \
 		$(GCC_WITH_TARGET_GMP) \
@@ -354,12 +354,13 @@
 		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS));
+		$(EXTRA_GCC_CONFIG_OPTIONS) \
+		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS));
 	touch $@
 
 $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
 	PATH=$(TARGET_PATH) \
-	$(MAKE) $(TARGET_GCC_ARGS) -C $(GCC_BUILD_DIR3) all
+	$(MAKE) -C $(GCC_BUILD_DIR3) all
 	touch $@
 
 #
