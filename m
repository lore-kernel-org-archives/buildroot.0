From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 19 Jan 2009 09:18:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package toolchain/gcc
Message-ID: <20090119091850.AC6D677182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-19 09:18:46 +0000 (Mon, 19 Jan 2009)
New Revision: 24907

Log:
toolchain: introduce HOSTCC_VERSION and fix gcc-4.3.x build with old host CCs

gcc < 4.2.0 doesn't support -Wno-overlength-stings, but gcc-4.3.x configure
fails to detect that, breaking the build.

Work around it by detecting the host gcc version (and store in HOSTCC_VERSION)
and set the proper configure variables for gcc < 4.2.0.

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-01-19 03:20:03 UTC (rev 24906)
+++ trunk/buildroot/package/Makefile.in	2009-01-19 09:18:46 UTC (rev 24907)
@@ -185,6 +185,10 @@
 FLEX:=$(shell which flex || type -p flex)
 BISON:=$(shell which bison || type -p bison)
 
+# hostcc version as an integer - E.G. 4.3.2 => 432
+HOSTCC_VERSION:=$(shell $(HOSTCC) --version | \
+	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
+
 HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 	-e 's/sparc.*/sparc/' \
 	-e 's/arm.*/arm/g' \

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-19 03:20:03 UTC (rev 24906)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-01-19 09:18:46 UTC (rev 24907)
@@ -145,6 +145,13 @@
 GCC_DECIMAL_FLOAT:=--disable-decimal-float
 endif
 
+# gcc version < 4.2.0 don't have -Wno-overlength-strings and the configure
+# script has problems detecting it, so help it
+ifeq ($(shell test $(HOSTCC_VERSION) -lt 420 && echo OLD),OLD)
+GCC_CONF_ENV:=acx_cv_prog_cc_pedantic__Wno_long_long__Wno_variadic_macros_____________Wno_overlength_strings=no \
+	acx_cv_prog_cc_warning__Wno_overlength_strings=no
+endif
+
 HOST_SOURCE+=gcc-source
 
 $(DL_DIR)/$(GCC_SOURCE):
@@ -227,7 +234,7 @@
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
 	# gcc >= 4.3.0 have to also build all-target-libgcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	$(MAKE) -C $(GCC_BUILD_DIR1) all-gcc all-target-libgcc
+	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc all-target-libgcc
 else
 	$(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 endif
@@ -301,7 +308,7 @@
 	touch $@
 
 $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
-	$(MAKE) -C $(GCC_BUILD_DIR2) all
+	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all
 	touch $@
 
 $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
