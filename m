From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Fri, 29 Jul 2016 12:22:54 +0300
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2016.09-eng007
	and PIE fix
Message-ID: <1469784174-25923-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-eng007 tag plus a
couple of fixes on top of it that will all make its way in the
next engineering build.

We hope this patch will cure most buildroot ARC failures as it
contains important fixes:

1) PIE fix. We have added PIE support to ARC toolchain at last.
So that should prevent breakage of many packages.

2) Assembler fix. This patch also have changes that fixes frequent
assembler failures, e.g.:
http://autobuild.buildroot.net/results/543/5430b902d900943a34c1888e7e410bd5df367bc2//

Note that we added patch for uClibc-ng that also affects PIE feature.
We had to do that because in Buildroot for ARC uclibc comes right from
uClibc-ng release tarballs and the change hasn't been in any release of
uClibc-ng. If we don't add this patch we see a lot of link-time issues.
This patch is stopgap measure. We are going to upstream this change
to uClibc-ng and remove from buildroot as soon as it would be included
in some uClibc-ng release.

We still keep GDB as it is of arc-2016.03 release because there're some
issues we'd like to resolve before releasing it to wider audience.

So again note this is next engineering builds of arc-2016.09 series
and it might have all kinds of breakages, please don't use it for
production builds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../0300-ld-makefile.patch                         |   0
 .../0301-check-ldrunpath-length.patch              |   0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |   0
 .../0600-poison-system-directories.patch           |   0
 .../0700-PIE-fixes-in-for-ARC-bfd.patch            | 287 +++++++++++++++++++++
 .../0701-Fixed-init-fini-linker-options.patch      |  40 +++
 ...x-undefined-symbols-aborting-on-PIE-cases.patch |  27 ++
 .../0800-Fixed-issue-in-tvheadend-package.patch    |  24 ++
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 .../130-fix_build_with_gcc-6.patch                 |   0
 .../130-pr43538.patch                              |   0
 .../301-missing-execinfo_h.patch                   |   0
 .../305-libmudflap-susv3-legacy.patch              |   0
 .../842-PR60155.patch                              |   0
 .../850-libstdcxx-uclibc-c99.patch                 |   0
 .../851-PR-other-56780.patch                       |   0
 .../930-libgcc-disable-split-stack-nothreads.patch |   0
 package/gcc/gcc.hash                               |   2 +-
 package/uclibc/0002-Fix-to-PIE.patch               |  35 +++
 22 files changed, 418 insertions(+), 5 deletions(-)
 rename package/binutils/{arc-2016.09-eng006 => arc-2016.09-eng007}/0300-ld-makefile.patch (100%)
 rename package/binutils/{arc-2016.09-eng006 => arc-2016.09-eng007}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{arc-2016.09-eng006 => arc-2016.09-eng007}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{arc-2016.09-eng006 => arc-2016.09-eng007}/0600-poison-system-directories.patch (100%)
 create mode 100644 package/binutils/arc-2016.09-eng007/0700-PIE-fixes-in-for-ARC-bfd.patch
 create mode 100644 package/binutils/arc-2016.09-eng007/0701-Fixed-init-fini-linker-options.patch
 create mode 100644 package/binutils/arc-2016.09-eng007/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch
 create mode 100644 package/binutils/arc-2016.09-eng007/0800-Fixed-issue-in-tvheadend-package.patch
 rename package/gcc/{arc-2016.09-eng006 => arc-2016.09-eng007}/130-fix_build_with_gcc-6.patch (100%)
 rename package/gcc/{arc-2016.09-eng006 => arc-2016.09-eng007}/130-pr43538.patch (100%)
 rename package/gcc/{arc-2016.09-eng006 => arc-2016.09-eng007}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{arc-2016.09-eng006 => arc-2016.09-eng007}/305-libmudflap-susv3-legacy.patch (100%)
 rename package/gcc/{arc-2016.09-eng006 => arc-2016.09-eng007}/842-PR60155.patch (100%)
 rename package/gcc/{arc-2016.09-eng006 => arc-2016.09-eng007}/850-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{arc-2016.09-eng006 => arc-2016.09-eng007}/851-PR-other-56780.patch (100%)
 rename package/gcc/{arc-2016.09-eng006 => arc-2016.09-eng007}/930-libgcc-disable-split-stack-nothreads.patch (100%)
 create mode 100644 package/uclibc/0002-Fix-to-PIE.patch

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 34cda13..92ca998 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.09-eng006"	if BR2_arc
+	default "arc-2016.09-eng007"	if BR2_arc
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
diff --git a/package/binutils/arc-2016.09-eng006/0300-ld-makefile.patch b/package/binutils/arc-2016.09-eng007/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng006/0300-ld-makefile.patch
rename to package/binutils/arc-2016.09-eng007/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.09-eng006/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-eng007/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng006/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.09-eng007/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.09-eng006/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-eng007/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng006/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.09-eng007/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.09-eng006/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-eng007/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng006/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.09-eng007/0600-poison-system-directories.patch
diff --git a/package/binutils/arc-2016.09-eng007/0700-PIE-fixes-in-for-ARC-bfd.patch b/package/binutils/arc-2016.09-eng007/0700-PIE-fixes-in-for-ARC-bfd.patch
new file mode 100644
index 0000000..fa7d667
--- /dev/null
+++ b/package/binutils/arc-2016.09-eng007/0700-PIE-fixes-in-for-ARC-bfd.patch
@@ -0,0 +1,287 @@
+From 3db684c4f3c873cd53d2d323e62441038c7607c4 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Wed, 13 Jul 2016 18:04:20 +0200
+Subject: [PATCH 06/11] PIE fixes in for ARC bfd.
+
+---
+ bfd/elf-bfd.h   |   1 +
+ bfd/elf32-arc.c | 187 ++++++++++++++++++++++++++++++++++++++++++++------------
+ 2 files changed, 149 insertions(+), 39 deletions(-)
+
+diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
+index bb3371f..fbe0464 100644
+--- a/bfd/elf-bfd.h
++++ b/bfd/elf-bfd.h
+@@ -444,6 +444,7 @@ enum elf_target_id
+ {
+   AARCH64_ELF_DATA = 1,
+   ALPHA_ELF_DATA,
++  ARC_ELF_DATA,
+   ARM_ELF_DATA,
+   AVR_ELF_DATA,
+   BFIN_ELF_DATA,
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 00828be..17670f0 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -301,6 +301,92 @@ struct arc_reloc_map
+   unsigned char		    elf_reloc_val;
+ };
+ 
++/* ARC ELF linker hash entry.  */
++struct elf_arc_link_hash_entry
++{
++  struct elf_link_hash_entry root;
++
++  /* Track dynamic relocs copied for this symbol.  */
++  struct elf_dyn_relocs *dyn_relocs;
++};
++
++/* ARC ELF linker hash table.  */
++struct elf_arc_link_hash_table
++{
++  struct elf_link_hash_table elf;
++
++  /* Short-cuts to get to dynamic linker sections.  */
++  asection *srelbss;
++};
++
++static struct bfd_hash_entry *
++elf_arc_link_hash_newfunc (struct bfd_hash_entry *entry,
++			   struct bfd_hash_table *table,
++			   const char *string)
++{
++  /* Allocate the structure if it has not already been allocated by a
++     subclass.  */
++  if (entry == NULL)
++    {
++      entry = (struct bfd_hash_entry *)
++	  bfd_hash_allocate (table,
++			     sizeof (struct elf_arc_link_hash_entry));
++      if (entry == NULL)
++	return entry;
++    }
++
++  /* Call the allocation method of the superclass.  */
++  entry = _bfd_elf_link_hash_newfunc (entry, table, string);
++  if (entry != NULL)
++    {
++      struct elf_arc_link_hash_entry *eh;
++
++      eh = (struct elf_arc_link_hash_entry *) entry;
++      eh->dyn_relocs = NULL;
++    }
++
++  return entry;
++}
++
++/* Destroy an ARC ELF linker hash table.  */
++/*
++static void
++elf_arc_link_hash_table_free (bfd *obfd)
++{
++  _bfd_elf_link_hash_table_free (obfd);
++}
++*/
++
++/* Create an X86-64 ELF linker hash table.  */
++
++static struct bfd_link_hash_table *
++arc_elf_link_hash_table_create (bfd *abfd)
++{
++  struct elf_arc_link_hash_table *ret;
++
++  ret = (struct elf_arc_link_hash_table *) bfd_zmalloc (sizeof (*ret));
++  if (ret == NULL)
++    return NULL;
++
++  if (!_bfd_elf_link_hash_table_init (&ret->elf, abfd,
++				      elf_arc_link_hash_newfunc,
++				      sizeof (struct elf_arc_link_hash_entry),
++				      ARC_ELF_DATA))
++    {
++      free (ret);
++      return NULL;
++    }
++
++  ret->srelbss = NULL;
++
++  ret->elf.init_got_refcount.refcount = 0;
++  ret->elf.init_got_refcount.glist = NULL;
++  ret->elf.init_got_offset.offset = 0;
++  ret->elf.init_got_offset.glist = NULL;
++
++  return &ret->elf.root;
++}
++
+ #define ARC_RELOC_HOWTO(TYPE, VALUE, SIZE, BITSIZE, RELOC_FUNCTION, OVERFLOW, FORMULA) \
+   { BFD_RELOC_##TYPE, R_##TYPE },
+ static const struct arc_reloc_map arc_reloc_map[] =
+@@ -1317,7 +1403,7 @@ elf_arc_relocate_section (bfd *		          output_bfd,
+ 	  case R_ARC_32_ME:
+ 	  case R_ARC_PC32:
+ 	  case R_ARC_32_PCREL:
+-	    if ((bfd_link_pic (info))// || bfd_link_pie (info))
++	    if ((bfd_link_pic (info))
+ 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
+ 		    || (h != NULL
+ 			&& h->dynindx != -1
+@@ -1470,6 +1556,49 @@ elf_arc_relocate_section (bfd *		          output_bfd,
+   return TRUE;
+ }
+ 
++#define elf_arc_hash_table(p) \
++    (elf_hash_table_id ((struct elf_link_hash_table *) ((p)->hash)) \
++  == ARC_ELF_DATA ? ((struct elf_arc_link_hash_table *) ((p)->hash)) : NULL)
++
++/* Create .plt, .rela.plt, .got, .got.plt, .rela.got, .dynbss, and
++   .rela.bss sections in DYNOBJ, and set up shortcuts to them in our
++   hash table.  */
++
++static bfd_boolean
++arc_elf_create_dynamic_sections (bfd *dynobj,
++				    struct bfd_link_info *info)
++{
++  struct elf_arc_link_hash_table *htab;
++
++  if (!_bfd_elf_create_dynamic_sections (dynobj, info))
++    return FALSE;
++
++  htab = elf_arc_hash_table (info);
++  if (htab == NULL)
++    return FALSE;
++
++  if (bfd_link_executable (info))
++    {
++      /* Always allow copy relocs for building executables.  */
++      asection *s = bfd_get_linker_section (dynobj, ".rela.bss");
++      if (s == NULL)
++	{
++	  const struct elf_backend_data *bed = get_elf_backend_data (dynobj);
++	  s = bfd_make_section_anyway_with_flags (dynobj,
++						  ".rela.bss",
++						  (bed->dynamic_sec_flags
++						   | SEC_READONLY));
++	  if (s == NULL
++	      || ! bfd_set_section_alignment (dynobj, s,
++					      bed->s->log_file_align))
++	    return FALSE;
++	}
++      htab->srelbss = s;
++    }
++
++  return TRUE;
++}
++
+ static struct dynamic_sections
+ arc_create_dynamic_sections (bfd * abfd, struct bfd_link_info *info)
+ {
+@@ -1615,7 +1744,7 @@ elf_arc_check_relocs (bfd *			 abfd,
+ 	    /* FALLTHROUGH */
+ 	  case R_ARC_PC32:
+ 	  case R_ARC_32_PCREL:
+-	    if ((bfd_link_pic (info))// || bfd_link_pie (info))
++	    if ((bfd_link_pic (info))
+ 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
+ 		    || (h != NULL
+ 			&& h->dynindx != -1
+@@ -1967,14 +2096,14 @@ elf_arc_adjust_dynamic_symbol (struct bfd_link_info *info,
+      .rela.bss section we are going to use.  */
+   if ((h->root.u.def.section->flags & SEC_ALLOC) != 0)
+     {
+-      asection *srel;
++      struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
+ 
+-      srel = bfd_get_section_by_name (dynobj, ".rela.bss");
+-      BFD_ASSERT (srel != NULL);
+-      srel->size += sizeof (Elf32_External_Rela);
++      BFD_ASSERT (arc_htab->srelbss != NULL);
++      arc_htab->srelbss->size += sizeof (Elf32_External_Rela);
+       h->needs_copy = 1;
+     }
+ 
++  /* TODO: Move this also to arc_hash_table.  */
+   s = bfd_get_section_by_name (dynobj, ".dynbss");
+   BFD_ASSERT (s != NULL);
+ 
+@@ -2020,17 +2149,21 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
+ 
+   if (h->needs_copy)
+     {
++      struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
++
++      if (h->dynindx == -1
++	  || (h->root.type != bfd_link_hash_defined
++	      && h->root.type != bfd_link_hash_defweak)
++	  || arc_htab->srelbss == NULL)
++	abort ();
++
+       bfd_vma rel_offset = (h->root.u.def.value
+ 			    + h->root.u.def.section->output_section->vma
+ 			    + h->root.u.def.section->output_offset);
+ 
+-      asection *srelbss
+-	= bfd_get_section_by_name (h->root.u.def.section->owner,
+-				 ".rela.bss");
+-
+-      bfd_byte * loc = srelbss->contents
+-	+ (srelbss->reloc_count * sizeof (Elf32_External_Rela));
+-      srelbss->reloc_count++;
++      bfd_byte * loc = arc_htab->srelbss->contents
++	+ (arc_htab->srelbss->reloc_count * sizeof (Elf32_External_Rela));
++      arc_htab->srelbss->reloc_count++;
+ 
+       Elf_Internal_Rela rel;
+       rel.r_addend = 0;
+@@ -2394,31 +2527,6 @@ const struct elf_size_info arc_elf32_size_info =
+ 
+ #define elf_backend_size_info		arc_elf32_size_info
+ 
+-static struct bfd_link_hash_table *
+-arc_elf_link_hash_table_create (bfd *abfd)
+-{
+-  struct elf_link_hash_table *htab;
+-
+-  htab = bfd_zmalloc (sizeof (*htab));
+-  if (htab == NULL)
+-    return NULL;
+-
+-  if (!_bfd_elf_link_hash_table_init (htab, abfd,
+-				      _bfd_elf_link_hash_newfunc,
+-				      sizeof (struct elf_link_hash_entry),
+-				      GENERIC_ELF_DATA))
+-    {
+-      free (htab);
+-      return NULL;
+-    }
+-
+-  htab->init_got_refcount.refcount = 0;
+-  htab->init_got_refcount.glist = NULL;
+-  htab->init_got_offset.offset = 0;
+-  htab->init_got_offset.glist = NULL;
+-  return (struct bfd_link_hash_table *) htab;
+-}
+-
+ /* Hook called by the linker routine which adds symbols from an object
+    file.  */
+ 
+@@ -2444,6 +2552,7 @@ elf_arc_add_symbol_hook (bfd * abfd,
+ #define TARGET_BIG_SYM	    arc_elf32_be_vec
+ #define TARGET_BIG_NAME     "elf32-bigarc"
+ #define ELF_ARCH	    bfd_arch_arc
++#define ELF_TARGET_ID	    ARC_ELF_DATA
+ #define ELF_MACHINE_CODE    EM_ARC_COMPACT
+ #define ELF_MACHINE_ALT1    EM_ARC_COMPACT2
+ #define ELF_MAXPAGESIZE     0x2000
+@@ -2462,7 +2571,7 @@ elf_arc_add_symbol_hook (bfd * abfd,
+ 
+ #define elf_backend_relocate_section	     elf_arc_relocate_section
+ #define elf_backend_check_relocs	     elf_arc_check_relocs
+-#define elf_backend_create_dynamic_sections  _bfd_elf_create_dynamic_sections
++#define elf_backend_create_dynamic_sections  arc_elf_create_dynamic_sections
+ 
+ #define elf_backend_reloc_type_class		elf32_arc_reloc_type_class
+ 
+-- 
+2.5.5
+
diff --git a/package/binutils/arc-2016.09-eng007/0701-Fixed-init-fini-linker-options.patch b/package/binutils/arc-2016.09-eng007/0701-Fixed-init-fini-linker-options.patch
new file mode 100644
index 0000000..4c0c72e
--- /dev/null
+++ b/package/binutils/arc-2016.09-eng007/0701-Fixed-init-fini-linker-options.patch
@@ -0,0 +1,40 @@
+From 7a967af93d05c894c28c7c90c2c10fa81d053812 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Tue, 19 Jul 2016 14:33:34 +0200
+Subject: [PATCH 07/11] Fixed -init, -fini linker options.
+
+ARC was overloading this options by forcing DT_INIT AND DT_FINI
+to always point to _init and _fini, respectively.
+---
+ bfd/elf32-arc.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 17670f0..a0533f2 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -2228,8 +2228,8 @@ elf_arc_finish_dynamic_sections (bfd * output_bfd,
+ 
+ 	  switch (internal_dyn.d_tag)
+ 	    {
+-	      GET_SYMBOL_OR_SECTION (DT_INIT, "_init", NULL)
+-	      GET_SYMBOL_OR_SECTION (DT_FINI, "_fini", NULL)
++	      GET_SYMBOL_OR_SECTION (DT_INIT, info->init_function, NULL)
++	      GET_SYMBOL_OR_SECTION (DT_FINI, info->fini_function, NULL)
+ 	      GET_SYMBOL_OR_SECTION (DT_PLTGOT, NULL, ".plt")
+ 	      GET_SYMBOL_OR_SECTION (DT_JMPREL, NULL, ".rela.plt")
+ 	      GET_SYMBOL_OR_SECTION (DT_PLTRELSZ, NULL, ".rela.plt")
+@@ -2377,8 +2377,8 @@ elf_arc_size_dynamic_sections (bfd * output_bfd,
+ 	 section.  Checking if the .init section is present.  We also
+ 	 create DT_INIT and DT_FINI entries if the init_str has been
+ 	 changed by the user.  */
+-      ADD_DYNAMIC_SYMBOL ("init", DT_INIT);
+-      ADD_DYNAMIC_SYMBOL ("fini", DT_FINI);
++      ADD_DYNAMIC_SYMBOL (info->init_function, DT_INIT);
++      ADD_DYNAMIC_SYMBOL (info->fini_function, DT_FINI);
+     }
+   else
+     {
+-- 
+2.5.5
+
diff --git a/package/binutils/arc-2016.09-eng007/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch b/package/binutils/arc-2016.09-eng007/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch
new file mode 100644
index 0000000..c317b83
--- /dev/null
+++ b/package/binutils/arc-2016.09-eng007/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch
@@ -0,0 +1,27 @@
+From 1f2dee5355c2a4a4850ff6eb83a8b916e503dfdf Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 22 Jul 2016 13:53:35 +0200
+Subject: [PATCH 09/11] Fix undefined symbols aborting on PIE cases.
+
+In the context of STAR 9000925001.
+Extended check instruction to validate for this case.
+---
+ bfd/elf32-arc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index d70852c..6999dfc 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -1359,7 +1359,7 @@ elf_arc_relocate_section (bfd *		          output_bfd,
+ 
+ 		  reloc_data.should_relocate = TRUE;
+ 		}
+-	      else if (!bfd_link_pic (info))
++	      else if (!bfd_link_pic (info) || bfd_link_executable (info))
+ 		(*info->callbacks->undefined_symbol)
+ 		  (info, h->root.root.string, input_bfd, input_section,
+ 		   rel->r_offset, TRUE);
+-- 
+2.5.5
+
diff --git a/package/binutils/arc-2016.09-eng007/0800-Fixed-issue-in-tvheadend-package.patch b/package/binutils/arc-2016.09-eng007/0800-Fixed-issue-in-tvheadend-package.patch
new file mode 100644
index 0000000..1affacb
--- /dev/null
+++ b/package/binutils/arc-2016.09-eng007/0800-Fixed-issue-in-tvheadend-package.patch
@@ -0,0 +1,24 @@
+From 7e7470e6e3cbf9034641cc555d27b86334793871 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Tue, 26 Jul 2016 17:34:05 +0200
+Subject: [PATCH] Fixed issue in tvheadend package.
+
+---
+ bfd/elf32-arc.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 9c97092..0c1bbb2 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -1749,7 +1749,6 @@ elf_arc_check_relocs (bfd *			 abfd,
+ 	    if ((bfd_link_pic (info))
+ 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
+ 		    || (h != NULL
+-			&& h->dynindx != -1
+ 			&& (!info->symbolic || !h->def_regular))))
+ 	      {
+ 		if (sreloc == NULL)
+-- 
+2.5.5
+
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 435f622..502e338 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f6
 sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322bb6cb2b45e8df812f0e8ac059149f8a1f69ba3ed9d86a35c6a540b67  binutils-2.26.1.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  2609afaad4c37469ee3661f12140d7b0c856cd8050a0d29ec28c92416377bc0742ff680fcffba753ac38a2692c77ac8bf2ec1373a94dde3782d9b077b939c8fa  binutils-arc-2016.09-eng006.tar.gz
+sha512  5ab5d45671ad57eff8f8688260c425ca5b10440b89fd54387a68e7834abee190c540bd2d19292d119f2add6fdf5d39d378315f97384ae26e74d9917b1e163291  binutils-arc-2016.09-eng007.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index ae532a2..68f7707 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.09-eng006
+BINUTILS_VERSION = arc-2016.09-eng007
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 204876f..bcfb196 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -107,7 +107,7 @@ config BR2_GCC_VERSION
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-eng006" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2016.09-eng007" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2016.09-eng006/130-fix_build_with_gcc-6.patch b/package/gcc/arc-2016.09-eng007/130-fix_build_with_gcc-6.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng006/130-fix_build_with_gcc-6.patch
rename to package/gcc/arc-2016.09-eng007/130-fix_build_with_gcc-6.patch
diff --git a/package/gcc/arc-2016.09-eng006/130-pr43538.patch b/package/gcc/arc-2016.09-eng007/130-pr43538.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng006/130-pr43538.patch
rename to package/gcc/arc-2016.09-eng007/130-pr43538.patch
diff --git a/package/gcc/arc-2016.09-eng006/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-eng007/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng006/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.09-eng007/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.09-eng006/305-libmudflap-susv3-legacy.patch b/package/gcc/arc-2016.09-eng007/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng006/305-libmudflap-susv3-legacy.patch
rename to package/gcc/arc-2016.09-eng007/305-libmudflap-susv3-legacy.patch
diff --git a/package/gcc/arc-2016.09-eng006/842-PR60155.patch b/package/gcc/arc-2016.09-eng007/842-PR60155.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng006/842-PR60155.patch
rename to package/gcc/arc-2016.09-eng007/842-PR60155.patch
diff --git a/package/gcc/arc-2016.09-eng006/850-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2016.09-eng007/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng006/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2016.09-eng007/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2016.09-eng006/851-PR-other-56780.patch b/package/gcc/arc-2016.09-eng007/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng006/851-PR-other-56780.patch
rename to package/gcc/arc-2016.09-eng007/851-PR-other-56780.patch
diff --git a/package/gcc/arc-2016.09-eng006/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/arc-2016.09-eng007/930-libgcc-disable-split-stack-nothreads.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng006/930-libgcc-disable-split-stack-nothreads.patch
rename to package/gcc/arc-2016.09-eng007/930-libgcc-disable-split-stack-nothreads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 808e0ac..9f4069b 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,4 +12,4 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  40e4c5d8dc4086c1d5edea94fa4efc5726b1dd6d0b7c14f28d75a2538d434e908f7561bfae28e239c87bde52775464fd86a8b08fde4204bc374312c37e681db1  gcc-arc-2016.09-eng006.tar.gz
+sha512  f798e450ae3095538c5b12c785eab00f8f4084d3ff3e5e2dfd05ed20e0a20d4e754d87359482962d85c9082cb9fcbbf100d9eab6dfd2dbdccbecdcbf680ff23a  gcc-arc-2016.09-eng007.tar.gz
diff --git a/package/uclibc/0002-Fix-to-PIE.patch b/package/uclibc/0002-Fix-to-PIE.patch
new file mode 100644
index 0000000..de9d3f8
--- /dev/null
+++ b/package/uclibc/0002-Fix-to-PIE.patch
@@ -0,0 +1,35 @@
+From 99582e990c31cbd90ace105ed245c5d15e21e096 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Tue, 19 Jul 2016 14:27:49 +0200
+Subject: [PATCH] Fix to PIE.
+
+crt1.S needed to use a got relative reference.
+Libraries like pthreads define a _init and unless it is GOT, the
+linker will fail because it will try to create a dynamic reloc on
+.text section, more precisely on __start.
+---
+ libc/sysdeps/linux/arc/crt1.S | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/libc/sysdeps/linux/arc/crt1.S b/libc/sysdeps/linux/arc/crt1.S
+index 178c5b4..f895e18 100644
+--- a/libc/sysdeps/linux/arc/crt1.S
++++ b/libc/sysdeps/linux/arc/crt1.S
+@@ -41,10 +41,11 @@ __start:
+ 
+ 	mov_s	r5, r0		; rltd_fini
+ 	add_s	r2, sp, 4	; argv
++
+ #ifdef L_Scrt1
+-	add	r0, pcl, @main at pcl
+-	add	r3, pcl, @_init at pcl
+-	add	r4, pcl, @_fini at pcl
++	 ld r0, [pcl, @main at gotpc]
++	 ld r3, [pcl, @_init at gotpc]
++	 ld r4, [pcl, @_fini at gotpc]
+ #else
+ 	mov_s	r0, main
+ 	mov_s	r3, _init
+-- 
+2.5.5
+
-- 
2.5.5
