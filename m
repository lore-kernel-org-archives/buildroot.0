From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Apr 2017 10:42:38 +0200
Subject: [Buildroot] [PATCH 2/2] binutils: add patch for 2.27 that fixes
	elf2flt segfaults
In-Reply-To: <20170410084238.13201-1-arnout@mind.be>
References: <20170410084238.13201-1-arnout@mind.be>
Message-ID: <20170410084238.13201-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ARM thumb-only builds with FLAT binary formats, elf2flt segfaults on
some programs when binutils 2.27 is used. Binutils 2.26 and 2.28 work
fine. So the fix from 2.28 was bisected and added as a patch to our
patch queue.

Fixes:
acpica:
http://autobuild.buildroot.net/results/e58/e5872fb121d1cc906fa9db026963c36b829a89da
busybox:
http://autobuild.buildroot.net/results/8bc/8bc0b81ab298685f3de3defdbcd873c6d208e571
libxml2:
http://autobuild.buildroot.net/results/180/180ec71605ea063d0306ecc17a6c876002371bb3
arp-scan:
http://autobuild.buildroot.net/results/1fb/1fb88e5db902323dc97e73cbd9c78f2b6d71d909
pcre:
http://autobuild.buildroot.net/results/68c/68cf951594b0e67b45f8711745c17b93e2fbc03e

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../2.27/0011-arm-thumb-fix-elf2flt-segfault.patch | 927 +++++++++++++++++++++
 1 file changed, 927 insertions(+)
 create mode 100644 package/binutils/2.27/0011-arm-thumb-fix-elf2flt-segfault.patch

diff --git a/package/binutils/2.27/0011-arm-thumb-fix-elf2flt-segfault.patch b/package/binutils/2.27/0011-arm-thumb-fix-elf2flt-segfault.patch
new file mode 100644
index 0000000000..b50cf2fa04
--- /dev/null
+++ b/package/binutils/2.27/0011-arm-thumb-fix-elf2flt-segfault.patch
@@ -0,0 +1,927 @@
+From 1509a6875ba421c1d0219b0c959e2638392be7f0 Mon Sep 17 00:00:00 2001
+From: Thomas Preud'homme <thomas.preudhomme@arm.com>
+Date: Thu, 4 Aug 2016 15:36:52 +0100
+Subject: [PATCH] arm thumb: fix elf2flt segfault
+
+[Arnout: on ARM thumb-only using FLAT binary format, elf2flt would give
+ a segfault on some programs. This only occurred with binutils 2.27, not
+ with 2.26 or 2.28. The fix was bisected to this commit. It's not
+ entirely clear what it does, but it works.]
+
+bfd/
+	* elf32-arm.c (CMSE_PREFIX): Define macro.
+	(elf32_arm_stub_cmse_branch_thumb_only): Define stub sequence.
+	(cmse_branch_thumb_only): Declare stub.
+	(struct elf32_arm_link_hash_table): Define cmse_stub_sec field.
+	(elf32_arm_get_plt_info): Add globals parameter.  Use it to return
+	FALSE if there is no PLT.
+	(arm_type_of_stub): Adapt to new elf32_arm_get_plt_info signature.
+	(elf32_arm_final_link_relocate): Likewise.
+	(elf32_arm_gc_sweep_hook): Likewise.
+	(elf32_arm_gc_mark_extra_sections): Mark sections holding ARMv8-M
+	secure entry functions.
+	(arm_stub_is_thumb): Add case for arm_stub_cmse_branch_thumb_only.
+	(arm_dedicated_stub_output_section_required): Change to a switch case
+	and add a case for arm_stub_cmse_branch_thumb_only.
+	(arm_dedicated_stub_output_section_required_alignment): Likewise.
+	(arm_stub_dedicated_output_section_name): Likewise.
+	(arm_stub_dedicated_input_section_ptr): Likewise and remove
+	ATTRIBUTE_UNUSED for htab parameter.
+	(arm_stub_required_alignment): Likewise.
+	(arm_stub_sym_claimed): Likewise.
+	(arm_dedicated_stub_section_padding): Likewise.
+	(cmse_scan): New function.
+	(elf32_arm_size_stubs): Call cmse_scan for ARM M profile targets.
+	Set stub_changed to TRUE if such veneers were created.
+	(elf32_arm_swap_symbol_in): Add detection code for CMSE special
+	symbols.
+
+include/
+	* arm.h (ARM_GET_SYM_CMSE_SPCL): Define macro.
+	(ARM_SET_SYM_CMSE_SPCL): Likewise.
+
+ld/
+	* ld.texinfo (Placement of SG veneers): New concept entry.
+	* testsuite/ld-arm/arm-elf.exp
+	(Secure gateway veneers: no .gnu.sgstubs section): New test.
+	(Secure gateway veneers: wrong entry functions): Likewise.
+	(Secure gateway veneers (ARMv8-M Baseline)): Likewise.
+	(Secure gateway veneers (ARMv8-M Mainline)): Likewise.
+	* testsuite/ld-arm/cmse-veneers.s: New file.
+	* testsuite/ld-arm/cmse-veneers.d: Likewise.
+	* testsuite/ld-arm/cmse-veneers.rd: Likewise.
+	* testsuite/ld-arm/cmse-veneers.sd: Likewise.
+	* testsuite/ld-arm/cmse-veneers-no-gnu_sgstubs.out: Likewise.
+	* testsuite/ld-arm/cmse-veneers-wrong-entryfct.out: Likewise.
+
+Cherry-picked from 4ba2ef8fbe74716708e5ce0bcba4f3b1cc8ac99a in 2.28
+[Arnout: dropped the changes to the ChangeLog files]
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ bfd/elf32-arm.c                                    | 383 +++++++++++++++++++--
+ include/elf/arm.h                                  |   7 +
+ ld/ld.texinfo                                      |   6 +
+ ld/testsuite/ld-arm/arm-elf.exp                    |  27 ++
+ .../ld-arm/cmse-veneers-no-gnu_sgstubs.out         |   3 +
+ .../ld-arm/cmse-veneers-wrong-entryfct.out         |  19 +
+ ld/testsuite/ld-arm/cmse-veneers.d                 |  21 ++
+ ld/testsuite/ld-arm/cmse-veneers.rd                |   9 +
+ ld/testsuite/ld-arm/cmse-veneers.s                 |  97 ++++++
+ ld/testsuite/ld-arm/cmse-veneers.sd                |   7 +
+ 10 files changed, 559 insertions(+), 20 deletions(-)
+ create mode 100644 ld/testsuite/ld-arm/cmse-veneers-no-gnu_sgstubs.out
+ create mode 100644 ld/testsuite/ld-arm/cmse-veneers-wrong-entryfct.out
+ create mode 100644 ld/testsuite/ld-arm/cmse-veneers.d
+ create mode 100644 ld/testsuite/ld-arm/cmse-veneers.rd
+ create mode 100644 ld/testsuite/ld-arm/cmse-veneers.s
+ create mode 100644 ld/testsuite/ld-arm/cmse-veneers.sd
+
+diff --git a/bfd/elf32-arm.c b/bfd/elf32-arm.c
+index dbd291138cd..da6acee0b9f 100644
+--- a/bfd/elf32-arm.c
++++ b/bfd/elf32-arm.c
+@@ -2138,6 +2138,8 @@ typedef unsigned short int insn16;
+ 
+ #define STUB_ENTRY_NAME   "__%s_veneer"
+ 
++#define CMSE_PREFIX "__acle_se_"
++
+ /* The name of the dynamic interpreter.  This is put in the .interp
+    section.  */
+ #define ELF_DYNAMIC_INTERPRETER     "/usr/lib/ld.so.1"
+@@ -2550,6 +2552,13 @@ static const insn_sequence elf32_arm_stub_long_branch_arm_nacl_pic[] =
+   DATA_WORD (0, R_ARM_NONE, 0),         /* .word 0 */
+ };
+ 
++/* Stub used for transition to secure state (aka SG veneer).  */
++static const insn_sequence elf32_arm_stub_cmse_branch_thumb_only[] =
++{
++  THUMB32_INSN (0xe97fe97f),		/* sg.  */
++  THUMB32_B_INSN (0xf000b800, -4),	/* b.w original_branch_dest.  */
++};
++
+ 
+ /* Cortex-A8 erratum-workaround stubs.  */
+ 
+@@ -2629,6 +2638,7 @@ static const insn_sequence elf32_arm_stub_a8_veneer_blx[] =
+   DEF_STUB(long_branch_v4t_thumb_tls_pic) \
+   DEF_STUB(long_branch_arm_nacl) \
+   DEF_STUB(long_branch_arm_nacl_pic) \
++  DEF_STUB(cmse_branch_thumb_only) \
+   DEF_STUB(a8_veneer_b_cond) \
+   DEF_STUB(a8_veneer_b) \
+   DEF_STUB(a8_veneer_bl) \
+@@ -3180,6 +3190,9 @@ struct elf32_arm_link_hash_table
+      information on stub grouping.  */
+   struct map_stub *stub_group;
+ 
++  /* Input stub section holding secure gateway veneers.  */
++  asection *cmse_stub_sec;
++
+   /* Number of elements in stub_group.  */
+   unsigned int top_id;
+ 
+@@ -3328,12 +3341,16 @@ elf32_arm_create_local_iplt (bfd *abfd, unsigned long r_symndx)
+    union and *ARM_PLT at the ARM-specific information.  */
+ 
+ static bfd_boolean
+-elf32_arm_get_plt_info (bfd *abfd, struct elf32_arm_link_hash_entry *h,
++elf32_arm_get_plt_info (bfd *abfd, struct elf32_arm_link_hash_table *globals,
++			struct elf32_arm_link_hash_entry *h,
+ 			unsigned long r_symndx, union gotplt_union **root_plt,
+ 			struct arm_plt_info **arm_plt)
+ {
+   struct arm_local_iplt_info *local_iplt;
+ 
++  if (globals->root.splt == NULL && globals->root.iplt == NULL)
++    return FALSE;
++
+   if (h != NULL)
+     {
+       *root_plt = &h->root.plt;
+@@ -3795,6 +3812,7 @@ arm_stub_is_thumb (enum elf32_arm_stub_type stub_type)
+     case arm_stub_long_branch_v4t_thumb_arm_pic:
+     case arm_stub_long_branch_v4t_thumb_tls_pic:
+     case arm_stub_long_branch_thumb_only_pic:
++    case arm_stub_cmse_branch_thumb_only:
+       return TRUE;
+     case arm_stub_none:
+       BFD_FAIL ();
+@@ -3860,8 +3878,9 @@ arm_type_of_stub (struct bfd_link_info *info,
+      the address of the appropriate trampoline.  */
+   if (r_type != R_ARM_TLS_CALL
+       && r_type != R_ARM_THM_TLS_CALL
+-      && elf32_arm_get_plt_info (input_bfd, hash, ELF32_R_SYM (rel->r_info),
+-				 &root_plt, &arm_plt)
++      && elf32_arm_get_plt_info (input_bfd, globals, hash,
++				 ELF32_R_SYM (rel->r_info), &root_plt,
++				 &arm_plt)
+       && root_plt->offset != (bfd_vma) -1)
+     {
+       asection *splt;
+@@ -4173,7 +4192,16 @@ arm_dedicated_stub_output_section_required (enum elf32_arm_stub_type stub_type)
+   if (stub_type >= max_stub_type)
+     abort ();  /* Should be unreachable.  */
+ 
+-  return FALSE;
++  switch (stub_type)
++    {
++    case arm_stub_cmse_branch_thumb_only:
++      return TRUE;
++
++    default:
++      return FALSE;
++    }
++
++  abort ();  /* Should be unreachable.  */
+ }
+ 
+ /* Required alignment (as a power of 2) for the dedicated section holding
+@@ -4187,8 +4215,19 @@ arm_dedicated_stub_output_section_required_alignment
+   if (stub_type >= max_stub_type)
+     abort ();  /* Should be unreachable.  */
+ 
+-  BFD_ASSERT (!arm_dedicated_stub_output_section_required (stub_type));
+-  return 0;
++  switch (stub_type)
++    {
++    /* Vectors of Secure Gateway veneers must be aligned on 32byte
++       boundary.  */
++    case arm_stub_cmse_branch_thumb_only:
++      return 5;
++
++    default:
++      BFD_ASSERT (!arm_dedicated_stub_output_section_required (stub_type));
++      return 0;
++    }
++
++  abort ();  /* Should be unreachable.  */
+ }
+ 
+ /* Name of the dedicated output section to put veneers of type STUB_TYPE, or
+@@ -4200,8 +4239,17 @@ arm_dedicated_stub_output_section_name (enum elf32_arm_stub_type stub_type)
+   if (stub_type >= max_stub_type)
+     abort ();  /* Should be unreachable.  */
+ 
+-  BFD_ASSERT (!arm_dedicated_stub_output_section_required (stub_type));
+-  return NULL;
++  switch (stub_type)
++    {
++    case arm_stub_cmse_branch_thumb_only:
++      return ".gnu.sgstubs";
++
++    default:
++      BFD_ASSERT (!arm_dedicated_stub_output_section_required (stub_type));
++      return NULL;
++    }
++
++  abort ();  /* Should be unreachable.  */
+ }
+ 
+ /* If veneers of type STUB_TYPE should go in a dedicated output section,
+@@ -4209,15 +4257,23 @@ arm_dedicated_stub_output_section_name (enum elf32_arm_stub_type stub_type)
+    corresponding input section.  Otherwise, returns NULL.  */
+ 
+ static asection **
+-arm_dedicated_stub_input_section_ptr
+-  (struct elf32_arm_link_hash_table *htab ATTRIBUTE_UNUSED,
+-   enum elf32_arm_stub_type stub_type)
++arm_dedicated_stub_input_section_ptr (struct elf32_arm_link_hash_table *htab,
++				      enum elf32_arm_stub_type stub_type)
+ {
+   if (stub_type >= max_stub_type)
+     abort ();  /* Should be unreachable.  */
+ 
+-  BFD_ASSERT (!arm_dedicated_stub_output_section_required (stub_type));
+-  return NULL;
++  switch (stub_type)
++    {
++    case arm_stub_cmse_branch_thumb_only:
++      return &htab->cmse_stub_sec;
++
++    default:
++      BFD_ASSERT (!arm_dedicated_stub_output_section_required (stub_type));
++      return NULL;
++    }
++
++  abort ();  /* Should be unreachable.  */
+ }
+ 
+ /* Find or create a stub section to contain a stub of type STUB_TYPE.  SECTION
+@@ -4440,6 +4496,7 @@ arm_stub_required_alignment (enum elf32_arm_stub_type stub_type)
+     case arm_stub_long_branch_thumb_only_pic:
+     case arm_stub_long_branch_any_tls_pic:
+     case arm_stub_long_branch_v4t_thumb_tls_pic:
++    case arm_stub_cmse_branch_thumb_only:
+     case arm_stub_a8_veneer_blx:
+       return 4;
+ 
+@@ -4461,7 +4518,16 @@ arm_stub_sym_claimed (enum elf32_arm_stub_type stub_type)
+   if (stub_type >= max_stub_type)
+     abort ();  /* Should be unreachable.  */
+ 
+-  return FALSE;
++  switch (stub_type)
++    {
++    case arm_stub_cmse_branch_thumb_only:
++      return TRUE;
++
++    default:
++      return FALSE;
++    }
++
++  abort ();  /* Should be unreachable.  */
+ }
+ 
+ /* Returns the padding needed for the dedicated section used stubs of type
+@@ -4473,7 +4539,16 @@ arm_dedicated_stub_section_padding (enum elf32_arm_stub_type stub_type)
+   if (stub_type >= max_stub_type)
+     abort ();  /* Should be unreachable.  */
+ 
+-  return 0;
++  switch (stub_type)
++    {
++    case arm_stub_cmse_branch_thumb_only:
++      return 32;
++
++    default:
++      return 0;
++    }
++
++  abort ();  /* Should be unreachable.  */
+ }
+ 
+ static bfd_boolean
+@@ -5364,6 +5439,204 @@ elf32_arm_create_stub (struct elf32_arm_link_hash_table *htab,
+   return TRUE;
+ }
+ 
++/* Scan symbols in INPUT_BFD to identify secure entry functions needing a
++   gateway veneer to transition from non secure to secure state and create them
++   accordingly.
++
++   "ARMv8-M Security Extensions: Requirements on Development Tools" document
++   defines the conditions that govern Secure Gateway veneer creation for a
++   given symbol <SYM> as follows:
++   - it has function type
++   - it has non local binding
++   - a symbol named __acle_se_<SYM> (called special symbol) exists with the
++     same type, binding and value as <SYM> (called normal symbol).
++   An entry function can handle secure state transition itself in which case
++   its special symbol would have a different value from the normal symbol.
++
++   OUT_ATTR gives the output attributes, SYM_HASHES the symbol index to hash
++   entry mapping while HTAB gives the name to hash entry mapping.
++
++   If any secure gateway veneer is created, *STUB_CHANGED is set to TRUE.  The
++   return value gives whether a stub failed to be allocated.  */
++
++static bfd_boolean
++cmse_scan (bfd *input_bfd, struct elf32_arm_link_hash_table *htab,
++	   obj_attribute *out_attr, struct elf_link_hash_entry **sym_hashes,
++	   bfd_boolean *stub_changed)
++{
++  const struct elf_backend_data *bed;
++  Elf_Internal_Shdr *symtab_hdr;
++  unsigned i, j, sym_count, ext_start;
++  Elf_Internal_Sym *cmse_sym, *local_syms;
++  struct elf32_arm_link_hash_entry *hash, *cmse_hash = NULL;
++  enum arm_st_branch_type branch_type;
++  char *sym_name, *lsym_name;
++  bfd_vma sym_value;
++  asection *section;
++  bfd_boolean is_v8m, new_stub, created_stub, cmse_invalid, ret = TRUE;
++
++  bed = get_elf_backend_data (input_bfd);
++  symtab_hdr = &elf_tdata (input_bfd)->symtab_hdr;
++  sym_count = symtab_hdr->sh_size / bed->s->sizeof_sym;
++  ext_start = symtab_hdr->sh_info;
++  is_v8m = (out_attr[Tag_CPU_arch].i >= TAG_CPU_ARCH_V8M_BASE
++	    && out_attr[Tag_CPU_arch_profile].i == 'M');
++
++  local_syms = (Elf_Internal_Sym *) symtab_hdr->contents;
++  if (local_syms == NULL)
++    local_syms = bfd_elf_get_elf_syms (input_bfd, symtab_hdr,
++				       symtab_hdr->sh_info, 0, NULL, NULL,
++				       NULL);
++  if (symtab_hdr->sh_info && local_syms == NULL)
++    return FALSE;
++
++  /* Scan symbols.  */
++  for (i = 0; i < sym_count; i++)
++    {
++      cmse_invalid = FALSE;
++
++      if (i < ext_start)
++	{
++	  cmse_sym = &local_syms[i];
++	  /* Not a special symbol.  */
++	  if (!ARM_GET_SYM_CMSE_SPCL (cmse_sym->st_target_internal))
++	    continue;
++	  sym_name = bfd_elf_string_from_elf_section (input_bfd,
++						      symtab_hdr->sh_link,
++						      cmse_sym->st_name);
++	  /* Special symbol with local binding.  */
++	  cmse_invalid = TRUE;
++	}
++      else
++	{
++	  cmse_hash = elf32_arm_hash_entry (sym_hashes[i - ext_start]);
++	  sym_name = (char *) cmse_hash->root.root.root.string;
++
++	  /* Not a special symbol.  */
++	  if (!ARM_GET_SYM_CMSE_SPCL (cmse_hash->root.target_internal))
++	    continue;
++
++	  /* Special symbol has incorrect binding or type.  */
++	  if ((cmse_hash->root.root.type != bfd_link_hash_defined
++	       && cmse_hash->root.root.type != bfd_link_hash_defweak)
++	      || cmse_hash->root.type != STT_FUNC)
++	    cmse_invalid = TRUE;
++	}
++
++      if (!is_v8m)
++	{
++	  (*_bfd_error_handler) (_("%B: Special symbol `%s' only allowed for "
++				   "ARMv8-M architecture or later."),
++				 input_bfd, sym_name);
++	  is_v8m = TRUE; /* Avoid multiple warning.  */
++	  ret = FALSE;
++	}
++
++      if (cmse_invalid)
++	{
++	  (*_bfd_error_handler) (_("%B: invalid special symbol `%s'."),
++				 input_bfd, sym_name);
++	  (*_bfd_error_handler) (_("It must be a global or weak function "
++				   "symbol."));
++	  ret = FALSE;
++	  if (i < ext_start)
++	    continue;
++	}
++
++      sym_name += strlen (CMSE_PREFIX);
++      hash = (struct elf32_arm_link_hash_entry *)
++	elf_link_hash_lookup (&(htab)->root, sym_name, FALSE, FALSE, TRUE);
++
++      /* No associated normal symbol or it is neither global nor weak.  */
++      if (!hash
++	  || (hash->root.root.type != bfd_link_hash_defined
++	      && hash->root.root.type != bfd_link_hash_defweak)
++	  || hash->root.type != STT_FUNC)
++	{
++	  /* Initialize here to avoid warning about use of possibly
++	     uninitialized variable.  */
++	  j = 0;
++
++	  if (!hash)
++	    {
++	      /* Searching for a normal symbol with local binding.  */
++	      for (; j < ext_start; j++)
++		{
++		  lsym_name =
++		    bfd_elf_string_from_elf_section (input_bfd,
++						     symtab_hdr->sh_link,
++						     local_syms[j].st_name);
++		  if (!strcmp (sym_name, lsym_name))
++		    break;
++		}
++	    }
++
++	  if (hash || j < ext_start)
++	    {
++	      (*_bfd_error_handler)
++		(_("%B: invalid standard symbol `%s'."), input_bfd, sym_name);
++	      (*_bfd_error_handler)
++		(_("It must be a global or weak function symbol."));
++	    }
++	  else
++	    (*_bfd_error_handler)
++	      (_("%B: absent standard symbol `%s'."), input_bfd, sym_name);
++	  ret = FALSE;
++	  if (!hash)
++	    continue;
++	}
++
++      sym_value = hash->root.root.u.def.value;
++      section = hash->root.root.u.def.section;
++
++      if (cmse_hash->root.root.u.def.section != section)
++	{
++	  (*_bfd_error_handler)
++	    (_("%B: `%s' and its special symbol are in different sections."),
++	     input_bfd, sym_name);
++	  ret = FALSE;
++	}
++      if (cmse_hash->root.root.u.def.value != sym_value)
++	continue; /* Ignore: could be an entry function starting with SG.  */
++
++	/* If this section is a link-once section that will be discarded, then
++	   don't create any stubs.  */
++      if (section->output_section == NULL)
++	{
++	  (*_bfd_error_handler)
++	    (_("%B: entry function `%s' not output."), input_bfd, sym_name);
++	  continue;
++	}
++
++      if (hash->root.size == 0)
++	{
++	  (*_bfd_error_handler)
++	    (_("%B: entry function `%s' is empty."), input_bfd, sym_name);
++	  ret = FALSE;
++	}
++
++      if (!ret)
++	continue;
++      branch_type = ARM_GET_SYM_BRANCH_TYPE (hash->root.target_internal);
++      created_stub
++	= elf32_arm_create_stub (htab, arm_stub_cmse_branch_thumb_only,
++				 NULL, NULL, section, hash, sym_name,
++				 sym_value, branch_type, &new_stub);
++
++      if (!created_stub)
++	 ret = FALSE;
++      else
++	{
++	  BFD_ASSERT (new_stub);
++	  *stub_changed = TRUE;
++	}
++    }
++
++  if (!symtab_hdr->contents)
++    free (local_syms);
++  return ret;
++}
++
+ /* Determine and set the size of the stub section for a final link.
+ 
+    The basic idea here is to examine all the relocations looking for
+@@ -5380,8 +5653,9 @@ elf32_arm_size_stubs (bfd *output_bfd,
+ 						      unsigned int),
+ 		      void (*layout_sections_again) (void))
+ {
++  obj_attribute *out_attr;
+   bfd_size_type stub_group_size;
+-  bfd_boolean stubs_always_after_branch;
++  bfd_boolean m_profile, stubs_always_after_branch, first_veneer_scan = TRUE;
+   struct elf32_arm_link_hash_table *htab = elf32_arm_hash_table (info);
+   struct a8_erratum_fix *a8_fixes = NULL;
+   unsigned int num_a8_fixes = 0, a8_fix_table_size = 10;
+@@ -5410,6 +5684,8 @@ elf32_arm_size_stubs (bfd *output_bfd,
+   htab->layout_sections_again = layout_sections_again;
+   stubs_always_after_branch = group_size < 0;
+ 
++  out_attr = elf_known_obj_attributes_proc (output_bfd);
++  m_profile = out_attr[Tag_CPU_arch_profile].i == 'M';
+   /* The Cortex-A8 erratum fix depends on stubs not being in the same 4K page
+      as the first half of a 32-bit branch straddling two 4K pages.  This is a
+      crude way of enforcing that.  */
+@@ -5475,6 +5751,18 @@ elf32_arm_size_stubs (bfd *output_bfd,
+ 	  if (symtab_hdr->sh_info == 0)
+ 	    continue;
+ 
++	  /* Limit scan of symbols to object file whose profile is
++	     Microcontroller to not hinder performance in the general case.  */
++	  if (m_profile && first_veneer_scan)
++	    {
++	      struct elf_link_hash_entry **sym_hashes;
++
++	      sym_hashes = elf_sym_hashes (input_bfd);
++	      if (!cmse_scan (input_bfd, htab, out_attr, sym_hashes,
++			      &stub_changed))
++		goto error_ret_free_local;
++	    }
++
+ 	  /* Walk over each section attached to the input bfd.  */
+ 	  for (section = input_bfd->sections;
+ 	       section != NULL;
+@@ -5861,6 +6149,7 @@ elf32_arm_size_stubs (bfd *output_bfd,
+ 
+       /* Ask the linker to do its stuff.  */
+       (*htab->layout_sections_again) ();
++      first_veneer_scan = FALSE;
+     }
+ 
+   /* Add stubs for Cortex-A8 erratum fixes now.  */
+@@ -9202,7 +9491,8 @@ elf32_arm_final_link_relocate (reloc_howto_type *           howto,
+   /* Find out whether the symbol has a PLT.  Set ST_VALUE, BRANCH_TYPE and
+      VALUE appropriately for relocations that we resolve at link time.  */
+   has_iplt_entry = FALSE;
+-  if (elf32_arm_get_plt_info (input_bfd, eh, r_symndx, &root_plt, &arm_plt)
++  if (elf32_arm_get_plt_info (input_bfd, globals, eh, r_symndx, &root_plt,
++			      &arm_plt)
+       && root_plt->offset != (bfd_vma) -1)
+     {
+       plt_offset = root_plt->offset;
+@@ -13614,7 +13904,8 @@ elf32_arm_gc_sweep_hook (bfd *                     abfd,
+ 	}
+ 
+       if (may_need_local_target_p
+-	  && elf32_arm_get_plt_info (abfd, eh, r_symndx, &root_plt, &arm_plt))
++	  && elf32_arm_get_plt_info (abfd, globals, eh, r_symndx, &root_plt,
++				     &arm_plt))
+ 	{
+ 	  /* If PLT refcount book-keeping is wrong and too low, we'll
+ 	     see a zero value (going to -1) for the root PLT reference
+@@ -14082,7 +14373,11 @@ elf32_arm_check_relocs (bfd *abfd, struct bfd_link_info *info,
+ }
+ 
+ /* Unwinding tables are not referenced directly.  This pass marks them as
+-   required if the corresponding code section is marked.  */
++   required if the corresponding code section is marked.  Similarly, ARMv8-M
++   secure entry functions can only be referenced by SG veneers which are
++   created after the GC process. They need to be marked in case they reside in
++   their own section (as would be the case if code was compiled with
++   -ffunction-sections).  */
+ 
+ static bfd_boolean
+ elf32_arm_gc_mark_extra_sections (struct bfd_link_info *info,
+@@ -14090,10 +14385,21 @@ elf32_arm_gc_mark_extra_sections (struct bfd_link_info *info,
+ {
+   bfd *sub;
+   Elf_Internal_Shdr **elf_shdrp;
+-  bfd_boolean again;
++  asection *cmse_sec;
++  obj_attribute *out_attr;
++  Elf_Internal_Shdr *symtab_hdr;
++  unsigned i, sym_count, ext_start;
++  const struct elf_backend_data *bed;
++  struct elf_link_hash_entry **sym_hashes;
++  struct elf32_arm_link_hash_entry *cmse_hash;
++  bfd_boolean again, is_v8m, first_bfd_browse = TRUE;
+ 
+   _bfd_elf_gc_mark_extra_sections (info, gc_mark_hook);
+ 
++  out_attr = elf_known_obj_attributes_proc (info->output_bfd);
++  is_v8m = out_attr[Tag_CPU_arch].i >= TAG_CPU_ARCH_V8M_BASE
++	   && out_attr[Tag_CPU_arch_profile].i == 'M';
++
+   /* Marking EH data may cause additional code sections to be marked,
+      requiring multiple passes.  */
+   again = TRUE;
+@@ -14124,7 +14430,34 @@ elf32_arm_gc_mark_extra_sections (struct bfd_link_info *info,
+ 		    return FALSE;
+ 		}
+ 	    }
++
++	  /* Mark section holding ARMv8-M secure entry functions.  We mark all
++	     of them so no need for a second browsing.  */
++	  if (is_v8m && first_bfd_browse)
++	    {
++	      sym_hashes = elf_sym_hashes (sub);
++	      bed = get_elf_backend_data (sub);
++	      symtab_hdr = &elf_tdata (sub)->symtab_hdr;
++	      sym_count = symtab_hdr->sh_size / bed->s->sizeof_sym;
++	      ext_start = symtab_hdr->sh_info;
++
++	      /* Scan symbols.  */
++	      for (i = ext_start; i < sym_count; i++)
++		{
++		  cmse_hash = elf32_arm_hash_entry (sym_hashes[i - ext_start]);
++
++		  /* Assume it is a special symbol.  If not, cmse_scan will
++		     warn about it and user can do something about it.  */
++		  if (ARM_GET_SYM_CMSE_SPCL (cmse_hash->root.target_internal))
++		    {
++		      cmse_sec = cmse_hash->root.root.u.def.section;
++		      if (!_bfd_elf_gc_mark (info, cmse_sec, gc_mark_hook))
++			return FALSE;
++		    }
++		}
++	    }
+ 	}
++      first_bfd_browse = FALSE;
+     }
+ 
+   return TRUE;
+@@ -17776,6 +18109,9 @@ elf32_arm_swap_symbol_in (bfd * abfd,
+ 			  const void *pshn,
+ 			  Elf_Internal_Sym *dst)
+ {
++  Elf_Internal_Shdr *symtab_hdr;
++  const char *name = NULL;
++
+   if (!bfd_elf32_swap_symbol_in (abfd, psrc, pshn, dst))
+     return FALSE;
+   dst->st_target_internal = 0;
+@@ -17804,6 +18140,13 @@ elf32_arm_swap_symbol_in (bfd * abfd,
+   else
+     ARM_SET_SYM_BRANCH_TYPE (dst->st_target_internal, ST_BRANCH_UNKNOWN);
+ 
++  /* Mark CMSE special symbols.  */
++  symtab_hdr = & elf_symtab_hdr (abfd);
++  if (symtab_hdr->sh_size)
++    name = bfd_elf_sym_name (abfd, symtab_hdr, dst, NULL);
++  if (name && CONST_STRNEQ (name, CMSE_PREFIX))
++    ARM_SET_SYM_CMSE_SPCL (dst->st_target_internal);
++
+   return TRUE;
+ }
+ 
+diff --git a/include/elf/arm.h b/include/elf/arm.h
+index bafc03c52ee..abad4731b33 100644
+--- a/include/elf/arm.h
++++ b/include/elf/arm.h
+@@ -384,4 +384,11 @@ enum arm_st_branch_type {
+ 	   | ((TYPE) & ENUM_ARM_ST_BRANCH_TYPE_BITMASK))
+ #endif
+ 
++/* Get or set whether a symbol is a special symbol of an entry function of CMSE
++   secure code.  */
++#define ARM_GET_SYM_CMSE_SPCL(SYM_TARGET_INTERNAL) \
++  (((SYM_TARGET_INTERNAL) >> 2) & 1)
++#define ARM_SET_SYM_CMSE_SPCL(SYM_TARGET_INTERNAL) \
++  (SYM_TARGET_INTERNAL) |= 4
++
+ #endif /* _ELF_ARM_H */
+diff --git a/ld/ld.texinfo b/ld/ld.texinfo
+index 838c75deb50..2580fdf2f6e 100644
+--- a/ld/ld.texinfo
++++ b/ld/ld.texinfo
+@@ -6865,6 +6865,12 @@ entries which only support 512Mb of code.
+ The @samp{--no-apply-dynamic-relocs} option makes AArch64 linker do not apply
+ link-time values for dynamic relocations.
+ 
++ at cindex Placement of SG veneers
++All SG veneers are placed in the special output section @code{.gnu.sgstubs}.
++Its start address must be set, either with the command line option
++ at samp{--section-start} or in a linker script, to indicate where to place these
++veneers in memory.
++
+ @ifclear GENERIC
+ @lowersections
+ @end ifclear
+diff --git a/ld/testsuite/ld-arm/arm-elf.exp b/ld/testsuite/ld-arm/arm-elf.exp
+index a5d4c8757cb..88a4ea977b4 100644
+--- a/ld/testsuite/ld-arm/arm-elf.exp
++++ b/ld/testsuite/ld-arm/arm-elf.exp
+@@ -636,6 +636,33 @@ set armeabitests_nonacl {
+      {{objdump -d jump-reloc-veneers-long.d}}
+      "jump-reloc-veneers-long"}
+ 
++    {"Secure gateway veneers: no .gnu.sgstubs section" "" ""
++     "-march=armv8-m.base -mthumb"
++     {cmse-veneers.s}
++     {{ld cmse-veneers-no-gnu_sgstubs.out}}
++     "cmse-veneers-no-gnu_sgstubs"}
++    {"Secure gateway veneers: wrong entry functions" "" ""
++     "-march=armv7-m -mthumb --defsym CHECK_ERRORS=1"
++     {cmse-veneers.s}
++     {{ld cmse-veneers-wrong-entryfct.out}}
++     "cmse-veneers-wrong-entryfct"}
++    {"Secure gateway veneers (ARMv8-M Baseline)"
++     "-Ttext=0x8000 --section-start .gnu.sgstubs=0x20000 --gc-sections" ""
++     "-march=armv8-m.base -mthumb"
++     {cmse-veneers.s}
++     {{objdump {-d -j .gnu.sgstubs} cmse-veneers.d}
++      {objdump {-h -j .gnu.sgstubs} cmse-veneers.sd}
++      {nm {} cmse-veneers.rd}}
++     "cmse-veneers-baseline"}
++    {"Secure gateway veneers (ARMv8-M Mainline)"
++     "-Ttext=0x8000 --section-start .gnu.sgstubs=0x20000 --gc-sections" ""
++     "-march=armv8-m.main -mthumb"
++     {cmse-veneers.s}
++     {{objdump {-d -j .gnu.sgstubs} cmse-veneers.d}
++      {objdump {-h -j .gnu.sgstubs} cmse-veneers.sd}
++      {nm {} cmse-veneers.rd}}
++     "cmse-veneers-mainline"}
++
+     {"R_ARM_THM_JUMP19 Relocation veneers: Short"
+      "--section-start destsect=0x000108002 --section-start .text=0x8000" ""
+      "-march=armv7-m -mthumb"
+diff --git a/ld/testsuite/ld-arm/cmse-veneers-no-gnu_sgstubs.out b/ld/testsuite/ld-arm/cmse-veneers-no-gnu_sgstubs.out
+new file mode 100644
+index 00000000000..9d1e5ba3215
+--- /dev/null
++++ b/ld/testsuite/ld-arm/cmse-veneers-no-gnu_sgstubs.out
+@@ -0,0 +1,3 @@
++.*: No address assigned to the veneers output section .gnu.sgstubs
++.*: cannot size stub section: Invalid operation
++#...
+diff --git a/ld/testsuite/ld-arm/cmse-veneers-wrong-entryfct.out b/ld/testsuite/ld-arm/cmse-veneers-wrong-entryfct.out
+new file mode 100644
+index 00000000000..fd4766ab877
+--- /dev/null
++++ b/ld/testsuite/ld-arm/cmse-veneers-wrong-entryfct.out
+@@ -0,0 +1,19 @@
++.*: .*: Special symbol `__acle_se_loc_entry_veneer1' only allowed for ARMv8-M architecture or later.
++.*: .*: invalid .* symbol `.*loc_entry_veneer1'.
++.*: It must be a global or weak function symbol.
++.*: .*: invalid special symbol `__acle_se_loc_entry_veneer2'.
++.*: It must be a global or weak function symbol.
++.*: .*: invalid special symbol `__acle_se_loc_entry_veneer4'.
++.*: It must be a global or weak function symbol.
++.*: .*: invalid standard symbol `loc_entry_veneer3'.
++.*: It must be a global or weak function symbol.
++.*: .*: invalid standard symbol `loc_entry_veneer5'.
++.*: It must be a global or weak function symbol.
++.*: .*: absent standard symbol `fake_entry_veneer1'.
++.*: .*: invalid standard symbol `obj_entry_veneer1'.
++.*: It must be a global or weak function symbol.
++.*: .*: invalid special symbol `__acle_se_obj_entry_veneer2'.
++.*: It must be a global or weak function symbol.
++.*: .*: `fake_entry_veneer2' and its special symbol are in different sections.
++.*: cannot size stub section: Invalid operation
++#...
+diff --git a/ld/testsuite/ld-arm/cmse-veneers.d b/ld/testsuite/ld-arm/cmse-veneers.d
+new file mode 100644
+index 00000000000..6a44a2b5dce
+--- /dev/null
++++ b/ld/testsuite/ld-arm/cmse-veneers.d
+@@ -0,0 +1,21 @@
++
++.*
++
++
++Disassembly of section \.gnu.sgstubs:
++
++00020000 <glob_entry_veneer2>:
++   20000:	e97f e97f 	sg
++   20004:	f7e8 b800 	b\.w	8008 <__acle_se_glob_entry_veneer2>
++
++00020008 <weak_entry_veneer2>:
++   20008:	e97f e97f 	sg
++   2000c:	f7e7 bffe 	b\.w	800c <__acle_se_weak_entry_veneer2>
++
++00020010 <glob_entry_veneer1>:
++   20010:	e97f e97f 	sg
++   20014:	f7e7 bff4 	b\.w	8000 <__acle_se_glob_entry_veneer1>
++
++00020018 <weak_entry_veneer1>:
++   20018:	e97f e97f 	sg
++   2001c:	f7e7 bff2 	b\.w	8004 <__acle_se_weak_entry_veneer1>
+diff --git a/ld/testsuite/ld-arm/cmse-veneers.rd b/ld/testsuite/ld-arm/cmse-veneers.rd
+new file mode 100644
+index 00000000000..20fad961bd8
+--- /dev/null
++++ b/ld/testsuite/ld-arm/cmse-veneers.rd
+@@ -0,0 +1,9 @@
++#...
++[0-9a-f]+ T glob_entry_fct
++#...
++[0-9a-f]+ T glob_entry_veneer1
++[0-9a-f]+ T glob_entry_veneer2
++#...
++[0-9a-f]+ W weak_entry_veneer1
++[0-9a-f]+ W weak_entry_veneer2
++#...
+diff --git a/ld/testsuite/ld-arm/cmse-veneers.s b/ld/testsuite/ld-arm/cmse-veneers.s
+new file mode 100644
+index 00000000000..d5c57f646a7
+--- /dev/null
++++ b/ld/testsuite/ld-arm/cmse-veneers.s
+@@ -0,0 +1,97 @@
++	.syntax unified
++	.thumb
++	.file	"foo.c"
++	.text
++
++.macro	decltype	name, type
++.ifc \type,object
++	.data
++.else
++	.thumb
++	.thumb_func
++.endif
++	.type	\name, %\type
++.endm
++
++
++.macro	entry	name, type, vis, typespc, visspc, entry_fct
++	.align	2
++.ifb \visspc
++	.\vis	__acle_se_\name
++.else
++	.\visspc	__acle_se_\name
++.endif
++	.\vis	\name
++	.thumb
++	.thumb_func
++.ifb \typespc
++	decltype	__acle_se_\name, \type
++.else
++	decltype	__acle_se_\name, \typespc
++.endif
++	decltype	\name, \type
++__acle_se_\name:
++	\entry_fct
++\name:
++.ifc \type,object
++	.word 42
++.else
++	nop
++.endif
++	.size	\name, .-\name
++	.size	__acle_se_\name, .-__acle_se_\name
++.endm
++
++
++.ifndef CHECK_ERRORS
++	@ Valid setups for veneer generation
++	entry glob_entry_veneer1, function, global
++	entry weak_entry_veneer1, function, weak
++	entry glob_entry_veneer2, function, global, visspc=weak
++	entry weak_entry_veneer2, function, weak, visspc=global
++
++	@ Valid setup for entry function without SG veneer
++	entry glob_entry_fct, function, global, entry_fct=nop
++
++.else
++	@ Invalid setups for veneer generation (visibility)
++	entry loc_entry_veneer1, function, local
++	entry loc_entry_veneer2, function, global, visspc=local
++	entry loc_entry_veneer3, function, local, visspc=global
++	entry loc_entry_veneer4, function, weak, visspc=local
++	entry loc_entry_veneer5, function, local, visspc=weak
++
++	@ Invalid setups for veneer generation (absent standard symbol)
++	.align	2
++	.global	__acle_se_fake_entry_veneer1
++	.thumb
++	.thumb_func
++	.type	__acle_se_fake_entry_veneer1, %function
++__acle_se_fake_entry_veneer1:
++	nop
++	.size	__acle_se_fake_entry_veneer1, .-__acle_se_fake_entry_veneer1
++
++	@ Invalid setups for veneer generation (type)
++	entry obj_entry_veneer1, object, global, typespc=function
++	entry obj_entry_veneer2, function, global, typespc=object
++
++	@ Invalid setup for veneer generation (sections)
++	.section .text.sub1
++	.align	2
++	.thumb
++	.thumb_func
++	.global	__acle_se_fake_entry_veneer2
++	.type	__acle_se_fake_entry_veneer2, %function
++__acle_se_fake_entry_veneer2:
++	nop
++	.size	__acle_se_fake_entry_veneer2, .-__acle_se_fake_entry_veneer2
++	.section .text.sub2
++	.align	2
++	.thumb
++	.thumb_func
++	.global	fake_entry_veneer2
++	.type	fake_entry_veneer2, %function
++fake_entry_veneer2:
++	nop
++	.size	fake_entry_veneer2, .-fake_entry_veneer2
++.endif
+diff --git a/ld/testsuite/ld-arm/cmse-veneers.sd b/ld/testsuite/ld-arm/cmse-veneers.sd
+new file mode 100644
+index 00000000000..99bfc8f37c2
+--- /dev/null
++++ b/ld/testsuite/ld-arm/cmse-veneers.sd
+@@ -0,0 +1,7 @@
++
++.*
++
++Sections:
++Idx Name          Size      VMA       LMA       File off  Algn
++  \d+ \.gnu\.sgstubs  00000020  00020000  00020000  00010000  2\*\*5
++                  CONTENTS, ALLOC, LOAD, READONLY, CODE
+-- 
+2.11.0
+
-- 
2.11.0
