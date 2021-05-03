From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 May 2021 13:13:43 +0200
Subject: [Buildroot] [PATCH 2/9] package/binutils: add upstream backported
 patches to support -mcmodel=large gcc option
In-Reply-To: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
References: <20210503111350.2933319-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210503111350.2933319-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream backported patches that allows using -mcmodel=large gcc option
that in order allows fixing build failure due to binutils bug 21464:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
 ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
 ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
 ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
 ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
 ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
 ...elocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++
 ...K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...ge-plt_relocs-when-generating-plt-en.patch | 500 ++++++++++++++++++
 12 files changed, 3268 insertions(+)
 create mode 100644 package/binutils/2.32/0011-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
 create mode 100644 package/binutils/2.32/0012-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
 create mode 100644 package/binutils/2.32/0013-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
 create mode 100644 package/binutils/2.34/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
 create mode 100644 package/binutils/2.34/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
 create mode 100644 package/binutils/2.34/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
 create mode 100644 package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
 create mode 100644 package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
 create mode 100644 package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
 create mode 100644 package/binutils/2.36.1/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
 create mode 100644 package/binutils/2.36.1/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
 create mode 100644 package/binutils/2.36.1/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch

diff --git a/package/binutils/2.32/0011-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch b/package/binutils/2.32/0011-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
new file mode 100644
index 0000000000..2ea3c3e7ac
--- /dev/null
+++ b/package/binutils/2.32/0011-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
@@ -0,0 +1,256 @@
+From b10e6230dea0015bf3b7748580b82c551f9a3a4a Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:15 +0900
+Subject: [PATCH 11/13] or1k: Implement relocation R_OR1K_GOT_AHI16 for gotha()
+
+The gotha() relocation mnemonic will be outputted by OpenRISC GCC when
+using the -mcmodel=large option.  This relocation is used along with
+got() to generate 32-bit GOT offsets.  This increases the previous GOT
+offset limit from the previous 16-bit (64K) limit.
+
+This is needed on large binaries where the GOT grows larger than 64k.
+
+bfd/ChangeLog:
+
+	PR 21464
+	* bfd-in2.h: Add BFD_RELOC_OR1K_GOT_AHI16 relocation.
+	* elf32-or1k.c (or1k_elf_howto_table, or1k_reloc_map): Likewise.
+	(or1k_final_link_relocate, or1k_elf_relocate_section,
+	or1k_elf_check_relocs): Likewise.
+	* libbfd.h (bfd_reloc_code_real_names): Likewise.
+	* reloc.c: Likewise.
+
+cpu/ChangeLog:
+
+	PR 21464
+	* or1k.opc (or1k_imm16_relocs, parse_reloc): Define parse logic
+	for gotha() relocation.
+
+include/ChangeLog:
+
+	PR 21464
+	* elf/or1k.h (elf_or1k_reloc_type): Define R_OR1K_GOT_AHI16 number.
+
+opcodes/ChangeLog:
+
+	PR 21464
+	* or1k-asm.c: Regenerate.
+
+gas/ChangeLog:
+
+	PR 21464
+	* testsuite/gas/or1k/reloc-1.s: Add test for new relocation.
+	* testsuite/gas/or1k/reloc-1.d: Add test result for new
+	relocation.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+
+fixup reloc, add tests
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/bfd-in2.h                    |  1 +
+ bfd/elf32-or1k.c                 | 21 ++++++++++++++++++++-
+ bfd/libbfd.h                     |  1 +
+ bfd/reloc.c                      |  2 ++
+ cpu/or1k.opc                     |  7 ++++++-
+ gas/testsuite/gas/or1k/reloc-1.d |  4 +++-
+ gas/testsuite/gas/or1k/reloc-1.s |  4 ++++
+ include/elf/or1k.h               |  1 +
+ opcodes/or1k-asm.c               |  7 ++++++-
+ 9 files changed, 44 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
+index e25da50aafb..530a41fca43 100644
+--- a/bfd/bfd-in2.h
++++ b/bfd/bfd-in2.h
+@@ -5517,6 +5517,7 @@ then it may be truncated to 8 bits.  */
+   BFD_RELOC_OR1K_TLS_TPOFF,
+   BFD_RELOC_OR1K_TLS_DTPOFF,
+   BFD_RELOC_OR1K_TLS_DTPMOD,
++  BFD_RELOC_OR1K_GOT_AHI16,
+ 
+ /* H8 elf Relocations.  */
+   BFD_RELOC_H8_DIR16A8,
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 1f2c88b0b3a..a4a64f73b7c 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -808,6 +808,20 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	 0,			/* Source Mask.  */
+ 	 0x03ffffff,		/* Dest Mask.  */
+ 	 TRUE),			/* PC relative offset?  */
++
++  HOWTO (R_OR1K_GOT_AHI16,     /* type */
++	16,                    /* rightshift */
++	2,                     /* size (0 = byte, 1 = short, 2 = long) */
++	16,                    /* bitsize */
++	FALSE,                 /* pc_relative */
++	0,                     /* bitpos */
++	complain_overflow_signed, /* complain_on_overflow */
++	bfd_elf_generic_reloc, /* special_function */
++	"R_OR1K_GOT_AHI16",    /* name */
++	FALSE,                 /* partial_inplace */
++	0,                     /* src_mask */
++	0xffff,                /* dst_mask */
++	FALSE),                /* pcrel_offset */
+ };
+ 
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+@@ -871,6 +885,7 @@ static const struct or1k_reloc_map or1k_reloc_map[] =
+   { BFD_RELOC_OR1K_TLS_IE_LO13,	R_OR1K_TLS_IE_LO13 },
+   { BFD_RELOC_OR1K_SLO13,	R_OR1K_SLO13 },
+   { BFD_RELOC_OR1K_PLTA26,	R_OR1K_PLTA26 },
++  { BFD_RELOC_OR1K_GOT_AHI16,	R_OR1K_GOT_AHI16 },
+ };
+ 
+ #define TLS_UNKNOWN    0
+@@ -1080,6 +1095,7 @@ or1k_final_link_relocate (reloc_howto_type *howto, bfd *input_bfd,
+   switch (howto->type)
+     {
+     case R_OR1K_AHI16:
++    case R_OR1K_GOT_AHI16:
+     case R_OR1K_GOTOFF_AHI16:
+     case R_OR1K_TLS_IE_AHI16:
+     case R_OR1K_TLS_LE_AHI16:
+@@ -1344,6 +1360,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    }
+ 	  break;
+ 
++	case R_OR1K_GOT_AHI16:
+ 	case R_OR1K_GOT16:
+ 	case R_OR1K_GOT_PG21:
+ 	case R_OR1K_GOT_LO13:
+@@ -1435,7 +1452,8 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    /* The GOT_PG21 and GOT_LO13 relocs are pc-relative,
+ 	       while the GOT16 reloc is GOT relative.  */
+ 	    relocation = got_base + off;
+-	    if (r_type == R_OR1K_GOT16)
++	    if (r_type == R_OR1K_GOT16
++		|| r_type == R_OR1K_GOT_AHI16)
+ 	      relocation -= got_sym_value;
+ 
+ 	  /* Addend should be zero.  */
+@@ -1945,6 +1963,7 @@ or1k_elf_check_relocs (bfd *abfd,
+ 	    }
+ 	  break;
+ 
++	case R_OR1K_GOT_AHI16:
+ 	case R_OR1K_GOT16:
+ 	case R_OR1K_GOT_PG21:
+ 	case R_OR1K_GOT_LO13:
+diff --git a/bfd/libbfd.h b/bfd/libbfd.h
+index 36284d71a9b..6e9e3190bb8 100644
+--- a/bfd/libbfd.h
++++ b/bfd/libbfd.h
+@@ -2702,6 +2702,7 @@ static const char *const bfd_reloc_code_real_names[] = { "@@uninitialized@@",
+   "BFD_RELOC_OR1K_TLS_TPOFF",
+   "BFD_RELOC_OR1K_TLS_DTPOFF",
+   "BFD_RELOC_OR1K_TLS_DTPMOD",
++  "BFD_RELOC_OR1K_GOT_AHI16",
+   "BFD_RELOC_H8_DIR16A8",
+   "BFD_RELOC_H8_DIR16R8",
+   "BFD_RELOC_H8_DIR24A8",
+diff --git a/bfd/reloc.c b/bfd/reloc.c
+index e6446a78098..b0003ab1175 100644
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -6164,6 +6164,8 @@ ENUMX
+   BFD_RELOC_OR1K_GOTPC_HI16
+ ENUMX
+   BFD_RELOC_OR1K_GOTPC_LO16
++ENUMX
++  BFD_RELOC_OR1K_GOT_AHI16
+ ENUMX
+   BFD_RELOC_OR1K_GOT16
+ ENUMX
+diff --git a/cpu/or1k.opc b/cpu/or1k.opc
+index 5082a30cee1..85163fc96c9 100644
+--- a/cpu/or1k.opc
++++ b/cpu/or1k.opc
+@@ -173,7 +173,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
+     BFD_RELOC_OR1K_GOT_LO13,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+-    BFD_RELOC_UNUSED },
++    BFD_RELOC_OR1K_GOT_AHI16 },
+   { BFD_RELOC_OR1K_GOTPC_LO16,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+@@ -276,6 +276,11 @@ parse_reloc (const char **strp)
+ 	str += 5;
+ 	cls = RCLASS_TPOFF;
+       }
++    else if (strncasecmp (str, "got", 3) == 0)
++      {
++	str += 3;
++	cls = RCLASS_GOT;
++      }
+ 
+     if (strncasecmp (str, "hi(", 3) == 0)
+       {
+diff --git a/gas/testsuite/gas/or1k/reloc-1.d b/gas/testsuite/gas/or1k/reloc-1.d
+index d1bcf5608bb..3a001c4ed99 100644
+--- a/gas/testsuite/gas/or1k/reloc-1.d
++++ b/gas/testsuite/gas/or1k/reloc-1.d
+@@ -68,5 +68,7 @@ OFFSET   TYPE              VALUE
+ 000000ec R_OR1K_LO13       x
+ 000000f0 R_OR1K_GOT_LO13   x
+ 000000f4 R_OR1K_SLO13      x
+-
++000000f8 R_OR1K_GOT_AHI16  x
++000000fc R_OR1K_GOT_AHI16  x
++00000100 R_OR1K_GOT_AHI16  x
+ 
+diff --git a/gas/testsuite/gas/or1k/reloc-1.s b/gas/testsuite/gas/or1k/reloc-1.s
+index e76abef6532..562609aa869 100644
+--- a/gas/testsuite/gas/or1k/reloc-1.s
++++ b/gas/testsuite/gas/or1k/reloc-1.s
+@@ -74,3 +74,7 @@
+ 	l.lbz	r5,po(x)(r3)
+ 	l.lbz	r5,gotpo(x)(r3)
+ 	l.sb	po(x)(r3),r6
++
++	l.movhi	r4,gotha(x)
++	l.ori	r3,r4,gotha(x)
++	l.addi	r3,r4,gotha(x)
+diff --git a/include/elf/or1k.h b/include/elf/or1k.h
+index 0abef046202..7db3cad18eb 100644
+--- a/include/elf/or1k.h
++++ b/include/elf/or1k.h
+@@ -77,6 +77,7 @@ START_RELOC_NUMBERS (elf_or1k_reloc_type)
+   RELOC_NUMBER (R_OR1K_TLS_IE_LO13,   51)
+   RELOC_NUMBER (R_OR1K_SLO13,         52)
+   RELOC_NUMBER (R_OR1K_PLTA26,        53)
++  RELOC_NUMBER (R_OR1K_GOT_AHI16,     54)
+ END_RELOC_NUMBERS (R_OR1K_max)
+ 
+ #define EF_OR1K_NODELAY (1UL << 0)
+diff --git a/opcodes/or1k-asm.c b/opcodes/or1k-asm.c
+index 7d058d03f5f..332f4b7a9b5 100644
+--- a/opcodes/or1k-asm.c
++++ b/opcodes/or1k-asm.c
+@@ -177,7 +177,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
+     BFD_RELOC_OR1K_GOT_LO13,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+-    BFD_RELOC_UNUSED },
++    BFD_RELOC_OR1K_GOT_AHI16 },
+   { BFD_RELOC_OR1K_GOTPC_LO16,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+@@ -280,6 +280,11 @@ parse_reloc (const char **strp)
+ 	str += 5;
+ 	cls = RCLASS_TPOFF;
+       }
++    else if (strncasecmp (str, "got", 3) == 0)
++      {
++	str += 3;
++	cls = RCLASS_GOT;
++      }
+ 
+     if (strncasecmp (str, "hi(", 3) == 0)
+       {
+-- 
+2.25.1
+
diff --git a/package/binutils/2.32/0012-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch b/package/binutils/2.32/0012-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
new file mode 100644
index 0000000000..c481aca5ec
--- /dev/null
+++ b/package/binutils/2.32/0012-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
@@ -0,0 +1,61 @@
+From 0f61f76454a9420f158f626cb09a4fbc08c3709e Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:16 +0900
+Subject: [PATCH 12/13] or1k: Avoid R_OR1K_GOT16 overflow failures in presence
+ of R_OR1K_GOT_AHI16
+
+Now that we support R_OR1K_GOT_AHI16 we can relax the R_OR1K_GOT16
+overflow validation check if the section has R_OR1K_GOT_AHI16.
+
+We cannot simple disable R_OR1K_GOT16 overflow validation as there will
+still be binaries that will have only R_OR1K_GOT16.  The
+R_OR1K_GOT_AHI16 relocation will only be added by GCC when building with
+the option -mcmodel=large.
+
+This assumes that R_OR1K_GOT_AHI16 will come before R_OR1K_GOT16, which
+is the code pattern that will be emitted by GCC.
+
+bfd/ChangeLog:
+
+	PR 21464
+	* elf32-or1k.c (or1k_elf_relocate_section): Relax R_OR1K_GOT16
+	overflow check if we have R_OR1K_GOT_AHI16 followed by
+	R_OR1K_GOT16.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index a4a64f73b7c..07fff3602a3 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -1248,6 +1248,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
+   asection *sgot, *splt;
+   bfd_vma plt_base, got_base, got_sym_value;
+   bfd_boolean ret_val = TRUE;
++  bfd_boolean saw_gotha = FALSE;
+ 
+   if (htab == NULL)
+     return FALSE;
+@@ -1456,6 +1457,16 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 		|| r_type == R_OR1K_GOT_AHI16)
+ 	      relocation -= got_sym_value;
+ 
++	    if (r_type == R_OR1K_GOT_AHI16)
++	      saw_gotha = TRUE;
++
++	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	       relocation we assume the code is doing the right thing to avoid
++	       overflows.  Here we mask the lower 16-bit of the relocation to
++	       avoid overflow validation failures.  */
++	    if (r_type == R_OR1K_GOT16 && saw_gotha)
++	      relocation &= 0xffff;
++
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+ 	    {
+-- 
+2.25.1
+
diff --git a/package/binutils/2.32/0013-or1k-Support-large-plt_relocs-when-generating-plt-en.patch b/package/binutils/2.32/0013-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
new file mode 100644
index 0000000000..fd191221e5
--- /dev/null
+++ b/package/binutils/2.32/0013-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
@@ -0,0 +1,500 @@
+From 36c7de7ef77ab0c30cb33e2c7ea7a6f4e3052c73 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:17 +0900
+Subject: [PATCH 13/13] or1k: Support large plt_relocs when generating plt
+ entries
+
+The current PLT generation code will generate invalid code when the PLT
+relocation offset exceeds 64k.  This fixes the issue by detecting large
+plt_reloc offsets and generare code sequences to create larger plt
+relocations.
+
+The "large" plt code needs 2 extra instructions to create 32-bit offsets.
+
+bfd/ChangeLog:
+
+	PR 27746
+	* elf32-or1k.c (PLT_ENTRY_SIZE_LARGE, PLT_MAX_INSN_COUNT,
+	OR1K_ADD, OR1K_ORI): New macros to help with plt creation.
+	(elf_or1k_link_hash_table): New field plt_count.
+	(elf_or1k_link_hash_entry): New field plt_index.
+	(elf_or1k_plt_entry_size): New function.
+	(or1k_write_plt_entry): Update to support variable size PLTs.
+	(or1k_elf_finish_dynamic_sections): Use new or1k_write_plt_entry
+	API.
+	(or1k_elf_finish_dynamic_symbol): Update to write large PLTs
+	when needed.
+	(allocate_dynrelocs): Use elf_or1k_plt_entry_size to account for
+	PLT size.
+
+ld/ChangeLog:
+
+	PR 27746
+	testsuite/ld-or1k/or1k.exp (or1kplttests): Add tests for linking
+	along with gotha() relocations.
+	testsuite/ld-or1k/gotha1.dd: New file.
+	testsuite/ld-or1k/gotha1.s: New file.
+	testsuite/ld-or1k/gotha2.dd: New file.
+	testsuite/ld-or1k/gotha2.s: New file
+	testsuite/ld-or1k/pltlib.s (x): Define size to avoid link
+	failure.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c               | 149 ++++++++++++++++++++++++---------
+ ld/testsuite/ld-or1k/gotha1.dd |  34 ++++++++
+ ld/testsuite/ld-or1k/gotha1.s  |  24 ++++++
+ ld/testsuite/ld-or1k/gotha2.dd |  21 +++++
+ ld/testsuite/ld-or1k/gotha2.s  |  22 +++++
+ ld/testsuite/ld-or1k/or1k.exp  |   8 ++
+ ld/testsuite/ld-or1k/pltlib.s  |   1 +
+ 7 files changed, 220 insertions(+), 39 deletions(-)
+ create mode 100644 ld/testsuite/ld-or1k/gotha1.dd
+ create mode 100644 ld/testsuite/ld-or1k/gotha1.s
+ create mode 100644 ld/testsuite/ld-or1k/gotha2.dd
+ create mode 100644 ld/testsuite/ld-or1k/gotha2.s
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 07fff3602a3..fcebbe5f23a 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -30,10 +30,14 @@
+ #define N_ONES(X)	(((bfd_vma)2 << (X)) - 1)
+ 
+ #define PLT_ENTRY_SIZE 16
++#define PLT_ENTRY_SIZE_LARGE (6*4)
++#define PLT_MAX_INSN_COUNT 6
+ 
+ #define OR1K_MOVHI(D)		(0x18000000 | (D << 21))
+ #define OR1K_ADRP(D)		(0x08000000 | (D << 21))
+ #define OR1K_LWZ(D,A)		(0x84000000 | (D << 21) | (A << 16))
++#define OR1K_ADD(D,A,B)		(0xE0000000 | (D << 21) | (A << 16) | (B << 11))
++#define OR1K_ORI(D,A)		(0xA8000000 | (D << 21) | (A << 16))
+ #define OR1K_ORI0(D)		(0xA8000000 | (D << 21))
+ #define OR1K_JR(B)		(0x44000000 | (B << 11))
+ #define OR1K_NOP		0x15000000
+@@ -903,6 +907,8 @@ struct elf_or1k_link_hash_entry
+   /* Track dynamic relocs copied for this symbol.  */
+   struct elf_dyn_relocs *dyn_relocs;
+ 
++  /* For calculating PLT size.  */
++  bfd_vma plt_index;
+   /* Track type of TLS access.  */
+   unsigned char tls_type;
+ };
+@@ -930,9 +936,20 @@ struct elf_or1k_link_hash_table
+   /* Small local sym to section mapping cache.  */
+   struct sym_cache sym_sec;
+ 
++  bfd_vma plt_count;
+   bfd_boolean saw_plta;
+ };
+ 
++static size_t
++elf_or1k_plt_entry_size (bfd_vma plt_index)
++{
++  bfd_vma plt_reloc;
++
++  plt_reloc = plt_index * sizeof (Elf32_External_Rela);
++
++  return (plt_reloc > 0xffff) ? PLT_ENTRY_SIZE_LARGE : PLT_ENTRY_SIZE;
++}
++
+ /* Get the ELF linker hash table from a link_info structure.  */
+ #define or1k_elf_hash_table(p) \
+   (elf_hash_table_id ((struct elf_link_hash_table *) ((p)->hash)) \
+@@ -2176,33 +2193,46 @@ or1k_elf_check_relocs (bfd *abfd,
+ }
+ 
+ static void
+-or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insn1,
+-		      unsigned insn2, unsigned insn3, unsigned insnj)
++or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
++		      unsigned insns[], size_t insn_count)
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+-  unsigned insn4;
++  unsigned output_insns[PLT_MAX_INSN_COUNT];
++
++  /* Copy instructions into the output buffer.  */
++  for (size_t i = 0; i < insn_count; i++)
++    output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+-  if (insn3 == OR1K_NOP)
++  if (insns[insn_count-1] == OR1K_NOP)
+     {
+-      insn4 = insn3;
++      unsigned slot1, slot2;
++
+       if (nodelay)
+-	insn3 = insnj;
++	slot1 = insns[insn_count-2], slot2 = insnj;
+       else
+-	insn3 = insn2, insn2 = insnj;
++	slot1 = insnj, slot2 = insns[insn_count-2];
++
++      output_insns[insn_count-2] = slot1;
++      output_insns[insn_count-1] = slot2;
++      output_insns[insn_count]   = OR1K_NOP;
+     }
+   else
+     {
++      unsigned slot1, slot2;
++
+       if (nodelay)
+-	insn4 = insnj;
++	slot1 = insns[insn_count-1], slot2 = insnj;
+       else
+-	insn4 = insn3, insn3 = insnj;
++	slot1 = insnj, slot2 = insns[insn_count-1];
++
++      output_insns[insn_count-1] = slot1;
++      output_insns[insn_count]   = slot2;
+     }
+ 
+-  bfd_put_32 (output_bfd, insn1, contents);
+-  bfd_put_32 (output_bfd, insn2, contents + 4);
+-  bfd_put_32 (output_bfd, insn3, contents + 8);
+-  bfd_put_32 (output_bfd, insn4, contents + 12);
++  /* Write out the output buffer.  */
++  for (size_t i = 0; i < (insn_count+1); i++)
++    bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+ /* Finish up the dynamic sections.  */
+@@ -2269,7 +2299,8 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
+       splt = htab->root.splt;
+       if (splt && splt->size > 0)
+ 	{
+-	  unsigned plt0, plt1, plt2;
++	  unsigned plt[PLT_MAX_INSN_COUNT];
++	  size_t plt_insn_count = 3;
+ 	  bfd_vma got_addr = sgot->output_section->vma + sgot->output_offset;
+ 
+ 	  /* Note we force 16 byte alignment on the .got, so that
+@@ -2280,27 +2311,27 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
+ 	      bfd_vma pc = splt->output_section->vma + splt->output_offset;
+ 	      unsigned pa = ((got_addr >> 13) - (pc >> 13)) & 0x1fffff;
+ 	      unsigned po = got_addr & 0x1fff;
+-	      plt0 = OR1K_ADRP(12) | pa;
+-	      plt1 = OR1K_LWZ(15,12) | (po + 8);
+-	      plt2 = OR1K_LWZ(12,12) | (po + 4);
++	      plt[0] = OR1K_ADRP(12) | pa;
++	      plt[1] = OR1K_LWZ(15,12) | (po + 8);
++	      plt[2] = OR1K_LWZ(12,12) | (po + 4);
+ 	    }
+ 	  else if (bfd_link_pic (info))
+ 	    {
+-	      plt0 = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
+-	      plt1 = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
+-	      plt2 = OR1K_NOP;
++	      plt[0] = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
++	      plt[1] = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
++	      plt[2] = OR1K_NOP;
+ 	    }
+ 	  else
+ 	    {
+ 	      unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
+ 	      unsigned lo = got_addr & 0xffff;
+-	      plt0 = OR1K_MOVHI(12) | ha;
+-	      plt1 = OR1K_LWZ(15,12) | (lo + 8);
+-	      plt2 = OR1K_LWZ(12,12) | (lo + 4);
++	      plt[0] = OR1K_MOVHI(12) | ha;
++	      plt[1] = OR1K_LWZ(15,12) | (lo + 8);
++	      plt[2] = OR1K_LWZ(12,12) | (lo + 4);
+ 	    }
+ 
+-	  or1k_write_plt_entry (output_bfd, splt->contents,
+-				plt0, plt1, plt2, OR1K_JR(15));
++	  or1k_write_plt_entry (output_bfd, splt->contents, OR1K_JR(15),
++				plt, plt_insn_count);
+ 
+ 	  elf_section_data (splt->output_section)->this_hdr.sh_entsize = 4;
+ 	}
+@@ -2343,7 +2374,8 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 
+   if (h->plt.offset != (bfd_vma) -1)
+     {
+-      unsigned int plt0, plt1, plt2;
++      unsigned int plt[PLT_MAX_INSN_COUNT];
++      size_t plt_insn_count = 3;
+       asection *splt;
+       asection *sgot;
+       asection *srela;
+@@ -2355,6 +2387,7 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+       bfd_vma got_offset;
+       bfd_vma got_addr;
+       Elf_Internal_Rela rela;
++      bfd_boolean large_plt_entry;
+ 
+       /* This symbol has an entry in the procedure linkage table.  Set
+ 	 it up.  */
+@@ -2372,10 +2405,13 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 	 corresponds to this symbol.  This is the index of this symbol
+ 	 in all the symbols for which we are making plt entries.  The
+ 	 first entry in the procedure linkage table is reserved.  */
+-      plt_index = h->plt.offset / PLT_ENTRY_SIZE - 1;
++      plt_index = ((struct elf_or1k_link_hash_entry *) h)->plt_index;
+       plt_addr = plt_base_addr + h->plt.offset;
+       plt_reloc = plt_index * sizeof (Elf32_External_Rela);
+ 
++      large_plt_entry = (elf_or1k_plt_entry_size (plt_index)
++			 == PLT_ENTRY_SIZE_LARGE);
++
+       /* Get the offset into the .got table of the entry that
+ 	corresponds to this function.  Each .got entry is 4 bytes.
+ 	The first three are reserved.  */
+@@ -2387,27 +2423,57 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 	{
+ 	  unsigned pa = ((got_addr >> 13) - (plt_addr >> 13)) & 0x1fffff;
+ 	  unsigned po = (got_addr & 0x1fff);
+-	  plt0 = OR1K_ADRP(12) | pa;
+-	  plt1 = OR1K_LWZ(12,12) | po;
+-	  plt2 = OR1K_ORI0(11) | plt_reloc;
++	  plt[0] = OR1K_ADRP(12) | pa;
++	  plt[1] = OR1K_LWZ(12,12) | po;
++	  plt[2] = OR1K_ORI0(11) | plt_reloc;
+ 	}
+       else if (bfd_link_pic (info))
+ 	{
+-	  plt0 = OR1K_LWZ(12,16) | got_offset;
+-	  plt1 = OR1K_ORI0(11) | plt_reloc;
+-	  plt2 = OR1K_NOP;
++	  if (large_plt_entry)
++	    {
++	      unsigned gotha = ((got_offset + 0x8000) >> 16) & 0xffff;
++	      unsigned got = got_offset & 0xffff;
++	      unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
++	      unsigned pltrello = plt_reloc & 0xffff;
++
++	      plt[0] = OR1K_MOVHI(12) | gotha;
++	      plt[1] = OR1K_ADD(12,12,16);
++	      plt[2] = OR1K_LWZ(12,12) | got;
++	      plt[3] = OR1K_MOVHI(11) | pltrelhi;
++	      plt[4] = OR1K_ORI(11,11) | pltrello;
++	      plt_insn_count = 5;
++	    }
++	  else
++	    {
++	      plt[0] = OR1K_LWZ(12,16) | got_offset;
++	      plt[1] = OR1K_ORI0(11) | plt_reloc;
++	      plt[2] = OR1K_NOP;
++	    }
+ 	}
+       else
+ 	{
+ 	  unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
+ 	  unsigned lo = got_addr & 0xffff;
+-	  plt0 = OR1K_MOVHI(12) | ha;
+-	  plt1 = OR1K_LWZ(12,12) | lo;
+-	  plt2 = OR1K_ORI0(11) | plt_reloc;
++	  plt[0] = OR1K_MOVHI(12) | ha;
++	  plt[1] = OR1K_LWZ(12,12) | lo;
++	  plt[2] = OR1K_ORI0(11) | plt_reloc;
++	}
++
++      /* For large code model we fixup the non-PIC PLT relocation instructions
++	 here.  */
++      if (large_plt_entry && !bfd_link_pic (info))
++	{
++	  unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
++	  unsigned pltrello = plt_reloc & 0xffff;
++
++	  plt[2] = OR1K_MOVHI(11) | pltrelhi;
++	  plt[3] = OR1K_ORI(11,11) | pltrello;
++	  plt[4] = OR1K_NOP;
++	  plt_insn_count = 5;
+ 	}
+ 
+       or1k_write_plt_entry (output_bfd, splt->contents + h->plt.offset,
+-			    plt0, plt1, plt2, OR1K_JR(12));
++			    OR1K_JR(12), plt, plt_insn_count);
+ 
+       /* Fill in the entry in the global offset table.  */
+       bfd_put_32 (output_bfd, plt_addr, sgot->contents + got_offset);
+@@ -2699,11 +2765,16 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+       if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (1, bfd_link_pic (info), h))
+ 	{
+ 	  asection *s = htab->root.splt;
++	  bfd_vma plt_index;
++
++	  /* Track the index of our plt entry for use in calculating size.  */
++	  plt_index = htab->plt_count++;
++	  ((struct elf_or1k_link_hash_entry *) h)->plt_index = plt_index;
+ 
+ 	  /* If this is the first .plt entry, make room for the special
+ 	     first entry.  */
+ 	  if (s->size == 0)
+-	    s->size = PLT_ENTRY_SIZE;
++	    s->size = elf_or1k_plt_entry_size (plt_index);
+ 
+ 	  h->plt.offset = s->size;
+ 
+@@ -2720,7 +2791,7 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+ 	    }
+ 
+ 	  /* Make room for this entry.  */
+-	  s->size += PLT_ENTRY_SIZE;
++	  s->size += elf_or1k_plt_entry_size (plt_index);
+ 
+ 	  /* We also need to make an entry in the .got.plt section, which
+ 	     will be placed in the .got section by the linker script.  */
+diff --git a/ld/testsuite/ld-or1k/gotha1.dd b/ld/testsuite/ld-or1k/gotha1.dd
+new file mode 100644
+index 00000000000..0ad1f8f5399
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha1.dd
+@@ -0,0 +1,34 @@
++
++.*\.x:     file format elf32-or1k
++
++
++Disassembly of section \.plt:
++
++[0-9a-f]+ <\.plt>:
++ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
++ +[0-9a-f]+:	85 ec [0-9a-f]+ [0-9a-f]+ 	l\.lwz r15,[0-9]+\(r12\)
++ +[0-9a-f]+:	44 00 78 00 	l\.jr r15
++ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
++ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
++ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
++ +[0-9a-f]+:	44 00 60 00 	l\.jr r12
++ +[0-9a-f]+:	a9 60 00 00 	l\.ori r11,r0,0x0
++
++Disassembly of section \.text:
++
++[0-9a-f]+ <_start>:
++ +[0-9a-f]+:	9c 21 ff fc 	l\.addi r1,r1,-4
++ +[0-9a-f]+:	d4 01 48 00 	l\.sw 0\(r1\),r9
++ +[0-9a-f]+:	04 00 00 02 	l\.jal [0-9a-f]+ <_start\+0x10>
++ +[0-9a-f]+:	1a 60 00 00 	l\.movhi r19,0x0
++ +[0-9a-f]+:	aa 73 [0-9a-f]+ [0-9a-f]+ 	l\.ori r19,r19,0x[0-9a-f]+
++ +[0-9a-f]+:	e2 73 48 00 	l\.add r19,r19,r9
++ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
++ +[0-9a-f]+:	e2 31 98 00 	l\.add r17,r17,r19
++ +[0-9a-f]+:	86 31 00 10 	l\.lwz r17,16\(r17\)
++ +[0-9a-f]+:	84 71 00 00 	l\.lwz r3,0\(r17\)
++ +[0-9a-f]+:	07 ff ff f2 	l\.jal [0-9a-f]+ <\.plt\+0x10>
++ +[0-9a-f]+:	15 00 00 00 	l\.nop 0x0
++ +[0-9a-f]+:	85 21 00 00 	l\.lwz r9,0\(r1\)
++ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
++ +[0-9a-f]+:	9c 21 00 04 	l\.addi r1,r1,4
+diff --git a/ld/testsuite/ld-or1k/gotha1.s b/ld/testsuite/ld-or1k/gotha1.s
+new file mode 100644
+index 00000000000..42b16db425c
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha1.s
+@@ -0,0 +1,24 @@
++	.data
++	.p2align 16
++
++	.text
++	.globl	_start
++_start:
++	l.addi	r1, r1, -4
++	l.sw	0(r1), r9
++
++	l.jal	8
++	 l.movhi	r19, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
++	l.ori	r19, r19, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
++	l.add	r19, r19, r9
++
++	l.movhi	r17, gotha(x)
++	l.add	r17, r17, r19
++	l.lwz	r17, got(x)(r17)
++	l.lwz	r3, 0(r17)
++
++	l.jal	plt(func)
++	 l.nop
++	l.lwz	r9, 0(r1)
++	l.jr	r9
++	 l.addi	r1, r1, 4
+diff --git a/ld/testsuite/ld-or1k/gotha2.dd b/ld/testsuite/ld-or1k/gotha2.dd
+new file mode 100644
+index 00000000000..fe09da5466b
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha2.dd
+@@ -0,0 +1,21 @@
++
++.*\.x:     file format elf32-or1k
++
++
++Disassembly of section \.text:
++
++[0-9a-f]+ <test>:
++ +[0-9a-f]+:	9c 21 ff f8 	l\.addi r1,r1,-8
++ +[0-9a-f]+:	d4 01 80 00 	l\.sw 0\(r1\),r16
++ +[0-9a-f]+:	d4 01 48 04 	l\.sw 4\(r1\),r9
++ +[0-9a-f]+:	04 00 [0-9a-f]+ [0-9a-f]+ 	l\.jal [0-9a-f]+ <test\+0x14>
++ +[0-9a-f]+:	1a 00 00 00 	l\.movhi r16,0x0
++ +[0-9a-f]+:	aa 10 [0-9a-f]+ [0-9a-f]+ 	l\.ori r16,r16,0x[0-9a-f]+
++ +[0-9a-f]+:	e2 10 48 00 	l\.add r16,r16,r9
++ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
++ +[0-9a-f]+:	e2 31 80 00 	l\.add r17,r17,r16
++ +[0-9a-f]+:	86 31 00 0c 	l\.lwz r17,12\(r17\)
++ +[0-9a-f]+:	85 21 00 04 	l\.lwz r9,4\(r1\)
++ +[0-9a-f]+:	86 01 00 00 	l\.lwz r16,0\(r1\)
++ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
++ +[0-9a-f]+:	9c 21 00 08 	l\.addi r1,r1,8
+diff --git a/ld/testsuite/ld-or1k/gotha2.s b/ld/testsuite/ld-or1k/gotha2.s
+new file mode 100644
+index 00000000000..164b282f2dd
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha2.s
+@@ -0,0 +1,22 @@
++	.section	.text
++	.align 4
++	.global	test
++	.type	test, @function
++test:
++	l.addi	r1, r1, -8
++	l.sw	0(r1), r16
++	l.sw	4(r1), r9
++
++	l.jal	8
++	 l.movhi	r16, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
++	l.ori	r16, r16, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
++	l.add	r16, r16, r9
++
++	l.movhi	r17, gotha(i)
++	l.add	r17, r17, r16
++	l.lwz	r17, got(i)(r17)
++
++	l.lwz	r9, 4(r1)
++	l.lwz	r16, 0(r1)
++	l.jr	r9
++	 l.addi	r1, r1, 8
+diff --git a/ld/testsuite/ld-or1k/or1k.exp b/ld/testsuite/ld-or1k/or1k.exp
+index 24cdbe5fbf3..9cebc49b946 100644
+--- a/ld/testsuite/ld-or1k/or1k.exp
++++ b/ld/testsuite/ld-or1k/or1k.exp
+@@ -53,6 +53,14 @@ set or1kplttests {
+      "" {plt1.s}
+      {{objdump -dr plt1.x.dd}}
+      "plt1.x"}
++    {"gotha exec plt" "tmpdir/libpltlib.so" ""
++     "" {gotha1.s}
++     {{objdump -dr gotha1.dd}}
++     "gotha1.x"}
++    {"gotha -fpic -shared" "-fpic -shared" ""
++     "" {gotha2.s}
++     {{objdump -dr gotha2.dd}}
++     "gotha2.x"}
+ }
+ 
+ # Not implemented yet
+diff --git a/ld/testsuite/ld-or1k/pltlib.s b/ld/testsuite/ld-or1k/pltlib.s
+index baf76ca1af7..8b4d7ba48fd 100644
+--- a/ld/testsuite/ld-or1k/pltlib.s
++++ b/ld/testsuite/ld-or1k/pltlib.s
+@@ -1,5 +1,6 @@
+ 	.section .data
+ 	.globl x, y
++	.size x, 4
+ x:	.long 33
+ y:	.long 44
+ 
+-- 
+2.25.1
+
diff --git a/package/binutils/2.34/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch b/package/binutils/2.34/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
new file mode 100644
index 0000000000..3a5a426f09
--- /dev/null
+++ b/package/binutils/2.34/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
@@ -0,0 +1,256 @@
+From 5fb945116ba058eb8f032f94ab2e0c71024388ec Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:15 +0900
+Subject: [PATCH 4/6] or1k: Implement relocation R_OR1K_GOT_AHI16 for gotha()
+
+The gotha() relocation mnemonic will be outputted by OpenRISC GCC when
+using the -mcmodel=large option.  This relocation is used along with
+got() to generate 32-bit GOT offsets.  This increases the previous GOT
+offset limit from the previous 16-bit (64K) limit.
+
+This is needed on large binaries where the GOT grows larger than 64k.
+
+bfd/ChangeLog:
+
+	PR 21464
+	* bfd-in2.h: Add BFD_RELOC_OR1K_GOT_AHI16 relocation.
+	* elf32-or1k.c (or1k_elf_howto_table, or1k_reloc_map): Likewise.
+	(or1k_final_link_relocate, or1k_elf_relocate_section,
+	or1k_elf_check_relocs): Likewise.
+	* libbfd.h (bfd_reloc_code_real_names): Likewise.
+	* reloc.c: Likewise.
+
+cpu/ChangeLog:
+
+	PR 21464
+	* or1k.opc (or1k_imm16_relocs, parse_reloc): Define parse logic
+	for gotha() relocation.
+
+include/ChangeLog:
+
+	PR 21464
+	* elf/or1k.h (elf_or1k_reloc_type): Define R_OR1K_GOT_AHI16 number.
+
+opcodes/ChangeLog:
+
+	PR 21464
+	* or1k-asm.c: Regenerate.
+
+gas/ChangeLog:
+
+	PR 21464
+	* testsuite/gas/or1k/reloc-1.s: Add test for new relocation.
+	* testsuite/gas/or1k/reloc-1.d: Add test result for new
+	relocation.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+
+fixup reloc, add tests
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/bfd-in2.h                    |  1 +
+ bfd/elf32-or1k.c                 | 21 ++++++++++++++++++++-
+ bfd/libbfd.h                     |  1 +
+ bfd/reloc.c                      |  2 ++
+ cpu/or1k.opc                     |  7 ++++++-
+ gas/testsuite/gas/or1k/reloc-1.d |  4 +++-
+ gas/testsuite/gas/or1k/reloc-1.s |  4 ++++
+ include/elf/or1k.h               |  1 +
+ opcodes/or1k-asm.c               |  7 ++++++-
+ 9 files changed, 44 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
+index 7c13bc8c91a..ae1082a67c2 100644
+--- a/bfd/bfd-in2.h
++++ b/bfd/bfd-in2.h
+@@ -5017,6 +5017,7 @@ then it may be truncated to 8 bits.  */
+   BFD_RELOC_OR1K_TLS_TPOFF,
+   BFD_RELOC_OR1K_TLS_DTPOFF,
+   BFD_RELOC_OR1K_TLS_DTPMOD,
++  BFD_RELOC_OR1K_GOT_AHI16,
+ 
+ /* H8 elf Relocations.  */
+   BFD_RELOC_H8_DIR16A8,
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 58246875546..1273fbacb3c 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -808,6 +808,20 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	 0,			/* Source Mask.  */
+ 	 0x03ffffff,		/* Dest Mask.  */
+ 	 TRUE),			/* PC relative offset?  */
++
++  HOWTO (R_OR1K_GOT_AHI16,     /* type */
++	16,                    /* rightshift */
++	2,                     /* size (0 = byte, 1 = short, 2 = long) */
++	16,                    /* bitsize */
++	FALSE,                 /* pc_relative */
++	0,                     /* bitpos */
++	complain_overflow_signed, /* complain_on_overflow */
++	bfd_elf_generic_reloc, /* special_function */
++	"R_OR1K_GOT_AHI16",    /* name */
++	FALSE,                 /* partial_inplace */
++	0,                     /* src_mask */
++	0xffff,                /* dst_mask */
++	FALSE),                /* pcrel_offset */
+ };
+ 
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+@@ -871,6 +885,7 @@ static const struct or1k_reloc_map or1k_reloc_map[] =
+   { BFD_RELOC_OR1K_TLS_IE_LO13,	R_OR1K_TLS_IE_LO13 },
+   { BFD_RELOC_OR1K_SLO13,	R_OR1K_SLO13 },
+   { BFD_RELOC_OR1K_PLTA26,	R_OR1K_PLTA26 },
++  { BFD_RELOC_OR1K_GOT_AHI16,	R_OR1K_GOT_AHI16 },
+ };
+ 
+ #define TLS_UNKNOWN    0
+@@ -1080,6 +1095,7 @@ or1k_final_link_relocate (reloc_howto_type *howto, bfd *input_bfd,
+   switch (howto->type)
+     {
+     case R_OR1K_AHI16:
++    case R_OR1K_GOT_AHI16:
+     case R_OR1K_GOTOFF_AHI16:
+     case R_OR1K_TLS_IE_AHI16:
+     case R_OR1K_TLS_LE_AHI16:
+@@ -1344,6 +1360,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    }
+ 	  break;
+ 
++	case R_OR1K_GOT_AHI16:
+ 	case R_OR1K_GOT16:
+ 	case R_OR1K_GOT_PG21:
+ 	case R_OR1K_GOT_LO13:
+@@ -1435,7 +1452,8 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    /* The GOT_PG21 and GOT_LO13 relocs are pc-relative,
+ 	       while the GOT16 reloc is GOT relative.  */
+ 	    relocation = got_base + off;
+-	    if (r_type == R_OR1K_GOT16)
++	    if (r_type == R_OR1K_GOT16
++		|| r_type == R_OR1K_GOT_AHI16)
+ 	      relocation -= got_sym_value;
+ 
+ 	  /* Addend should be zero.  */
+@@ -1943,6 +1961,7 @@ or1k_elf_check_relocs (bfd *abfd,
+ 	    }
+ 	  break;
+ 
++	case R_OR1K_GOT_AHI16:
+ 	case R_OR1K_GOT16:
+ 	case R_OR1K_GOT_PG21:
+ 	case R_OR1K_GOT_LO13:
+diff --git a/bfd/libbfd.h b/bfd/libbfd.h
+index d97d4e57a77..9edc71e0558 100644
+--- a/bfd/libbfd.h
++++ b/bfd/libbfd.h
+@@ -2704,6 +2704,7 @@ static const char *const bfd_reloc_code_real_names[] = { "@@uninitialized@@",
+   "BFD_RELOC_OR1K_TLS_TPOFF",
+   "BFD_RELOC_OR1K_TLS_DTPOFF",
+   "BFD_RELOC_OR1K_TLS_DTPMOD",
++  "BFD_RELOC_OR1K_GOT_AHI16",
+   "BFD_RELOC_H8_DIR16A8",
+   "BFD_RELOC_H8_DIR16R8",
+   "BFD_RELOC_H8_DIR24A8",
+diff --git a/bfd/reloc.c b/bfd/reloc.c
+index 33cd67150cf..f57ad14a501 100644
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -6175,6 +6175,8 @@ ENUMX
+   BFD_RELOC_OR1K_GOTPC_HI16
+ ENUMX
+   BFD_RELOC_OR1K_GOTPC_LO16
++ENUMX
++  BFD_RELOC_OR1K_GOT_AHI16
+ ENUMX
+   BFD_RELOC_OR1K_GOT16
+ ENUMX
+diff --git a/cpu/or1k.opc b/cpu/or1k.opc
+index f0adcbb00a5..5d20a1f33a7 100644
+--- a/cpu/or1k.opc
++++ b/cpu/or1k.opc
+@@ -193,7 +193,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
+     BFD_RELOC_OR1K_GOT_LO13,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+-    BFD_RELOC_UNUSED },
++    BFD_RELOC_OR1K_GOT_AHI16 },
+   { BFD_RELOC_OR1K_GOTPC_LO16,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+@@ -296,6 +296,11 @@ parse_reloc (const char **strp)
+ 	str += 5;
+ 	cls = RCLASS_TPOFF;
+       }
++    else if (strncasecmp (str, "got", 3) == 0)
++      {
++	str += 3;
++	cls = RCLASS_GOT;
++      }
+ 
+     if (strncasecmp (str, "hi(", 3) == 0)
+       {
+diff --git a/gas/testsuite/gas/or1k/reloc-1.d b/gas/testsuite/gas/or1k/reloc-1.d
+index d1bcf5608bb..3a001c4ed99 100644
+--- a/gas/testsuite/gas/or1k/reloc-1.d
++++ b/gas/testsuite/gas/or1k/reloc-1.d
+@@ -68,5 +68,7 @@ OFFSET   TYPE              VALUE
+ 000000ec R_OR1K_LO13       x
+ 000000f0 R_OR1K_GOT_LO13   x
+ 000000f4 R_OR1K_SLO13      x
+-
++000000f8 R_OR1K_GOT_AHI16  x
++000000fc R_OR1K_GOT_AHI16  x
++00000100 R_OR1K_GOT_AHI16  x
+ 
+diff --git a/gas/testsuite/gas/or1k/reloc-1.s b/gas/testsuite/gas/or1k/reloc-1.s
+index e76abef6532..562609aa869 100644
+--- a/gas/testsuite/gas/or1k/reloc-1.s
++++ b/gas/testsuite/gas/or1k/reloc-1.s
+@@ -74,3 +74,7 @@
+ 	l.lbz	r5,po(x)(r3)
+ 	l.lbz	r5,gotpo(x)(r3)
+ 	l.sb	po(x)(r3),r6
++
++	l.movhi	r4,gotha(x)
++	l.ori	r3,r4,gotha(x)
++	l.addi	r3,r4,gotha(x)
+diff --git a/include/elf/or1k.h b/include/elf/or1k.h
+index a215ef5c17e..dff37d875f2 100644
+--- a/include/elf/or1k.h
++++ b/include/elf/or1k.h
+@@ -77,6 +77,7 @@ START_RELOC_NUMBERS (elf_or1k_reloc_type)
+   RELOC_NUMBER (R_OR1K_TLS_IE_LO13,   51)
+   RELOC_NUMBER (R_OR1K_SLO13,         52)
+   RELOC_NUMBER (R_OR1K_PLTA26,        53)
++  RELOC_NUMBER (R_OR1K_GOT_AHI16,     54)
+ END_RELOC_NUMBERS (R_OR1K_max)
+ 
+ #define EF_OR1K_NODELAY (1UL << 0)
+diff --git a/opcodes/or1k-asm.c b/opcodes/or1k-asm.c
+index 4715c4f2826..a72a4e85363 100644
+--- a/opcodes/or1k-asm.c
++++ b/opcodes/or1k-asm.c
+@@ -177,7 +177,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
+     BFD_RELOC_OR1K_GOT_LO13,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+-    BFD_RELOC_UNUSED },
++    BFD_RELOC_OR1K_GOT_AHI16 },
+   { BFD_RELOC_OR1K_GOTPC_LO16,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+@@ -280,6 +280,11 @@ parse_reloc (const char **strp)
+ 	str += 5;
+ 	cls = RCLASS_TPOFF;
+       }
++    else if (strncasecmp (str, "got", 3) == 0)
++      {
++	str += 3;
++	cls = RCLASS_GOT;
++      }
+ 
+     if (strncasecmp (str, "hi(", 3) == 0)
+       {
+-- 
+2.25.1
+
diff --git a/package/binutils/2.34/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch b/package/binutils/2.34/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
new file mode 100644
index 0000000000..9a88d1407c
--- /dev/null
+++ b/package/binutils/2.34/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
@@ -0,0 +1,61 @@
+From d92116c7df340ff40063c5c97d202e7e87400027 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:16 +0900
+Subject: [PATCH 5/6] or1k: Avoid R_OR1K_GOT16 overflow failures in presence of
+ R_OR1K_GOT_AHI16
+
+Now that we support R_OR1K_GOT_AHI16 we can relax the R_OR1K_GOT16
+overflow validation check if the section has R_OR1K_GOT_AHI16.
+
+We cannot simple disable R_OR1K_GOT16 overflow validation as there will
+still be binaries that will have only R_OR1K_GOT16.  The
+R_OR1K_GOT_AHI16 relocation will only be added by GCC when building with
+the option -mcmodel=large.
+
+This assumes that R_OR1K_GOT_AHI16 will come before R_OR1K_GOT16, which
+is the code pattern that will be emitted by GCC.
+
+bfd/ChangeLog:
+
+	PR 21464
+	* elf32-or1k.c (or1k_elf_relocate_section): Relax R_OR1K_GOT16
+	overflow check if we have R_OR1K_GOT_AHI16 followed by
+	R_OR1K_GOT16.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 1273fbacb3c..ce2c4fdb3bd 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -1248,6 +1248,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
+   asection *sgot, *splt;
+   bfd_vma plt_base, got_base, got_sym_value;
+   bfd_boolean ret_val = TRUE;
++  bfd_boolean saw_gotha = FALSE;
+ 
+   if (htab == NULL)
+     return FALSE;
+@@ -1456,6 +1457,16 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 		|| r_type == R_OR1K_GOT_AHI16)
+ 	      relocation -= got_sym_value;
+ 
++	    if (r_type == R_OR1K_GOT_AHI16)
++	      saw_gotha = TRUE;
++
++	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	       relocation we assume the code is doing the right thing to avoid
++	       overflows.  Here we mask the lower 16-bit of the relocation to
++	       avoid overflow validation failures.  */
++	    if (r_type == R_OR1K_GOT16 && saw_gotha)
++	      relocation &= 0xffff;
++
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+ 	    {
+-- 
+2.25.1
+
diff --git a/package/binutils/2.34/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch b/package/binutils/2.34/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
new file mode 100644
index 0000000000..4032253ac0
--- /dev/null
+++ b/package/binutils/2.34/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
@@ -0,0 +1,500 @@
+From cba29e387040eaa401c52eb20e7cab5a4401185c Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:17 +0900
+Subject: [PATCH 6/6] or1k: Support large plt_relocs when generating plt
+ entries
+
+The current PLT generation code will generate invalid code when the PLT
+relocation offset exceeds 64k.  This fixes the issue by detecting large
+plt_reloc offsets and generare code sequences to create larger plt
+relocations.
+
+The "large" plt code needs 2 extra instructions to create 32-bit offsets.
+
+bfd/ChangeLog:
+
+	PR 27746
+	* elf32-or1k.c (PLT_ENTRY_SIZE_LARGE, PLT_MAX_INSN_COUNT,
+	OR1K_ADD, OR1K_ORI): New macros to help with plt creation.
+	(elf_or1k_link_hash_table): New field plt_count.
+	(elf_or1k_link_hash_entry): New field plt_index.
+	(elf_or1k_plt_entry_size): New function.
+	(or1k_write_plt_entry): Update to support variable size PLTs.
+	(or1k_elf_finish_dynamic_sections): Use new or1k_write_plt_entry
+	API.
+	(or1k_elf_finish_dynamic_symbol): Update to write large PLTs
+	when needed.
+	(allocate_dynrelocs): Use elf_or1k_plt_entry_size to account for
+	PLT size.
+
+ld/ChangeLog:
+
+	PR 27746
+	testsuite/ld-or1k/or1k.exp (or1kplttests): Add tests for linking
+	along with gotha() relocations.
+	testsuite/ld-or1k/gotha1.dd: New file.
+	testsuite/ld-or1k/gotha1.s: New file.
+	testsuite/ld-or1k/gotha2.dd: New file.
+	testsuite/ld-or1k/gotha2.s: New file
+	testsuite/ld-or1k/pltlib.s (x): Define size to avoid link
+	failure.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c               | 149 ++++++++++++++++++++++++---------
+ ld/testsuite/ld-or1k/gotha1.dd |  34 ++++++++
+ ld/testsuite/ld-or1k/gotha1.s  |  24 ++++++
+ ld/testsuite/ld-or1k/gotha2.dd |  21 +++++
+ ld/testsuite/ld-or1k/gotha2.s  |  22 +++++
+ ld/testsuite/ld-or1k/or1k.exp  |   8 ++
+ ld/testsuite/ld-or1k/pltlib.s  |   1 +
+ 7 files changed, 220 insertions(+), 39 deletions(-)
+ create mode 100644 ld/testsuite/ld-or1k/gotha1.dd
+ create mode 100644 ld/testsuite/ld-or1k/gotha1.s
+ create mode 100644 ld/testsuite/ld-or1k/gotha2.dd
+ create mode 100644 ld/testsuite/ld-or1k/gotha2.s
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index ce2c4fdb3bd..8b021b79d92 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -30,10 +30,14 @@
+ #define N_ONES(X)	(((bfd_vma)2 << (X)) - 1)
+ 
+ #define PLT_ENTRY_SIZE 16
++#define PLT_ENTRY_SIZE_LARGE (6*4)
++#define PLT_MAX_INSN_COUNT 6
+ 
+ #define OR1K_MOVHI(D)		(0x18000000 | (D << 21))
+ #define OR1K_ADRP(D)		(0x08000000 | (D << 21))
+ #define OR1K_LWZ(D,A)		(0x84000000 | (D << 21) | (A << 16))
++#define OR1K_ADD(D,A,B)		(0xE0000000 | (D << 21) | (A << 16) | (B << 11))
++#define OR1K_ORI(D,A)		(0xA8000000 | (D << 21) | (A << 16))
+ #define OR1K_ORI0(D)		(0xA8000000 | (D << 21))
+ #define OR1K_JR(B)		(0x44000000 | (B << 11))
+ #define OR1K_NOP		0x15000000
+@@ -903,6 +907,8 @@ struct elf_or1k_link_hash_entry
+   /* Track dynamic relocs copied for this symbol.  */
+   struct elf_dyn_relocs *dyn_relocs;
+ 
++  /* For calculating PLT size.  */
++  bfd_vma plt_index;
+   /* Track type of TLS access.  */
+   unsigned char tls_type;
+ };
+@@ -930,9 +936,20 @@ struct elf_or1k_link_hash_table
+   /* Small local sym to section mapping cache.  */
+   struct sym_cache sym_sec;
+ 
++  bfd_vma plt_count;
+   bfd_boolean saw_plta;
+ };
+ 
++static size_t
++elf_or1k_plt_entry_size (bfd_vma plt_index)
++{
++  bfd_vma plt_reloc;
++
++  plt_reloc = plt_index * sizeof (Elf32_External_Rela);
++
++  return (plt_reloc > 0xffff) ? PLT_ENTRY_SIZE_LARGE : PLT_ENTRY_SIZE;
++}
++
+ /* Get the ELF linker hash table from a link_info structure.  */
+ #define or1k_elf_hash_table(p) \
+   (elf_hash_table_id ((struct elf_link_hash_table *) ((p)->hash)) \
+@@ -2173,33 +2190,46 @@ or1k_elf_check_relocs (bfd *abfd,
+ }
+ 
+ static void
+-or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insn1,
+-		      unsigned insn2, unsigned insn3, unsigned insnj)
++or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
++		      unsigned insns[], size_t insn_count)
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+-  unsigned insn4;
++  unsigned output_insns[PLT_MAX_INSN_COUNT];
++
++  /* Copy instructions into the output buffer.  */
++  for (size_t i = 0; i < insn_count; i++)
++    output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+-  if (insn3 == OR1K_NOP)
++  if (insns[insn_count-1] == OR1K_NOP)
+     {
+-      insn4 = insn3;
++      unsigned slot1, slot2;
++
+       if (nodelay)
+-	insn3 = insnj;
++	slot1 = insns[insn_count-2], slot2 = insnj;
+       else
+-	insn3 = insn2, insn2 = insnj;
++	slot1 = insnj, slot2 = insns[insn_count-2];
++
++      output_insns[insn_count-2] = slot1;
++      output_insns[insn_count-1] = slot2;
++      output_insns[insn_count]   = OR1K_NOP;
+     }
+   else
+     {
++      unsigned slot1, slot2;
++
+       if (nodelay)
+-	insn4 = insnj;
++	slot1 = insns[insn_count-1], slot2 = insnj;
+       else
+-	insn4 = insn3, insn3 = insnj;
++	slot1 = insnj, slot2 = insns[insn_count-1];
++
++      output_insns[insn_count-1] = slot1;
++      output_insns[insn_count]   = slot2;
+     }
+ 
+-  bfd_put_32 (output_bfd, insn1, contents);
+-  bfd_put_32 (output_bfd, insn2, contents + 4);
+-  bfd_put_32 (output_bfd, insn3, contents + 8);
+-  bfd_put_32 (output_bfd, insn4, contents + 12);
++  /* Write out the output buffer.  */
++  for (size_t i = 0; i < (insn_count+1); i++)
++    bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+ /* Finish up the dynamic sections.  */
+@@ -2266,7 +2296,8 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
+       splt = htab->root.splt;
+       if (splt && splt->size > 0)
+ 	{
+-	  unsigned plt0, plt1, plt2;
++	  unsigned plt[PLT_MAX_INSN_COUNT];
++	  size_t plt_insn_count = 3;
+ 	  bfd_vma got_addr = sgot->output_section->vma + sgot->output_offset;
+ 
+ 	  /* Note we force 16 byte alignment on the .got, so that
+@@ -2277,27 +2308,27 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
+ 	      bfd_vma pc = splt->output_section->vma + splt->output_offset;
+ 	      unsigned pa = ((got_addr >> 13) - (pc >> 13)) & 0x1fffff;
+ 	      unsigned po = got_addr & 0x1fff;
+-	      plt0 = OR1K_ADRP(12) | pa;
+-	      plt1 = OR1K_LWZ(15,12) | (po + 8);
+-	      plt2 = OR1K_LWZ(12,12) | (po + 4);
++	      plt[0] = OR1K_ADRP(12) | pa;
++	      plt[1] = OR1K_LWZ(15,12) | (po + 8);
++	      plt[2] = OR1K_LWZ(12,12) | (po + 4);
+ 	    }
+ 	  else if (bfd_link_pic (info))
+ 	    {
+-	      plt0 = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
+-	      plt1 = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
+-	      plt2 = OR1K_NOP;
++	      plt[0] = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
++	      plt[1] = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
++	      plt[2] = OR1K_NOP;
+ 	    }
+ 	  else
+ 	    {
+ 	      unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
+ 	      unsigned lo = got_addr & 0xffff;
+-	      plt0 = OR1K_MOVHI(12) | ha;
+-	      plt1 = OR1K_LWZ(15,12) | (lo + 8);
+-	      plt2 = OR1K_LWZ(12,12) | (lo + 4);
++	      plt[0] = OR1K_MOVHI(12) | ha;
++	      plt[1] = OR1K_LWZ(15,12) | (lo + 8);
++	      plt[2] = OR1K_LWZ(12,12) | (lo + 4);
+ 	    }
+ 
+-	  or1k_write_plt_entry (output_bfd, splt->contents,
+-				plt0, plt1, plt2, OR1K_JR(15));
++	  or1k_write_plt_entry (output_bfd, splt->contents, OR1K_JR(15),
++				plt, plt_insn_count);
+ 
+ 	  elf_section_data (splt->output_section)->this_hdr.sh_entsize = 4;
+ 	}
+@@ -2340,7 +2371,8 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 
+   if (h->plt.offset != (bfd_vma) -1)
+     {
+-      unsigned int plt0, plt1, plt2;
++      unsigned int plt[PLT_MAX_INSN_COUNT];
++      size_t plt_insn_count = 3;
+       asection *splt;
+       asection *sgot;
+       asection *srela;
+@@ -2352,6 +2384,7 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+       bfd_vma got_offset;
+       bfd_vma got_addr;
+       Elf_Internal_Rela rela;
++      bfd_boolean large_plt_entry;
+ 
+       /* This symbol has an entry in the procedure linkage table.  Set
+ 	 it up.  */
+@@ -2369,10 +2402,13 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 	 corresponds to this symbol.  This is the index of this symbol
+ 	 in all the symbols for which we are making plt entries.  The
+ 	 first entry in the procedure linkage table is reserved.  */
+-      plt_index = h->plt.offset / PLT_ENTRY_SIZE - 1;
++      plt_index = ((struct elf_or1k_link_hash_entry *) h)->plt_index;
+       plt_addr = plt_base_addr + h->plt.offset;
+       plt_reloc = plt_index * sizeof (Elf32_External_Rela);
+ 
++      large_plt_entry = (elf_or1k_plt_entry_size (plt_index)
++			 == PLT_ENTRY_SIZE_LARGE);
++
+       /* Get the offset into the .got table of the entry that
+ 	corresponds to this function.  Each .got entry is 4 bytes.
+ 	The first three are reserved.  */
+@@ -2384,27 +2420,57 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 	{
+ 	  unsigned pa = ((got_addr >> 13) - (plt_addr >> 13)) & 0x1fffff;
+ 	  unsigned po = (got_addr & 0x1fff);
+-	  plt0 = OR1K_ADRP(12) | pa;
+-	  plt1 = OR1K_LWZ(12,12) | po;
+-	  plt2 = OR1K_ORI0(11) | plt_reloc;
++	  plt[0] = OR1K_ADRP(12) | pa;
++	  plt[1] = OR1K_LWZ(12,12) | po;
++	  plt[2] = OR1K_ORI0(11) | plt_reloc;
+ 	}
+       else if (bfd_link_pic (info))
+ 	{
+-	  plt0 = OR1K_LWZ(12,16) | got_offset;
+-	  plt1 = OR1K_ORI0(11) | plt_reloc;
+-	  plt2 = OR1K_NOP;
++	  if (large_plt_entry)
++	    {
++	      unsigned gotha = ((got_offset + 0x8000) >> 16) & 0xffff;
++	      unsigned got = got_offset & 0xffff;
++	      unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
++	      unsigned pltrello = plt_reloc & 0xffff;
++
++	      plt[0] = OR1K_MOVHI(12) | gotha;
++	      plt[1] = OR1K_ADD(12,12,16);
++	      plt[2] = OR1K_LWZ(12,12) | got;
++	      plt[3] = OR1K_MOVHI(11) | pltrelhi;
++	      plt[4] = OR1K_ORI(11,11) | pltrello;
++	      plt_insn_count = 5;
++	    }
++	  else
++	    {
++	      plt[0] = OR1K_LWZ(12,16) | got_offset;
++	      plt[1] = OR1K_ORI0(11) | plt_reloc;
++	      plt[2] = OR1K_NOP;
++	    }
+ 	}
+       else
+ 	{
+ 	  unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
+ 	  unsigned lo = got_addr & 0xffff;
+-	  plt0 = OR1K_MOVHI(12) | ha;
+-	  plt1 = OR1K_LWZ(12,12) | lo;
+-	  plt2 = OR1K_ORI0(11) | plt_reloc;
++	  plt[0] = OR1K_MOVHI(12) | ha;
++	  plt[1] = OR1K_LWZ(12,12) | lo;
++	  plt[2] = OR1K_ORI0(11) | plt_reloc;
++	}
++
++      /* For large code model we fixup the non-PIC PLT relocation instructions
++	 here.  */
++      if (large_plt_entry && !bfd_link_pic (info))
++	{
++	  unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
++	  unsigned pltrello = plt_reloc & 0xffff;
++
++	  plt[2] = OR1K_MOVHI(11) | pltrelhi;
++	  plt[3] = OR1K_ORI(11,11) | pltrello;
++	  plt[4] = OR1K_NOP;
++	  plt_insn_count = 5;
+ 	}
+ 
+       or1k_write_plt_entry (output_bfd, splt->contents + h->plt.offset,
+-			    plt0, plt1, plt2, OR1K_JR(12));
++			    OR1K_JR(12), plt, plt_insn_count);
+ 
+       /* Fill in the entry in the global offset table.  We initialize it to
+ 	 point to the top of the plt.  This is done to lazy lookup the actual
+@@ -2699,11 +2765,16 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+       if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (1, bfd_link_pic (info), h))
+ 	{
+ 	  asection *s = htab->root.splt;
++	  bfd_vma plt_index;
++
++	  /* Track the index of our plt entry for use in calculating size.  */
++	  plt_index = htab->plt_count++;
++	  ((struct elf_or1k_link_hash_entry *) h)->plt_index = plt_index;
+ 
+ 	  /* If this is the first .plt entry, make room for the special
+ 	     first entry.  */
+ 	  if (s->size == 0)
+-	    s->size = PLT_ENTRY_SIZE;
++	    s->size = elf_or1k_plt_entry_size (plt_index);
+ 
+ 	  h->plt.offset = s->size;
+ 
+@@ -2720,7 +2791,7 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+ 	    }
+ 
+ 	  /* Make room for this entry.  */
+-	  s->size += PLT_ENTRY_SIZE;
++	  s->size += elf_or1k_plt_entry_size (plt_index);
+ 
+ 	  /* We also need to make an entry in the .got.plt section, which
+ 	     will be placed in the .got section by the linker script.  */
+diff --git a/ld/testsuite/ld-or1k/gotha1.dd b/ld/testsuite/ld-or1k/gotha1.dd
+new file mode 100644
+index 00000000000..0ad1f8f5399
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha1.dd
+@@ -0,0 +1,34 @@
++
++.*\.x:     file format elf32-or1k
++
++
++Disassembly of section \.plt:
++
++[0-9a-f]+ <\.plt>:
++ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
++ +[0-9a-f]+:	85 ec [0-9a-f]+ [0-9a-f]+ 	l\.lwz r15,[0-9]+\(r12\)
++ +[0-9a-f]+:	44 00 78 00 	l\.jr r15
++ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
++ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
++ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
++ +[0-9a-f]+:	44 00 60 00 	l\.jr r12
++ +[0-9a-f]+:	a9 60 00 00 	l\.ori r11,r0,0x0
++
++Disassembly of section \.text:
++
++[0-9a-f]+ <_start>:
++ +[0-9a-f]+:	9c 21 ff fc 	l\.addi r1,r1,-4
++ +[0-9a-f]+:	d4 01 48 00 	l\.sw 0\(r1\),r9
++ +[0-9a-f]+:	04 00 00 02 	l\.jal [0-9a-f]+ <_start\+0x10>
++ +[0-9a-f]+:	1a 60 00 00 	l\.movhi r19,0x0
++ +[0-9a-f]+:	aa 73 [0-9a-f]+ [0-9a-f]+ 	l\.ori r19,r19,0x[0-9a-f]+
++ +[0-9a-f]+:	e2 73 48 00 	l\.add r19,r19,r9
++ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
++ +[0-9a-f]+:	e2 31 98 00 	l\.add r17,r17,r19
++ +[0-9a-f]+:	86 31 00 10 	l\.lwz r17,16\(r17\)
++ +[0-9a-f]+:	84 71 00 00 	l\.lwz r3,0\(r17\)
++ +[0-9a-f]+:	07 ff ff f2 	l\.jal [0-9a-f]+ <\.plt\+0x10>
++ +[0-9a-f]+:	15 00 00 00 	l\.nop 0x0
++ +[0-9a-f]+:	85 21 00 00 	l\.lwz r9,0\(r1\)
++ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
++ +[0-9a-f]+:	9c 21 00 04 	l\.addi r1,r1,4
+diff --git a/ld/testsuite/ld-or1k/gotha1.s b/ld/testsuite/ld-or1k/gotha1.s
+new file mode 100644
+index 00000000000..42b16db425c
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha1.s
+@@ -0,0 +1,24 @@
++	.data
++	.p2align 16
++
++	.text
++	.globl	_start
++_start:
++	l.addi	r1, r1, -4
++	l.sw	0(r1), r9
++
++	l.jal	8
++	 l.movhi	r19, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
++	l.ori	r19, r19, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
++	l.add	r19, r19, r9
++
++	l.movhi	r17, gotha(x)
++	l.add	r17, r17, r19
++	l.lwz	r17, got(x)(r17)
++	l.lwz	r3, 0(r17)
++
++	l.jal	plt(func)
++	 l.nop
++	l.lwz	r9, 0(r1)
++	l.jr	r9
++	 l.addi	r1, r1, 4
+diff --git a/ld/testsuite/ld-or1k/gotha2.dd b/ld/testsuite/ld-or1k/gotha2.dd
+new file mode 100644
+index 00000000000..fe09da5466b
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha2.dd
+@@ -0,0 +1,21 @@
++
++.*\.x:     file format elf32-or1k
++
++
++Disassembly of section \.text:
++
++[0-9a-f]+ <test>:
++ +[0-9a-f]+:	9c 21 ff f8 	l\.addi r1,r1,-8
++ +[0-9a-f]+:	d4 01 80 00 	l\.sw 0\(r1\),r16
++ +[0-9a-f]+:	d4 01 48 04 	l\.sw 4\(r1\),r9
++ +[0-9a-f]+:	04 00 [0-9a-f]+ [0-9a-f]+ 	l\.jal [0-9a-f]+ <test\+0x14>
++ +[0-9a-f]+:	1a 00 00 00 	l\.movhi r16,0x0
++ +[0-9a-f]+:	aa 10 [0-9a-f]+ [0-9a-f]+ 	l\.ori r16,r16,0x[0-9a-f]+
++ +[0-9a-f]+:	e2 10 48 00 	l\.add r16,r16,r9
++ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
++ +[0-9a-f]+:	e2 31 80 00 	l\.add r17,r17,r16
++ +[0-9a-f]+:	86 31 00 0c 	l\.lwz r17,12\(r17\)
++ +[0-9a-f]+:	85 21 00 04 	l\.lwz r9,4\(r1\)
++ +[0-9a-f]+:	86 01 00 00 	l\.lwz r16,0\(r1\)
++ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
++ +[0-9a-f]+:	9c 21 00 08 	l\.addi r1,r1,8
+diff --git a/ld/testsuite/ld-or1k/gotha2.s b/ld/testsuite/ld-or1k/gotha2.s
+new file mode 100644
+index 00000000000..164b282f2dd
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha2.s
+@@ -0,0 +1,22 @@
++	.section	.text
++	.align 4
++	.global	test
++	.type	test, @function
++test:
++	l.addi	r1, r1, -8
++	l.sw	0(r1), r16
++	l.sw	4(r1), r9
++
++	l.jal	8
++	 l.movhi	r16, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
++	l.ori	r16, r16, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
++	l.add	r16, r16, r9
++
++	l.movhi	r17, gotha(i)
++	l.add	r17, r17, r16
++	l.lwz	r17, got(i)(r17)
++
++	l.lwz	r9, 4(r1)
++	l.lwz	r16, 0(r1)
++	l.jr	r9
++	 l.addi	r1, r1, 8
+diff --git a/ld/testsuite/ld-or1k/or1k.exp b/ld/testsuite/ld-or1k/or1k.exp
+index 7592e8307c1..8e19ec6c31a 100644
+--- a/ld/testsuite/ld-or1k/or1k.exp
++++ b/ld/testsuite/ld-or1k/or1k.exp
+@@ -53,6 +53,14 @@ set or1kplttests {
+      "" {plt1.s}
+      {{objdump -dr plt1.x.dd}}
+      "plt1.x"}
++    {"gotha exec plt" "tmpdir/libpltlib.so" ""
++     "" {gotha1.s}
++     {{objdump -dr gotha1.dd}}
++     "gotha1.x"}
++    {"gotha -fpic -shared" "-fpic -shared" ""
++     "" {gotha2.s}
++     {{objdump -dr gotha2.dd}}
++     "gotha2.x"}
+ }
+ 
+ # Not implemented yet
+diff --git a/ld/testsuite/ld-or1k/pltlib.s b/ld/testsuite/ld-or1k/pltlib.s
+index baf76ca1af7..8b4d7ba48fd 100644
+--- a/ld/testsuite/ld-or1k/pltlib.s
++++ b/ld/testsuite/ld-or1k/pltlib.s
+@@ -1,5 +1,6 @@
+ 	.section .data
+ 	.globl x, y
++	.size x, 4
+ x:	.long 33
+ y:	.long 44
+ 
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch b/package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
new file mode 100644
index 0000000000..5c9e8c0617
--- /dev/null
+++ b/package/binutils/2.35.2/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
@@ -0,0 +1,256 @@
+From c67656e248d6dadaa2729975a17c8dd03afe48d0 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:15 +0900
+Subject: [PATCH 4/6] or1k: Implement relocation R_OR1K_GOT_AHI16 for gotha()
+
+The gotha() relocation mnemonic will be outputted by OpenRISC GCC when
+using the -mcmodel=large option.  This relocation is used along with
+got() to generate 32-bit GOT offsets.  This increases the previous GOT
+offset limit from the previous 16-bit (64K) limit.
+
+This is needed on large binaries where the GOT grows larger than 64k.
+
+bfd/ChangeLog:
+
+	PR 21464
+	* bfd-in2.h: Add BFD_RELOC_OR1K_GOT_AHI16 relocation.
+	* elf32-or1k.c (or1k_elf_howto_table, or1k_reloc_map): Likewise.
+	(or1k_final_link_relocate, or1k_elf_relocate_section,
+	or1k_elf_check_relocs): Likewise.
+	* libbfd.h (bfd_reloc_code_real_names): Likewise.
+	* reloc.c: Likewise.
+
+cpu/ChangeLog:
+
+	PR 21464
+	* or1k.opc (or1k_imm16_relocs, parse_reloc): Define parse logic
+	for gotha() relocation.
+
+include/ChangeLog:
+
+	PR 21464
+	* elf/or1k.h (elf_or1k_reloc_type): Define R_OR1K_GOT_AHI16 number.
+
+opcodes/ChangeLog:
+
+	PR 21464
+	* or1k-asm.c: Regenerate.
+
+gas/ChangeLog:
+
+	PR 21464
+	* testsuite/gas/or1k/reloc-1.s: Add test for new relocation.
+	* testsuite/gas/or1k/reloc-1.d: Add test result for new
+	relocation.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+
+fixup reloc, add tests
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/bfd-in2.h                    |  1 +
+ bfd/elf32-or1k.c                 | 21 ++++++++++++++++++++-
+ bfd/libbfd.h                     |  1 +
+ bfd/reloc.c                      |  2 ++
+ cpu/or1k.opc                     |  7 ++++++-
+ gas/testsuite/gas/or1k/reloc-1.d |  4 +++-
+ gas/testsuite/gas/or1k/reloc-1.s |  4 ++++
+ include/elf/or1k.h               |  1 +
+ opcodes/or1k-asm.c               |  7 ++++++-
+ 9 files changed, 44 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
+index df6f9f45673..ab861395e93 100644
+--- a/bfd/bfd-in2.h
++++ b/bfd/bfd-in2.h
+@@ -5041,6 +5041,7 @@ then it may be truncated to 8 bits.  */
+   BFD_RELOC_OR1K_TLS_TPOFF,
+   BFD_RELOC_OR1K_TLS_DTPOFF,
+   BFD_RELOC_OR1K_TLS_DTPMOD,
++  BFD_RELOC_OR1K_GOT_AHI16,
+ 
+ /* H8 elf Relocations.  */
+   BFD_RELOC_H8_DIR16A8,
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index bbfa2bfe614..8e395827123 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -808,6 +808,20 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	 0,			/* Source Mask.  */
+ 	 0x03ffffff,		/* Dest Mask.  */
+ 	 TRUE),			/* PC relative offset?  */
++
++  HOWTO (R_OR1K_GOT_AHI16,     /* type */
++	16,                    /* rightshift */
++	2,                     /* size (0 = byte, 1 = short, 2 = long) */
++	16,                    /* bitsize */
++	FALSE,                 /* pc_relative */
++	0,                     /* bitpos */
++	complain_overflow_signed, /* complain_on_overflow */
++	bfd_elf_generic_reloc, /* special_function */
++	"R_OR1K_GOT_AHI16",    /* name */
++	FALSE,                 /* partial_inplace */
++	0,                     /* src_mask */
++	0xffff,                /* dst_mask */
++	FALSE),                /* pcrel_offset */
+ };
+ 
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+@@ -871,6 +885,7 @@ static const struct or1k_reloc_map or1k_reloc_map[] =
+   { BFD_RELOC_OR1K_TLS_IE_LO13,	R_OR1K_TLS_IE_LO13 },
+   { BFD_RELOC_OR1K_SLO13,	R_OR1K_SLO13 },
+   { BFD_RELOC_OR1K_PLTA26,	R_OR1K_PLTA26 },
++  { BFD_RELOC_OR1K_GOT_AHI16,	R_OR1K_GOT_AHI16 },
+ };
+ 
+ /* tls_type is a mask used to track how each symbol is accessed,
+@@ -1113,6 +1128,7 @@ or1k_final_link_relocate (reloc_howto_type *howto, bfd *input_bfd,
+   switch (howto->type)
+     {
+     case R_OR1K_AHI16:
++    case R_OR1K_GOT_AHI16:
+     case R_OR1K_GOTOFF_AHI16:
+     case R_OR1K_TLS_IE_AHI16:
+     case R_OR1K_TLS_LE_AHI16:
+@@ -1375,6 +1391,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    }
+ 	  break;
+ 
++	case R_OR1K_GOT_AHI16:
+ 	case R_OR1K_GOT16:
+ 	case R_OR1K_GOT_PG21:
+ 	case R_OR1K_GOT_LO13:
+@@ -1466,7 +1483,8 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    /* The GOT_PG21 and GOT_LO13 relocs are pc-relative,
+ 	       while the GOT16 reloc is GOT relative.  */
+ 	    relocation = got_base + off;
+-	    if (r_type == R_OR1K_GOT16)
++	    if (r_type == R_OR1K_GOT16
++		|| r_type == R_OR1K_GOT_AHI16)
+ 	      relocation -= got_sym_value;
+ 
+ 	  /* Addend should be zero.  */
+@@ -1992,6 +2010,7 @@ or1k_elf_check_relocs (bfd *abfd,
+ 	    }
+ 	  break;
+ 
++	case R_OR1K_GOT_AHI16:
+ 	case R_OR1K_GOT16:
+ 	case R_OR1K_GOT_PG21:
+ 	case R_OR1K_GOT_LO13:
+diff --git a/bfd/libbfd.h b/bfd/libbfd.h
+index b97534fc9fe..795c9b9d27f 100644
+--- a/bfd/libbfd.h
++++ b/bfd/libbfd.h
+@@ -2755,6 +2755,7 @@ static const char *const bfd_reloc_code_real_names[] = { "@@uninitialized@@",
+   "BFD_RELOC_OR1K_TLS_TPOFF",
+   "BFD_RELOC_OR1K_TLS_DTPOFF",
+   "BFD_RELOC_OR1K_TLS_DTPMOD",
++  "BFD_RELOC_OR1K_GOT_AHI16",
+   "BFD_RELOC_H8_DIR16A8",
+   "BFD_RELOC_H8_DIR16R8",
+   "BFD_RELOC_H8_DIR24A8",
+diff --git a/bfd/reloc.c b/bfd/reloc.c
+index 9aba84ca81e..1e021febef2 100644
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -6175,6 +6175,8 @@ ENUMX
+   BFD_RELOC_OR1K_GOTPC_HI16
+ ENUMX
+   BFD_RELOC_OR1K_GOTPC_LO16
++ENUMX
++  BFD_RELOC_OR1K_GOT_AHI16
+ ENUMX
+   BFD_RELOC_OR1K_GOT16
+ ENUMX
+diff --git a/cpu/or1k.opc b/cpu/or1k.opc
+index f0adcbb00a5..5d20a1f33a7 100644
+--- a/cpu/or1k.opc
++++ b/cpu/or1k.opc
+@@ -193,7 +193,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
+     BFD_RELOC_OR1K_GOT_LO13,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+-    BFD_RELOC_UNUSED },
++    BFD_RELOC_OR1K_GOT_AHI16 },
+   { BFD_RELOC_OR1K_GOTPC_LO16,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+@@ -296,6 +296,11 @@ parse_reloc (const char **strp)
+ 	str += 5;
+ 	cls = RCLASS_TPOFF;
+       }
++    else if (strncasecmp (str, "got", 3) == 0)
++      {
++	str += 3;
++	cls = RCLASS_GOT;
++      }
+ 
+     if (strncasecmp (str, "hi(", 3) == 0)
+       {
+diff --git a/gas/testsuite/gas/or1k/reloc-1.d b/gas/testsuite/gas/or1k/reloc-1.d
+index d1bcf5608bb..3a001c4ed99 100644
+--- a/gas/testsuite/gas/or1k/reloc-1.d
++++ b/gas/testsuite/gas/or1k/reloc-1.d
+@@ -68,5 +68,7 @@ OFFSET   TYPE              VALUE
+ 000000ec R_OR1K_LO13       x
+ 000000f0 R_OR1K_GOT_LO13   x
+ 000000f4 R_OR1K_SLO13      x
+-
++000000f8 R_OR1K_GOT_AHI16  x
++000000fc R_OR1K_GOT_AHI16  x
++00000100 R_OR1K_GOT_AHI16  x
+ 
+diff --git a/gas/testsuite/gas/or1k/reloc-1.s b/gas/testsuite/gas/or1k/reloc-1.s
+index e76abef6532..562609aa869 100644
+--- a/gas/testsuite/gas/or1k/reloc-1.s
++++ b/gas/testsuite/gas/or1k/reloc-1.s
+@@ -74,3 +74,7 @@
+ 	l.lbz	r5,po(x)(r3)
+ 	l.lbz	r5,gotpo(x)(r3)
+ 	l.sb	po(x)(r3),r6
++
++	l.movhi	r4,gotha(x)
++	l.ori	r3,r4,gotha(x)
++	l.addi	r3,r4,gotha(x)
+diff --git a/include/elf/or1k.h b/include/elf/or1k.h
+index a215ef5c17e..dff37d875f2 100644
+--- a/include/elf/or1k.h
++++ b/include/elf/or1k.h
+@@ -77,6 +77,7 @@ START_RELOC_NUMBERS (elf_or1k_reloc_type)
+   RELOC_NUMBER (R_OR1K_TLS_IE_LO13,   51)
+   RELOC_NUMBER (R_OR1K_SLO13,         52)
+   RELOC_NUMBER (R_OR1K_PLTA26,        53)
++  RELOC_NUMBER (R_OR1K_GOT_AHI16,     54)
+ END_RELOC_NUMBERS (R_OR1K_max)
+ 
+ #define EF_OR1K_NODELAY (1UL << 0)
+diff --git a/opcodes/or1k-asm.c b/opcodes/or1k-asm.c
+index 5f3c6c74b12..e0c49b3b8cd 100644
+--- a/opcodes/or1k-asm.c
++++ b/opcodes/or1k-asm.c
+@@ -177,7 +177,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
+     BFD_RELOC_OR1K_GOT_LO13,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+-    BFD_RELOC_UNUSED },
++    BFD_RELOC_OR1K_GOT_AHI16 },
+   { BFD_RELOC_OR1K_GOTPC_LO16,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+@@ -280,6 +280,11 @@ parse_reloc (const char **strp)
+ 	str += 5;
+ 	cls = RCLASS_TPOFF;
+       }
++    else if (strncasecmp (str, "got", 3) == 0)
++      {
++	str += 3;
++	cls = RCLASS_GOT;
++      }
+ 
+     if (strncasecmp (str, "hi(", 3) == 0)
+       {
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch b/package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
new file mode 100644
index 0000000000..71baf4c69b
--- /dev/null
+++ b/package/binutils/2.35.2/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
@@ -0,0 +1,61 @@
+From 097b83a1c9c694a14e6081cee034bf24f16875c1 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:16 +0900
+Subject: [PATCH 5/6] or1k: Avoid R_OR1K_GOT16 overflow failures in presence of
+ R_OR1K_GOT_AHI16
+
+Now that we support R_OR1K_GOT_AHI16 we can relax the R_OR1K_GOT16
+overflow validation check if the section has R_OR1K_GOT_AHI16.
+
+We cannot simple disable R_OR1K_GOT16 overflow validation as there will
+still be binaries that will have only R_OR1K_GOT16.  The
+R_OR1K_GOT_AHI16 relocation will only be added by GCC when building with
+the option -mcmodel=large.
+
+This assumes that R_OR1K_GOT_AHI16 will come before R_OR1K_GOT16, which
+is the code pattern that will be emitted by GCC.
+
+bfd/ChangeLog:
+
+	PR 21464
+	* elf32-or1k.c (or1k_elf_relocate_section): Relax R_OR1K_GOT16
+	overflow check if we have R_OR1K_GOT_AHI16 followed by
+	R_OR1K_GOT16.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 8e395827123..9f315bfda99 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -1280,6 +1280,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
+   asection *sgot, *splt;
+   bfd_vma plt_base, got_base, got_sym_value;
+   bfd_boolean ret_val = TRUE;
++  bfd_boolean saw_gotha = FALSE;
+ 
+   if (htab == NULL)
+     return FALSE;
+@@ -1487,6 +1488,16 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 		|| r_type == R_OR1K_GOT_AHI16)
+ 	      relocation -= got_sym_value;
+ 
++	    if (r_type == R_OR1K_GOT_AHI16)
++	      saw_gotha = TRUE;
++
++	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	       relocation we assume the code is doing the right thing to avoid
++	       overflows.  Here we mask the lower 16-bit of the relocation to
++	       avoid overflow validation failures.  */
++	    if (r_type == R_OR1K_GOT16 && saw_gotha)
++	      relocation &= 0xffff;
++
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+ 	    {
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch b/package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
new file mode 100644
index 0000000000..6f5cf3ad4a
--- /dev/null
+++ b/package/binutils/2.35.2/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
@@ -0,0 +1,500 @@
+From c87692eb894b4b86eced7b7ba205f9bf27c2c213 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:17 +0900
+Subject: [PATCH 6/6] or1k: Support large plt_relocs when generating plt
+ entries
+
+The current PLT generation code will generate invalid code when the PLT
+relocation offset exceeds 64k.  This fixes the issue by detecting large
+plt_reloc offsets and generare code sequences to create larger plt
+relocations.
+
+The "large" plt code needs 2 extra instructions to create 32-bit offsets.
+
+bfd/ChangeLog:
+
+	PR 27746
+	* elf32-or1k.c (PLT_ENTRY_SIZE_LARGE, PLT_MAX_INSN_COUNT,
+	OR1K_ADD, OR1K_ORI): New macros to help with plt creation.
+	(elf_or1k_link_hash_table): New field plt_count.
+	(elf_or1k_link_hash_entry): New field plt_index.
+	(elf_or1k_plt_entry_size): New function.
+	(or1k_write_plt_entry): Update to support variable size PLTs.
+	(or1k_elf_finish_dynamic_sections): Use new or1k_write_plt_entry
+	API.
+	(or1k_elf_finish_dynamic_symbol): Update to write large PLTs
+	when needed.
+	(allocate_dynrelocs): Use elf_or1k_plt_entry_size to account for
+	PLT size.
+
+ld/ChangeLog:
+
+	PR 27746
+	testsuite/ld-or1k/or1k.exp (or1kplttests): Add tests for linking
+	along with gotha() relocations.
+	testsuite/ld-or1k/gotha1.dd: New file.
+	testsuite/ld-or1k/gotha1.s: New file.
+	testsuite/ld-or1k/gotha2.dd: New file.
+	testsuite/ld-or1k/gotha2.s: New file
+	testsuite/ld-or1k/pltlib.s (x): Define size to avoid link
+	failure.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c               | 149 ++++++++++++++++++++++++---------
+ ld/testsuite/ld-or1k/gotha1.dd |  34 ++++++++
+ ld/testsuite/ld-or1k/gotha1.s  |  24 ++++++
+ ld/testsuite/ld-or1k/gotha2.dd |  21 +++++
+ ld/testsuite/ld-or1k/gotha2.s  |  22 +++++
+ ld/testsuite/ld-or1k/or1k.exp  |   8 ++
+ ld/testsuite/ld-or1k/pltlib.s  |   1 +
+ 7 files changed, 220 insertions(+), 39 deletions(-)
+ create mode 100644 ld/testsuite/ld-or1k/gotha1.dd
+ create mode 100644 ld/testsuite/ld-or1k/gotha1.s
+ create mode 100644 ld/testsuite/ld-or1k/gotha2.dd
+ create mode 100644 ld/testsuite/ld-or1k/gotha2.s
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 9f315bfda99..7a14eaa3a46 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -30,10 +30,14 @@
+ #define N_ONES(X)	(((bfd_vma)2 << (X)) - 1)
+ 
+ #define PLT_ENTRY_SIZE 16
++#define PLT_ENTRY_SIZE_LARGE (6*4)
++#define PLT_MAX_INSN_COUNT 6
+ 
+ #define OR1K_MOVHI(D)		(0x18000000 | (D << 21))
+ #define OR1K_ADRP(D)		(0x08000000 | (D << 21))
+ #define OR1K_LWZ(D,A)		(0x84000000 | (D << 21) | (A << 16))
++#define OR1K_ADD(D,A,B)		(0xE0000000 | (D << 21) | (A << 16) | (B << 11))
++#define OR1K_ORI(D,A)		(0xA8000000 | (D << 21) | (A << 16))
+ #define OR1K_ORI0(D)		(0xA8000000 | (D << 21))
+ #define OR1K_JR(B)		(0x44000000 | (B << 11))
+ #define OR1K_NOP		0x15000000
+@@ -907,6 +911,8 @@ struct elf_or1k_link_hash_entry
+ {
+   struct elf_link_hash_entry root;
+ 
++  /* For calculating PLT size.  */
++  bfd_vma plt_index;
+   /* Track type of TLS access.  */
+   unsigned char tls_type;
+ };
+@@ -934,9 +940,20 @@ struct elf_or1k_link_hash_table
+   /* Small local sym to section mapping cache.  */
+   struct sym_cache sym_sec;
+ 
++  bfd_vma plt_count;
+   bfd_boolean saw_plta;
+ };
+ 
++static size_t
++elf_or1k_plt_entry_size (bfd_vma plt_index)
++{
++  bfd_vma plt_reloc;
++
++  plt_reloc = plt_index * sizeof (Elf32_External_Rela);
++
++  return (plt_reloc > 0xffff) ? PLT_ENTRY_SIZE_LARGE : PLT_ENTRY_SIZE;
++}
++
+ /* Get the ELF linker hash table from a link_info structure.  */
+ #define or1k_elf_hash_table(p) \
+   (elf_hash_table_id ((struct elf_link_hash_table *) ((p)->hash)) \
+@@ -2224,33 +2241,46 @@ or1k_elf_check_relocs (bfd *abfd,
+ }
+ 
+ static void
+-or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insn1,
+-		      unsigned insn2, unsigned insn3, unsigned insnj)
++or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
++		      unsigned insns[], size_t insn_count)
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+-  unsigned insn4;
++  unsigned output_insns[PLT_MAX_INSN_COUNT];
++
++  /* Copy instructions into the output buffer.  */
++  for (size_t i = 0; i < insn_count; i++)
++    output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+-  if (insn3 == OR1K_NOP)
++  if (insns[insn_count-1] == OR1K_NOP)
+     {
+-      insn4 = insn3;
++      unsigned slot1, slot2;
++
+       if (nodelay)
+-	insn3 = insnj;
++	slot1 = insns[insn_count-2], slot2 = insnj;
+       else
+-	insn3 = insn2, insn2 = insnj;
++	slot1 = insnj, slot2 = insns[insn_count-2];
++
++      output_insns[insn_count-2] = slot1;
++      output_insns[insn_count-1] = slot2;
++      output_insns[insn_count]   = OR1K_NOP;
+     }
+   else
+     {
++      unsigned slot1, slot2;
++
+       if (nodelay)
+-	insn4 = insnj;
++	slot1 = insns[insn_count-1], slot2 = insnj;
+       else
+-	insn4 = insn3, insn3 = insnj;
++	slot1 = insnj, slot2 = insns[insn_count-1];
++
++      output_insns[insn_count-1] = slot1;
++      output_insns[insn_count]   = slot2;
+     }
+ 
+-  bfd_put_32 (output_bfd, insn1, contents);
+-  bfd_put_32 (output_bfd, insn2, contents + 4);
+-  bfd_put_32 (output_bfd, insn3, contents + 8);
+-  bfd_put_32 (output_bfd, insn4, contents + 12);
++  /* Write out the output buffer.  */
++  for (size_t i = 0; i < (insn_count+1); i++)
++    bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+ /* Finish up the dynamic sections.  */
+@@ -2317,7 +2347,8 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
+       splt = htab->root.splt;
+       if (splt && splt->size > 0)
+ 	{
+-	  unsigned plt0, plt1, plt2;
++	  unsigned plt[PLT_MAX_INSN_COUNT];
++	  size_t plt_insn_count = 3;
+ 	  bfd_vma got_addr = sgot->output_section->vma + sgot->output_offset;
+ 
+ 	  /* Note we force 16 byte alignment on the .got, so that
+@@ -2328,27 +2359,27 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
+ 	      bfd_vma pc = splt->output_section->vma + splt->output_offset;
+ 	      unsigned pa = ((got_addr >> 13) - (pc >> 13)) & 0x1fffff;
+ 	      unsigned po = got_addr & 0x1fff;
+-	      plt0 = OR1K_ADRP(12) | pa;
+-	      plt1 = OR1K_LWZ(15,12) | (po + 8);
+-	      plt2 = OR1K_LWZ(12,12) | (po + 4);
++	      plt[0] = OR1K_ADRP(12) | pa;
++	      plt[1] = OR1K_LWZ(15,12) | (po + 8);
++	      plt[2] = OR1K_LWZ(12,12) | (po + 4);
+ 	    }
+ 	  else if (bfd_link_pic (info))
+ 	    {
+-	      plt0 = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
+-	      plt1 = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
+-	      plt2 = OR1K_NOP;
++	      plt[0] = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
++	      plt[1] = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
++	      plt[2] = OR1K_NOP;
+ 	    }
+ 	  else
+ 	    {
+ 	      unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
+ 	      unsigned lo = got_addr & 0xffff;
+-	      plt0 = OR1K_MOVHI(12) | ha;
+-	      plt1 = OR1K_LWZ(15,12) | (lo + 8);
+-	      plt2 = OR1K_LWZ(12,12) | (lo + 4);
++	      plt[0] = OR1K_MOVHI(12) | ha;
++	      plt[1] = OR1K_LWZ(15,12) | (lo + 8);
++	      plt[2] = OR1K_LWZ(12,12) | (lo + 4);
+ 	    }
+ 
+-	  or1k_write_plt_entry (output_bfd, splt->contents,
+-				plt0, plt1, plt2, OR1K_JR(15));
++	  or1k_write_plt_entry (output_bfd, splt->contents, OR1K_JR(15),
++				plt, plt_insn_count);
+ 
+ 	  elf_section_data (splt->output_section)->this_hdr.sh_entsize = 4;
+ 	}
+@@ -2391,7 +2422,8 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 
+   if (h->plt.offset != (bfd_vma) -1)
+     {
+-      unsigned int plt0, plt1, plt2;
++      unsigned int plt[PLT_MAX_INSN_COUNT];
++      size_t plt_insn_count = 3;
+       asection *splt;
+       asection *sgot;
+       asection *srela;
+@@ -2403,6 +2435,7 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+       bfd_vma got_offset;
+       bfd_vma got_addr;
+       Elf_Internal_Rela rela;
++      bfd_boolean large_plt_entry;
+ 
+       /* This symbol has an entry in the procedure linkage table.  Set
+ 	 it up.  */
+@@ -2420,10 +2453,13 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 	 corresponds to this symbol.  This is the index of this symbol
+ 	 in all the symbols for which we are making plt entries.  The
+ 	 first entry in the procedure linkage table is reserved.  */
+-      plt_index = h->plt.offset / PLT_ENTRY_SIZE - 1;
++      plt_index = ((struct elf_or1k_link_hash_entry *) h)->plt_index;
+       plt_addr = plt_base_addr + h->plt.offset;
+       plt_reloc = plt_index * sizeof (Elf32_External_Rela);
+ 
++      large_plt_entry = (elf_or1k_plt_entry_size (plt_index)
++			 == PLT_ENTRY_SIZE_LARGE);
++
+       /* Get the offset into the .got table of the entry that
+ 	corresponds to this function.  Each .got entry is 4 bytes.
+ 	The first three are reserved.  */
+@@ -2435,27 +2471,57 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 	{
+ 	  unsigned pa = ((got_addr >> 13) - (plt_addr >> 13)) & 0x1fffff;
+ 	  unsigned po = (got_addr & 0x1fff);
+-	  plt0 = OR1K_ADRP(12) | pa;
+-	  plt1 = OR1K_LWZ(12,12) | po;
+-	  plt2 = OR1K_ORI0(11) | plt_reloc;
++	  plt[0] = OR1K_ADRP(12) | pa;
++	  plt[1] = OR1K_LWZ(12,12) | po;
++	  plt[2] = OR1K_ORI0(11) | plt_reloc;
+ 	}
+       else if (bfd_link_pic (info))
+ 	{
+-	  plt0 = OR1K_LWZ(12,16) | got_offset;
+-	  plt1 = OR1K_ORI0(11) | plt_reloc;
+-	  plt2 = OR1K_NOP;
++	  if (large_plt_entry)
++	    {
++	      unsigned gotha = ((got_offset + 0x8000) >> 16) & 0xffff;
++	      unsigned got = got_offset & 0xffff;
++	      unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
++	      unsigned pltrello = plt_reloc & 0xffff;
++
++	      plt[0] = OR1K_MOVHI(12) | gotha;
++	      plt[1] = OR1K_ADD(12,12,16);
++	      plt[2] = OR1K_LWZ(12,12) | got;
++	      plt[3] = OR1K_MOVHI(11) | pltrelhi;
++	      plt[4] = OR1K_ORI(11,11) | pltrello;
++	      plt_insn_count = 5;
++	    }
++	  else
++	    {
++	      plt[0] = OR1K_LWZ(12,16) | got_offset;
++	      plt[1] = OR1K_ORI0(11) | plt_reloc;
++	      plt[2] = OR1K_NOP;
++	    }
+ 	}
+       else
+ 	{
+ 	  unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
+ 	  unsigned lo = got_addr & 0xffff;
+-	  plt0 = OR1K_MOVHI(12) | ha;
+-	  plt1 = OR1K_LWZ(12,12) | lo;
+-	  plt2 = OR1K_ORI0(11) | plt_reloc;
++	  plt[0] = OR1K_MOVHI(12) | ha;
++	  plt[1] = OR1K_LWZ(12,12) | lo;
++	  plt[2] = OR1K_ORI0(11) | plt_reloc;
++	}
++
++      /* For large code model we fixup the non-PIC PLT relocation instructions
++	 here.  */
++      if (large_plt_entry && !bfd_link_pic (info))
++	{
++	  unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
++	  unsigned pltrello = plt_reloc & 0xffff;
++
++	  plt[2] = OR1K_MOVHI(11) | pltrelhi;
++	  plt[3] = OR1K_ORI(11,11) | pltrello;
++	  plt[4] = OR1K_NOP;
++	  plt_insn_count = 5;
+ 	}
+ 
+       or1k_write_plt_entry (output_bfd, splt->contents + h->plt.offset,
+-			    plt0, plt1, plt2, OR1K_JR(12));
++			    OR1K_JR(12), plt, plt_insn_count);
+ 
+       /* Fill in the entry in the global offset table.  We initialize it to
+ 	 point to the top of the plt.  This is done to lazy lookup the actual
+@@ -2779,11 +2845,16 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+       if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (1, bfd_link_pic (info), h))
+ 	{
+ 	  asection *splt = htab->root.splt;
++	  bfd_vma plt_index;
++
++	  /* Track the index of our plt entry for use in calculating size.  */
++	  plt_index = htab->plt_count++;
++	  ((struct elf_or1k_link_hash_entry *) h)->plt_index = plt_index;
+ 
+ 	  /* If this is the first .plt entry, make room for the special
+ 	     first entry.  */
+ 	  if (splt->size == 0)
+-	    splt->size = PLT_ENTRY_SIZE;
++	    splt->size = elf_or1k_plt_entry_size (plt_index);
+ 
+ 	  h->plt.offset = splt->size;
+ 
+@@ -2800,7 +2871,7 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+ 	    }
+ 
+ 	  /* Make room for this entry.  */
+-	  splt->size += PLT_ENTRY_SIZE;
++	  splt->size += elf_or1k_plt_entry_size (plt_index);
+ 
+ 	  /* We also need to make an entry in the .got.plt section, which
+ 	     will be placed in the .got section by the linker script.  */
+diff --git a/ld/testsuite/ld-or1k/gotha1.dd b/ld/testsuite/ld-or1k/gotha1.dd
+new file mode 100644
+index 00000000000..0ad1f8f5399
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha1.dd
+@@ -0,0 +1,34 @@
++
++.*\.x:     file format elf32-or1k
++
++
++Disassembly of section \.plt:
++
++[0-9a-f]+ <\.plt>:
++ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
++ +[0-9a-f]+:	85 ec [0-9a-f]+ [0-9a-f]+ 	l\.lwz r15,[0-9]+\(r12\)
++ +[0-9a-f]+:	44 00 78 00 	l\.jr r15
++ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
++ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
++ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
++ +[0-9a-f]+:	44 00 60 00 	l\.jr r12
++ +[0-9a-f]+:	a9 60 00 00 	l\.ori r11,r0,0x0
++
++Disassembly of section \.text:
++
++[0-9a-f]+ <_start>:
++ +[0-9a-f]+:	9c 21 ff fc 	l\.addi r1,r1,-4
++ +[0-9a-f]+:	d4 01 48 00 	l\.sw 0\(r1\),r9
++ +[0-9a-f]+:	04 00 00 02 	l\.jal [0-9a-f]+ <_start\+0x10>
++ +[0-9a-f]+:	1a 60 00 00 	l\.movhi r19,0x0
++ +[0-9a-f]+:	aa 73 [0-9a-f]+ [0-9a-f]+ 	l\.ori r19,r19,0x[0-9a-f]+
++ +[0-9a-f]+:	e2 73 48 00 	l\.add r19,r19,r9
++ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
++ +[0-9a-f]+:	e2 31 98 00 	l\.add r17,r17,r19
++ +[0-9a-f]+:	86 31 00 10 	l\.lwz r17,16\(r17\)
++ +[0-9a-f]+:	84 71 00 00 	l\.lwz r3,0\(r17\)
++ +[0-9a-f]+:	07 ff ff f2 	l\.jal [0-9a-f]+ <\.plt\+0x10>
++ +[0-9a-f]+:	15 00 00 00 	l\.nop 0x0
++ +[0-9a-f]+:	85 21 00 00 	l\.lwz r9,0\(r1\)
++ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
++ +[0-9a-f]+:	9c 21 00 04 	l\.addi r1,r1,4
+diff --git a/ld/testsuite/ld-or1k/gotha1.s b/ld/testsuite/ld-or1k/gotha1.s
+new file mode 100644
+index 00000000000..42b16db425c
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha1.s
+@@ -0,0 +1,24 @@
++	.data
++	.p2align 16
++
++	.text
++	.globl	_start
++_start:
++	l.addi	r1, r1, -4
++	l.sw	0(r1), r9
++
++	l.jal	8
++	 l.movhi	r19, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
++	l.ori	r19, r19, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
++	l.add	r19, r19, r9
++
++	l.movhi	r17, gotha(x)
++	l.add	r17, r17, r19
++	l.lwz	r17, got(x)(r17)
++	l.lwz	r3, 0(r17)
++
++	l.jal	plt(func)
++	 l.nop
++	l.lwz	r9, 0(r1)
++	l.jr	r9
++	 l.addi	r1, r1, 4
+diff --git a/ld/testsuite/ld-or1k/gotha2.dd b/ld/testsuite/ld-or1k/gotha2.dd
+new file mode 100644
+index 00000000000..fe09da5466b
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha2.dd
+@@ -0,0 +1,21 @@
++
++.*\.x:     file format elf32-or1k
++
++
++Disassembly of section \.text:
++
++[0-9a-f]+ <test>:
++ +[0-9a-f]+:	9c 21 ff f8 	l\.addi r1,r1,-8
++ +[0-9a-f]+:	d4 01 80 00 	l\.sw 0\(r1\),r16
++ +[0-9a-f]+:	d4 01 48 04 	l\.sw 4\(r1\),r9
++ +[0-9a-f]+:	04 00 [0-9a-f]+ [0-9a-f]+ 	l\.jal [0-9a-f]+ <test\+0x14>
++ +[0-9a-f]+:	1a 00 00 00 	l\.movhi r16,0x0
++ +[0-9a-f]+:	aa 10 [0-9a-f]+ [0-9a-f]+ 	l\.ori r16,r16,0x[0-9a-f]+
++ +[0-9a-f]+:	e2 10 48 00 	l\.add r16,r16,r9
++ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
++ +[0-9a-f]+:	e2 31 80 00 	l\.add r17,r17,r16
++ +[0-9a-f]+:	86 31 00 0c 	l\.lwz r17,12\(r17\)
++ +[0-9a-f]+:	85 21 00 04 	l\.lwz r9,4\(r1\)
++ +[0-9a-f]+:	86 01 00 00 	l\.lwz r16,0\(r1\)
++ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
++ +[0-9a-f]+:	9c 21 00 08 	l\.addi r1,r1,8
+diff --git a/ld/testsuite/ld-or1k/gotha2.s b/ld/testsuite/ld-or1k/gotha2.s
+new file mode 100644
+index 00000000000..164b282f2dd
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha2.s
+@@ -0,0 +1,22 @@
++	.section	.text
++	.align 4
++	.global	test
++	.type	test, @function
++test:
++	l.addi	r1, r1, -8
++	l.sw	0(r1), r16
++	l.sw	4(r1), r9
++
++	l.jal	8
++	 l.movhi	r16, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
++	l.ori	r16, r16, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
++	l.add	r16, r16, r9
++
++	l.movhi	r17, gotha(i)
++	l.add	r17, r17, r16
++	l.lwz	r17, got(i)(r17)
++
++	l.lwz	r9, 4(r1)
++	l.lwz	r16, 0(r1)
++	l.jr	r9
++	 l.addi	r1, r1, 8
+diff --git a/ld/testsuite/ld-or1k/or1k.exp b/ld/testsuite/ld-or1k/or1k.exp
+index 7592e8307c1..8e19ec6c31a 100644
+--- a/ld/testsuite/ld-or1k/or1k.exp
++++ b/ld/testsuite/ld-or1k/or1k.exp
+@@ -53,6 +53,14 @@ set or1kplttests {
+      "" {plt1.s}
+      {{objdump -dr plt1.x.dd}}
+      "plt1.x"}
++    {"gotha exec plt" "tmpdir/libpltlib.so" ""
++     "" {gotha1.s}
++     {{objdump -dr gotha1.dd}}
++     "gotha1.x"}
++    {"gotha -fpic -shared" "-fpic -shared" ""
++     "" {gotha2.s}
++     {{objdump -dr gotha2.dd}}
++     "gotha2.x"}
+ }
+ 
+ # Not implemented yet
+diff --git a/ld/testsuite/ld-or1k/pltlib.s b/ld/testsuite/ld-or1k/pltlib.s
+index baf76ca1af7..8b4d7ba48fd 100644
+--- a/ld/testsuite/ld-or1k/pltlib.s
++++ b/ld/testsuite/ld-or1k/pltlib.s
+@@ -1,5 +1,6 @@
+ 	.section .data
+ 	.globl x, y
++	.size x, 4
+ x:	.long 33
+ y:	.long 44
+ 
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch b/package/binutils/2.36.1/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
new file mode 100644
index 0000000000..326e7d7b68
--- /dev/null
+++ b/package/binutils/2.36.1/0004-or1k-Implement-relocation-R_OR1K_GOT_AHI16-for-gotha.patch
@@ -0,0 +1,256 @@
+From 141dee7402871c7b3994838c3eddf64a92d67be7 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:15 +0900
+Subject: [PATCH 4/6] or1k: Implement relocation R_OR1K_GOT_AHI16 for gotha()
+
+The gotha() relocation mnemonic will be outputted by OpenRISC GCC when
+using the -mcmodel=large option.  This relocation is used along with
+got() to generate 32-bit GOT offsets.  This increases the previous GOT
+offset limit from the previous 16-bit (64K) limit.
+
+This is needed on large binaries where the GOT grows larger than 64k.
+
+bfd/ChangeLog:
+
+	PR 21464
+	* bfd-in2.h: Add BFD_RELOC_OR1K_GOT_AHI16 relocation.
+	* elf32-or1k.c (or1k_elf_howto_table, or1k_reloc_map): Likewise.
+	(or1k_final_link_relocate, or1k_elf_relocate_section,
+	or1k_elf_check_relocs): Likewise.
+	* libbfd.h (bfd_reloc_code_real_names): Likewise.
+	* reloc.c: Likewise.
+
+cpu/ChangeLog:
+
+	PR 21464
+	* or1k.opc (or1k_imm16_relocs, parse_reloc): Define parse logic
+	for gotha() relocation.
+
+include/ChangeLog:
+
+	PR 21464
+	* elf/or1k.h (elf_or1k_reloc_type): Define R_OR1K_GOT_AHI16 number.
+
+opcodes/ChangeLog:
+
+	PR 21464
+	* or1k-asm.c: Regenerate.
+
+gas/ChangeLog:
+
+	PR 21464
+	* testsuite/gas/or1k/reloc-1.s: Add test for new relocation.
+	* testsuite/gas/or1k/reloc-1.d: Add test result for new
+	relocation.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+
+fixup reloc, add tests
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/bfd-in2.h                    |  1 +
+ bfd/elf32-or1k.c                 | 21 ++++++++++++++++++++-
+ bfd/libbfd.h                     |  1 +
+ bfd/reloc.c                      |  2 ++
+ cpu/or1k.opc                     |  7 ++++++-
+ gas/testsuite/gas/or1k/reloc-1.d |  4 +++-
+ gas/testsuite/gas/or1k/reloc-1.s |  4 ++++
+ include/elf/or1k.h               |  1 +
+ opcodes/or1k-asm.c               |  7 ++++++-
+ 9 files changed, 44 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/bfd-in2.h b/bfd/bfd-in2.h
+index 7eff85b7eaa..e76b9e7a319 100644
+--- a/bfd/bfd-in2.h
++++ b/bfd/bfd-in2.h
+@@ -5048,6 +5048,7 @@ then it may be truncated to 8 bits.  */
+   BFD_RELOC_OR1K_TLS_TPOFF,
+   BFD_RELOC_OR1K_TLS_DTPOFF,
+   BFD_RELOC_OR1K_TLS_DTPMOD,
++  BFD_RELOC_OR1K_GOT_AHI16,
+ 
+ /* H8 elf Relocations.  */
+   BFD_RELOC_H8_DIR16A8,
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 4f82cc4c667..48461854a96 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -808,6 +808,20 @@ static reloc_howto_type or1k_elf_howto_table[] =
+ 	 0,			/* Source Mask.  */
+ 	 0x03ffffff,		/* Dest Mask.  */
+ 	 TRUE),			/* PC relative offset?  */
++
++  HOWTO (R_OR1K_GOT_AHI16,     /* type */
++	16,                    /* rightshift */
++	2,                     /* size (0 = byte, 1 = short, 2 = long) */
++	16,                    /* bitsize */
++	FALSE,                 /* pc_relative */
++	0,                     /* bitpos */
++	complain_overflow_signed, /* complain_on_overflow */
++	bfd_elf_generic_reloc, /* special_function */
++	"R_OR1K_GOT_AHI16",    /* name */
++	FALSE,                 /* partial_inplace */
++	0,                     /* src_mask */
++	0xffff,                /* dst_mask */
++	FALSE),                /* pcrel_offset */
+ };
+ 
+ /* Map BFD reloc types to Or1k ELF reloc types.  */
+@@ -871,6 +885,7 @@ static const struct or1k_reloc_map or1k_reloc_map[] =
+   { BFD_RELOC_OR1K_TLS_IE_LO13,	R_OR1K_TLS_IE_LO13 },
+   { BFD_RELOC_OR1K_SLO13,	R_OR1K_SLO13 },
+   { BFD_RELOC_OR1K_PLTA26,	R_OR1K_PLTA26 },
++  { BFD_RELOC_OR1K_GOT_AHI16,	R_OR1K_GOT_AHI16 },
+ };
+ 
+ /* tls_type is a mask used to track how each symbol is accessed,
+@@ -1111,6 +1126,7 @@ or1k_final_link_relocate (reloc_howto_type *howto, bfd *input_bfd,
+   switch (howto->type)
+     {
+     case R_OR1K_AHI16:
++    case R_OR1K_GOT_AHI16:
+     case R_OR1K_GOTOFF_AHI16:
+     case R_OR1K_TLS_IE_AHI16:
+     case R_OR1K_TLS_LE_AHI16:
+@@ -1373,6 +1389,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    }
+ 	  break;
+ 
++	case R_OR1K_GOT_AHI16:
+ 	case R_OR1K_GOT16:
+ 	case R_OR1K_GOT_PG21:
+ 	case R_OR1K_GOT_LO13:
+@@ -1464,7 +1481,8 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 	    /* The GOT_PG21 and GOT_LO13 relocs are pc-relative,
+ 	       while the GOT16 reloc is GOT relative.  */
+ 	    relocation = got_base + off;
+-	    if (r_type == R_OR1K_GOT16)
++	    if (r_type == R_OR1K_GOT16
++		|| r_type == R_OR1K_GOT_AHI16)
+ 	      relocation -= got_sym_value;
+ 
+ 	  /* Addend should be zero.  */
+@@ -1990,6 +2008,7 @@ or1k_elf_check_relocs (bfd *abfd,
+ 	    }
+ 	  break;
+ 
++	case R_OR1K_GOT_AHI16:
+ 	case R_OR1K_GOT16:
+ 	case R_OR1K_GOT_PG21:
+ 	case R_OR1K_GOT_LO13:
+diff --git a/bfd/libbfd.h b/bfd/libbfd.h
+index 7271a2ad5a1..e0ee2dafc07 100644
+--- a/bfd/libbfd.h
++++ b/bfd/libbfd.h
+@@ -2757,6 +2757,7 @@ static const char *const bfd_reloc_code_real_names[] = { "@@uninitialized@@",
+   "BFD_RELOC_OR1K_TLS_TPOFF",
+   "BFD_RELOC_OR1K_TLS_DTPOFF",
+   "BFD_RELOC_OR1K_TLS_DTPMOD",
++  "BFD_RELOC_OR1K_GOT_AHI16",
+   "BFD_RELOC_H8_DIR16A8",
+   "BFD_RELOC_H8_DIR16R8",
+   "BFD_RELOC_H8_DIR24A8",
+diff --git a/bfd/reloc.c b/bfd/reloc.c
+index 4f4b95a0b7f..fe94e0d8f91 100644
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -6204,6 +6204,8 @@ ENUMX
+   BFD_RELOC_OR1K_GOTPC_HI16
+ ENUMX
+   BFD_RELOC_OR1K_GOTPC_LO16
++ENUMX
++  BFD_RELOC_OR1K_GOT_AHI16
+ ENUMX
+   BFD_RELOC_OR1K_GOT16
+ ENUMX
+diff --git a/cpu/or1k.opc b/cpu/or1k.opc
+index f0adcbb00a5..5d20a1f33a7 100644
+--- a/cpu/or1k.opc
++++ b/cpu/or1k.opc
+@@ -193,7 +193,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
+     BFD_RELOC_OR1K_GOT_LO13,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+-    BFD_RELOC_UNUSED },
++    BFD_RELOC_OR1K_GOT_AHI16 },
+   { BFD_RELOC_OR1K_GOTPC_LO16,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+@@ -296,6 +296,11 @@ parse_reloc (const char **strp)
+ 	str += 5;
+ 	cls = RCLASS_TPOFF;
+       }
++    else if (strncasecmp (str, "got", 3) == 0)
++      {
++	str += 3;
++	cls = RCLASS_GOT;
++      }
+ 
+     if (strncasecmp (str, "hi(", 3) == 0)
+       {
+diff --git a/gas/testsuite/gas/or1k/reloc-1.d b/gas/testsuite/gas/or1k/reloc-1.d
+index d1bcf5608bb..3a001c4ed99 100644
+--- a/gas/testsuite/gas/or1k/reloc-1.d
++++ b/gas/testsuite/gas/or1k/reloc-1.d
+@@ -68,5 +68,7 @@ OFFSET   TYPE              VALUE
+ 000000ec R_OR1K_LO13       x
+ 000000f0 R_OR1K_GOT_LO13   x
+ 000000f4 R_OR1K_SLO13      x
+-
++000000f8 R_OR1K_GOT_AHI16  x
++000000fc R_OR1K_GOT_AHI16  x
++00000100 R_OR1K_GOT_AHI16  x
+ 
+diff --git a/gas/testsuite/gas/or1k/reloc-1.s b/gas/testsuite/gas/or1k/reloc-1.s
+index e76abef6532..562609aa869 100644
+--- a/gas/testsuite/gas/or1k/reloc-1.s
++++ b/gas/testsuite/gas/or1k/reloc-1.s
+@@ -74,3 +74,7 @@
+ 	l.lbz	r5,po(x)(r3)
+ 	l.lbz	r5,gotpo(x)(r3)
+ 	l.sb	po(x)(r3),r6
++
++	l.movhi	r4,gotha(x)
++	l.ori	r3,r4,gotha(x)
++	l.addi	r3,r4,gotha(x)
+diff --git a/include/elf/or1k.h b/include/elf/or1k.h
+index 7f281481061..69ab90584a2 100644
+--- a/include/elf/or1k.h
++++ b/include/elf/or1k.h
+@@ -77,6 +77,7 @@ START_RELOC_NUMBERS (elf_or1k_reloc_type)
+   RELOC_NUMBER (R_OR1K_TLS_IE_LO13,   51)
+   RELOC_NUMBER (R_OR1K_SLO13,         52)
+   RELOC_NUMBER (R_OR1K_PLTA26,        53)
++  RELOC_NUMBER (R_OR1K_GOT_AHI16,     54)
+ END_RELOC_NUMBERS (R_OR1K_max)
+ 
+ #define EF_OR1K_NODELAY (1UL << 0)
+diff --git a/opcodes/or1k-asm.c b/opcodes/or1k-asm.c
+index 045ab6230b6..fdccf67f9e1 100644
+--- a/opcodes/or1k-asm.c
++++ b/opcodes/or1k-asm.c
+@@ -177,7 +177,7 @@ static const bfd_reloc_code_real_type or1k_imm16_relocs[][6] = {
+     BFD_RELOC_OR1K_GOT_LO13,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+-    BFD_RELOC_UNUSED },
++    BFD_RELOC_OR1K_GOT_AHI16 },
+   { BFD_RELOC_OR1K_GOTPC_LO16,
+     BFD_RELOC_UNUSED,
+     BFD_RELOC_UNUSED,
+@@ -280,6 +280,11 @@ parse_reloc (const char **strp)
+ 	str += 5;
+ 	cls = RCLASS_TPOFF;
+       }
++    else if (strncasecmp (str, "got", 3) == 0)
++      {
++	str += 3;
++	cls = RCLASS_GOT;
++      }
+ 
+     if (strncasecmp (str, "hi(", 3) == 0)
+       {
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch b/package/binutils/2.36.1/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
new file mode 100644
index 0000000000..e3f1edf1a6
--- /dev/null
+++ b/package/binutils/2.36.1/0005-or1k-Avoid-R_OR1K_GOT16-overflow-failures-in-presenc.patch
@@ -0,0 +1,61 @@
+From de914df5f2ba23a9f6f1fbf6efdc22e1b045901c Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:16 +0900
+Subject: [PATCH 5/6] or1k: Avoid R_OR1K_GOT16 overflow failures in presence of
+ R_OR1K_GOT_AHI16
+
+Now that we support R_OR1K_GOT_AHI16 we can relax the R_OR1K_GOT16
+overflow validation check if the section has R_OR1K_GOT_AHI16.
+
+We cannot simple disable R_OR1K_GOT16 overflow validation as there will
+still be binaries that will have only R_OR1K_GOT16.  The
+R_OR1K_GOT_AHI16 relocation will only be added by GCC when building with
+the option -mcmodel=large.
+
+This assumes that R_OR1K_GOT_AHI16 will come before R_OR1K_GOT16, which
+is the code pattern that will be emitted by GCC.
+
+bfd/ChangeLog:
+
+	PR 21464
+	* elf32-or1k.c (or1k_elf_relocate_section): Relax R_OR1K_GOT16
+	overflow check if we have R_OR1K_GOT_AHI16 followed by
+	R_OR1K_GOT16.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 48461854a96..44e67f2b84b 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -1278,6 +1278,7 @@ or1k_elf_relocate_section (bfd *output_bfd,
+   asection *sgot, *splt;
+   bfd_vma plt_base, got_base, got_sym_value;
+   bfd_boolean ret_val = TRUE;
++  bfd_boolean saw_gotha = FALSE;
+ 
+   if (htab == NULL)
+     return FALSE;
+@@ -1485,6 +1486,16 @@ or1k_elf_relocate_section (bfd *output_bfd,
+ 		|| r_type == R_OR1K_GOT_AHI16)
+ 	      relocation -= got_sym_value;
+ 
++	    if (r_type == R_OR1K_GOT_AHI16)
++	      saw_gotha = TRUE;
++
++	    /* If we have a R_OR1K_GOT16 followed by a R_OR1K_GOT_AHI16
++	       relocation we assume the code is doing the right thing to avoid
++	       overflows.  Here we mask the lower 16-bit of the relocation to
++	       avoid overflow validation failures.  */
++	    if (r_type == R_OR1K_GOT16 && saw_gotha)
++	      relocation &= 0xffff;
++
+ 	  /* Addend should be zero.  */
+ 	  if (rel->r_addend != 0)
+ 	    {
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch b/package/binutils/2.36.1/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
new file mode 100644
index 0000000000..70c46662ba
--- /dev/null
+++ b/package/binutils/2.36.1/0006-or1k-Support-large-plt_relocs-when-generating-plt-en.patch
@@ -0,0 +1,500 @@
+From 4a7b357d0c802685bee7706bafb9702c821286e1 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:17 +0900
+Subject: [PATCH 6/6] or1k: Support large plt_relocs when generating plt
+ entries
+
+The current PLT generation code will generate invalid code when the PLT
+relocation offset exceeds 64k.  This fixes the issue by detecting large
+plt_reloc offsets and generare code sequences to create larger plt
+relocations.
+
+The "large" plt code needs 2 extra instructions to create 32-bit offsets.
+
+bfd/ChangeLog:
+
+	PR 27746
+	* elf32-or1k.c (PLT_ENTRY_SIZE_LARGE, PLT_MAX_INSN_COUNT,
+	OR1K_ADD, OR1K_ORI): New macros to help with plt creation.
+	(elf_or1k_link_hash_table): New field plt_count.
+	(elf_or1k_link_hash_entry): New field plt_index.
+	(elf_or1k_plt_entry_size): New function.
+	(or1k_write_plt_entry): Update to support variable size PLTs.
+	(or1k_elf_finish_dynamic_sections): Use new or1k_write_plt_entry
+	API.
+	(or1k_elf_finish_dynamic_symbol): Update to write large PLTs
+	when needed.
+	(allocate_dynrelocs): Use elf_or1k_plt_entry_size to account for
+	PLT size.
+
+ld/ChangeLog:
+
+	PR 27746
+	testsuite/ld-or1k/or1k.exp (or1kplttests): Add tests for linking
+	along with gotha() relocations.
+	testsuite/ld-or1k/gotha1.dd: New file.
+	testsuite/ld-or1k/gotha1.s: New file.
+	testsuite/ld-or1k/gotha2.dd: New file.
+	testsuite/ld-or1k/gotha2.s: New file
+	testsuite/ld-or1k/pltlib.s (x): Define size to avoid link
+	failure.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c               | 149 ++++++++++++++++++++++++---------
+ ld/testsuite/ld-or1k/gotha1.dd |  34 ++++++++
+ ld/testsuite/ld-or1k/gotha1.s  |  24 ++++++
+ ld/testsuite/ld-or1k/gotha2.dd |  21 +++++
+ ld/testsuite/ld-or1k/gotha2.s  |  22 +++++
+ ld/testsuite/ld-or1k/or1k.exp  |   8 ++
+ ld/testsuite/ld-or1k/pltlib.s  |   1 +
+ 7 files changed, 220 insertions(+), 39 deletions(-)
+ create mode 100644 ld/testsuite/ld-or1k/gotha1.dd
+ create mode 100644 ld/testsuite/ld-or1k/gotha1.s
+ create mode 100644 ld/testsuite/ld-or1k/gotha2.dd
+ create mode 100644 ld/testsuite/ld-or1k/gotha2.s
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 44e67f2b84b..3da68e52425 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -30,10 +30,14 @@
+ #define N_ONES(X)	(((bfd_vma)2 << (X)) - 1)
+ 
+ #define PLT_ENTRY_SIZE 16
++#define PLT_ENTRY_SIZE_LARGE (6*4)
++#define PLT_MAX_INSN_COUNT 6
+ 
+ #define OR1K_MOVHI(D)		(0x18000000 | (D << 21))
+ #define OR1K_ADRP(D)		(0x08000000 | (D << 21))
+ #define OR1K_LWZ(D,A)		(0x84000000 | (D << 21) | (A << 16))
++#define OR1K_ADD(D,A,B)		(0xE0000000 | (D << 21) | (A << 16) | (B << 11))
++#define OR1K_ORI(D,A)		(0xA8000000 | (D << 21) | (A << 16))
+ #define OR1K_ORI0(D)		(0xA8000000 | (D << 21))
+ #define OR1K_JR(B)		(0x44000000 | (B << 11))
+ #define OR1K_NOP		0x15000000
+@@ -907,6 +911,8 @@ struct elf_or1k_link_hash_entry
+ {
+   struct elf_link_hash_entry root;
+ 
++  /* For calculating PLT size.  */
++  bfd_vma plt_index;
+   /* Track type of TLS access.  */
+   unsigned char tls_type;
+ };
+@@ -931,9 +937,20 @@ struct elf_or1k_link_hash_table
+ {
+   struct elf_link_hash_table root;
+ 
++  bfd_vma plt_count;
+   bfd_boolean saw_plta;
+ };
+ 
++static size_t
++elf_or1k_plt_entry_size (bfd_vma plt_index)
++{
++  bfd_vma plt_reloc;
++
++  plt_reloc = plt_index * sizeof (Elf32_External_Rela);
++
++  return (plt_reloc > 0xffff) ? PLT_ENTRY_SIZE_LARGE : PLT_ENTRY_SIZE;
++}
++
+ /* Get the ELF linker hash table from a link_info structure.  */
+ #define or1k_elf_hash_table(p) \
+   ((is_elf_hash_table ((p)->hash)					\
+@@ -2222,33 +2239,46 @@ or1k_elf_check_relocs (bfd *abfd,
+ }
+ 
+ static void
+-or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insn1,
+-		      unsigned insn2, unsigned insn3, unsigned insnj)
++or1k_write_plt_entry (bfd *output_bfd, bfd_byte *contents, unsigned insnj,
++		      unsigned insns[], size_t insn_count)
+ {
+   unsigned nodelay = elf_elfheader (output_bfd)->e_flags & EF_OR1K_NODELAY;
+-  unsigned insn4;
++  unsigned output_insns[PLT_MAX_INSN_COUNT];
++
++  /* Copy instructions into the output buffer.  */
++  for (size_t i = 0; i < insn_count; i++)
++    output_insns[i] = insns[i];
+ 
+   /* Honor the no-delay-slot setting.  */
+-  if (insn3 == OR1K_NOP)
++  if (insns[insn_count-1] == OR1K_NOP)
+     {
+-      insn4 = insn3;
++      unsigned slot1, slot2;
++
+       if (nodelay)
+-	insn3 = insnj;
++	slot1 = insns[insn_count-2], slot2 = insnj;
+       else
+-	insn3 = insn2, insn2 = insnj;
++	slot1 = insnj, slot2 = insns[insn_count-2];
++
++      output_insns[insn_count-2] = slot1;
++      output_insns[insn_count-1] = slot2;
++      output_insns[insn_count]   = OR1K_NOP;
+     }
+   else
+     {
++      unsigned slot1, slot2;
++
+       if (nodelay)
+-	insn4 = insnj;
++	slot1 = insns[insn_count-1], slot2 = insnj;
+       else
+-	insn4 = insn3, insn3 = insnj;
++	slot1 = insnj, slot2 = insns[insn_count-1];
++
++      output_insns[insn_count-1] = slot1;
++      output_insns[insn_count]   = slot2;
+     }
+ 
+-  bfd_put_32 (output_bfd, insn1, contents);
+-  bfd_put_32 (output_bfd, insn2, contents + 4);
+-  bfd_put_32 (output_bfd, insn3, contents + 8);
+-  bfd_put_32 (output_bfd, insn4, contents + 12);
++  /* Write out the output buffer.  */
++  for (size_t i = 0; i < (insn_count+1); i++)
++    bfd_put_32 (output_bfd, output_insns[i], contents + (i*4));
+ }
+ 
+ /* Finish up the dynamic sections.  */
+@@ -2315,7 +2345,8 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
+       splt = htab->root.splt;
+       if (splt && splt->size > 0)
+ 	{
+-	  unsigned plt0, plt1, plt2;
++	  unsigned plt[PLT_MAX_INSN_COUNT];
++	  size_t plt_insn_count = 3;
+ 	  bfd_vma got_addr = sgot->output_section->vma + sgot->output_offset;
+ 
+ 	  /* Note we force 16 byte alignment on the .got, so that
+@@ -2326,27 +2357,27 @@ or1k_elf_finish_dynamic_sections (bfd *output_bfd,
+ 	      bfd_vma pc = splt->output_section->vma + splt->output_offset;
+ 	      unsigned pa = ((got_addr >> 13) - (pc >> 13)) & 0x1fffff;
+ 	      unsigned po = got_addr & 0x1fff;
+-	      plt0 = OR1K_ADRP(12) | pa;
+-	      plt1 = OR1K_LWZ(15,12) | (po + 8);
+-	      plt2 = OR1K_LWZ(12,12) | (po + 4);
++	      plt[0] = OR1K_ADRP(12) | pa;
++	      plt[1] = OR1K_LWZ(15,12) | (po + 8);
++	      plt[2] = OR1K_LWZ(12,12) | (po + 4);
+ 	    }
+ 	  else if (bfd_link_pic (info))
+ 	    {
+-	      plt0 = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
+-	      plt1 = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
+-	      plt2 = OR1K_NOP;
++	      plt[0] = OR1K_LWZ(15, 16) | 8;	/* .got+8 */
++	      plt[1] = OR1K_LWZ(12, 16) | 4;	/* .got+4 */
++	      plt[2] = OR1K_NOP;
+ 	    }
+ 	  else
+ 	    {
+ 	      unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
+ 	      unsigned lo = got_addr & 0xffff;
+-	      plt0 = OR1K_MOVHI(12) | ha;
+-	      plt1 = OR1K_LWZ(15,12) | (lo + 8);
+-	      plt2 = OR1K_LWZ(12,12) | (lo + 4);
++	      plt[0] = OR1K_MOVHI(12) | ha;
++	      plt[1] = OR1K_LWZ(15,12) | (lo + 8);
++	      plt[2] = OR1K_LWZ(12,12) | (lo + 4);
+ 	    }
+ 
+-	  or1k_write_plt_entry (output_bfd, splt->contents,
+-				plt0, plt1, plt2, OR1K_JR(15));
++	  or1k_write_plt_entry (output_bfd, splt->contents, OR1K_JR(15),
++				plt, plt_insn_count);
+ 
+ 	  elf_section_data (splt->output_section)->this_hdr.sh_entsize = 4;
+ 	}
+@@ -2389,7 +2420,8 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 
+   if (h->plt.offset != (bfd_vma) -1)
+     {
+-      unsigned int plt0, plt1, plt2;
++      unsigned int plt[PLT_MAX_INSN_COUNT];
++      size_t plt_insn_count = 3;
+       asection *splt;
+       asection *sgot;
+       asection *srela;
+@@ -2401,6 +2433,7 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+       bfd_vma got_offset;
+       bfd_vma got_addr;
+       Elf_Internal_Rela rela;
++      bfd_boolean large_plt_entry;
+ 
+       /* This symbol has an entry in the procedure linkage table.  Set
+ 	 it up.  */
+@@ -2418,10 +2451,13 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 	 corresponds to this symbol.  This is the index of this symbol
+ 	 in all the symbols for which we are making plt entries.  The
+ 	 first entry in the procedure linkage table is reserved.  */
+-      plt_index = h->plt.offset / PLT_ENTRY_SIZE - 1;
++      plt_index = ((struct elf_or1k_link_hash_entry *) h)->plt_index;
+       plt_addr = plt_base_addr + h->plt.offset;
+       plt_reloc = plt_index * sizeof (Elf32_External_Rela);
+ 
++      large_plt_entry = (elf_or1k_plt_entry_size (plt_index)
++			 == PLT_ENTRY_SIZE_LARGE);
++
+       /* Get the offset into the .got table of the entry that
+ 	corresponds to this function.  Each .got entry is 4 bytes.
+ 	The first three are reserved.  */
+@@ -2433,27 +2469,57 @@ or1k_elf_finish_dynamic_symbol (bfd *output_bfd,
+ 	{
+ 	  unsigned pa = ((got_addr >> 13) - (plt_addr >> 13)) & 0x1fffff;
+ 	  unsigned po = (got_addr & 0x1fff);
+-	  plt0 = OR1K_ADRP(12) | pa;
+-	  plt1 = OR1K_LWZ(12,12) | po;
+-	  plt2 = OR1K_ORI0(11) | plt_reloc;
++	  plt[0] = OR1K_ADRP(12) | pa;
++	  plt[1] = OR1K_LWZ(12,12) | po;
++	  plt[2] = OR1K_ORI0(11) | plt_reloc;
+ 	}
+       else if (bfd_link_pic (info))
+ 	{
+-	  plt0 = OR1K_LWZ(12,16) | got_offset;
+-	  plt1 = OR1K_ORI0(11) | plt_reloc;
+-	  plt2 = OR1K_NOP;
++	  if (large_plt_entry)
++	    {
++	      unsigned gotha = ((got_offset + 0x8000) >> 16) & 0xffff;
++	      unsigned got = got_offset & 0xffff;
++	      unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
++	      unsigned pltrello = plt_reloc & 0xffff;
++
++	      plt[0] = OR1K_MOVHI(12) | gotha;
++	      plt[1] = OR1K_ADD(12,12,16);
++	      plt[2] = OR1K_LWZ(12,12) | got;
++	      plt[3] = OR1K_MOVHI(11) | pltrelhi;
++	      plt[4] = OR1K_ORI(11,11) | pltrello;
++	      plt_insn_count = 5;
++	    }
++	  else
++	    {
++	      plt[0] = OR1K_LWZ(12,16) | got_offset;
++	      plt[1] = OR1K_ORI0(11) | plt_reloc;
++	      plt[2] = OR1K_NOP;
++	    }
+ 	}
+       else
+ 	{
+ 	  unsigned ha = ((got_addr + 0x8000) >> 16) & 0xffff;
+ 	  unsigned lo = got_addr & 0xffff;
+-	  plt0 = OR1K_MOVHI(12) | ha;
+-	  plt1 = OR1K_LWZ(12,12) | lo;
+-	  plt2 = OR1K_ORI0(11) | plt_reloc;
++	  plt[0] = OR1K_MOVHI(12) | ha;
++	  plt[1] = OR1K_LWZ(12,12) | lo;
++	  plt[2] = OR1K_ORI0(11) | plt_reloc;
++	}
++
++      /* For large code model we fixup the non-PIC PLT relocation instructions
++	 here.  */
++      if (large_plt_entry && !bfd_link_pic (info))
++	{
++	  unsigned pltrelhi = (plt_reloc >> 16) & 0xffff;
++	  unsigned pltrello = plt_reloc & 0xffff;
++
++	  plt[2] = OR1K_MOVHI(11) | pltrelhi;
++	  plt[3] = OR1K_ORI(11,11) | pltrello;
++	  plt[4] = OR1K_NOP;
++	  plt_insn_count = 5;
+ 	}
+ 
+       or1k_write_plt_entry (output_bfd, splt->contents + h->plt.offset,
+-			    plt0, plt1, plt2, OR1K_JR(12));
++			    OR1K_JR(12), plt, plt_insn_count);
+ 
+       /* Fill in the entry in the global offset table.  We initialize it to
+ 	 point to the top of the plt.  This is done to lazy lookup the actual
+@@ -2777,11 +2843,16 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+       if (WILL_CALL_FINISH_DYNAMIC_SYMBOL (1, bfd_link_pic (info), h))
+ 	{
+ 	  asection *splt = htab->root.splt;
++	  bfd_vma plt_index;
++
++	  /* Track the index of our plt entry for use in calculating size.  */
++	  plt_index = htab->plt_count++;
++	  ((struct elf_or1k_link_hash_entry *) h)->plt_index = plt_index;
+ 
+ 	  /* If this is the first .plt entry, make room for the special
+ 	     first entry.  */
+ 	  if (splt->size == 0)
+-	    splt->size = PLT_ENTRY_SIZE;
++	    splt->size = elf_or1k_plt_entry_size (plt_index);
+ 
+ 	  h->plt.offset = splt->size;
+ 
+@@ -2798,7 +2869,7 @@ allocate_dynrelocs (struct elf_link_hash_entry *h, void * inf)
+ 	    }
+ 
+ 	  /* Make room for this entry.  */
+-	  splt->size += PLT_ENTRY_SIZE;
++	  splt->size += elf_or1k_plt_entry_size (plt_index);
+ 
+ 	  /* We also need to make an entry in the .got.plt section, which
+ 	     will be placed in the .got section by the linker script.  */
+diff --git a/ld/testsuite/ld-or1k/gotha1.dd b/ld/testsuite/ld-or1k/gotha1.dd
+new file mode 100644
+index 00000000000..0ad1f8f5399
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha1.dd
+@@ -0,0 +1,34 @@
++
++.*\.x:     file format elf32-or1k
++
++
++Disassembly of section \.plt:
++
++[0-9a-f]+ <\.plt>:
++ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
++ +[0-9a-f]+:	85 ec [0-9a-f]+ [0-9a-f]+ 	l\.lwz r15,[0-9]+\(r12\)
++ +[0-9a-f]+:	44 00 78 00 	l\.jr r15
++ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
++ +[0-9a-f]+:	19 80 00 00 	l\.movhi r12,0x0
++ +[0-9a-f]+:	85 8c [0-9a-f]+ [0-9a-f]+ 	l\.lwz r12,[0-9]+\(r12\)
++ +[0-9a-f]+:	44 00 60 00 	l\.jr r12
++ +[0-9a-f]+:	a9 60 00 00 	l\.ori r11,r0,0x0
++
++Disassembly of section \.text:
++
++[0-9a-f]+ <_start>:
++ +[0-9a-f]+:	9c 21 ff fc 	l\.addi r1,r1,-4
++ +[0-9a-f]+:	d4 01 48 00 	l\.sw 0\(r1\),r9
++ +[0-9a-f]+:	04 00 00 02 	l\.jal [0-9a-f]+ <_start\+0x10>
++ +[0-9a-f]+:	1a 60 00 00 	l\.movhi r19,0x0
++ +[0-9a-f]+:	aa 73 [0-9a-f]+ [0-9a-f]+ 	l\.ori r19,r19,0x[0-9a-f]+
++ +[0-9a-f]+:	e2 73 48 00 	l\.add r19,r19,r9
++ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
++ +[0-9a-f]+:	e2 31 98 00 	l\.add r17,r17,r19
++ +[0-9a-f]+:	86 31 00 10 	l\.lwz r17,16\(r17\)
++ +[0-9a-f]+:	84 71 00 00 	l\.lwz r3,0\(r17\)
++ +[0-9a-f]+:	07 ff ff f2 	l\.jal [0-9a-f]+ <\.plt\+0x10>
++ +[0-9a-f]+:	15 00 00 00 	l\.nop 0x0
++ +[0-9a-f]+:	85 21 00 00 	l\.lwz r9,0\(r1\)
++ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
++ +[0-9a-f]+:	9c 21 00 04 	l\.addi r1,r1,4
+diff --git a/ld/testsuite/ld-or1k/gotha1.s b/ld/testsuite/ld-or1k/gotha1.s
+new file mode 100644
+index 00000000000..42b16db425c
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha1.s
+@@ -0,0 +1,24 @@
++	.data
++	.p2align 16
++
++	.text
++	.globl	_start
++_start:
++	l.addi	r1, r1, -4
++	l.sw	0(r1), r9
++
++	l.jal	8
++	 l.movhi	r19, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
++	l.ori	r19, r19, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
++	l.add	r19, r19, r9
++
++	l.movhi	r17, gotha(x)
++	l.add	r17, r17, r19
++	l.lwz	r17, got(x)(r17)
++	l.lwz	r3, 0(r17)
++
++	l.jal	plt(func)
++	 l.nop
++	l.lwz	r9, 0(r1)
++	l.jr	r9
++	 l.addi	r1, r1, 4
+diff --git a/ld/testsuite/ld-or1k/gotha2.dd b/ld/testsuite/ld-or1k/gotha2.dd
+new file mode 100644
+index 00000000000..fe09da5466b
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha2.dd
+@@ -0,0 +1,21 @@
++
++.*\.x:     file format elf32-or1k
++
++
++Disassembly of section \.text:
++
++[0-9a-f]+ <test>:
++ +[0-9a-f]+:	9c 21 ff f8 	l\.addi r1,r1,-8
++ +[0-9a-f]+:	d4 01 80 00 	l\.sw 0\(r1\),r16
++ +[0-9a-f]+:	d4 01 48 04 	l\.sw 4\(r1\),r9
++ +[0-9a-f]+:	04 00 [0-9a-f]+ [0-9a-f]+ 	l\.jal [0-9a-f]+ <test\+0x14>
++ +[0-9a-f]+:	1a 00 00 00 	l\.movhi r16,0x0
++ +[0-9a-f]+:	aa 10 [0-9a-f]+ [0-9a-f]+ 	l\.ori r16,r16,0x[0-9a-f]+
++ +[0-9a-f]+:	e2 10 48 00 	l\.add r16,r16,r9
++ +[0-9a-f]+:	1a 20 00 00 	l\.movhi r17,0x0
++ +[0-9a-f]+:	e2 31 80 00 	l\.add r17,r17,r16
++ +[0-9a-f]+:	86 31 00 0c 	l\.lwz r17,12\(r17\)
++ +[0-9a-f]+:	85 21 00 04 	l\.lwz r9,4\(r1\)
++ +[0-9a-f]+:	86 01 00 00 	l\.lwz r16,0\(r1\)
++ +[0-9a-f]+:	44 00 48 00 	l\.jr r9
++ +[0-9a-f]+:	9c 21 00 08 	l\.addi r1,r1,8
+diff --git a/ld/testsuite/ld-or1k/gotha2.s b/ld/testsuite/ld-or1k/gotha2.s
+new file mode 100644
+index 00000000000..164b282f2dd
+--- /dev/null
++++ b/ld/testsuite/ld-or1k/gotha2.s
+@@ -0,0 +1,22 @@
++	.section	.text
++	.align 4
++	.global	test
++	.type	test, @function
++test:
++	l.addi	r1, r1, -8
++	l.sw	0(r1), r16
++	l.sw	4(r1), r9
++
++	l.jal	8
++	 l.movhi	r16, gotpchi(_GLOBAL_OFFSET_TABLE_-4)
++	l.ori	r16, r16, gotpclo(_GLOBAL_OFFSET_TABLE_+0)
++	l.add	r16, r16, r9
++
++	l.movhi	r17, gotha(i)
++	l.add	r17, r17, r16
++	l.lwz	r17, got(i)(r17)
++
++	l.lwz	r9, 4(r1)
++	l.lwz	r16, 0(r1)
++	l.jr	r9
++	 l.addi	r1, r1, 8
+diff --git a/ld/testsuite/ld-or1k/or1k.exp b/ld/testsuite/ld-or1k/or1k.exp
+index 8bb943aacc9..f10949e89aa 100644
+--- a/ld/testsuite/ld-or1k/or1k.exp
++++ b/ld/testsuite/ld-or1k/or1k.exp
+@@ -53,6 +53,14 @@ set or1kplttests {
+      "" {plt1.s}
+      {{objdump -dr plt1.x.dd}}
+      "plt1.x"}
++    {"gotha exec plt" "tmpdir/libpltlib.so" ""
++     "" {gotha1.s}
++     {{objdump -dr gotha1.dd}}
++     "gotha1.x"}
++    {"gotha -fpic -shared" "-fpic -shared" ""
++     "" {gotha2.s}
++     {{objdump -dr gotha2.dd}}
++     "gotha2.x"}
+ }
+ 
+ # Not implemented yet
+diff --git a/ld/testsuite/ld-or1k/pltlib.s b/ld/testsuite/ld-or1k/pltlib.s
+index baf76ca1af7..8b4d7ba48fd 100644
+--- a/ld/testsuite/ld-or1k/pltlib.s
++++ b/ld/testsuite/ld-or1k/pltlib.s
+@@ -1,5 +1,6 @@
+ 	.section .data
+ 	.globl x, y
++	.size x, 4
+ x:	.long 33
+ y:	.long 44
+ 
+-- 
+2.25.1
+
-- 
2.25.1
