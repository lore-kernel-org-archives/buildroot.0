From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Jun 2007 12:45:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/gmp package/mpfr
	toolchain/binut etc...
Message-ID: <20070606194546.9C30348076@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-06 12:45:46 -0700 (Wed, 06 Jun 2007)
New Revision: 18760

Log:
- prefer shared libs on the host


Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/toolchain/binutils/binutils.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2007-06-06 19:30:12 UTC (rev 18759)
+++ trunk/buildroot/package/gmp/gmp.mk	2007-06-06 19:45:46 UTC (rev 18760)
@@ -10,7 +10,7 @@
 GMP_DIR:=$(TOOL_BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_TARGET_DIR:=$(BUILD_DIR)/gmp-$(GMP_VERSION)
 GMP_BINARY:=libgmp$(LIBTGTEXT)
-GMP_HOST_BINARY:=libgmp$(HOST_LIBEXT)
+GMP_HOST_BINARY:=libgmp$(HOST_SHREXT)
 GMP_LIBVERSION:=3.4.1
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -123,7 +123,7 @@
 	);
 	touch $@
 
-$(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY): $(GMP_DIR2)/.configured
+$(GMP_HOST_DIR)/lib/libgmp$(HOST_LIBEXT)/lib/libgmp$(HOST_SHREXT): $(GMP_DIR2)/.configured
 	$(MAKE) -C $(GMP_DIR2) install
 
 host-libgmp: $(GMP_HOST_DIR)/lib/$(GMP_HOST_BINARY)

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2007-06-06 19:30:12 UTC (rev 18759)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2007-06-06 19:45:46 UTC (rev 18760)
@@ -12,7 +12,7 @@
 MPFR_DIR:=$(TOOL_BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_TARGET_DIR:=$(BUILD_DIR)/mpfr-$(MPFR_VERSION)
 MPFR_BINARY:=libmpfr$(LIBTGTEXT)
-MPFR_HOST_BINARY:=libmpfr$(HOST_LIBEXT)
+MPFR_HOST_BINARY:=libmpfr$(HOST_SHREXT)
 MPFR_LIBVERSION:=1.0.1
 
 ifeq ($(BR2_ENDIAN),"BIG")
@@ -140,7 +140,7 @@
 	);
 	touch $@
 
-$(MPFR_HOST_DIR)/lib/$(MPFR_HOST_BINARY): $(MPFR_DIR2)/.configured
+$(MPFR_HOST_DIR)/lib/libmpfr$(HOST_LIBEXT) $(MPFR_HOST_DIR)/lib/libmpfr$(HOST_SHREXT): $(MPFR_DIR2)/.configured
 	$(MAKE) -C $(MPFR_DIR2) install
 
 host-libmpfr: $(MPFR_HOST_DIR)/lib/$(MPFR_HOST_BINARY)

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-06-06 19:30:12 UTC (rev 18759)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-06-06 19:45:46 UTC (rev 18760)
@@ -49,8 +49,8 @@
 endif
 
 ifndef BINUTILS_NO_MPFR
-BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_LIBEXT) \
-	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_LIBEXT)
+BINUTILS_HOST_PREREQ:=$(TOOL_BUILD_DIR)/gmp/lib/libgmp$(HOST_SHREXT) \
+	$(TOOL_BUILD_DIR)/mpfr/lib/libmpfr$(HOST_SHREXT)
 
 BINUTILS_TARGET_PREREQ:=$(TARGET_DIR)/lib/libgmp$(LIBTGTEXT) \
 	$(TARGET_DIR)/lib/libmpfr$(LIBTGTEXT)
