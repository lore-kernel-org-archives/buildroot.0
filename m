From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 09:27:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070708162726.92D5BA6881@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 09:27:25 -0700 (Sun, 08 Jul 2007)
New Revision: 19039

Log:
- unify the GCC_WITH_ configure options and make them active


Modified:
   trunk/buildroot/toolchain/gcc/Makefile.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Makefile.in	2007-07-08 13:55:49 UTC (rev 19038)
+++ trunk/buildroot/toolchain/gcc/Makefile.in	2007-07-08 16:27:25 UTC (rev 19039)
@@ -47,7 +47,20 @@
 SOFT_FLOAT_CONFIG_OPTION:=
 TARGET_SOFT_FLOAT:=
 ARCH_FPU_SUFFIX:=
+# some additional defaults
+ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ARCH))),)
+# ")))
+GCC_WITH_ARCH:=--with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
+ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_TUNE))),)
+# ")))
+GCC_WITH_TUNE:=--with-tune=$(BR2_GCC_TARGET_TUNE)
+endif
+ifneq ($(strip $(subst ",,$(BR2_GCC_TARGET_ABI))),)
+# ")))
+GCC_WITH_ABI:=--with-tune=$(BR2_GCC_TARGET_ABI)
+endif
+endif
 
 TARGET_GCC_FLAGS= CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
 	CXXFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-07-08 13:55:49 UTC (rev 19038)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-07-08 16:27:25 UTC (rev 19039)
@@ -173,7 +173,7 @@
 		$(THREADS) \
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
 	touch $@
 
@@ -233,7 +233,7 @@
 		$(THREADS) \
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
@@ -366,7 +366,7 @@
 		$(THREADS) \
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
@@ -400,10 +400,6 @@
 else
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
-#XXX: FIXME: cleanup BR2_ARCH selection and establish BR2_CPU
-#GCC_WITH_ARCH=--with-arch=$(BR2_ARCH)
-#GCC_WITH_TUNE=--with-tune=$(BR2_ARCH)
-#GCC_WITH_CPU=--with-cpu=$(BR2_ARCH)
 endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-08 13:55:49 UTC (rev 19038)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-07-08 16:27:25 UTC (rev 19039)
@@ -170,7 +170,7 @@
 		$(THREADS) \
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
 	touch $@
 
@@ -231,7 +231,7 @@
 		$(THREADS) \
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS));
@@ -366,7 +366,7 @@
 		$(THREADS) \
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_CPU) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
@@ -400,10 +400,6 @@
 else
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
-#XXX: FIXME: cleanup BR2_ARCH selection and establish BR2_CPU
-#GCC_WITH_ARCH=--with-arch=$(BR2_ARCH)
-#GCC_WITH_TUNE=--with-tune=$(BR2_ARCH)
-#GCC_WITH_CPU=--with-cpu=$(BR2_ARCH)
 endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
