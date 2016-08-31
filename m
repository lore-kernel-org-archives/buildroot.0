From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 09:32:29 +0200
Subject: [Buildroot] [git commit] toolchain: Bump ARC tools to
	arc-2016.09-eng010
Message-ID: <20160831073325.26BED822F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e227e6bf504ce91849744c155164e5bec26594a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As described at:
4520524ba055706236db9f00dd79f1b2e2e87fde
this commit continues a series of updates of ARC tools.
This time we're updating tools to arc-2016.09-eng010.

This engenering build contains different fixes done to TLS and
PIE features. Appropriate custom patches are removed as they have
been added to eng010.

We still keep GDB as it is of arc-2016.03 release because there're some
issues we'd like to resolve before releasing it to wider audience.

So again note this is next engineering builds of arc-2016.09 series
and it might have all kinds of breakages, please don't use it for
production builds.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host                    |   2 +-
 .../0700-PIE-fixes-in-for-ARC-bfd.patch            | 289 ---------------------
 .../0701-Fixed-init-fini-linker-options.patch      |  43 ---
 ...x-undefined-symbols-aborting-on-PIE-cases.patch |  30 ---
 .../0800-Fixed-issue-in-tvheadend-package.patch    |  26 --
 .../0300-ld-makefile.patch                         |   0
 .../0301-check-ldrunpath-length.patch              |   0
 .../0500-add-sysroot-fix-from-bug-3049.patch       |   0
 .../0600-poison-system-directories.patch           |   0
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 .../950-ARC-Fix-conditional-move-contstraint.patch |  34 ---
 .../301-missing-execinfo_h.patch                   |   0
 .../860-cilk-wchar.patch                           |   0
 .../940-uclinux-enable-threads.patch               |   0
 package/gcc/gcc.hash                               |   2 +-
 17 files changed, 5 insertions(+), 427 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index ab83aff..86daa0c 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2016.09-eng008"	if BR2_arc
+	default "arc-2016.09-eng010"	if BR2_arc
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
diff --git a/package/binutils/arc-2016.09-eng008/0700-PIE-fixes-in-for-ARC-bfd.patch b/package/binutils/arc-2016.09-eng008/0700-PIE-fixes-in-for-ARC-bfd.patch
deleted file mode 100644
index 9301928..0000000
--- a/package/binutils/arc-2016.09-eng008/0700-PIE-fixes-in-for-ARC-bfd.patch
+++ /dev/null
@@ -1,289 +0,0 @@
-From f73e79e550cd92dcdd002b62931d11c79db50115 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Wed, 13 Jul 2016 18:04:20 +0200
-Subject: [PATCH 700/703] PIE fixes in for ARC bfd.
-
-Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
----
- bfd/elf-bfd.h   |   1 +
- bfd/elf32-arc.c | 187 ++++++++++++++++++++++++++++++++++++++++++++------------
- 2 files changed, 149 insertions(+), 39 deletions(-)
-
-diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
-index bb3371f..fbe0464 100644
---- a/bfd/elf-bfd.h
-+++ b/bfd/elf-bfd.h
-@@ -444,6 +444,7 @@ enum elf_target_id
- {
-   AARCH64_ELF_DATA = 1,
-   ALPHA_ELF_DATA,
-+  ARC_ELF_DATA,
-   ARM_ELF_DATA,
-   AVR_ELF_DATA,
-   BFIN_ELF_DATA,
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 00828be..17670f0 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -301,6 +301,92 @@ struct arc_reloc_map
-   unsigned char		    elf_reloc_val;
- };
- 
-+/* ARC ELF linker hash entry.  */
-+struct elf_arc_link_hash_entry
-+{
-+  struct elf_link_hash_entry root;
-+
-+  /* Track dynamic relocs copied for this symbol.  */
-+  struct elf_dyn_relocs *dyn_relocs;
-+};
-+
-+/* ARC ELF linker hash table.  */
-+struct elf_arc_link_hash_table
-+{
-+  struct elf_link_hash_table elf;
-+
-+  /* Short-cuts to get to dynamic linker sections.  */
-+  asection *srelbss;
-+};
-+
-+static struct bfd_hash_entry *
-+elf_arc_link_hash_newfunc (struct bfd_hash_entry *entry,
-+			   struct bfd_hash_table *table,
-+			   const char *string)
-+{
-+  /* Allocate the structure if it has not already been allocated by a
-+     subclass.  */
-+  if (entry == NULL)
-+    {
-+      entry = (struct bfd_hash_entry *)
-+	  bfd_hash_allocate (table,
-+			     sizeof (struct elf_arc_link_hash_entry));
-+      if (entry == NULL)
-+	return entry;
-+    }
-+
-+  /* Call the allocation method of the superclass.  */
-+  entry = _bfd_elf_link_hash_newfunc (entry, table, string);
-+  if (entry != NULL)
-+    {
-+      struct elf_arc_link_hash_entry *eh;
-+
-+      eh = (struct elf_arc_link_hash_entry *) entry;
-+      eh->dyn_relocs = NULL;
-+    }
-+
-+  return entry;
-+}
-+
-+/* Destroy an ARC ELF linker hash table.  */
-+/*
-+static void
-+elf_arc_link_hash_table_free (bfd *obfd)
-+{
-+  _bfd_elf_link_hash_table_free (obfd);
-+}
-+*/
-+
-+/* Create an X86-64 ELF linker hash table.  */
-+
-+static struct bfd_link_hash_table *
-+arc_elf_link_hash_table_create (bfd *abfd)
-+{
-+  struct elf_arc_link_hash_table *ret;
-+
-+  ret = (struct elf_arc_link_hash_table *) bfd_zmalloc (sizeof (*ret));
-+  if (ret == NULL)
-+    return NULL;
-+
-+  if (!_bfd_elf_link_hash_table_init (&ret->elf, abfd,
-+				      elf_arc_link_hash_newfunc,
-+				      sizeof (struct elf_arc_link_hash_entry),
-+				      ARC_ELF_DATA))
-+    {
-+      free (ret);
-+      return NULL;
-+    }
-+
-+  ret->srelbss = NULL;
-+
-+  ret->elf.init_got_refcount.refcount = 0;
-+  ret->elf.init_got_refcount.glist = NULL;
-+  ret->elf.init_got_offset.offset = 0;
-+  ret->elf.init_got_offset.glist = NULL;
-+
-+  return &ret->elf.root;
-+}
-+
- #define ARC_RELOC_HOWTO(TYPE, VALUE, SIZE, BITSIZE, RELOC_FUNCTION, OVERFLOW, FORMULA) \
-   { BFD_RELOC_##TYPE, R_##TYPE },
- static const struct arc_reloc_map arc_reloc_map[] =
-@@ -1317,7 +1403,7 @@ elf_arc_relocate_section (bfd *		          output_bfd,
- 	  case R_ARC_32_ME:
- 	  case R_ARC_PC32:
- 	  case R_ARC_32_PCREL:
--	    if ((bfd_link_pic (info))// || bfd_link_pie (info))
-+	    if ((bfd_link_pic (info))
- 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
- 		    || (h != NULL
- 			&& h->dynindx != -1
-@@ -1470,6 +1556,49 @@ elf_arc_relocate_section (bfd *		          output_bfd,
-   return TRUE;
- }
- 
-+#define elf_arc_hash_table(p) \
-+    (elf_hash_table_id ((struct elf_link_hash_table *) ((p)->hash)) \
-+  == ARC_ELF_DATA ? ((struct elf_arc_link_hash_table *) ((p)->hash)) : NULL)
-+
-+/* Create .plt, .rela.plt, .got, .got.plt, .rela.got, .dynbss, and
-+   .rela.bss sections in DYNOBJ, and set up shortcuts to them in our
-+   hash table.  */
-+
-+static bfd_boolean
-+arc_elf_create_dynamic_sections (bfd *dynobj,
-+				    struct bfd_link_info *info)
-+{
-+  struct elf_arc_link_hash_table *htab;
-+
-+  if (!_bfd_elf_create_dynamic_sections (dynobj, info))
-+    return FALSE;
-+
-+  htab = elf_arc_hash_table (info);
-+  if (htab == NULL)
-+    return FALSE;
-+
-+  if (bfd_link_executable (info))
-+    {
-+      /* Always allow copy relocs for building executables.  */
-+      asection *s = bfd_get_linker_section (dynobj, ".rela.bss");
-+      if (s == NULL)
-+	{
-+	  const struct elf_backend_data *bed = get_elf_backend_data (dynobj);
-+	  s = bfd_make_section_anyway_with_flags (dynobj,
-+						  ".rela.bss",
-+						  (bed->dynamic_sec_flags
-+						   | SEC_READONLY));
-+	  if (s == NULL
-+	      || ! bfd_set_section_alignment (dynobj, s,
-+					      bed->s->log_file_align))
-+	    return FALSE;
-+	}
-+      htab->srelbss = s;
-+    }
-+
-+  return TRUE;
-+}
-+
- static struct dynamic_sections
- arc_create_dynamic_sections (bfd * abfd, struct bfd_link_info *info)
- {
-@@ -1615,7 +1744,7 @@ elf_arc_check_relocs (bfd *			 abfd,
- 	    /* FALLTHROUGH */
- 	  case R_ARC_PC32:
- 	  case R_ARC_32_PCREL:
--	    if ((bfd_link_pic (info))// || bfd_link_pie (info))
-+	    if ((bfd_link_pic (info))
- 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
- 		    || (h != NULL
- 			&& h->dynindx != -1
-@@ -1967,14 +2096,14 @@ elf_arc_adjust_dynamic_symbol (struct bfd_link_info *info,
-      .rela.bss section we are going to use.  */
-   if ((h->root.u.def.section->flags & SEC_ALLOC) != 0)
-     {
--      asection *srel;
-+      struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
- 
--      srel = bfd_get_section_by_name (dynobj, ".rela.bss");
--      BFD_ASSERT (srel != NULL);
--      srel->size += sizeof (Elf32_External_Rela);
-+      BFD_ASSERT (arc_htab->srelbss != NULL);
-+      arc_htab->srelbss->size += sizeof (Elf32_External_Rela);
-       h->needs_copy = 1;
-     }
- 
-+  /* TODO: Move this also to arc_hash_table.  */
-   s = bfd_get_section_by_name (dynobj, ".dynbss");
-   BFD_ASSERT (s != NULL);
- 
-@@ -2020,17 +2149,21 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
- 
-   if (h->needs_copy)
-     {
-+      struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
-+
-+      if (h->dynindx == -1
-+	  || (h->root.type != bfd_link_hash_defined
-+	      && h->root.type != bfd_link_hash_defweak)
-+	  || arc_htab->srelbss == NULL)
-+	abort ();
-+
-       bfd_vma rel_offset = (h->root.u.def.value
- 			    + h->root.u.def.section->output_section->vma
- 			    + h->root.u.def.section->output_offset);
- 
--      asection *srelbss
--	= bfd_get_section_by_name (h->root.u.def.section->owner,
--				 ".rela.bss");
--
--      bfd_byte * loc = srelbss->contents
--	+ (srelbss->reloc_count * sizeof (Elf32_External_Rela));
--      srelbss->reloc_count++;
-+      bfd_byte * loc = arc_htab->srelbss->contents
-+	+ (arc_htab->srelbss->reloc_count * sizeof (Elf32_External_Rela));
-+      arc_htab->srelbss->reloc_count++;
- 
-       Elf_Internal_Rela rel;
-       rel.r_addend = 0;
-@@ -2394,31 +2527,6 @@ const struct elf_size_info arc_elf32_size_info =
- 
- #define elf_backend_size_info		arc_elf32_size_info
- 
--static struct bfd_link_hash_table *
--arc_elf_link_hash_table_create (bfd *abfd)
--{
--  struct elf_link_hash_table *htab;
--
--  htab = bfd_zmalloc (sizeof (*htab));
--  if (htab == NULL)
--    return NULL;
--
--  if (!_bfd_elf_link_hash_table_init (htab, abfd,
--				      _bfd_elf_link_hash_newfunc,
--				      sizeof (struct elf_link_hash_entry),
--				      GENERIC_ELF_DATA))
--    {
--      free (htab);
--      return NULL;
--    }
--
--  htab->init_got_refcount.refcount = 0;
--  htab->init_got_refcount.glist = NULL;
--  htab->init_got_offset.offset = 0;
--  htab->init_got_offset.glist = NULL;
--  return (struct bfd_link_hash_table *) htab;
--}
--
- /* Hook called by the linker routine which adds symbols from an object
-    file.  */
- 
-@@ -2444,6 +2552,7 @@ elf_arc_add_symbol_hook (bfd * abfd,
- #define TARGET_BIG_SYM	    arc_elf32_be_vec
- #define TARGET_BIG_NAME     "elf32-bigarc"
- #define ELF_ARCH	    bfd_arch_arc
-+#define ELF_TARGET_ID	    ARC_ELF_DATA
- #define ELF_MACHINE_CODE    EM_ARC_COMPACT
- #define ELF_MACHINE_ALT1    EM_ARC_COMPACT2
- #define ELF_MAXPAGESIZE     0x2000
-@@ -2462,7 +2571,7 @@ elf_arc_add_symbol_hook (bfd * abfd,
- 
- #define elf_backend_relocate_section	     elf_arc_relocate_section
- #define elf_backend_check_relocs	     elf_arc_check_relocs
--#define elf_backend_create_dynamic_sections  _bfd_elf_create_dynamic_sections
-+#define elf_backend_create_dynamic_sections  arc_elf_create_dynamic_sections
- 
- #define elf_backend_reloc_type_class		elf32_arc_reloc_type_class
- 
--- 
-2.5.5
-
diff --git a/package/binutils/arc-2016.09-eng008/0701-Fixed-init-fini-linker-options.patch b/package/binutils/arc-2016.09-eng008/0701-Fixed-init-fini-linker-options.patch
deleted file mode 100644
index e4628bb..0000000
--- a/package/binutils/arc-2016.09-eng008/0701-Fixed-init-fini-linker-options.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 156a0ec59728ae2b27ad84bcf86fec77c01aec5d Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Tue, 19 Jul 2016 14:33:34 +0200
-Subject: [PATCH 701/703] Fixed -init, -fini linker options.
-
-ARC was overloading this options by forcing DT_INIT AND DT_FINI
-to always point to _init and _fini, respectively.
-
-Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
----
- bfd/elf32-arc.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 17670f0..a0533f2 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -2228,8 +2228,8 @@ elf_arc_finish_dynamic_sections (bfd * output_bfd,
- 
- 	  switch (internal_dyn.d_tag)
- 	    {
--	      GET_SYMBOL_OR_SECTION (DT_INIT, "_init", NULL)
--	      GET_SYMBOL_OR_SECTION (DT_FINI, "_fini", NULL)
-+	      GET_SYMBOL_OR_SECTION (DT_INIT, info->init_function, NULL)
-+	      GET_SYMBOL_OR_SECTION (DT_FINI, info->fini_function, NULL)
- 	      GET_SYMBOL_OR_SECTION (DT_PLTGOT, NULL, ".plt")
- 	      GET_SYMBOL_OR_SECTION (DT_JMPREL, NULL, ".rela.plt")
- 	      GET_SYMBOL_OR_SECTION (DT_PLTRELSZ, NULL, ".rela.plt")
-@@ -2377,8 +2377,8 @@ elf_arc_size_dynamic_sections (bfd * output_bfd,
- 	 section.  Checking if the .init section is present.  We also
- 	 create DT_INIT and DT_FINI entries if the init_str has been
- 	 changed by the user.  */
--      ADD_DYNAMIC_SYMBOL ("init", DT_INIT);
--      ADD_DYNAMIC_SYMBOL ("fini", DT_FINI);
-+      ADD_DYNAMIC_SYMBOL (info->init_function, DT_INIT);
-+      ADD_DYNAMIC_SYMBOL (info->fini_function, DT_FINI);
-     }
-   else
-     {
--- 
-2.5.5
-
diff --git a/package/binutils/arc-2016.09-eng008/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch b/package/binutils/arc-2016.09-eng008/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch
deleted file mode 100644
index 23b8ed1..0000000
--- a/package/binutils/arc-2016.09-eng008/0702-Fix-undefined-symbols-aborting-on-PIE-cases.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5bc929f1609ddcc1180d9f004dd0064fa1f351ca Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 22 Jul 2016 13:53:35 +0200
-Subject: [PATCH 702/703] Fix undefined symbols aborting on PIE cases.
-
-In the context of STAR 9000925001.
-Extended check instruction to validate for this case.
-
-Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
----
- bfd/elf32-arc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index a0533f2..f4e1521 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -1359,7 +1359,7 @@ elf_arc_relocate_section (bfd *		          output_bfd,
- 
- 		  reloc_data.should_relocate = TRUE;
- 		}
--	      else if (!bfd_link_pic (info))
-+	      else if (!bfd_link_pic (info) || bfd_link_executable (info))
- 		(*info->callbacks->undefined_symbol)
- 		  (info, h->root.root.string, input_bfd, input_section,
- 		   rel->r_offset, TRUE);
--- 
-2.5.5
-
diff --git a/package/binutils/arc-2016.09-eng008/0800-Fixed-issue-in-tvheadend-package.patch b/package/binutils/arc-2016.09-eng008/0800-Fixed-issue-in-tvheadend-package.patch
deleted file mode 100644
index 8dae342..0000000
--- a/package/binutils/arc-2016.09-eng008/0800-Fixed-issue-in-tvheadend-package.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d10d05e66fd2f8431a08ceaf8b655bc47ce13a21 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Tue, 26 Jul 2016 17:34:05 +0200
-Subject: [PATCH 703/703] Fixed issue in tvheadend package.
-
-Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
----
- bfd/elf32-arc.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index f4e1521..857b7b6 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -1747,7 +1747,6 @@ elf_arc_check_relocs (bfd *			 abfd,
- 	    if ((bfd_link_pic (info))
- 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
- 		    || (h != NULL
--			&& h->dynindx != -1
- 			&& (!info->symbolic || !h->def_regular))))
- 	      {
- 		if (sreloc == NULL)
--- 
-2.5.5
-
diff --git a/package/binutils/arc-2016.09-eng008/0300-ld-makefile.patch b/package/binutils/arc-2016.09-eng010/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng008/0300-ld-makefile.patch
rename to package/binutils/arc-2016.09-eng010/0300-ld-makefile.patch
diff --git a/package/binutils/arc-2016.09-eng008/0301-check-ldrunpath-length.patch b/package/binutils/arc-2016.09-eng010/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng008/0301-check-ldrunpath-length.patch
rename to package/binutils/arc-2016.09-eng010/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/arc-2016.09-eng008/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/arc-2016.09-eng010/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng008/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/arc-2016.09-eng010/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/arc-2016.09-eng008/0600-poison-system-directories.patch b/package/binutils/arc-2016.09-eng010/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2016.09-eng008/0600-poison-system-directories.patch
rename to package/binutils/arc-2016.09-eng010/0600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index b8ba89d..3979628 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f6
 sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322bb6cb2b45e8df812f0e8ac059149f8a1f69ba3ed9d86a35c6a540b67  binutils-2.26.1.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  ab2914329cd2c725de567d7d2b6c3018779f0c3109dcbb26663e379d38434f48fd35cd46f680cc47165b6dc77aa35571ed2c09499161fd11bb86dcf5fa7ec068  binutils-arc-2016.09-eng008.tar.gz
+sha512  32d2f04ec62ee0491fd711baf7e6f28052170b1fa4cb8f6046ca4709e03250335a65b362295c13c7c44f8a28d91d2c54b0ab7c8f0f2e2324ea8ba2c80cbee29a  binutils-arc-2016.09-eng010.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 85663a8..ff90a16 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2016.09-eng008
+BINUTILS_VERSION = arc-2016.09-eng010
 else
 BINUTILS_VERSION = 2.25.1
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6ab7f00..7ef6ff2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -107,7 +107,7 @@ config BR2_GCC_VERSION
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
 	default "6.1.0" if BR2_GCC_VERSION_6_X
-	default "arc-2016.09-eng008" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2016.09-eng010" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2016.09-eng008/950-ARC-Fix-conditional-move-contstraint.patch b/package/gcc/arc-2016.09-eng008/950-ARC-Fix-conditional-move-contstraint.patch
deleted file mode 100644
index 153af6d..0000000
--- a/package/gcc/arc-2016.09-eng008/950-ARC-Fix-conditional-move-contstraint.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e569e9c2ce2273f5175e0928efd6e45c3e71c45f Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Mon, 22 Aug 2016 19:58:25 +0200
-Subject: [PATCH] [ARC] Fix conditional move contstraint
-
-Move pattern (movsi_insn) allows predicated instructions to be
-instructions which can hold all registers.  However, the conditional
-variant doesn't.  This patch fixes this problem.
-
-2016-08-22  Claudiu Zissulescu  <claziss@synopsys.com>
-
-	* config/arc/arc.md (movsi_cond_exec): Update constraint.
-
-Signed-off-by: Claudiu Zissulescu  <claziss@synopsys.com>
----
- gcc/config/arc/arc.md | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gcc/config/arc/arc.md b/gcc/config/arc/arc.md
-index d87174a..607c6e6 100644
---- a/gcc/config/arc/arc.md
-+++ b/gcc/config/arc/arc.md
-@@ -3603,7 +3603,7 @@
-      (match_operator 3 "proper_comparison_operator"
-        [(match_operand 2 "cc_register" "Rcc,Rcc") (const_int 0)])
-      (set (match_operand:SI 0 "dest_reg_operand" "=w,w")
--	  (match_operand:SI 1 "nonmemory_operand" "Lc,?Cal")))]
-+	  (match_operand:SI 1 "nonmemory_operand" "LRac,?Cal")))]
-   ""
-   "mov.%d3 %0,%S1"
-   [(set_attr "type" "cmove")
--- 
-2.6.3
-
diff --git a/package/gcc/arc-2016.09-eng008/301-missing-execinfo_h.patch b/package/gcc/arc-2016.09-eng010/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng008/301-missing-execinfo_h.patch
rename to package/gcc/arc-2016.09-eng010/301-missing-execinfo_h.patch
diff --git a/package/gcc/arc-2016.09-eng008/860-cilk-wchar.patch b/package/gcc/arc-2016.09-eng010/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng008/860-cilk-wchar.patch
rename to package/gcc/arc-2016.09-eng010/860-cilk-wchar.patch
diff --git a/package/gcc/arc-2016.09-eng008/940-uclinux-enable-threads.patch b/package/gcc/arc-2016.09-eng010/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/arc-2016.09-eng008/940-uclinux-enable-threads.patch
rename to package/gcc/arc-2016.09-eng010/940-uclinux-enable-threads.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index e463e04..2e11551 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -12,4 +12,4 @@ sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d
 sha512  eeed3e2018b8c012aabce419e8d718fde701e5c3c179b4486c61ba46e5736eecc8fccdd18b01fcd973a42c6ad3116dbbe2ee247fe3757d622d373f93ebaf8d2e  gcc-6.1.0.tar.bz2
 
 # Locally calculated (fetched from Github)
-sha512  481302b50c8d6a3db3ea0a3c3713666d3aea990461cf0e1e0a670a2db90b8f2024e02a2fab6f2e7ccba14a92ca82218db0b585ace1aa932f5ae109e21ddbc83e  gcc-arc-2016.09-eng008.tar.gz
+sha512  a788737022c178a1e7704e4ecd3438937f2239bf27fd487db2b00e4bb5c6604535842e4d6798f120488bdbf0b226fa9c94f4b8aede4ce9d20b0add6bcec82927  gcc-arc-2016.09-eng010.tar.gz
