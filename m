From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Thu, 15 Jul 2021 09:48:36 +0900
Subject: [Buildroot] [PATCH v2 2/9] package/elf2flt: add RISC-V support
In-Reply-To: <20210715004843.337268-1-damien.lemoal@wdc.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
Message-ID: <20210715004843.337268-3-damien.lemoal@wdc.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>

Enable selecting elf2flt for RISC-V no MMU builds and add support for
it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../0004-elf2flt-add-riscv-support.patch      | 293 ++++++++++++++++++
 package/elf2flt/Config.in.host                |   2 +-
 2 files changed, 294 insertions(+), 1 deletion(-)
 create mode 100644 package/elf2flt/0004-elf2flt-add-riscv-support.patch

diff --git a/package/elf2flt/0004-elf2flt-add-riscv-support.patch b/package/elf2flt/0004-elf2flt-add-riscv-support.patch
new file mode 100644
index 0000000000..4a0bc6e4fa
--- /dev/null
+++ b/package/elf2flt/0004-elf2flt-add-riscv-support.patch
@@ -0,0 +1,293 @@
+From d096b496525e487b356ac180a7168c18703c1c43 Mon Sep 17 00:00:00 2001
+From: Christoph Hellwig <hch@lst.de>
+Date: Wed, 9 Sep 2020 17:31:33 +0900
+Subject: [PATCH] elf2flt: add riscv support
+
+We need a new linker script - riscv has a global_pointer and is
+very picky about some section ordering.
+
+Signed-off-by: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
+---
+ Makefile.in        |   4 +-
+ elf2flt.c          |  22 +++++
+ riscv64-elf2flt.ld | 198 +++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 223 insertions(+), 1 deletion(-)
+ create mode 100644 riscv64-elf2flt.ld
+
+diff --git a/Makefile.in b/Makefile.in
+index 0529c7f..121a2a7 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -44,7 +44,9 @@ endif
+ LDFILE= elf2flt.ld
+ ifeq ($(strip $(CPU)),e1)
+ SRC_LDFILE= $(srcdir)/$(CPU)-elf2flt.ld
+-else 
++else ifeq ($(strip $(CPU)),riscv64)
++SRC_LDFILE= $(srcdir)/$(CPU)-elf2flt.ld
++else
+ SRC_LDFILE= elf2flt.ld
+ endif
+ 
+diff --git a/elf2flt.c b/elf2flt.c
+index 3bcf4fe..0adba12 100644
+--- a/elf2flt.c
++++ b/elf2flt.c
+@@ -81,6 +81,8 @@ const char *elf2flt_progname;
+ #include <elf/v850.h>
+ #elif defined(TARGET_xtensa)
+ #include <elf/xtensa.h>
++#elif defined(TARGET_riscv64)
++#include <elf/riscv.h>
+ #endif
+ 
+ #if defined(__MINGW32__)
+@@ -123,6 +125,8 @@ const char *elf2flt_progname;
+ #define ARCH	"nios2"
+ #elif defined(TARGET_xtensa)
+ #define ARCH	"xtensa"
++#elif defined(TARGET_riscv64)
++#define ARCH    "riscv64"
+ #else
+ #error "Don't know how to support your CPU architecture??"
+ #endif
+@@ -820,6 +824,15 @@ output_relocs (
+ 					goto good_32bit_resolved_reloc;
+ 				default:
+ 					goto bad_resolved_reloc;
++#elif defined(TARGET_riscv64)
++				case R_RISCV_32_PCREL:
++				case R_RISCV_ADD32:
++				case R_RISCV_SUB32:
++					break;
++				case R_RISCV_64:
++					goto good_32bit_resolved_reloc;
++				default:
++					goto bad_resolved_reloc;
+ #else
+ 				default:
+ 					/* The default is to assume that the
+@@ -1840,6 +1853,15 @@ int main(int argc, char *argv[])
+   if (!load_to_ram && !pfile)
+     load_to_ram = 1;
+ 
++#ifdef TARGET_riscv64
++  /*
++   * riscv only supports loading text and data contiguously.
++   * So fail if load_to_ram is false.
++   */
++  if (!load_to_ram)
++    fatal("Loading to RAM ('-r' option) is required");
++#endif
++
+   fname = argv[argc-1];
+ 
+   if (pfile) {
+diff --git a/riscv64-elf2flt.ld b/riscv64-elf2flt.ld
+new file mode 100644
+index 0000000..74ab680
+--- /dev/null
++++ b/riscv64-elf2flt.ld
+@@ -0,0 +1,198 @@
++
++ENTRY (_start)
++
++MEMORY {
++	flatmem : ORIGIN = 0x0, LENGTH = 0xfffffff
++}
++
++PHDRS {
++	text PT_LOAD ;
++	data PT_LOAD ;
++}
++
++SECTIONS {
++
++	.text 0x0 : {
++		. = . + 4;
++		. = ALIGN(0x4) ;
++		_stext = . ;
++		*(.literal .text)
++		*(.literal.* .text.*)
++		*(.gnu.warning)
++		*(.stub)
++		*(.gnu.linkonce.literal.*)
++		*(.gnu.linkonce.t*)
++		*(.glue_7t)
++		*(.glue_7)
++		*(.jcr)
++		*(.init.literal)
++		KEEP (*(.init))
++		*(.fini.literal)
++		KEEP (*(.fini))
++
++W_RODAT		*(.rodata)
++W_RODAT		*(.rodata1)
++W_RODAT		*(.rodata.*)
++W_RODAT		*(.gnu.linkonce.r*)
++
++		/* This is special code area at the end of the normal
++		   text section.  It contains a small lookup table at
++		   the start followed by the code pointed to by entries
++		   in the lookup table.  */
++		. = ALIGN (4) ;
++		PROVIDE(__ctbp = .);
++		*(.call_table_data)
++		*(.call_table_text)
++
++		. = ALIGN(0x10) ;
++		_etext = . ;
++	} > flatmem :text
++
++	.data : {
++		. = ALIGN(0x20) ;
++		_sdata = . ;
++		__data_start = . ;
++		data_start = . ;
++		*(.got)
++		*(.got.plt)
++		*(.igot)
++		*(.igot.plt)
++		FILL(0) ;
++		. = ALIGN(0x20) ;
++		LONG(-1)
++		. = ALIGN(0x20) ;
++
++		__global_pointer$ = . + 0x800;
++
++R_RODAT		*(.rodata)
++R_RODAT		*(.rodata1)
++R_RODAT		*(.rodata.*)
++R_RODAT		*(.gnu.linkonce.r*)
++		*(.data)
++		*(.data1)
++		*(.data.*)
++		*(.gnu.linkonce.d*)
++
++		*(.gnu.linkonce.s.*)
++		*(__libc_atexit)
++		*(__libc_subinit)
++		*(__libc_subfreeres)
++
++		. = ALIGN(4) ;
++TOR:		__CTOR_LIST__ = .;
++TOR:		LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2)
++SINGLE_LINK:	/* gcc uses crtbegin.o to find the start of
++SINGLE_LINK:	   the constructors, so we make sure it is
++SINGLE_LINK:	   first.  Because this is a wildcard, it
++SINGLE_LINK:	   doesn't matter if the user does not
++SINGLE_LINK:	   actually link against crtbegin.o; the
++SINGLE_LINK:	   linker won't look for a file to match a
++SINGLE_LINK:	   wildcard.  The wildcard also means that it
++SINGLE_LINK:	   doesn't matter which directory crtbegin.o
++SINGLE_LINK:	   is in.  */
++SINGLE_LINK:	KEEP (*crtbegin*.o(.ctors))
++SINGLE_LINK:	/* We don't want to include the .ctor section from
++SINGLE_LINK:	   from the crtend.o file until after the sorted ctors.
++SINGLE_LINK:	   The .ctor section from the crtend file contains the
++SINGLE_LINK:	   end of ctors marker and it must be last */
++SINGLE_LINK:	KEEP (*(EXCLUDE_FILE (*crtend*.o ) .ctors))
++SINGLE_LINK:	KEEP (*(SORT(.ctors.*)))
++		KEEP (*(.ctors))
++TOR:		LONG(0)
++TOR:		__CTOR_END__ = .;
++TOR:		__DTOR_LIST__ = .;
++TOR:		LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2)
++SINGLE_LINK:	KEEP (*crtbegin*.o(.dtors))
++SINGLE_LINK:	KEEP (*(EXCLUDE_FILE (*crtend*.o ) .dtors))
++SINGLE_LINK:	KEEP (*(SORT(.dtors.*)))
++		KEEP (*(.dtors))
++TOR:		LONG(0)
++TOR:		__DTOR_END__ = .;
++
++		PROVIDE (__preinit_array_start = .);
++		KEEP (*(.preinit_array))
++		PROVIDE (__preinit_array_end = .);
++
++		PROVIDE (__init_array_start = .);
++		KEEP (*(SORT(.init_array.*)))
++		KEEP (*(.init_array))
++		PROVIDE (__init_array_end = .);
++
++		PROVIDE (__fini_array_start = .);
++		KEEP (*(.fini_array))
++		KEEP (*(SORT(.fini_array.*)))
++		PROVIDE (__fini_array_end = .);
++
++		. = ALIGN(0x10) ;
++		_edata = . ;
++	} > flatmem :data
++
++	.note.ABI-tag : { *(.note.ABI-tag) } > flatmem
++	.eh_frame_hdr : { *(.eh_frame_hdr) } > flatmem
++	.eh_frame : { KEEP(*(.eh_frame)) } > flatmem
++	.gcc_except_table : {
++		KEEP(*(.gcc_except_table))
++		KEEP(*(.gcc_except_table.*))
++	} > flatmem
++
++	.bss : {
++		. = ALIGN(0x4) ;
++		_sbss = ALIGN(0x4) ;
++		__bss_start = . ;
++		*(.dynsbss)
++		*(.sbss)
++		*(.sbss.*)
++		*(.scommon)
++		*(.dynbss)
++		*(.bss)
++		*(.bss.*)
++		*(.bss*)
++		*(.gnu.linkonce.b*)
++		*(COMMON)
++		. = ALIGN(0x10) ;
++		_ebss = . ;
++		_end = . ;
++		end = . ;
++	} > flatmem
++
++	.stack : {
++		. = ALIGN(0x4);
++		_stack_start = .;
++	} > flatmem
++
++	.junk 0 : { *(.rel*) *(.rela*) }
++	/DISCARD/ : { *(.note.GNU-stack) }
++	/* Stabs debugging sections.    */
++	.stab 0 : { *(.stab) }
++	.stabstr 0 : { *(.stabstr) }
++	.stab.excl 0 : { *(.stab.excl) }
++	.stab.exclstr 0 : { *(.stab.exclstr) }
++	.stab.index 0 : { *(.stab.index) }
++	.stab.indexstr 0 : { *(.stab.indexstr) }
++	.comment 0 : { *(.comment) }
++	/* DWARF debug sections.
++	   Symbols in the DWARF debugging sections are relative to the beginning
++	   of the section so we begin them at 0.  */
++	/* DWARF 1 */
++	.debug          0 : { *(.debug) }
++	.line           0 : { *(.line) }
++	/* GNU DWARF 1 extensions */
++	.debug_srcinfo  0 : { *(.debug_srcinfo) }
++	.debug_sfnames  0 : { *(.debug_sfnames) }
++	/* DWARF 1.1 and DWARF 2 */
++	.debug_aranges  0 : { *(.debug_aranges) }
++	.debug_pubnames 0 : { *(.debug_pubnames) }
++	/* DWARF 2 */
++	.debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
++	.debug_abbrev   0 : { *(.debug_abbrev) }
++	.debug_line     0 : { *(.debug_line) }
++	.debug_frame    0 : { *(.debug_frame) }
++	.debug_str      0 : { *(.debug_str) }
++	.debug_loc      0 : { *(.debug_loc) }
++	.debug_macinfo  0 : { *(.debug_macinfo) }
++	/* SGI/MIPS DWARF 2 extensions */
++	.debug_weaknames 0 : { *(.debug_weaknames) }
++	.debug_funcnames 0 : { *(.debug_funcnames) }
++	.debug_typenames 0 : { *(.debug_typenames) }
++	.debug_varnames  0 : { *(.debug_varnames) }
++}
+-- 
+2.30.2
+
diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index d6685a7ff6..2010526e04 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa
+	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_riscv
 	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
-- 
2.31.1
