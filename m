From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 14:26:54 -0500 (EST)
Subject: [Buildroot] [PATCH] fix configuration wrt elf2flt
Message-ID: <alpine.LFD.2.00.0812031426200.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The buildroot toolchain is installed in $(STAGING_DIR)/usr/bin and not
in $(STAGING_DIR)/bin so let,s adjust the --prefix accordingly.

Also the BFLT binary format is always stripped by definition, so it is
incompatible with any kind of stripping option.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: toolchain/elf2flt/elf2flt.mk
===================================================================
--- toolchain/elf2flt/elf2flt.mk	(revision 24233)
+++ toolchain/elf2flt/elf2flt.mk	(working copy)
@@ -25,11 +25,11 @@
 	(cd $(ELF2FLT_DIR); rm -rf config.cache; \
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
Index: Config.in
===================================================================
--- Config.in	(revision 24219)
+++ Config.in	(working copy)
@@ -246,14 +246,14 @@
 
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
 
