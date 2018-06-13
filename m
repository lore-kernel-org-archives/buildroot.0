From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 13 Jun 2018 19:39:56 +0300
Subject: [Buildroot] [PATCH] binutils: Fix glibc building for ARC with stock
 binutils 2.30
Message-ID: <20180613163956.28894-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There're known issues with building glibc for ARC with vanilla
Binutils 2.30. Adding a couple of not yet upstreamed patches
that solve it.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 ...ocation-where-GOT-information-is-col.patch | 197 ++++++++++++++++++
 ...ustness.-Return-FALSE-in-case-of-NUL.patch |  34 +++
 ...obal-symbol-is-not-an-indirect-or-wa.patch |  42 ++++
 ...ion-was-still-being-generated-when-s.patch |  35 ++++
 4 files changed, 308 insertions(+)
 create mode 100644 package/binutils/2.30/0010-ARC-Refactored-location-where-GOT-information-is-col.patch
 create mode 100644 package/binutils/2.30/0011-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch
 create mode 100644 package/binutils/2.30/0012-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch
 create mode 100644 package/binutils/2.30/0013-ARC-PLT-information-was-still-being-generated-when-s.patch

diff --git a/package/binutils/2.30/0010-ARC-Refactored-location-where-GOT-information-is-col.patch b/package/binutils/2.30/0010-ARC-Refactored-location-where-GOT-information-is-col.patch
new file mode 100644
index 000000000000..2519c5af0b0a
--- /dev/null
+++ b/package/binutils/2.30/0010-ARC-Refactored-location-where-GOT-information-is-col.patch
@@ -0,0 +1,197 @@
+From 141346d3968bdc82d3e487f3effdc3f835a09403 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 2 Mar 2018 17:16:21 +0100
+Subject: [PATCH 1/4] [ARC] Refactored location where GOT information is
+ collected.
+
+Change location where GOT information is collected for ARC target, avoiding
+posible use conflicts of the previous .got field in the symbols hash_entry.
+
+bfd/
+2018-03-01  Cupertino Miranda  <cmiranda@synopsys.com>
+
+	* arc-got.h (get_got_entry_list_for_symbol): Changed.
+	* ef32-arc.c (struct elf_arc_link_hash_entry): Moved and changed.
+	(elf_arc_link_hash_newfunc): Changed.
+	(arc_elf_link_hash_table_create): Removed old initializations.
+	(elf_arc_relocate_section, elf_arc_finish_dynamic_symbol): Changed.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ bfd/arc-got.h   |  6 ++--
+ bfd/elf32-arc.c | 77 +++++++++++++++++++++++++++----------------------
+ 2 files changed, 46 insertions(+), 37 deletions(-)
+
+diff --git a/bfd/arc-got.h b/bfd/arc-got.h
+index a86061bcb38f..81ce88fe21a0 100644
+--- a/bfd/arc-got.h
++++ b/bfd/arc-got.h
+@@ -156,9 +156,11 @@ get_got_entry_list_for_symbol (bfd *abfd,
+ 			       unsigned long r_symndx,
+ 			       struct elf_link_hash_entry *h)
+ {
+-  if (h != NULL)
++  struct elf_arc_link_hash_entry *h1 =
++    ((struct elf_arc_link_hash_entry *) h);
++  if (h1 != NULL)
+     {
+-      return &h->got.glist;
++      return &h1->got_ents;
+     }
+   else
+     {
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 5921cc25259e..166a5ef604ff 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -159,6 +159,18 @@ struct arc_relocation_data
+   const char *    symbol_name;
+ };
+ 
++/* ARC ELF linker hash entry.  */
++struct elf_arc_link_hash_entry
++{
++  struct elf_link_hash_entry root;
++
++  /* Track dynamic relocs copied for this symbol.  */
++  struct elf_dyn_relocs *dyn_relocs;
++
++  struct got_entry *got_ents;
++};
++
++
+ /* Should be included at this location due to static declarations
+  * defined before this point.  */
+ #include "arc-got.h"
+@@ -275,15 +287,6 @@ struct arc_reloc_map
+   unsigned char		    elf_reloc_val;
+ };
+ 
+-/* ARC ELF linker hash entry.  */
+-struct elf_arc_link_hash_entry
+-{
+-  struct elf_link_hash_entry root;
+-
+-  /* Track dynamic relocs copied for this symbol.  */
+-  struct elf_dyn_relocs *dyn_relocs;
+-};
+-
+ /* ARC ELF linker hash table.  */
+ struct elf_arc_link_hash_table
+ {
+@@ -295,28 +298,28 @@ elf_arc_link_hash_newfunc (struct bfd_hash_entry *entry,
+ 			   struct bfd_hash_table *table,
+ 			   const char *string)
+ {
++  struct elf_arc_link_hash_entry * ret =
++    (struct elf_arc_link_hash_entry *) entry;
++
+   /* Allocate the structure if it has not already been allocated by a
+      subclass.  */
+-  if (entry == NULL)
+-    {
+-      entry = (struct bfd_hash_entry *)
+-	  bfd_hash_allocate (table,
+-			     sizeof (struct elf_arc_link_hash_entry));
+-      if (entry == NULL)
+-	return entry;
+-    }
++  if (ret == NULL)
++    ret = (struct elf_arc_link_hash_entry *)
++	bfd_hash_allocate (table, sizeof (struct elf_arc_link_hash_entry));
++  if (ret == NULL)
++    return (struct bfd_hash_entry *) ret;
+ 
+   /* Call the allocation method of the superclass.  */
+-  entry = _bfd_elf_link_hash_newfunc (entry, table, string);
+-  if (entry != NULL)
++  ret = ((struct elf_arc_link_hash_entry *)
++	 _bfd_elf_link_hash_newfunc ((struct bfd_hash_entry *) ret,
++				     table, string));
++  if (ret != NULL)
+     {
+-      struct elf_arc_link_hash_entry *eh;
+-
+-      eh = (struct elf_arc_link_hash_entry *) entry;
+-      eh->dyn_relocs = NULL;
++      ret->dyn_relocs = NULL;
++      ret->got_ents = NULL;
+     }
+ 
+-  return entry;
++  return (struct bfd_hash_entry *) ret;
+ }
+ 
+ /* Destroy an ARC ELF linker hash table.  */
+@@ -346,11 +349,6 @@ arc_elf_link_hash_table_create (bfd *abfd)
+       return NULL;
+     }
+ 
+-  ret->elf.init_got_refcount.refcount = 0;
+-  ret->elf.init_got_refcount.glist = NULL;
+-  ret->elf.init_got_offset.offset = 0;
+-  ret->elf.init_got_offset.glist = NULL;
+-
+   ret->elf.root.hash_table_free = elf_arc_link_hash_table_free;
+ 
+   return &ret->elf.root;
+@@ -1598,10 +1596,14 @@ elf_arc_relocate_section (bfd *			  output_bfd,
+ 	  while (h->root.type == bfd_link_hash_indirect
+ 		 || h->root.type == bfd_link_hash_warning)
+ 	  {
+-	    struct elf_link_hash_entry *h_old = h;
++	    struct elf_arc_link_hash_entry *ah_old =
++	      (struct elf_arc_link_hash_entry *) h;
+ 	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
+-	    if (h->got.glist == 0 && h_old->got.glist != h->got.glist)
+-	      h->got.glist = h_old->got.glist;
++	    struct elf_arc_link_hash_entry *ah =
++	      (struct elf_arc_link_hash_entry *) h;
++
++	    if (ah->got_ents == 0 && ah_old->got_ents != ah->got_ents)
++	      ah->got_ents = ah_old->got_ents;
+ 	  }
+ 
+ 	  /* TODO: Need to validate what was the intention.  */
+@@ -1619,6 +1621,8 @@ elf_arc_relocate_section (bfd *			  output_bfd,
+ 
+ 	      if (is_reloc_for_GOT (howto) && !bfd_link_pic (info))
+ 		{
++		  struct elf_arc_link_hash_entry *ah =
++		    (struct elf_arc_link_hash_entry *) h;
+ 		  /* TODO: Change it to use arc_do_relocation with
+ 		    ARC_32 reloc.  Try to use ADD_RELA macro.  */
+ 		  bfd_vma relocation =
+@@ -1628,8 +1632,8 @@ elf_arc_relocate_section (bfd *			  output_bfd,
+ 			 + reloc_data.sym_section->output_section->vma)
+ 		      : 0);
+ 
+-		  BFD_ASSERT (h->got.glist);
+-		  bfd_vma got_offset = h->got.glist->offset;
++		  BFD_ASSERT (ah->got_ents);
++		  bfd_vma got_offset = ah->got_ents->offset;
+ 		  bfd_put_32 (output_bfd, relocation,
+ 			      htab->sgot->contents + got_offset);
+ 		}
+@@ -1941,6 +1945,7 @@ elf_arc_check_relocs (bfd *			 abfd,
+       else /* Global one.  */
+ 	h = sym_hashes[r_symndx - symtab_hdr->sh_info];
+ 
++
+       switch (r_type)
+ 	{
+ 	  case R_ARC_32:
+@@ -2387,7 +2392,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
+      create respective dynamic relocs.  */
+   /* TODO: Make function to get list and not access the list directly.  */
+   /* TODO: Move function to relocate_section create this relocs eagerly.  */
+-  create_got_dynrelocs_for_got_info (&h->got.glist,
++  struct elf_arc_link_hash_entry *ah =
++    (struct elf_arc_link_hash_entry *) h;
++  create_got_dynrelocs_for_got_info (&ah->got_ents,
+ 				     output_bfd,
+ 				     info,
+ 				     h);
+-- 
+2.17.1
+
diff --git a/package/binutils/2.30/0011-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch b/package/binutils/2.30/0011-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch
new file mode 100644
index 000000000000..a23271dc7f56
--- /dev/null
+++ b/package/binutils/2.30/0011-ARC-Improved-robustness.-Return-FALSE-in-case-of-NUL.patch
@@ -0,0 +1,34 @@
+From 4bac50c2c94023cb1b5bf947abfb1c72eeeb12d5 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 2 Mar 2018 17:33:48 +0100
+Subject: [PATCH 2/4] [ARC] Improved robustness. Return FALSE in case of NULL
+ pointer.
+
+bfd/
+2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
+
+	* elf32-arc.c (elf_arc_finish_dynamic_symbol) Return FALSE in case
+	arc_htab is NULL.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ bfd/elf32-arc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 166a5ef604ff..72b808b99127 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -2403,6 +2403,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
+     {
+       struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
+ 
++      if(arc_htab == NULL)
++	return FALSE;
++
+       if (h->dynindx == -1
+ 	  || (h->root.type != bfd_link_hash_defined
+ 	      && h->root.type != bfd_link_hash_defweak)
+-- 
+2.17.1
+
diff --git a/package/binutils/2.30/0012-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch b/package/binutils/2.30/0012-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch
new file mode 100644
index 000000000000..5c40d9eaca49
--- /dev/null
+++ b/package/binutils/2.30/0012-ARC-Make-sure-global-symbol-is-not-an-indirect-or-wa.patch
@@ -0,0 +1,42 @@
+From b182c9f81daa08cf18cd78af3e7aca74640e8551 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 2 Mar 2018 17:38:14 +0100
+Subject: [PATCH 3/4] [ARC] Make sure global symbol is not an indirect or
+ warning.
+
+Problem identified in the context of glibc with latest upstream binutils.
+Dynamic symbol space was being reserved but, no actual information for the
+symbol was being set. Data for the symbol was kept initialized with -1.
+No easy test case was possible to be created.
+
+bfd/
+2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
+
+	* elf32-arc.c (elf_arc_check_relocs): Changed.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ bfd/elf32-arc.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 72b808b99127..6f6470f6f202 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -1943,7 +1943,12 @@ elf_arc_check_relocs (bfd *			 abfd,
+       if (r_symndx < symtab_hdr->sh_info) /* Is a local symbol.  */
+ 	h = NULL;
+       else /* Global one.  */
+-	h = sym_hashes[r_symndx - symtab_hdr->sh_info];
++	{
++	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
++	  while (h->root.type == bfd_link_hash_indirect
++		 || h->root.type == bfd_link_hash_warning)
++	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
++	}
+ 
+ 
+       switch (r_type)
+-- 
+2.17.1
+
diff --git a/package/binutils/2.30/0013-ARC-PLT-information-was-still-being-generated-when-s.patch b/package/binutils/2.30/0013-ARC-PLT-information-was-still-being-generated-when-s.patch
new file mode 100644
index 000000000000..98b9622172ab
--- /dev/null
+++ b/package/binutils/2.30/0013-ARC-PLT-information-was-still-being-generated-when-s.patch
@@ -0,0 +1,35 @@
+From e2f2d7f939435280003983ef822acd0844648643 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Fri, 2 Mar 2018 17:44:29 +0100
+Subject: [PATCH 4/4] [ARC] PLT information was still being generated when
+ symbol was forced_local.
+
+A change upstream reveiled this issue, triggering an assert when linking glibc.
+
+bfd/
+2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
+
+	* elf32-arc.c (elf_arc_check_relocs): Changed.
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ bfd/elf32-arc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 6f6470f6f202..184957c7d750 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -2024,7 +2024,8 @@ elf_arc_check_relocs (bfd *			 abfd,
+ 	  if (h == NULL)
+ 	    continue;
+ 	  else
+-	    h->needs_plt = 1;
++	    if(h->forced_local == 0)
++	      h->needs_plt = 1;
+ 	}
+ 
+       /* Add info to the symbol got_entry_list.  */
+-- 
+2.17.1
+
-- 
2.17.1
