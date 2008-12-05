From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  5 Dec 2008 07:27:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/gmp package/mpfr
	toolchain/binut etc...
Message-ID: <20081205152728.D86353C8A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-05 07:27:26 -0800 (Fri, 05 Dec 2008)
New Revision: 24284

Log:
toolchain/*: use CONFIG_UPDATE

Based on e0e0945e in Bernhard's tree.

Modified:
   trunk/buildroot/package/gmp/gmp.mk
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/ccache/ccache.mk
   trunk/buildroot/toolchain/elf2flt/elf2flt.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/package/gmp/gmp.mk
===================================================================
--- trunk/buildroot/package/gmp/gmp.mk	2008-12-05 14:46:56 UTC (rev 24283)
+++ trunk/buildroot/package/gmp/gmp.mk	2008-12-05 15:27:26 UTC (rev 24284)
@@ -27,7 +27,7 @@
 $(GMP_DIR)/.unpacked: $(DL_DIR)/$(GMP_SOURCE)
 	$(GMP_CAT) $(DL_DIR)/$(GMP_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GMP_DIR) package/gmp/ \*.patch
-	$(CONFIG_UPDATE) $(GMP_DIR)
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 $(GMP_TARGET_DIR)/.configured: $(GMP_DIR)/.unpacked

Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2008-12-05 14:46:56 UTC (rev 24283)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2008-12-05 15:27:26 UTC (rev 24284)
@@ -30,7 +30,7 @@
 $(MPFR_DIR)/.unpacked: $(DL_DIR)/$(MPFR_SOURCE) $(MPFR_PATCH_SOURCE)
 	$(MPFR_CAT) $(DL_DIR)/$(MPFR_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(MPFR_DIR) package/mpfr/ \*.patch
-	$(CONFIG_UPDATE) $(MPFR_DIR)
+	$(CONFIG_UPDATE) $(@D)
 ifneq ($(MPFR_PATCH),)
 	( cd $(MPFR_DIR); patch -p1 -N -Z < $(MPFR_PATCH_SOURCE); )
 endif

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05 14:46:56 UTC (rev 24283)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-12-05 15:27:26 UTC (rev 24284)
@@ -88,7 +88,7 @@
 	mkdir -p $(TOOL_BUILD_DIR)
 	rm -rf $(BINUTILS_DIR)
 	$(BINUTILS_CAT) $(DL_DIR)/$(BINUTILS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(BINUTILS_DIR)
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 binutils-patched: $(BINUTILS_DIR)/.patched

Modified: trunk/buildroot/toolchain/ccache/ccache.mk
===================================================================
--- trunk/buildroot/toolchain/ccache/ccache.mk	2008-12-05 14:46:56 UTC (rev 24283)
+++ trunk/buildroot/toolchain/ccache/ccache.mk	2008-12-05 15:27:26 UTC (rev 24284)
@@ -29,6 +29,7 @@
 	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(BR2_CCACHE_DIR)\",g" \
 		$(CCACHE_DIR1)/ccache.c
 	mkdir -p $(CCACHE_DIR1)/cache
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 $(CCACHE_DIR1)/.configured: $(CCACHE_DIR1)/.patched

Modified: trunk/buildroot/toolchain/elf2flt/elf2flt.mk
===================================================================
--- trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2008-12-05 14:46:56 UTC (rev 24283)
+++ trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2008-12-05 15:27:26 UTC (rev 24284)
@@ -19,6 +19,7 @@
 	$(SED) "s,CROSS_COMPILE_PREFIX,$(REAL_GNU_TARGET_NAME),g;" toolchain/elf2flt/elf2flt.nios2.conditional
 	toolchain/patch-kernel.sh $(ELF2FLT_DIR) toolchain/elf2flt elf2flt.nios2.conditional
 endif
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 $(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-12-05 14:46:56 UTC (rev 24283)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2008-12-05 15:27:26 UTC (rev 24284)
@@ -144,7 +144,7 @@
 $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
 	mkdir -p $(TOOL_BUILD_DIR)
 	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(GCC_DIR)
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 gcc-patched: $(GCC_DIR)/.patched

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-12-05 14:46:56 UTC (rev 24283)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-12-05 15:27:26 UTC (rev 24284)
@@ -58,7 +58,7 @@
 	ln -sf $(TOOL_BUILD_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
 endif
 	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
-	$(CONFIG_UPDATE) $(GDB_DIR)
+	$(CONFIG_UPDATE) $(@D)
 	touch $@
 
 gdb-patched: $(GDB_DIR)/.unpacked
