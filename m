From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 06:32:40 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot:  toolchain/elf2flt
Message-ID: <20090128063240.3211E769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 06:32:39 +0000 (Wed, 28 Jan 2009)
New Revision: 25086

Log:
fix configuration wrt elf2flt

The buildroot toolchain is installed in $(STAGING_DIR)/usr/bin and not
in $(STAGING_DIR)/bin so let,s adjust the --prefix accordingly.

Also the BFLT binary format is always stripped by definition, so it is
incompatible with any kind of stripping option.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/toolchain/elf2flt/elf2flt.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2009-01-28 06:32:33 UTC (rev 25085)
+++ trunk/buildroot/Config.in	2009-01-28 06:32:39 UTC (rev 25086)
@@ -243,14 +243,14 @@
 
 config BR2_STRIP_strip
 	bool "strip"
-	depends on !BR2_ENABLE_DEBUG
+	depends on !BR2_ENABLE_DEBUG &&  !BR2_ELF2FLT
 	help
 	  strip   is the normal strip command
 
 config BR2_STRIP_sstrip
 	bool "sstrip"
 	select BR2_PACKAGE_SSTRIP_HOST
-	depends on !BR2_ENABLE_DEBUG
+	depends on !BR2_ENABLE_DEBUG && !BR2_ELF2FLT
 	help
 	  sstrip  is a strip that discards more than the normal strip
 

Modified: trunk/buildroot/toolchain/elf2flt/elf2flt.mk
===================================================================
--- trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2009-01-28 06:32:33 UTC (rev 25085)
+++ trunk/buildroot/toolchain/elf2flt/elf2flt.mk	2009-01-28 06:32:39 UTC (rev 25086)
@@ -27,11 +27,11 @@
 		LDFLAGS=-lz \
 		$(ELF2FLT_DIR)/configure \
 		--with-bfd-include-dir=$(BINUTILS_DIR1)/bfd/ \
-               --with-binutils-include-dir=$(BINUTILS_DIR)/include/ \
+		--with-binutils-include-dir=$(BINUTILS_DIR)/include/ \
 		--target=$(REAL_GNU_TARGET_NAME) \
 		--with-libbfd=$(BINUTILS_DIR1)/bfd/libbfd.a \
 		--with-libiberty=$(BINUTILS_DIR1)/libiberty/libiberty.a \
-		--prefix=$(STAGING_DIR))
+		--prefix=$(STAGING_DIR)/usr)
 	touch $@
 
 $(ELF2FLT_DIR)/$(ELF2FLT_BINARY): $(ELF2FLT_DIR)/.configured
