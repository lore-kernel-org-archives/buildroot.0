From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu,  9 Apr 2015 19:55:51 +0300
Subject: [Buildroot] [PATCH] binutils: backport xtensa ld optimizations
Message-ID: <1428598551-14838-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series optimizes most time-consuming algorithms and data structures
in the xtensa link-time relaxation code, leaving relaxation logic intact.

Speedup linking typical linux kernel is ~8 times (1 minute instead of 8),
pathological cases (linking objects partially linked without relaxation)
are handled ~60 times faster (1 minute instead of an hour).

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...nsa-optimize-check_section_ebb_pcrels_fit.patch | 502 +++++++++++++
 .../907-xtensa-optimize-removed_by_actions.patch   | 356 +++++++++
 .../908-xtensa-optimize-find_removed_literal.patch | 146 ++++
 ...tensa-replace-action-list-with-splay-tree.patch | 826 +++++++++++++++++++++
 ...nsa-optimize-check_section_ebb_pcrels_fit.patch | 502 +++++++++++++
 .../907-xtensa-optimize-removed_by_actions.patch   | 356 +++++++++
 .../908-xtensa-optimize-find_removed_literal.patch | 146 ++++
 ...tensa-replace-action-list-with-splay-tree.patch | 826 +++++++++++++++++++++
 8 files changed, 3660 insertions(+)
 create mode 100644 package/binutils/2.24/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
 create mode 100644 package/binutils/2.24/907-xtensa-optimize-removed_by_actions.patch
 create mode 100644 package/binutils/2.24/908-xtensa-optimize-find_removed_literal.patch
 create mode 100644 package/binutils/2.24/909-xtensa-replace-action-list-with-splay-tree.patch
 create mode 100644 package/binutils/2.25/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
 create mode 100644 package/binutils/2.25/907-xtensa-optimize-removed_by_actions.patch
 create mode 100644 package/binutils/2.25/908-xtensa-optimize-find_removed_literal.patch
 create mode 100644 package/binutils/2.25/909-xtensa-replace-action-list-with-splay-tree.patch

diff --git a/package/binutils/2.24/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch b/package/binutils/2.24/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
new file mode 100644
index 0000000..8a21100
--- /dev/null
+++ b/package/binutils/2.24/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
@@ -0,0 +1,502 @@
+From 20c79baf82273a0b368587f761f152c4d3a593a4 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 27 Mar 2015 07:13:55 +0300
+Subject: [PATCH 1/4] xtensa: optimize check_section_ebb_pcrels_fit
+
+The original check_section_ebb_pcrels_fit algorithm checks that text
+actions proposed for current EBB are OK for every relocation in a
+section. There's no need to check every relocation, because text actions
+for EBB can only change size of that EBB, thus only affecting
+relocations that in any way cross that EBB. In addition EBBs are
+iterated in ascending order of their VMA, making it easier to track
+relevant relocations.
+
+Introduce a structure that can track relocations that cross the range of
+VMAs of EBB and use it to only check relocations relevant to current EBB
+in check_section_ebb_pcrels_fit.
+It takes O(N log N) operations to build it and O(N) operations to move
+current EBB VMA window through its entire range, where N is the number
+of relocations in a section. The resulting complexity of
+compute_text_actions is thus reduced from O(N^2) to O(N log N + N * M),
+where M is the average number of relocations crossing each EBB.
+
+Original profile:
+
+% time    self  children    called     name
+-----------------------------------------
+         44.26   71.53    6429/6429        compute_text_actions
+  50.2   44.26   71.53    6429         check_section_ebb_pcrels_fit
+          1.16   20.12 347506666/347576152     pcrel_reloc_fits
+          2.95   16.52 347506666/348104944     get_relocation_opnd
+          2.01    9.74 347575100/361252208     r_reloc_init
+          0.55    7.53 347575100/363381467     r_reloc_get_section
+          5.76    0.02 695013332/695013332     xlate_offset_with_removed_text
+          0.68    3.89 347575100/363483827     bfd_octets_per_byte
+          0.32    0.00 347506666/349910253     is_alt_relocation
+          0.18    0.11    6391/6391        build_xlate_map
+          0.00    0.00    6429/19417168     get_xtensa_relax_info
+          0.00    0.00    6391/6391        free_xlate_map
+-----------------------------------------
+
+Same data, after optimization:
+
+% time    self  children    called     name
+-----------------------------------------
+          2.56    3.08    6429/6429        compute_text_actions
+   8.2    2.56    3.08    6429         check_section_ebb_pcrels_fit
+          0.08    0.91 17721075/17790561     pcrel_reloc_fits
+          0.17    0.47 17721075/31685977     r_reloc_init
+          0.43    0.00 35442150/35442150     xlate_offset_with_removed_text
+          0.02    0.37 17721075/33815236     r_reloc_get_section
+          0.22    0.11    6391/6391        build_xlate_map
+          0.05    0.22 17721075/33917596     bfd_octets_per_byte
+          0.03    0.00 17721075/20405299     is_alt_relocation
+          0.01    0.00    6429/6429        reloc_range_list_update_range
+          0.00    0.00    6429/19417168     get_xtensa_relax_info
+          0.00    0.00    6391/6391        free_xlate_map
+-----------------------------------------
+
+2015-04-01  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (reloc_range_list, reloc_range_list_entry,
+	reloc_range): new typedef.
+	(reloc_range_list_struct, reloc_range_list_entry_struct,
+	reloc_range_struct): new structures.
+	(reloc_range_compare, build_reloc_ranges,
+	reloc_range_list_append, reloc_range_list_remove,
+	reloc_range_list_update_range, free_reloc_range_list): new
+	functions.
+	(compute_text_actions): precompute relocation opcodes before the
+	loop. Add relevant_relocs variable, initialize it before the
+	loop, pass it to the check_section_ebb_pcrels_fit.
+	(check_section_ebb_pcrels_fit): add new parameter:
+	relevant_relocs. Update address range in the relevant_relocs if
+	it's non-NULL and iterate only over relevant relocations.
+
+Backported from: b2b326d246f839ee218192ac88da2384d929a072
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 321 +++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 298 insertions(+), 23 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 0b6f584..872370b 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -6619,8 +6619,10 @@ static bfd_boolean compute_text_actions
+   (bfd *, asection *, struct bfd_link_info *);
+ static bfd_boolean compute_ebb_proposed_actions (ebb_constraint *);
+ static bfd_boolean compute_ebb_actions (ebb_constraint *);
++typedef struct reloc_range_list_struct reloc_range_list;
+ static bfd_boolean check_section_ebb_pcrels_fit
+-  (bfd *, asection *, bfd_byte *, Elf_Internal_Rela *, const ebb_constraint *,
++  (bfd *, asection *, bfd_byte *, Elf_Internal_Rela *,
++   reloc_range_list *, const ebb_constraint *,
+    const xtensa_opcode *);
+ static bfd_boolean check_section_ebb_reduces (const ebb_constraint *);
+ static void text_action_add_proposed
+@@ -7219,6 +7221,221 @@ build_reloc_opcodes (bfd *abfd,
+   return reloc_opcodes;
+ }
+ 
++struct reloc_range_struct
++{
++  bfd_vma addr;
++  bfd_boolean add; /* TRUE if start of a range, FALSE otherwise.  */
++  /* Original irel index in the array of relocations for a section.  */
++  unsigned irel_index;
++};
++typedef struct reloc_range_struct reloc_range;
++
++typedef struct reloc_range_list_entry_struct reloc_range_list_entry;
++struct reloc_range_list_entry_struct
++{
++  reloc_range_list_entry *next;
++  reloc_range_list_entry *prev;
++  Elf_Internal_Rela *irel;
++  xtensa_opcode opcode;
++  int opnum;
++};
++
++struct reloc_range_list_struct
++{
++  /* The rest of the structure is only meaningful when ok is TRUE.  */
++  bfd_boolean ok;
++
++  unsigned n_range; /* Number of range markers.  */
++  reloc_range *range; /* Sorted range markers.  */
++
++  unsigned first; /* Index of a first range element in the list.  */
++  unsigned last; /* One past index of a last range element in the list.  */
++
++  unsigned n_list; /* Number of list elements.  */
++  reloc_range_list_entry *reloc; /*  */
++  reloc_range_list_entry list_root;
++};
++
++static int
++reloc_range_compare (const void *a, const void *b)
++{
++  const reloc_range *ra = a;
++  const reloc_range *rb = b;
++
++  if (ra->addr != rb->addr)
++    return ra->addr < rb->addr ? -1 : 1;
++  if (ra->add != rb->add)
++    return ra->add ? -1 : 1;
++  return 0;
++}
++
++static void
++build_reloc_ranges (bfd *abfd, asection *sec,
++		    bfd_byte *contents,
++		    Elf_Internal_Rela *internal_relocs,
++		    xtensa_opcode *reloc_opcodes,
++		    reloc_range_list *list)
++{
++  unsigned i;
++  size_t n = 0;
++  size_t max_n = 0;
++  reloc_range *ranges = NULL;
++  reloc_range_list_entry *reloc =
++    bfd_malloc (sec->reloc_count * sizeof (*reloc));
++
++  memset (list, 0, sizeof (*list));
++  list->ok = TRUE;
++
++  for (i = 0; i < sec->reloc_count; i++)
++    {
++      Elf_Internal_Rela *irel = &internal_relocs[i];
++      int r_type = ELF32_R_TYPE (irel->r_info);
++      reloc_howto_type *howto = &elf_howto_table[r_type];
++      r_reloc r_rel;
++
++      if (r_type == R_XTENSA_ASM_SIMPLIFY
++	  || r_type == R_XTENSA_32_PCREL
++	  || !howto->pc_relative)
++	continue;
++
++      r_reloc_init (&r_rel, abfd, irel, contents,
++		    bfd_get_section_limit (abfd, sec));
++
++      if (r_reloc_get_section (&r_rel) != sec)
++	continue;
++
++      if (n + 2 > max_n)
++	{
++	  max_n = (max_n + 2) * 2;
++	  ranges = bfd_realloc (ranges, max_n * sizeof (*ranges));
++	}
++
++      ranges[n].addr = irel->r_offset;
++      ranges[n + 1].addr = r_rel.target_offset;
++
++      ranges[n].add = ranges[n].addr < ranges[n + 1].addr;
++      ranges[n + 1].add = !ranges[n].add;
++
++      ranges[n].irel_index = i;
++      ranges[n + 1].irel_index = i;
++
++      n += 2;
++
++      reloc[i].irel = irel;
++
++      /* Every relocation won't possibly be checked in the optimized version of
++         check_section_ebb_pcrels_fit, so this needs to be done here.  */
++      if (is_alt_relocation (ELF32_R_TYPE (irel->r_info)))
++	{
++	  /* None of the current alternate relocs are PC-relative,
++	     and only PC-relative relocs matter here.  */
++	}
++      else
++	{
++	  xtensa_opcode opcode;
++	  int opnum;
++
++	  if (reloc_opcodes)
++	    opcode = reloc_opcodes[i];
++	  else
++	    opcode = get_relocation_opcode (abfd, sec, contents, irel);
++
++	  if (opcode == XTENSA_UNDEFINED)
++	    {
++	      list->ok = FALSE;
++	      break;
++	    }
++
++	  opnum = get_relocation_opnd (opcode, ELF32_R_TYPE (irel->r_info));
++	  if (opnum == XTENSA_UNDEFINED)
++	    {
++	      list->ok = FALSE;
++	      break;
++	    }
++
++	  /* Record relocation opcode and opnum as we've calculated them
++	     anyway and they won't change.  */
++	  reloc[i].opcode = opcode;
++	  reloc[i].opnum = opnum;
++	}
++    }
++
++  if (list->ok)
++    {
++      ranges = bfd_realloc (ranges, n * sizeof (*ranges));
++      qsort (ranges, n, sizeof (*ranges), reloc_range_compare);
++
++      list->n_range = n;
++      list->range = ranges;
++      list->reloc = reloc;
++      list->list_root.prev = &list->list_root;
++      list->list_root.next = &list->list_root;
++    }
++  else
++    {
++      free (ranges);
++      free (reloc);
++    }
++}
++
++static void reloc_range_list_append (reloc_range_list *list,
++				     unsigned irel_index)
++{
++  reloc_range_list_entry *entry = list->reloc + irel_index;
++
++  entry->prev = list->list_root.prev;
++  entry->next = &list->list_root;
++  entry->prev->next = entry;
++  entry->next->prev = entry;
++  ++list->n_list;
++}
++
++static void reloc_range_list_remove (reloc_range_list *list,
++				     unsigned irel_index)
++{
++  reloc_range_list_entry *entry = list->reloc + irel_index;
++
++  entry->next->prev = entry->prev;
++  entry->prev->next = entry->next;
++  --list->n_list;
++}
++
++/* Update relocation list object so that it lists all relocations that cross
++   [first; last] range.  Range bounds should not decrease with successive
++   invocations.  */
++static void reloc_range_list_update_range (reloc_range_list *list,
++					   bfd_vma first, bfd_vma last)
++{
++  /* This should not happen: EBBs are iterated from lower addresses to higher.
++     But even if that happens there's no need to break: just flush current list
++     and start from scratch.  */
++  if ((list->last > 0 && list->range[list->last - 1].addr > last) ||
++      (list->first > 0 && list->range[list->first - 1].addr >= first))
++    {
++      list->first = 0;
++      list->last = 0;
++      list->n_list = 0;
++      list->list_root.next = &list->list_root;
++      list->list_root.prev = &list->list_root;
++      fprintf (stderr, "%s: move backwards requested\n", __func__);
++    }
++
++  for (; list->last < list->n_range &&
++       list->range[list->last].addr <= last; ++list->last)
++    if (list->range[list->last].add)
++      reloc_range_list_append (list, list->range[list->last].irel_index);
++
++  for (; list->first < list->n_range &&
++       list->range[list->first].addr < first; ++list->first)
++    if (!list->range[list->first].add)
++      reloc_range_list_remove (list, list->range[list->first].irel_index);
++}
++
++static void free_reloc_range_list (reloc_range_list *list)
++{
++  free (list->range);
++  free (list->reloc);
++}
+ 
+ /* The compute_text_actions function will build a list of potential
+    transformation actions for code in the extended basic block of each
+@@ -7245,6 +7462,7 @@ compute_text_actions (bfd *abfd,
+   property_table_entry *prop_table = 0;
+   int ptblsize = 0;
+   bfd_size_type sec_size;
++  reloc_range_list relevant_relocs;
+ 
+   relax_info = get_xtensa_relax_info (sec);
+   BFD_ASSERT (relax_info);
+@@ -7277,6 +7495,12 @@ compute_text_actions (bfd *abfd,
+       goto error_return;
+     }
+ 
++  /* Precompute the opcode for each relocation.  */
++  reloc_opcodes = build_reloc_opcodes (abfd, sec, contents, internal_relocs);
++
++  build_reloc_ranges (abfd, sec, contents, internal_relocs, reloc_opcodes,
++		      &relevant_relocs);
++
+   for (i = 0; i < sec->reloc_count; i++)
+     {
+       Elf_Internal_Rela *irel = &internal_relocs[i];
+@@ -7340,17 +7564,13 @@ compute_text_actions (bfd *abfd,
+       ebb->start_reloc_idx = i;
+       ebb->end_reloc_idx = i;
+ 
+-      /* Precompute the opcode for each relocation.  */
+-      if (reloc_opcodes == NULL)
+-	reloc_opcodes = build_reloc_opcodes (abfd, sec, contents,
+-					     internal_relocs);
+-
+       if (!extend_ebb_bounds (ebb)
+ 	  || !compute_ebb_proposed_actions (&ebb_table)
+ 	  || !compute_ebb_actions (&ebb_table)
+ 	  || !check_section_ebb_pcrels_fit (abfd, sec, contents,
+-					    internal_relocs, &ebb_table,
+-					    reloc_opcodes)
++					    internal_relocs,
++					    &relevant_relocs,
++					    &ebb_table, reloc_opcodes)
+ 	  || !check_section_ebb_reduces (&ebb_table))
+ 	{
+ 	  /* If anything goes wrong or we get unlucky and something does
+@@ -7372,6 +7592,8 @@ compute_text_actions (bfd *abfd,
+       free_ebb_constraint (&ebb_table);
+     }
+ 
++  free_reloc_range_list (&relevant_relocs);
++
+ #if DEBUG
+   if (relax_info->action_list.head)
+     print_action_list (stderr, &relax_info->action_list);
+@@ -7974,14 +8196,17 @@ check_section_ebb_pcrels_fit (bfd *abfd,
+ 			      asection *sec,
+ 			      bfd_byte *contents,
+ 			      Elf_Internal_Rela *internal_relocs,
++			      reloc_range_list *relevant_relocs,
+ 			      const ebb_constraint *constraint,
+ 			      const xtensa_opcode *reloc_opcodes)
+ {
+   unsigned i, j;
++  unsigned n = sec->reloc_count;
+   Elf_Internal_Rela *irel;
+   xlate_map_t *xmap = NULL;
+   bfd_boolean ok = TRUE;
+   xtensa_relax_info *relax_info;
++  reloc_range_list_entry *entry = NULL;
+ 
+   relax_info = get_xtensa_relax_info (sec);
+ 
+@@ -7992,7 +8217,40 @@ check_section_ebb_pcrels_fit (bfd *abfd,
+ 	 can still be used.  */
+     }
+ 
+-  for (i = 0; i < sec->reloc_count; i++)
++  if (relevant_relocs && constraint->action_count)
++    {
++      if (!relevant_relocs->ok)
++	{
++	  ok = FALSE;
++	  n = 0;
++	}
++      else
++	{
++	  bfd_vma min_offset, max_offset;
++	  min_offset = max_offset = constraint->actions[0].offset;
++
++	  for (i = 1; i < constraint->action_count; ++i)
++	    {
++	      proposed_action *action = &constraint->actions[i];
++	      bfd_vma offset = action->offset;
++
++	      if (offset < min_offset)
++		min_offset = offset;
++	      if (offset > max_offset)
++		max_offset = offset;
++	    }
++	  reloc_range_list_update_range (relevant_relocs, min_offset,
++					 max_offset);
++	  n = relevant_relocs->n_list;
++	  entry = &relevant_relocs->list_root;
++	}
++    }
++  else
++    {
++      relevant_relocs = NULL;
++    }
++
++  for (i = 0; i < n; i++)
+     {
+       r_reloc r_rel;
+       bfd_vma orig_self_offset, orig_target_offset;
+@@ -8001,7 +8259,15 @@ check_section_ebb_pcrels_fit (bfd *abfd,
+       reloc_howto_type *howto;
+       int self_removed_bytes, target_removed_bytes;
+ 
+-      irel = &internal_relocs[i];
++      if (relevant_relocs)
++	{
++	  entry = entry->next;
++	  irel = entry->irel;
++	}
++      else
++	{
++	  irel = internal_relocs + i;
++	}
+       r_type = ELF32_R_TYPE (irel->r_info);
+ 
+       howto = &elf_howto_table[r_type];
+@@ -8067,21 +8333,30 @@ check_section_ebb_pcrels_fit (bfd *abfd,
+ 	  xtensa_opcode opcode;
+ 	  int opnum;
+ 
+-	  if (reloc_opcodes)
+-	    opcode = reloc_opcodes[i];
+-	  else
+-	    opcode = get_relocation_opcode (abfd, sec, contents, irel);
+-	  if (opcode == XTENSA_UNDEFINED)
++	  if (relevant_relocs)
+ 	    {
+-	      ok = FALSE;
+-	      break;
++	      opcode = entry->opcode;
++	      opnum = entry->opnum;
+ 	    }
+-
+-	  opnum = get_relocation_opnd (opcode, ELF32_R_TYPE (irel->r_info));
+-	  if (opnum == XTENSA_UNDEFINED)
++	  else
+ 	    {
+-	      ok = FALSE;
+-	      break;
++	      if (reloc_opcodes)
++		opcode = reloc_opcodes[relevant_relocs ?
++		  (unsigned)(entry - relevant_relocs->reloc) : i];
++	      else
++		opcode = get_relocation_opcode (abfd, sec, contents, irel);
++	      if (opcode == XTENSA_UNDEFINED)
++		{
++		  ok = FALSE;
++		  break;
++		}
++
++	      opnum = get_relocation_opnd (opcode, ELF32_R_TYPE (irel->r_info));
++	      if (opnum == XTENSA_UNDEFINED)
++		{
++		  ok = FALSE;
++		  break;
++		}
+ 	    }
+ 
+ 	  if (!pcrel_reloc_fits (opcode, opnum, self_offset, target_offset))
+@@ -8778,7 +9053,7 @@ move_shared_literal (asection *sec,
+   /* Check all of the PC-relative relocations to make sure they still fit.  */
+   relocs_fit = check_section_ebb_pcrels_fit (target_sec->owner, target_sec,
+ 					     target_sec_cache->contents,
+-					     target_sec_cache->relocs,
++					     target_sec_cache->relocs, NULL,
+ 					     &ebb_table, NULL);
+ 
+   if (!relocs_fit)
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.24/907-xtensa-optimize-removed_by_actions.patch b/package/binutils/2.24/907-xtensa-optimize-removed_by_actions.patch
new file mode 100644
index 0000000..9df8065
--- /dev/null
+++ b/package/binutils/2.24/907-xtensa-optimize-removed_by_actions.patch
@@ -0,0 +1,356 @@
+From 3e3f60207399ab29dd55af109e5ae9facc7d8e83 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 28 Mar 2015 08:46:28 +0300
+Subject: [PATCH 2/4] xtensa: optimize removed_by_actions
+
+The function removed_by_actions iterates through text actions to
+calculate an offset applied by text actions to a given VMA. Although it
+has a parameter p_start_action that allows for incremental offset
+calculation, in many places it's used with p_start_action explicitly set
+to the first action. After the first relaxation pass when the list of
+text actions is finalized, an array of offsets sorted by VMA may be used
+to speed up this function.
+
+Original profile:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.35    0.00   33872/4808961     relax_section_symbols
+          3.32    0.00  326022/4808961     relax_property_section
+         12.83    0.00 1259379/4808961     offset_with_removed_text
+         32.50    0.00 3189688/4808961     translate_reloc
+  71.5   49.00    0.00 4808961         removed_by_actions
+-----------------------------------------
+
+Same data, after optimization:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.00    0.00   33872/4808537     relax_section_symbols
+          0.01    0.00  326022/4808537     relax_property_section
+          0.05    0.00 1258955/4808537     offset_with_removed_text_map
+          0.13    0.00 3189688/4808537     translate_reloc
+   1.0    0.20    0.00 4808537         removed_by_actions_map
+          0.00    0.00     120/120         map_removal_by_action
+-----------------------------------------
+
+2015-04-01  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (removal_by_action_entry_struct,
+	removal_by_action_map_struct): new structures.
+	(removal_by_action_entry, removal_by_action_map): new typedefs.
+	(text_action_list_struct): add new field: map.
+	(map_removal_by_action, removed_by_actions_map,
+	offset_with_removed_text_map): new functions.
+	(relax_section): replace offset_with_removed_text with
+	offset_with_removed_text_map.
+	(translate_reloc, relax_property_section, relax_section_symbols):
+	replace removed_by_actions with removed_by_actions_map.
+
+Backported from: 071aa5c98a31c966f5fbfc573fcee61350fd1936
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 181 +++++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 156 insertions(+), 25 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 872370b..21b2871 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -5420,11 +5420,28 @@ struct text_action_struct
+   text_action *next;
+ };
+ 
++struct removal_by_action_entry_struct
++{
++  bfd_vma offset;
++  int removed;
++  int eq_removed;
++  int eq_removed_before_fill;
++};
++typedef struct removal_by_action_entry_struct removal_by_action_entry;
++
++struct removal_by_action_map_struct
++{
++  unsigned n_entries;
++  removal_by_action_entry *entry;
++};
++typedef struct removal_by_action_map_struct removal_by_action_map;
++
+ 
+ /* List of all of the actions taken on a text section.  */
+ struct text_action_list_struct
+ {
+   text_action *head;
++  removal_by_action_map map;
+ };
+ 
+ 
+@@ -5636,6 +5653,101 @@ action_list_count (text_action_list *action_list)
+   return count;
+ }
+ 
++static void
++map_removal_by_action (text_action_list *action_list)
++{
++  text_action *r;
++  int removed = 0;
++  removal_by_action_map map;
++  bfd_boolean eq_complete;
++
++  map.n_entries = 0;
++  map.entry = bfd_malloc (action_list_count (action_list) *
++			  sizeof (removal_by_action_entry));
++  eq_complete = FALSE;
++
++  for (r = action_list->head; r;)
++    {
++      removal_by_action_entry *ientry = map.entry + map.n_entries;
++
++      if (map.n_entries && (ientry - 1)->offset == r->offset)
++	{
++	  --ientry;
++	}
++      else
++	{
++	  ++map.n_entries;
++	  eq_complete = FALSE;
++	  ientry->offset = r->offset;
++	  ientry->eq_removed_before_fill = removed;
++	}
++
++      if (!eq_complete)
++	{
++	  if (r->action != ta_fill || r->removed_bytes >= 0)
++	    {
++	      ientry->eq_removed = removed;
++	      eq_complete = TRUE;
++	    }
++	  else
++	    ientry->eq_removed = removed + r->removed_bytes;
++	}
++
++      removed += r->removed_bytes;
++      ientry->removed = removed;
++      r = r->next;
++    }
++  action_list->map = map;
++}
++
++static int
++removed_by_actions_map (text_action_list *action_list, bfd_vma offset,
++			bfd_boolean before_fill)
++{
++  unsigned a, b;
++
++  if (!action_list->map.entry)
++    map_removal_by_action (action_list);
++
++  if (!action_list->map.n_entries)
++    return 0;
++
++  a = 0;
++  b = action_list->map.n_entries;
++
++  while (b - a > 1)
++    {
++      unsigned c = (a + b) / 2;
++
++      if (action_list->map.entry[c].offset <= offset)
++	a = c;
++      else
++	b = c;
++    }
++
++  if (action_list->map.entry[a].offset < offset)
++    {
++      return action_list->map.entry[a].removed;
++    }
++  else if (action_list->map.entry[a].offset == offset)
++    {
++      return before_fill ?
++	action_list->map.entry[a].eq_removed_before_fill :
++	action_list->map.entry[a].eq_removed;
++    }
++  else
++    {
++      return 0;
++    }
++}
++
++static bfd_vma
++offset_with_removed_text_map (text_action_list *action_list, bfd_vma offset)
++{
++  int removed = removed_by_actions_map (action_list, offset, FALSE);
++  return offset - removed;
++}
++
+ 
+ /* The find_insn_action routine will only find non-fill actions.  */
+ 
+@@ -5909,6 +6021,9 @@ init_xtensa_relax_info (asection *sec)
+ 
+   relax_info->action_list.head = NULL;
+ 
++  relax_info->action_list.map.n_entries = 0;
++  relax_info->action_list.map.entry = NULL;
++
+   relax_info->fix_list = NULL;
+   relax_info->fix_array = NULL;
+   relax_info->fix_array_count = 0;
+@@ -9218,7 +9333,7 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		  if (elf_hash_table (link_info)->dynamic_sections_created)
+ 		    shrink_dynamic_reloc_sections (link_info, abfd, sec, irel);
+ 		  irel->r_info = ELF32_R_INFO (0, R_XTENSA_NONE);
+-		  irel->r_offset = offset_with_removed_text
++		  irel->r_offset = offset_with_removed_text_map
+ 		    (&relax_info->action_list, irel->r_offset);
+ 		  continue;
+ 		}
+@@ -9255,7 +9370,7 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		    }
+ 		}
+ 
+-	      source_offset = offset_with_removed_text
++	      source_offset = offset_with_removed_text_map
+ 		(&relax_info->action_list, irel->r_offset);
+ 	      irel->r_offset = source_offset;
+ 	    }
+@@ -9352,7 +9467,7 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		      break;
+ 		    }
+ 
+-		  new_end_offset = offset_with_removed_text
++		  new_end_offset = offset_with_removed_text_map
+ 		    (&target_relax_info->action_list,
+ 		     r_rel.target_offset + diff_value);
+ 		  diff_value = new_end_offset - new_reloc.target_offset;
+@@ -9750,7 +9865,6 @@ translate_reloc (const r_reloc *orig_rel, r_reloc *new_rel, asection *sec)
+   xtensa_relax_info *relax_info;
+   removed_literal *removed;
+   bfd_vma target_offset, base_offset;
+-  text_action *act;
+ 
+   *new_rel = *orig_rel;
+ 
+@@ -9803,19 +9917,26 @@ translate_reloc (const r_reloc *orig_rel, r_reloc *new_rel, asection *sec)
+      offset.  */
+ 
+   base_offset = r_reloc_get_target_offset (new_rel) - new_rel->rela.r_addend;
+-  act = relax_info->action_list.head;
+   if (base_offset <= target_offset)
+     {
+-      int base_removed = removed_by_actions (&act, base_offset, FALSE);
+-      int addend_removed = removed_by_actions (&act, target_offset, FALSE);
++      int base_removed = removed_by_actions_map (&relax_info->action_list,
++						 base_offset, FALSE);
++      int addend_removed = removed_by_actions_map (&relax_info->action_list,
++						   target_offset, FALSE) -
++	base_removed;
++
+       new_rel->target_offset = target_offset - base_removed - addend_removed;
+       new_rel->rela.r_addend -= addend_removed;
+     }
+   else
+     {
+       /* Handle a negative addend.  The base offset comes first.  */
+-      int tgt_removed = removed_by_actions (&act, target_offset, FALSE);
+-      int addend_removed = removed_by_actions (&act, base_offset, FALSE);
++      int tgt_removed = removed_by_actions_map (&relax_info->action_list,
++						target_offset, FALSE);
++      int addend_removed = removed_by_actions_map (&relax_info->action_list,
++						   base_offset, FALSE) -
++	tgt_removed;
++
+       new_rel->target_offset = target_offset - tgt_removed;
+       new_rel->rela.r_addend += addend_removed;
+     }
+@@ -10138,9 +10259,10 @@ relax_property_section (bfd *abfd,
+ 	      bfd_vma old_offset = val.r_rel.target_offset;
+ 	      bfd_vma new_offset;
+ 	      long old_size, new_size;
+-	      text_action *act = target_relax_info->action_list.head;
+-	      new_offset = old_offset -
+-		removed_by_actions (&act, old_offset, FALSE);
++	      int removed_by_old_offset =
++		removed_by_actions_map (&target_relax_info->action_list,
++					old_offset, FALSE);
++	      new_offset = old_offset - removed_by_old_offset;
+ 
+ 	      /* Assert that we are not out of bounds.  */
+ 	      old_size = bfd_get_32 (abfd, size_p);
+@@ -10164,9 +10286,10 @@ relax_property_section (bfd *abfd,
+ 
+ 		      /* Recompute the new_offset, but this time don't
+ 			 include any fill inserted by relaxation.  */
+-		      act = target_relax_info->action_list.head;
+-		      new_offset = old_offset -
+-			removed_by_actions (&act, old_offset, TRUE);
++		      removed_by_old_offset =
++			removed_by_actions_map (&target_relax_info->action_list,
++						old_offset, TRUE);
++		      new_offset = old_offset - removed_by_old_offset;
+ 
+ 		      /* If it is not unreachable and we have not yet
+ 			 seen an unreachable at this address, place it
+@@ -10182,8 +10305,12 @@ relax_property_section (bfd *abfd,
+ 		    }
+ 		}
+ 	      else
+-		new_size -=
+-		    removed_by_actions (&act, old_offset + old_size, TRUE);
++		{
++		  int removed_by_old_offset_size =
++		    removed_by_actions_map (&target_relax_info->action_list,
++					    old_offset + old_size, TRUE);
++		  new_size -= removed_by_old_offset_size - removed_by_old_offset;
++		}
+ 
+ 	      if (new_size != old_size)
+ 		{
+@@ -10441,14 +10568,16 @@ relax_section_symbols (bfd *abfd, asection *sec)
+ 
+       if (isym->st_shndx == sec_shndx)
+ 	{
+-	  text_action *act = relax_info->action_list.head;
+ 	  bfd_vma orig_addr = isym->st_value;
++	  int removed = removed_by_actions_map (&relax_info->action_list,
++						orig_addr, FALSE);
+ 
+-	  isym->st_value -= removed_by_actions (&act, orig_addr, FALSE);
+-
++	  isym->st_value -= removed;
+ 	  if (ELF32_ST_TYPE (isym->st_info) == STT_FUNC)
+ 	    isym->st_size -=
+-	      removed_by_actions (&act, orig_addr + isym->st_size, FALSE);
++	      removed_by_actions_map (&relax_info->action_list,
++				      orig_addr + isym->st_size, FALSE) -
++	      removed;
+ 	}
+     }
+ 
+@@ -10466,15 +10595,17 @@ relax_section_symbols (bfd *abfd, asection *sec)
+ 	   || sym_hash->root.type == bfd_link_hash_defweak)
+ 	  && sym_hash->root.u.def.section == sec)
+ 	{
+-	  text_action *act = relax_info->action_list.head;
+ 	  bfd_vma orig_addr = sym_hash->root.u.def.value;
++	  int removed = removed_by_actions_map (&relax_info->action_list,
++						orig_addr, FALSE);
+ 
+-	  sym_hash->root.u.def.value -=
+-	    removed_by_actions (&act, orig_addr, FALSE);
++	  sym_hash->root.u.def.value -= removed;
+ 
+ 	  if (sym_hash->type == STT_FUNC)
+ 	    sym_hash->size -=
+-	      removed_by_actions (&act, orig_addr + sym_hash->size, FALSE);
++	      removed_by_actions_map (&relax_info->action_list,
++				      orig_addr + sym_hash->size, FALSE) -
++	      removed;
+ 	}
+     }
+ 
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.24/908-xtensa-optimize-find_removed_literal.patch b/package/binutils/2.24/908-xtensa-optimize-find_removed_literal.patch
new file mode 100644
index 0000000..96d526f
--- /dev/null
+++ b/package/binutils/2.24/908-xtensa-optimize-find_removed_literal.patch
@@ -0,0 +1,146 @@
+From 288c2b709e5e6841484e1a129eaccd299db36877 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 4 Apr 2015 14:49:42 +0300
+Subject: [PATCH 3/4] xtensa: optimize find_removed_literal
+
+find_removed_literal uses linear search to find removed literal by its
+VMA. The list of literals is fixed at that point, build an ordered index
+array and use binary search instead.
+
+Original profile:
+
+% time    self  children    called     name
+-----------------------------------------
+         56.72    0.00  297578/669392      translate_reloc
+         70.86    0.00  371814/669392      relax_section
+  67.9  127.58    0.00  669392         find_removed_literal
+-----------------------------------------
+
+Same data, after optimization:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.00    0.00  297578/669392      translate_reloc
+          0.00    0.00  371814/669392      relax_section
+   0.0    0.00    0.00  669392         find_removed_literal
+          0.00    0.00   23838/23838       map_removed_literal
+-----------------------------------------
+
+2015-04-03  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (removed_literal_map_entry): new typedef.
+	(removed_literal_map_entry_struct): new structure.
+	(removed_literal_list_struct): add new fields: n_map and map.
+	(map_removed_literal, removed_literal_compare): new functions.
+	(find_removed_literal): build index array for literals ordered
+	by VMA, use binary search to find removed literal.
+
+Backported from: 3439c466273378021821473d3fc84990e089ae34
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 58 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 21b2871..51733ad 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -5832,6 +5832,7 @@ print_action_list (FILE *fp, text_action_list *action_list)
+    by the "from" offset field.  */
+ 
+ typedef struct removed_literal_struct removed_literal;
++typedef struct removed_literal_map_entry_struct removed_literal_map_entry;
+ typedef struct removed_literal_list_struct removed_literal_list;
+ 
+ struct removed_literal_struct
+@@ -5841,10 +5842,19 @@ struct removed_literal_struct
+   removed_literal *next;
+ };
+ 
++struct removed_literal_map_entry_struct
++{
++  bfd_vma addr;
++  removed_literal *literal;
++};
++
+ struct removed_literal_list_struct
+ {
+   removed_literal *head;
+   removed_literal *tail;
++
++  unsigned n_map;
++  removed_literal_map_entry *map;
+ };
+ 
+ 
+@@ -5893,6 +5903,39 @@ add_removed_literal (removed_literal_list *removed_list,
+     }
+ }
+ 
++static void
++map_removed_literal (removed_literal_list *removed_list)
++{
++  unsigned n_map = 0;
++  unsigned i;
++  removed_literal_map_entry *map = NULL;
++  removed_literal *r = removed_list->head;
++
++  for (i = 0; r; ++i, r = r->next)
++    {
++      if (i == n_map)
++	{
++	  n_map = (n_map * 2) + 2;
++	  map = bfd_realloc (map, n_map * sizeof (*map));
++	}
++      map[i].addr = r->from.target_offset;
++      map[i].literal = r;
++    }
++  removed_list->map = map;
++  removed_list->n_map = i;
++}
++
++static int
++removed_literal_compare (const void *a, const void *b)
++{
++  const removed_literal_map_entry *pa = a;
++  const removed_literal_map_entry *pb = b;
++
++  if (pa->addr == pb->addr)
++    return 0;
++  else
++    return pa->addr < pb->addr ? -1 : 1;
++}
+ 
+ /* Check if the list of removed literals contains an entry for the
+    given address.  Return the entry if found.  */
+@@ -5900,12 +5943,21 @@ add_removed_literal (removed_literal_list *removed_list,
+ static removed_literal *
+ find_removed_literal (removed_literal_list *removed_list, bfd_vma addr)
+ {
+-  removed_literal *r = removed_list->head;
+-  while (r && r->from.target_offset < addr)
+-    r = r->next;
+-  if (r && r->from.target_offset == addr)
+-    return r;
+-  return NULL;
++  removed_literal_map_entry *p;
++  removed_literal *r = NULL;
++
++  if (removed_list->map == NULL)
++    map_removed_literal (removed_list);
++
++  p = bsearch (&addr, removed_list->map, removed_list->n_map,
++	       sizeof (*removed_list->map), removed_literal_compare);
++  if (p)
++    {
++      while (p != removed_list->map && (p - 1)->addr == addr)
++	--p;
++      r = p->literal;
++    }
++  return r;
+ }
+ 
+ 
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.24/909-xtensa-replace-action-list-with-splay-tree.patch b/package/binutils/2.24/909-xtensa-replace-action-list-with-splay-tree.patch
new file mode 100644
index 0000000..3090cc2
--- /dev/null
+++ b/package/binutils/2.24/909-xtensa-replace-action-list-with-splay-tree.patch
@@ -0,0 +1,826 @@
+From e5409aedd3ee2192855018a564650ffb75c26e60 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 5 Apr 2015 17:04:22 +0300
+Subject: [PATCH 4/4] xtensa: replace action list with splay tree
+
+text_action_add uses linear list search to order text actions list by
+action VMA. The list is used at the first relaxation pass, when it's not
+fixed yet.
+Replace the list with splay tree from libiberty.
+
+Original profile:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.00    0.00      14/158225      compute_text_actions
+          3.62    0.00   25211/158225      remove_dead_literal
+          8.42    0.00   58645/158225      coalesce_shared_literal
+         10.68    0.00   74355/158225      text_action_add_proposed
+  38.8   22.73    0.00  158225         text_action_add
+          0.00    0.00  144527/293246      bfd_zmalloc
+-----------------------------------------
+
+Same data, after optimization:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.00    0.00      14/158225      compute_text_actions
+          0.00    0.00   25211/158225      remove_dead_literal
+          0.00    0.01   58645/158225      coalesce_shared_literal
+          0.00    0.01   74355/158225      text_action_add_proposed
+   0.1    0.00    0.02  158225         text_action_add
+          0.01    0.00  144527/144527      splay_tree_insert
+          0.00    0.00  144527/195130      splay_tree_lookup
+          0.00    0.00  144527/293246      bfd_zmalloc
+-----------------------------------------
+
+2015-04-03  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (splay-tree.h): include header.
+	(text_action_struct): drop next pointer.
+	(text_action_list_struct): drop head pointer, add count and
+	tree fields.
+	(find_fill_action): instead of linear search in text_action_list
+	search in the tree.
+	(text_action_compare, action_first, action_next): new functions.
+	(text_action_add, text_action_add_literal): instead of linear
+	search and insertion insert new node into the tree.
+	(removed_by_actions): pass additional parameter: action_list,
+	use it to traverse the tree.
+	(offset_with_removed_text): pass additional action_list parameter
+	to removed_by_actions.
+	(map_action_fn_context): new typedef.
+	(map_action_fn_context_struct): new structure.
+	(map_action_fn): new function.
+	(map_removal_by_action): use splay_tree_foreach to build map.
+	(find_insn_action): replace linear search in text_action_list
+	with series of splay_tree_lookups.
+	(print_action, print_action_list_fn): new functions.
+	(print_action_list): use splay_tree_foreach.
+	(init_xtensa_relax_info): drop action_list.head initialization.
+	Initialize the tree.
+	(compute_text_actions): use non-zero action_list_count instead of
+	non-NULL action list.
+	(xlate_map_context): new typedef.
+	(xlate_map_context_struct): new structure.
+	(xlate_map_fn): new function.
+	(build_xlate_map): use splay_tree_foreach to build map.
+	(action_remove_bytes_fn): new function.
+	(relax_section): use zero action_list_count instead of NULL
+	action list. Use splay_tree_foreach to count final section size.
+	Drop unused variable 'removed'.
+
+Backported from: 4c2af04fe8b4452bf51d2debf1bb467fafcd0f08
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 488 +++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 282 insertions(+), 206 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 51733ad..53af1c6 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -28,6 +28,7 @@
+ #include "libbfd.h"
+ #include "elf-bfd.h"
+ #include "elf/xtensa.h"
++#include "splay-tree.h"
+ #include "xtensa-isa.h"
+ #include "xtensa-config.h"
+ 
+@@ -5416,8 +5417,6 @@ struct text_action_struct
+   bfd_vma virtual_offset;  /* Zero except for adding literals.  */
+   int removed_bytes;
+   literal_value value;	/* Only valid when adding literals.  */
+-
+-  text_action *next;
+ };
+ 
+ struct removal_by_action_entry_struct
+@@ -5440,7 +5439,8 @@ typedef struct removal_by_action_map_struct removal_by_action_map;
+ /* List of all of the actions taken on a text section.  */
+ struct text_action_list_struct
+ {
+-  text_action *head;
++  unsigned count;
++  splay_tree tree;
+   removal_by_action_map map;
+ };
+ 
+@@ -5448,20 +5448,18 @@ struct text_action_list_struct
+ static text_action *
+ find_fill_action (text_action_list *l, asection *sec, bfd_vma offset)
+ {
+-  text_action **m_p;
++  text_action a;
+ 
+   /* It is not necessary to fill at the end of a section.  */
+   if (sec->size == offset)
+     return NULL;
+ 
+-  for (m_p = &l->head; *m_p && (*m_p)->offset <= offset; m_p = &(*m_p)->next)
+-    {
+-      text_action *t = *m_p;
+-      /* When the action is another fill at the same address,
+-	 just increase the size.  */
+-      if (t->offset == offset && t->action == ta_fill)
+-	return t;
+-    }
++  a.offset = offset;
++  a.action = ta_fill;
++
++  splay_tree_node node = splay_tree_lookup (l->tree, (splay_tree_key)&a);
++  if (node)
++    return (text_action *)node->value;
+   return NULL;
+ }
+ 
+@@ -5509,6 +5507,49 @@ adjust_fill_action (text_action *ta, int fill_diff)
+ }
+ 
+ 
++static int
++text_action_compare (splay_tree_key a, splay_tree_key b)
++{
++  text_action *pa = (text_action *)a;
++  text_action *pb = (text_action *)b;
++  static const int action_priority[] =
++    {
++      [ta_fill] = 0,
++      [ta_none] = 1,
++      [ta_convert_longcall] = 2,
++      [ta_narrow_insn] = 3,
++      [ta_remove_insn] = 4,
++      [ta_remove_longcall] = 5,
++      [ta_remove_literal] = 6,
++      [ta_widen_insn] = 7,
++      [ta_add_literal] = 8,
++    };
++
++  if (pa->offset == pb->offset)
++    {
++      if (pa->action == pb->action)
++	  return 0;
++      return action_priority[pa->action] - action_priority[pb->action];
++    }
++  else
++    return pa->offset < pb->offset ? -1 : 1;
++}
++
++static text_action *
++action_first (text_action_list *action_list)
++{
++  splay_tree_node node = splay_tree_min (action_list->tree);
++  return node ? (text_action *)node->value : NULL;
++}
++
++static text_action *
++action_next (text_action_list *action_list, text_action *action)
++{
++  splay_tree_node node = splay_tree_successor (action_list->tree,
++					       (splay_tree_key)action);
++  return node ? (text_action *)node->value : NULL;
++}
++
+ /* Add a modification action to the text.  For the case of adding or
+    removing space, modify any current fill and assume that
+    "unreachable_space" bytes can be freely contracted.  Note that a
+@@ -5521,8 +5562,8 @@ text_action_add (text_action_list *l,
+ 		 bfd_vma offset,
+ 		 int removed)
+ {
+-  text_action **m_p;
+   text_action *ta;
++  text_action a;
+ 
+   /* It is not necessary to fill at the end of a section.  */
+   if (action == ta_fill && sec->size == offset)
+@@ -5532,34 +5573,30 @@ text_action_add (text_action_list *l,
+   if (action == ta_fill && removed == 0)
+     return;
+ 
+-  for (m_p = &l->head; *m_p && (*m_p)->offset <= offset; m_p = &(*m_p)->next)
++  a.action = action;
++  a.offset = offset;
++
++  if (action == ta_fill)
+     {
+-      text_action *t = *m_p;
++      splay_tree_node node = splay_tree_lookup (l->tree, (splay_tree_key)&a);
+ 
+-      if (action == ta_fill)
++      if (node)
+ 	{
+-	  /* When the action is another fill at the same address,
+-	     just increase the size.  */
+-	  if (t->offset == offset && t->action == ta_fill)
+-	    {
+-	      t->removed_bytes += removed;
+-	      return;
+-	    }
+-	  /* Fills need to happen before widens so that we don't
+-	     insert fill bytes into the instruction stream.  */
+-	  if (t->offset == offset && t->action == ta_widen_insn)
+-	    break;
++	  ta = (text_action *)node->value;
++	  ta->removed_bytes += removed;
++	  return;
+ 	}
+     }
++  else
++    BFD_ASSERT (splay_tree_lookup (l->tree, (splay_tree_key)&a) == NULL);
+ 
+-  /* Create a new record and fill it up.  */
+   ta = (text_action *) bfd_zmalloc (sizeof (text_action));
+   ta->action = action;
+   ta->sec = sec;
+   ta->offset = offset;
+   ta->removed_bytes = removed;
+-  ta->next = (*m_p);
+-  *m_p = ta;
++  splay_tree_insert (l->tree, (splay_tree_key)ta, (splay_tree_value)ta);
++  ++l->count;
+ }
+ 
+ 
+@@ -5570,7 +5607,6 @@ text_action_add_literal (text_action_list *l,
+ 			 const literal_value *value,
+ 			 int removed)
+ {
+-  text_action **m_p;
+   text_action *ta;
+   asection *sec = r_reloc_get_section (loc);
+   bfd_vma offset = loc->target_offset;
+@@ -5578,14 +5614,6 @@ text_action_add_literal (text_action_list *l,
+ 
+   BFD_ASSERT (action == ta_add_literal);
+ 
+-  for (m_p = &l->head; *m_p != NULL; m_p = &(*m_p)->next)
+-    {
+-      if ((*m_p)->offset > offset
+-	  && ((*m_p)->offset != offset
+-	      || (*m_p)->virtual_offset > virtual_offset))
+-	break;
+-    }
+-
+   /* Create a new record and fill it up.  */
+   ta = (text_action *) bfd_zmalloc (sizeof (text_action));
+   ta->action = action;
+@@ -5594,8 +5622,10 @@ text_action_add_literal (text_action_list *l,
+   ta->virtual_offset = virtual_offset;
+   ta->value = *value;
+   ta->removed_bytes = removed;
+-  ta->next = (*m_p);
+-  *m_p = ta;
++
++  BFD_ASSERT (splay_tree_lookup (l->tree, (splay_tree_key)ta) == NULL);
++  splay_tree_insert (l->tree, (splay_tree_key)ta, (splay_tree_value)ta);
++  ++l->count;
+ }
+ 
+ 
+@@ -5606,7 +5636,8 @@ text_action_add_literal (text_action_list *l,
+    so that each search may begin where the previous one left off.  */
+ 
+ static int
+-removed_by_actions (text_action **p_start_action,
++removed_by_actions (text_action_list *action_list,
++		    text_action **p_start_action,
+ 		    bfd_vma offset,
+ 		    bfd_boolean before_fill)
+ {
+@@ -5614,6 +5645,13 @@ removed_by_actions (text_action **p_start_action,
+   int removed = 0;
+ 
+   r = *p_start_action;
++  if (r)
++    {
++      splay_tree_node node = splay_tree_lookup (action_list->tree,
++						(splay_tree_key)r);
++      BFD_ASSERT (node != NULL && r == (text_action *)node->value);
++    }
++
+   while (r)
+     {
+       if (r->offset > offset)
+@@ -5625,7 +5663,7 @@ removed_by_actions (text_action **p_start_action,
+ 
+       removed += r->removed_bytes;
+ 
+-      r = r->next;
++      r = action_next (action_list, r);
+     }
+ 
+   *p_start_action = r;
+@@ -5636,68 +5674,74 @@ removed_by_actions (text_action **p_start_action,
+ static bfd_vma
+ offset_with_removed_text (text_action_list *action_list, bfd_vma offset)
+ {
+-  text_action *r = action_list->head;
+-  return offset - removed_by_actions (&r, offset, FALSE);
++  text_action *r = action_first (action_list);
++
++  return offset - removed_by_actions (action_list, &r, offset, FALSE);
+ }
+ 
+ 
+ static unsigned
+ action_list_count (text_action_list *action_list)
+ {
+-  text_action *r = action_list->head;
+-  unsigned count = 0;
+-  for (r = action_list->head; r != NULL; r = r->next)
+-    {
+-      count++;
+-    }
+-  return count;
++  return action_list->count;
+ }
+ 
+-static void
+-map_removal_by_action (text_action_list *action_list)
++typedef struct map_action_fn_context_struct map_action_fn_context;
++struct map_action_fn_context_struct
+ {
+-  text_action *r;
+-  int removed = 0;
++  int removed;
+   removal_by_action_map map;
+   bfd_boolean eq_complete;
++};
+ 
+-  map.n_entries = 0;
+-  map.entry = bfd_malloc (action_list_count (action_list) *
+-			  sizeof (removal_by_action_entry));
+-  eq_complete = FALSE;
++static int
++map_action_fn (splay_tree_node node, void *p)
++{
++  map_action_fn_context *ctx = p;
++  text_action *r = (text_action *)node->value;
++  removal_by_action_entry *ientry = ctx->map.entry + ctx->map.n_entries;
+ 
+-  for (r = action_list->head; r;)
++  if (ctx->map.n_entries && (ientry - 1)->offset == r->offset)
+     {
+-      removal_by_action_entry *ientry = map.entry + map.n_entries;
++      --ientry;
++    }
++  else
++    {
++      ++ctx->map.n_entries;
++      ctx->eq_complete = FALSE;
++      ientry->offset = r->offset;
++      ientry->eq_removed_before_fill = ctx->removed;
++    }
+ 
+-      if (map.n_entries && (ientry - 1)->offset == r->offset)
++  if (!ctx->eq_complete)
++    {
++      if (r->action != ta_fill || r->removed_bytes >= 0)
+ 	{
+-	  --ientry;
++	  ientry->eq_removed = ctx->removed;
++	  ctx->eq_complete = TRUE;
+ 	}
+       else
+-	{
+-	  ++map.n_entries;
+-	  eq_complete = FALSE;
+-	  ientry->offset = r->offset;
+-	  ientry->eq_removed_before_fill = removed;
+-	}
++	ientry->eq_removed = ctx->removed + r->removed_bytes;
++    }
+ 
+-      if (!eq_complete)
+-	{
+-	  if (r->action != ta_fill || r->removed_bytes >= 0)
+-	    {
+-	      ientry->eq_removed = removed;
+-	      eq_complete = TRUE;
+-	    }
+-	  else
+-	    ientry->eq_removed = removed + r->removed_bytes;
+-	}
++  ctx->removed += r->removed_bytes;
++  ientry->removed = ctx->removed;
++  return 0;
++}
+ 
+-      removed += r->removed_bytes;
+-      ientry->removed = removed;
+-      r = r->next;
+-    }
+-  action_list->map = map;
++static void
++map_removal_by_action (text_action_list *action_list)
++{
++  map_action_fn_context ctx;
++
++  ctx.removed = 0;
++  ctx.map.n_entries = 0;
++  ctx.map.entry = bfd_malloc (action_list_count (action_list) *
++			      sizeof (removal_by_action_entry));
++  ctx.eq_complete = FALSE;
++
++  splay_tree_foreach (action_list->tree, map_action_fn, &ctx);
++  action_list->map = ctx.map;
+ }
+ 
+ static int
+@@ -5754,28 +5798,26 @@ offset_with_removed_text_map (text_action_list *action_list, bfd_vma offset)
+ static text_action *
+ find_insn_action (text_action_list *action_list, bfd_vma offset)
+ {
+-  text_action *t;
+-  for (t = action_list->head; t; t = t->next)
++  static const text_action_t action[] =
+     {
+-      if (t->offset == offset)
+-	{
+-	  switch (t->action)
+-	    {
+-	    case ta_none:
+-	    case ta_fill:
+-	      break;
+-	    case ta_remove_insn:
+-	    case ta_remove_longcall:
+-	    case ta_convert_longcall:
+-	    case ta_narrow_insn:
+-	    case ta_widen_insn:
+-	      return t;
+-	    case ta_remove_literal:
+-	    case ta_add_literal:
+-	      BFD_ASSERT (0);
+-	      break;
+-	    }
+-	}
++      ta_convert_longcall,
++      ta_remove_longcall,
++      ta_widen_insn,
++      ta_narrow_insn,
++      ta_remove_insn,
++    };
++  text_action a;
++  unsigned i;
++
++  a.offset = offset;
++  for (i = 0; i < sizeof (action) / sizeof (*action); ++i)
++    {
++      splay_tree_node node;
++
++      a.action = action[i];
++      node = splay_tree_lookup (action_list->tree, (splay_tree_key)&a);
++      if (node)
++	return (text_action *)node->value;
+     }
+   return NULL;
+ }
+@@ -5784,40 +5826,50 @@ find_insn_action (text_action_list *action_list, bfd_vma offset)
+ #if DEBUG
+ 
+ static void
+-print_action_list (FILE *fp, text_action_list *action_list)
++print_action (FILE *fp, text_action *r)
++{
++  const char *t = "unknown";
++  switch (r->action)
++    {
++    case ta_remove_insn:
++      t = "remove_insn"; break;
++    case ta_remove_longcall:
++      t = "remove_longcall"; break;
++    case ta_convert_longcall:
++      t = "convert_longcall"; break;
++    case ta_narrow_insn:
++      t = "narrow_insn"; break;
++    case ta_widen_insn:
++      t = "widen_insn"; break;
++    case ta_fill:
++      t = "fill"; break;
++    case ta_none:
++      t = "none"; break;
++    case ta_remove_literal:
++      t = "remove_literal"; break;
++    case ta_add_literal:
++      t = "add_literal"; break;
++    }
++
++  fprintf (fp, "%s: %s[0x%lx] \"%s\" %d\n",
++	   r->sec->owner->filename,
++	   r->sec->name, (unsigned long) r->offset, t, r->removed_bytes);
++}
++
++static int
++print_action_list_fn (splay_tree_node node, void *p)
+ {
+-  text_action *r;
++  text_action *r = (text_action *)node->value;
+ 
+-  fprintf (fp, "Text Action\n");
+-  for (r = action_list->head; r != NULL; r = r->next)
+-    {
+-      const char *t = "unknown";
+-      switch (r->action)
+-	{
+-	case ta_remove_insn:
+-	  t = "remove_insn"; break;
+-	case ta_remove_longcall:
+-	  t = "remove_longcall"; break;
+-	case ta_convert_longcall:
+-	  t = "convert_longcall"; break;
+-	case ta_narrow_insn:
+-	  t = "narrow_insn"; break;
+-	case ta_widen_insn:
+-	  t = "widen_insn"; break;
+-	case ta_fill:
+-	  t = "fill"; break;
+-	case ta_none:
+-	  t = "none"; break;
+-	case ta_remove_literal:
+-	  t = "remove_literal"; break;
+-	case ta_add_literal:
+-	  t = "add_literal"; break;
+-	}
++  print_action (p, r);
++  return 0;
++}
+ 
+-      fprintf (fp, "%s: %s[0x%lx] \"%s\" %d\n",
+-	       r->sec->owner->filename,
+-	       r->sec->name, (unsigned long) r->offset, t, r->removed_bytes);
+-    }
++static void
++print_action_list (FILE *fp, text_action_list *action_list)
++{
++  fprintf (fp, "Text Action\n");
++  splay_tree_foreach (action_list->tree, print_action_list_fn, fp);
+ }
+ 
+ #endif /* DEBUG */
+@@ -6071,8 +6123,8 @@ init_xtensa_relax_info (asection *sec)
+   relax_info->removed_list.head = NULL;
+   relax_info->removed_list.tail = NULL;
+ 
+-  relax_info->action_list.head = NULL;
+-
++  relax_info->action_list.tree = splay_tree_new (text_action_compare,
++						 NULL, NULL);
+   relax_info->action_list.map.n_entries = 0;
+   relax_info->action_list.map.entry = NULL;
+ 
+@@ -7762,7 +7814,7 @@ compute_text_actions (bfd *abfd,
+   free_reloc_range_list (&relevant_relocs);
+ 
+ #if DEBUG
+-  if (relax_info->action_list.head)
++  if (action_list_count (&relax_info->action_list))
+     print_action_list (stderr, &relax_info->action_list);
+ #endif
+ 
+@@ -8263,6 +8315,54 @@ xlate_offset_with_removed_text (const xlate_map_t *map,
+   return e->new_address - e->orig_address + offset;
+ }
+ 
++typedef struct xlate_map_context_struct xlate_map_context;
++struct xlate_map_context_struct
++{
++  xlate_map_t *map;
++  xlate_map_entry_t *current_entry;
++  int removed;
++};
++
++static int
++xlate_map_fn (splay_tree_node node, void *p)
++{
++  text_action *r = (text_action *)node->value;
++  xlate_map_context *ctx = p;
++  unsigned orig_size = 0;
++
++  switch (r->action)
++    {
++    case ta_none:
++    case ta_remove_insn:
++    case ta_convert_longcall:
++    case ta_remove_literal:
++    case ta_add_literal:
++      break;
++    case ta_remove_longcall:
++      orig_size = 6;
++      break;
++    case ta_narrow_insn:
++      orig_size = 3;
++      break;
++    case ta_widen_insn:
++      orig_size = 2;
++      break;
++    case ta_fill:
++      break;
++    }
++  ctx->current_entry->size =
++    r->offset + orig_size - ctx->current_entry->orig_address;
++  if (ctx->current_entry->size != 0)
++    {
++      ctx->current_entry++;
++      ctx->map->entry_count++;
++    }
++  ctx->current_entry->orig_address = r->offset + orig_size;
++  ctx->removed += r->removed_bytes;
++  ctx->current_entry->new_address = r->offset + orig_size - ctx->removed;
++  ctx->current_entry->size = 0;
++  return 0;
++}
+ 
+ /* Build a binary searchable offset translation map from a section's
+    action list.  */
+@@ -8270,75 +8370,40 @@ xlate_offset_with_removed_text (const xlate_map_t *map,
+ static xlate_map_t *
+ build_xlate_map (asection *sec, xtensa_relax_info *relax_info)
+ {
+-  xlate_map_t *map = (xlate_map_t *) bfd_malloc (sizeof (xlate_map_t));
+   text_action_list *action_list = &relax_info->action_list;
+   unsigned num_actions = 0;
+-  text_action *r;
+-  int removed;
+-  xlate_map_entry_t *current_entry;
++  xlate_map_context ctx;
+ 
+-  if (map == NULL)
++  ctx.map = (xlate_map_t *) bfd_malloc (sizeof (xlate_map_t));
++
++  if (ctx.map == NULL)
+     return NULL;
+ 
+   num_actions = action_list_count (action_list);
+-  map->entry = (xlate_map_entry_t *)
++  ctx.map->entry = (xlate_map_entry_t *)
+     bfd_malloc (sizeof (xlate_map_entry_t) * (num_actions + 1));
+-  if (map->entry == NULL)
++  if (ctx.map->entry == NULL)
+     {
+-      free (map);
++      free (ctx.map);
+       return NULL;
+     }
+-  map->entry_count = 0;
++  ctx.map->entry_count = 0;
+ 
+-  removed = 0;
+-  current_entry = &map->entry[0];
++  ctx.removed = 0;
++  ctx.current_entry = &ctx.map->entry[0];
+ 
+-  current_entry->orig_address = 0;
+-  current_entry->new_address = 0;
+-  current_entry->size = 0;
++  ctx.current_entry->orig_address = 0;
++  ctx.current_entry->new_address = 0;
++  ctx.current_entry->size = 0;
+ 
+-  for (r = action_list->head; r != NULL; r = r->next)
+-    {
+-      unsigned orig_size = 0;
+-      switch (r->action)
+-	{
+-	case ta_none:
+-	case ta_remove_insn:
+-	case ta_convert_longcall:
+-	case ta_remove_literal:
+-	case ta_add_literal:
+-	  break;
+-	case ta_remove_longcall:
+-	  orig_size = 6;
+-	  break;
+-	case ta_narrow_insn:
+-	  orig_size = 3;
+-	  break;
+-	case ta_widen_insn:
+-	  orig_size = 2;
+-	  break;
+-	case ta_fill:
+-	  break;
+-	}
+-      current_entry->size =
+-	r->offset + orig_size - current_entry->orig_address;
+-      if (current_entry->size != 0)
+-	{
+-	  current_entry++;
+-	  map->entry_count++;
+-	}
+-      current_entry->orig_address = r->offset + orig_size;
+-      removed += r->removed_bytes;
+-      current_entry->new_address = r->offset + orig_size - removed;
+-      current_entry->size = 0;
+-    }
++  splay_tree_foreach (action_list->tree, xlate_map_fn, &ctx);
+ 
+-  current_entry->size = (bfd_get_section_limit (sec->owner, sec)
+-			 - current_entry->orig_address);
+-  if (current_entry->size != 0)
+-    map->entry_count++;
++  ctx.current_entry->size = (bfd_get_section_limit (sec->owner, sec)
++			     - ctx.current_entry->orig_address);
++  if (ctx.current_entry->size != 0)
++    ctx.map->entry_count++;
+ 
+-  return map;
++  return ctx.map;
+ }
+ 
+ 
+@@ -9302,6 +9367,16 @@ move_shared_literal (asection *sec,
+ 
+ /* Second relaxation pass.  */
+ 
++static int
++action_remove_bytes_fn (splay_tree_node node, void *p)
++{
++  bfd_size_type *final_size = p;
++  text_action *action = (text_action *)node->value;
++
++  *final_size -= action->removed_bytes;
++  return 0;
++}
++
+ /* Modify all of the relocations to point to the right spot, and if this
+    is a relaxable section, delete the unwanted literals and fix the
+    section size.  */
+@@ -9334,7 +9409,7 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 
+   internal_relocs = retrieve_internal_relocs (abfd, sec,
+ 					      link_info->keep_memory);
+-  if (!internal_relocs && !relax_info->action_list.head)
++  if (!internal_relocs && !action_list_count (&relax_info->action_list))
+     return TRUE;
+ 
+   contents = retrieve_contents (abfd, sec, link_info->keep_memory);
+@@ -9412,6 +9487,12 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 			}
+ 		      /* Update the action so that the code that moves
+ 			 the contents will do the right thing.  */
++		      /* ta_remove_longcall and ta_remove_insn actions are
++		         grouped together in the tree as well as
++			 ta_convert_longcall and ta_none, so that changes below
++			 can be done w/o removing and reinserting action into
++			 the tree.  */
++
+ 		      if (action->action == ta_remove_longcall)
+ 			action->action = ta_remove_insn;
+ 		      else
+@@ -9584,13 +9665,12 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 
+   if ((relax_info->is_relaxable_literal_section
+        || relax_info->is_relaxable_asm_section)
+-      && relax_info->action_list.head)
++      && action_list_count (&relax_info->action_list))
+     {
+       /* Walk through the planned actions and build up a table
+ 	 of move, copy and fill records.  Use the move, copy and
+ 	 fill records to perform the actions once.  */
+ 
+-      int removed = 0;
+       bfd_size_type final_size, copy_size, orig_insn_size;
+       bfd_byte *scratch = NULL;
+       bfd_byte *dup_contents = NULL;
+@@ -9601,15 +9681,12 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+       bfd_vma orig_dot_vo = 0; /* Virtual offset from orig_dot.  */
+       bfd_vma dup_dot = 0;
+ 
+-      text_action *action = relax_info->action_list.head;
++      text_action *action;
+ 
+       final_size = sec->size;
+-      for (action = relax_info->action_list.head; action;
+-	   action = action->next)
+-	{
+-	  final_size -= action->removed_bytes;
+-	}
+ 
++      splay_tree_foreach (relax_info->action_list.tree,
++			  action_remove_bytes_fn, &final_size);
+       scratch = (bfd_byte *) bfd_zmalloc (final_size);
+       dup_contents = (bfd_byte *) bfd_zmalloc (final_size);
+ 
+@@ -9618,8 +9695,8 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+       print_action_list (stderr, &relax_info->action_list);
+ #endif
+ 
+-      for (action = relax_info->action_list.head; action;
+-	   action = action->next)
++      for (action = action_first (&relax_info->action_list); action;
++	   action = action_next (&relax_info->action_list, action))
+ 	{
+ 	  virtual_action = FALSE;
+ 	  if (action->offset > orig_dot)
+@@ -9748,7 +9825,6 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 	      break;
+ 	    }
+ 
+-	  removed += action->removed_bytes;
+ 	  BFD_ASSERT (dup_dot <= final_size);
+ 	  BFD_ASSERT (orig_dot <= orig_size);
+ 	}
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.25/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch b/package/binutils/2.25/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
new file mode 100644
index 0000000..8a21100
--- /dev/null
+++ b/package/binutils/2.25/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
@@ -0,0 +1,502 @@
+From 20c79baf82273a0b368587f761f152c4d3a593a4 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 27 Mar 2015 07:13:55 +0300
+Subject: [PATCH 1/4] xtensa: optimize check_section_ebb_pcrels_fit
+
+The original check_section_ebb_pcrels_fit algorithm checks that text
+actions proposed for current EBB are OK for every relocation in a
+section. There's no need to check every relocation, because text actions
+for EBB can only change size of that EBB, thus only affecting
+relocations that in any way cross that EBB. In addition EBBs are
+iterated in ascending order of their VMA, making it easier to track
+relevant relocations.
+
+Introduce a structure that can track relocations that cross the range of
+VMAs of EBB and use it to only check relocations relevant to current EBB
+in check_section_ebb_pcrels_fit.
+It takes O(N log N) operations to build it and O(N) operations to move
+current EBB VMA window through its entire range, where N is the number
+of relocations in a section. The resulting complexity of
+compute_text_actions is thus reduced from O(N^2) to O(N log N + N * M),
+where M is the average number of relocations crossing each EBB.
+
+Original profile:
+
+% time    self  children    called     name
+-----------------------------------------
+         44.26   71.53    6429/6429        compute_text_actions
+  50.2   44.26   71.53    6429         check_section_ebb_pcrels_fit
+          1.16   20.12 347506666/347576152     pcrel_reloc_fits
+          2.95   16.52 347506666/348104944     get_relocation_opnd
+          2.01    9.74 347575100/361252208     r_reloc_init
+          0.55    7.53 347575100/363381467     r_reloc_get_section
+          5.76    0.02 695013332/695013332     xlate_offset_with_removed_text
+          0.68    3.89 347575100/363483827     bfd_octets_per_byte
+          0.32    0.00 347506666/349910253     is_alt_relocation
+          0.18    0.11    6391/6391        build_xlate_map
+          0.00    0.00    6429/19417168     get_xtensa_relax_info
+          0.00    0.00    6391/6391        free_xlate_map
+-----------------------------------------
+
+Same data, after optimization:
+
+% time    self  children    called     name
+-----------------------------------------
+          2.56    3.08    6429/6429        compute_text_actions
+   8.2    2.56    3.08    6429         check_section_ebb_pcrels_fit
+          0.08    0.91 17721075/17790561     pcrel_reloc_fits
+          0.17    0.47 17721075/31685977     r_reloc_init
+          0.43    0.00 35442150/35442150     xlate_offset_with_removed_text
+          0.02    0.37 17721075/33815236     r_reloc_get_section
+          0.22    0.11    6391/6391        build_xlate_map
+          0.05    0.22 17721075/33917596     bfd_octets_per_byte
+          0.03    0.00 17721075/20405299     is_alt_relocation
+          0.01    0.00    6429/6429        reloc_range_list_update_range
+          0.00    0.00    6429/19417168     get_xtensa_relax_info
+          0.00    0.00    6391/6391        free_xlate_map
+-----------------------------------------
+
+2015-04-01  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (reloc_range_list, reloc_range_list_entry,
+	reloc_range): new typedef.
+	(reloc_range_list_struct, reloc_range_list_entry_struct,
+	reloc_range_struct): new structures.
+	(reloc_range_compare, build_reloc_ranges,
+	reloc_range_list_append, reloc_range_list_remove,
+	reloc_range_list_update_range, free_reloc_range_list): new
+	functions.
+	(compute_text_actions): precompute relocation opcodes before the
+	loop. Add relevant_relocs variable, initialize it before the
+	loop, pass it to the check_section_ebb_pcrels_fit.
+	(check_section_ebb_pcrels_fit): add new parameter:
+	relevant_relocs. Update address range in the relevant_relocs if
+	it's non-NULL and iterate only over relevant relocations.
+
+Backported from: b2b326d246f839ee218192ac88da2384d929a072
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 321 +++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 298 insertions(+), 23 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 0b6f584..872370b 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -6619,8 +6619,10 @@ static bfd_boolean compute_text_actions
+   (bfd *, asection *, struct bfd_link_info *);
+ static bfd_boolean compute_ebb_proposed_actions (ebb_constraint *);
+ static bfd_boolean compute_ebb_actions (ebb_constraint *);
++typedef struct reloc_range_list_struct reloc_range_list;
+ static bfd_boolean check_section_ebb_pcrels_fit
+-  (bfd *, asection *, bfd_byte *, Elf_Internal_Rela *, const ebb_constraint *,
++  (bfd *, asection *, bfd_byte *, Elf_Internal_Rela *,
++   reloc_range_list *, const ebb_constraint *,
+    const xtensa_opcode *);
+ static bfd_boolean check_section_ebb_reduces (const ebb_constraint *);
+ static void text_action_add_proposed
+@@ -7219,6 +7221,221 @@ build_reloc_opcodes (bfd *abfd,
+   return reloc_opcodes;
+ }
+ 
++struct reloc_range_struct
++{
++  bfd_vma addr;
++  bfd_boolean add; /* TRUE if start of a range, FALSE otherwise.  */
++  /* Original irel index in the array of relocations for a section.  */
++  unsigned irel_index;
++};
++typedef struct reloc_range_struct reloc_range;
++
++typedef struct reloc_range_list_entry_struct reloc_range_list_entry;
++struct reloc_range_list_entry_struct
++{
++  reloc_range_list_entry *next;
++  reloc_range_list_entry *prev;
++  Elf_Internal_Rela *irel;
++  xtensa_opcode opcode;
++  int opnum;
++};
++
++struct reloc_range_list_struct
++{
++  /* The rest of the structure is only meaningful when ok is TRUE.  */
++  bfd_boolean ok;
++
++  unsigned n_range; /* Number of range markers.  */
++  reloc_range *range; /* Sorted range markers.  */
++
++  unsigned first; /* Index of a first range element in the list.  */
++  unsigned last; /* One past index of a last range element in the list.  */
++
++  unsigned n_list; /* Number of list elements.  */
++  reloc_range_list_entry *reloc; /*  */
++  reloc_range_list_entry list_root;
++};
++
++static int
++reloc_range_compare (const void *a, const void *b)
++{
++  const reloc_range *ra = a;
++  const reloc_range *rb = b;
++
++  if (ra->addr != rb->addr)
++    return ra->addr < rb->addr ? -1 : 1;
++  if (ra->add != rb->add)
++    return ra->add ? -1 : 1;
++  return 0;
++}
++
++static void
++build_reloc_ranges (bfd *abfd, asection *sec,
++		    bfd_byte *contents,
++		    Elf_Internal_Rela *internal_relocs,
++		    xtensa_opcode *reloc_opcodes,
++		    reloc_range_list *list)
++{
++  unsigned i;
++  size_t n = 0;
++  size_t max_n = 0;
++  reloc_range *ranges = NULL;
++  reloc_range_list_entry *reloc =
++    bfd_malloc (sec->reloc_count * sizeof (*reloc));
++
++  memset (list, 0, sizeof (*list));
++  list->ok = TRUE;
++
++  for (i = 0; i < sec->reloc_count; i++)
++    {
++      Elf_Internal_Rela *irel = &internal_relocs[i];
++      int r_type = ELF32_R_TYPE (irel->r_info);
++      reloc_howto_type *howto = &elf_howto_table[r_type];
++      r_reloc r_rel;
++
++      if (r_type == R_XTENSA_ASM_SIMPLIFY
++	  || r_type == R_XTENSA_32_PCREL
++	  || !howto->pc_relative)
++	continue;
++
++      r_reloc_init (&r_rel, abfd, irel, contents,
++		    bfd_get_section_limit (abfd, sec));
++
++      if (r_reloc_get_section (&r_rel) != sec)
++	continue;
++
++      if (n + 2 > max_n)
++	{
++	  max_n = (max_n + 2) * 2;
++	  ranges = bfd_realloc (ranges, max_n * sizeof (*ranges));
++	}
++
++      ranges[n].addr = irel->r_offset;
++      ranges[n + 1].addr = r_rel.target_offset;
++
++      ranges[n].add = ranges[n].addr < ranges[n + 1].addr;
++      ranges[n + 1].add = !ranges[n].add;
++
++      ranges[n].irel_index = i;
++      ranges[n + 1].irel_index = i;
++
++      n += 2;
++
++      reloc[i].irel = irel;
++
++      /* Every relocation won't possibly be checked in the optimized version of
++         check_section_ebb_pcrels_fit, so this needs to be done here.  */
++      if (is_alt_relocation (ELF32_R_TYPE (irel->r_info)))
++	{
++	  /* None of the current alternate relocs are PC-relative,
++	     and only PC-relative relocs matter here.  */
++	}
++      else
++	{
++	  xtensa_opcode opcode;
++	  int opnum;
++
++	  if (reloc_opcodes)
++	    opcode = reloc_opcodes[i];
++	  else
++	    opcode = get_relocation_opcode (abfd, sec, contents, irel);
++
++	  if (opcode == XTENSA_UNDEFINED)
++	    {
++	      list->ok = FALSE;
++	      break;
++	    }
++
++	  opnum = get_relocation_opnd (opcode, ELF32_R_TYPE (irel->r_info));
++	  if (opnum == XTENSA_UNDEFINED)
++	    {
++	      list->ok = FALSE;
++	      break;
++	    }
++
++	  /* Record relocation opcode and opnum as we've calculated them
++	     anyway and they won't change.  */
++	  reloc[i].opcode = opcode;
++	  reloc[i].opnum = opnum;
++	}
++    }
++
++  if (list->ok)
++    {
++      ranges = bfd_realloc (ranges, n * sizeof (*ranges));
++      qsort (ranges, n, sizeof (*ranges), reloc_range_compare);
++
++      list->n_range = n;
++      list->range = ranges;
++      list->reloc = reloc;
++      list->list_root.prev = &list->list_root;
++      list->list_root.next = &list->list_root;
++    }
++  else
++    {
++      free (ranges);
++      free (reloc);
++    }
++}
++
++static void reloc_range_list_append (reloc_range_list *list,
++				     unsigned irel_index)
++{
++  reloc_range_list_entry *entry = list->reloc + irel_index;
++
++  entry->prev = list->list_root.prev;
++  entry->next = &list->list_root;
++  entry->prev->next = entry;
++  entry->next->prev = entry;
++  ++list->n_list;
++}
++
++static void reloc_range_list_remove (reloc_range_list *list,
++				     unsigned irel_index)
++{
++  reloc_range_list_entry *entry = list->reloc + irel_index;
++
++  entry->next->prev = entry->prev;
++  entry->prev->next = entry->next;
++  --list->n_list;
++}
++
++/* Update relocation list object so that it lists all relocations that cross
++   [first; last] range.  Range bounds should not decrease with successive
++   invocations.  */
++static void reloc_range_list_update_range (reloc_range_list *list,
++					   bfd_vma first, bfd_vma last)
++{
++  /* This should not happen: EBBs are iterated from lower addresses to higher.
++     But even if that happens there's no need to break: just flush current list
++     and start from scratch.  */
++  if ((list->last > 0 && list->range[list->last - 1].addr > last) ||
++      (list->first > 0 && list->range[list->first - 1].addr >= first))
++    {
++      list->first = 0;
++      list->last = 0;
++      list->n_list = 0;
++      list->list_root.next = &list->list_root;
++      list->list_root.prev = &list->list_root;
++      fprintf (stderr, "%s: move backwards requested\n", __func__);
++    }
++
++  for (; list->last < list->n_range &&
++       list->range[list->last].addr <= last; ++list->last)
++    if (list->range[list->last].add)
++      reloc_range_list_append (list, list->range[list->last].irel_index);
++
++  for (; list->first < list->n_range &&
++       list->range[list->first].addr < first; ++list->first)
++    if (!list->range[list->first].add)
++      reloc_range_list_remove (list, list->range[list->first].irel_index);
++}
++
++static void free_reloc_range_list (reloc_range_list *list)
++{
++  free (list->range);
++  free (list->reloc);
++}
+ 
+ /* The compute_text_actions function will build a list of potential
+    transformation actions for code in the extended basic block of each
+@@ -7245,6 +7462,7 @@ compute_text_actions (bfd *abfd,
+   property_table_entry *prop_table = 0;
+   int ptblsize = 0;
+   bfd_size_type sec_size;
++  reloc_range_list relevant_relocs;
+ 
+   relax_info = get_xtensa_relax_info (sec);
+   BFD_ASSERT (relax_info);
+@@ -7277,6 +7495,12 @@ compute_text_actions (bfd *abfd,
+       goto error_return;
+     }
+ 
++  /* Precompute the opcode for each relocation.  */
++  reloc_opcodes = build_reloc_opcodes (abfd, sec, contents, internal_relocs);
++
++  build_reloc_ranges (abfd, sec, contents, internal_relocs, reloc_opcodes,
++		      &relevant_relocs);
++
+   for (i = 0; i < sec->reloc_count; i++)
+     {
+       Elf_Internal_Rela *irel = &internal_relocs[i];
+@@ -7340,17 +7564,13 @@ compute_text_actions (bfd *abfd,
+       ebb->start_reloc_idx = i;
+       ebb->end_reloc_idx = i;
+ 
+-      /* Precompute the opcode for each relocation.  */
+-      if (reloc_opcodes == NULL)
+-	reloc_opcodes = build_reloc_opcodes (abfd, sec, contents,
+-					     internal_relocs);
+-
+       if (!extend_ebb_bounds (ebb)
+ 	  || !compute_ebb_proposed_actions (&ebb_table)
+ 	  || !compute_ebb_actions (&ebb_table)
+ 	  || !check_section_ebb_pcrels_fit (abfd, sec, contents,
+-					    internal_relocs, &ebb_table,
+-					    reloc_opcodes)
++					    internal_relocs,
++					    &relevant_relocs,
++					    &ebb_table, reloc_opcodes)
+ 	  || !check_section_ebb_reduces (&ebb_table))
+ 	{
+ 	  /* If anything goes wrong or we get unlucky and something does
+@@ -7372,6 +7592,8 @@ compute_text_actions (bfd *abfd,
+       free_ebb_constraint (&ebb_table);
+     }
+ 
++  free_reloc_range_list (&relevant_relocs);
++
+ #if DEBUG
+   if (relax_info->action_list.head)
+     print_action_list (stderr, &relax_info->action_list);
+@@ -7974,14 +8196,17 @@ check_section_ebb_pcrels_fit (bfd *abfd,
+ 			      asection *sec,
+ 			      bfd_byte *contents,
+ 			      Elf_Internal_Rela *internal_relocs,
++			      reloc_range_list *relevant_relocs,
+ 			      const ebb_constraint *constraint,
+ 			      const xtensa_opcode *reloc_opcodes)
+ {
+   unsigned i, j;
++  unsigned n = sec->reloc_count;
+   Elf_Internal_Rela *irel;
+   xlate_map_t *xmap = NULL;
+   bfd_boolean ok = TRUE;
+   xtensa_relax_info *relax_info;
++  reloc_range_list_entry *entry = NULL;
+ 
+   relax_info = get_xtensa_relax_info (sec);
+ 
+@@ -7992,7 +8217,40 @@ check_section_ebb_pcrels_fit (bfd *abfd,
+ 	 can still be used.  */
+     }
+ 
+-  for (i = 0; i < sec->reloc_count; i++)
++  if (relevant_relocs && constraint->action_count)
++    {
++      if (!relevant_relocs->ok)
++	{
++	  ok = FALSE;
++	  n = 0;
++	}
++      else
++	{
++	  bfd_vma min_offset, max_offset;
++	  min_offset = max_offset = constraint->actions[0].offset;
++
++	  for (i = 1; i < constraint->action_count; ++i)
++	    {
++	      proposed_action *action = &constraint->actions[i];
++	      bfd_vma offset = action->offset;
++
++	      if (offset < min_offset)
++		min_offset = offset;
++	      if (offset > max_offset)
++		max_offset = offset;
++	    }
++	  reloc_range_list_update_range (relevant_relocs, min_offset,
++					 max_offset);
++	  n = relevant_relocs->n_list;
++	  entry = &relevant_relocs->list_root;
++	}
++    }
++  else
++    {
++      relevant_relocs = NULL;
++    }
++
++  for (i = 0; i < n; i++)
+     {
+       r_reloc r_rel;
+       bfd_vma orig_self_offset, orig_target_offset;
+@@ -8001,7 +8259,15 @@ check_section_ebb_pcrels_fit (bfd *abfd,
+       reloc_howto_type *howto;
+       int self_removed_bytes, target_removed_bytes;
+ 
+-      irel = &internal_relocs[i];
++      if (relevant_relocs)
++	{
++	  entry = entry->next;
++	  irel = entry->irel;
++	}
++      else
++	{
++	  irel = internal_relocs + i;
++	}
+       r_type = ELF32_R_TYPE (irel->r_info);
+ 
+       howto = &elf_howto_table[r_type];
+@@ -8067,21 +8333,30 @@ check_section_ebb_pcrels_fit (bfd *abfd,
+ 	  xtensa_opcode opcode;
+ 	  int opnum;
+ 
+-	  if (reloc_opcodes)
+-	    opcode = reloc_opcodes[i];
+-	  else
+-	    opcode = get_relocation_opcode (abfd, sec, contents, irel);
+-	  if (opcode == XTENSA_UNDEFINED)
++	  if (relevant_relocs)
+ 	    {
+-	      ok = FALSE;
+-	      break;
++	      opcode = entry->opcode;
++	      opnum = entry->opnum;
+ 	    }
+-
+-	  opnum = get_relocation_opnd (opcode, ELF32_R_TYPE (irel->r_info));
+-	  if (opnum == XTENSA_UNDEFINED)
++	  else
+ 	    {
+-	      ok = FALSE;
+-	      break;
++	      if (reloc_opcodes)
++		opcode = reloc_opcodes[relevant_relocs ?
++		  (unsigned)(entry - relevant_relocs->reloc) : i];
++	      else
++		opcode = get_relocation_opcode (abfd, sec, contents, irel);
++	      if (opcode == XTENSA_UNDEFINED)
++		{
++		  ok = FALSE;
++		  break;
++		}
++
++	      opnum = get_relocation_opnd (opcode, ELF32_R_TYPE (irel->r_info));
++	      if (opnum == XTENSA_UNDEFINED)
++		{
++		  ok = FALSE;
++		  break;
++		}
+ 	    }
+ 
+ 	  if (!pcrel_reloc_fits (opcode, opnum, self_offset, target_offset))
+@@ -8778,7 +9053,7 @@ move_shared_literal (asection *sec,
+   /* Check all of the PC-relative relocations to make sure they still fit.  */
+   relocs_fit = check_section_ebb_pcrels_fit (target_sec->owner, target_sec,
+ 					     target_sec_cache->contents,
+-					     target_sec_cache->relocs,
++					     target_sec_cache->relocs, NULL,
+ 					     &ebb_table, NULL);
+ 
+   if (!relocs_fit)
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.25/907-xtensa-optimize-removed_by_actions.patch b/package/binutils/2.25/907-xtensa-optimize-removed_by_actions.patch
new file mode 100644
index 0000000..9df8065
--- /dev/null
+++ b/package/binutils/2.25/907-xtensa-optimize-removed_by_actions.patch
@@ -0,0 +1,356 @@
+From 3e3f60207399ab29dd55af109e5ae9facc7d8e83 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 28 Mar 2015 08:46:28 +0300
+Subject: [PATCH 2/4] xtensa: optimize removed_by_actions
+
+The function removed_by_actions iterates through text actions to
+calculate an offset applied by text actions to a given VMA. Although it
+has a parameter p_start_action that allows for incremental offset
+calculation, in many places it's used with p_start_action explicitly set
+to the first action. After the first relaxation pass when the list of
+text actions is finalized, an array of offsets sorted by VMA may be used
+to speed up this function.
+
+Original profile:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.35    0.00   33872/4808961     relax_section_symbols
+          3.32    0.00  326022/4808961     relax_property_section
+         12.83    0.00 1259379/4808961     offset_with_removed_text
+         32.50    0.00 3189688/4808961     translate_reloc
+  71.5   49.00    0.00 4808961         removed_by_actions
+-----------------------------------------
+
+Same data, after optimization:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.00    0.00   33872/4808537     relax_section_symbols
+          0.01    0.00  326022/4808537     relax_property_section
+          0.05    0.00 1258955/4808537     offset_with_removed_text_map
+          0.13    0.00 3189688/4808537     translate_reloc
+   1.0    0.20    0.00 4808537         removed_by_actions_map
+          0.00    0.00     120/120         map_removal_by_action
+-----------------------------------------
+
+2015-04-01  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (removal_by_action_entry_struct,
+	removal_by_action_map_struct): new structures.
+	(removal_by_action_entry, removal_by_action_map): new typedefs.
+	(text_action_list_struct): add new field: map.
+	(map_removal_by_action, removed_by_actions_map,
+	offset_with_removed_text_map): new functions.
+	(relax_section): replace offset_with_removed_text with
+	offset_with_removed_text_map.
+	(translate_reloc, relax_property_section, relax_section_symbols):
+	replace removed_by_actions with removed_by_actions_map.
+
+Backported from: 071aa5c98a31c966f5fbfc573fcee61350fd1936
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 181 +++++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 156 insertions(+), 25 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 872370b..21b2871 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -5420,11 +5420,28 @@ struct text_action_struct
+   text_action *next;
+ };
+ 
++struct removal_by_action_entry_struct
++{
++  bfd_vma offset;
++  int removed;
++  int eq_removed;
++  int eq_removed_before_fill;
++};
++typedef struct removal_by_action_entry_struct removal_by_action_entry;
++
++struct removal_by_action_map_struct
++{
++  unsigned n_entries;
++  removal_by_action_entry *entry;
++};
++typedef struct removal_by_action_map_struct removal_by_action_map;
++
+ 
+ /* List of all of the actions taken on a text section.  */
+ struct text_action_list_struct
+ {
+   text_action *head;
++  removal_by_action_map map;
+ };
+ 
+ 
+@@ -5636,6 +5653,101 @@ action_list_count (text_action_list *action_list)
+   return count;
+ }
+ 
++static void
++map_removal_by_action (text_action_list *action_list)
++{
++  text_action *r;
++  int removed = 0;
++  removal_by_action_map map;
++  bfd_boolean eq_complete;
++
++  map.n_entries = 0;
++  map.entry = bfd_malloc (action_list_count (action_list) *
++			  sizeof (removal_by_action_entry));
++  eq_complete = FALSE;
++
++  for (r = action_list->head; r;)
++    {
++      removal_by_action_entry *ientry = map.entry + map.n_entries;
++
++      if (map.n_entries && (ientry - 1)->offset == r->offset)
++	{
++	  --ientry;
++	}
++      else
++	{
++	  ++map.n_entries;
++	  eq_complete = FALSE;
++	  ientry->offset = r->offset;
++	  ientry->eq_removed_before_fill = removed;
++	}
++
++      if (!eq_complete)
++	{
++	  if (r->action != ta_fill || r->removed_bytes >= 0)
++	    {
++	      ientry->eq_removed = removed;
++	      eq_complete = TRUE;
++	    }
++	  else
++	    ientry->eq_removed = removed + r->removed_bytes;
++	}
++
++      removed += r->removed_bytes;
++      ientry->removed = removed;
++      r = r->next;
++    }
++  action_list->map = map;
++}
++
++static int
++removed_by_actions_map (text_action_list *action_list, bfd_vma offset,
++			bfd_boolean before_fill)
++{
++  unsigned a, b;
++
++  if (!action_list->map.entry)
++    map_removal_by_action (action_list);
++
++  if (!action_list->map.n_entries)
++    return 0;
++
++  a = 0;
++  b = action_list->map.n_entries;
++
++  while (b - a > 1)
++    {
++      unsigned c = (a + b) / 2;
++
++      if (action_list->map.entry[c].offset <= offset)
++	a = c;
++      else
++	b = c;
++    }
++
++  if (action_list->map.entry[a].offset < offset)
++    {
++      return action_list->map.entry[a].removed;
++    }
++  else if (action_list->map.entry[a].offset == offset)
++    {
++      return before_fill ?
++	action_list->map.entry[a].eq_removed_before_fill :
++	action_list->map.entry[a].eq_removed;
++    }
++  else
++    {
++      return 0;
++    }
++}
++
++static bfd_vma
++offset_with_removed_text_map (text_action_list *action_list, bfd_vma offset)
++{
++  int removed = removed_by_actions_map (action_list, offset, FALSE);
++  return offset - removed;
++}
++
+ 
+ /* The find_insn_action routine will only find non-fill actions.  */
+ 
+@@ -5909,6 +6021,9 @@ init_xtensa_relax_info (asection *sec)
+ 
+   relax_info->action_list.head = NULL;
+ 
++  relax_info->action_list.map.n_entries = 0;
++  relax_info->action_list.map.entry = NULL;
++
+   relax_info->fix_list = NULL;
+   relax_info->fix_array = NULL;
+   relax_info->fix_array_count = 0;
+@@ -9218,7 +9333,7 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		  if (elf_hash_table (link_info)->dynamic_sections_created)
+ 		    shrink_dynamic_reloc_sections (link_info, abfd, sec, irel);
+ 		  irel->r_info = ELF32_R_INFO (0, R_XTENSA_NONE);
+-		  irel->r_offset = offset_with_removed_text
++		  irel->r_offset = offset_with_removed_text_map
+ 		    (&relax_info->action_list, irel->r_offset);
+ 		  continue;
+ 		}
+@@ -9255,7 +9370,7 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		    }
+ 		}
+ 
+-	      source_offset = offset_with_removed_text
++	      source_offset = offset_with_removed_text_map
+ 		(&relax_info->action_list, irel->r_offset);
+ 	      irel->r_offset = source_offset;
+ 	    }
+@@ -9352,7 +9467,7 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		      break;
+ 		    }
+ 
+-		  new_end_offset = offset_with_removed_text
++		  new_end_offset = offset_with_removed_text_map
+ 		    (&target_relax_info->action_list,
+ 		     r_rel.target_offset + diff_value);
+ 		  diff_value = new_end_offset - new_reloc.target_offset;
+@@ -9750,7 +9865,6 @@ translate_reloc (const r_reloc *orig_rel, r_reloc *new_rel, asection *sec)
+   xtensa_relax_info *relax_info;
+   removed_literal *removed;
+   bfd_vma target_offset, base_offset;
+-  text_action *act;
+ 
+   *new_rel = *orig_rel;
+ 
+@@ -9803,19 +9917,26 @@ translate_reloc (const r_reloc *orig_rel, r_reloc *new_rel, asection *sec)
+      offset.  */
+ 
+   base_offset = r_reloc_get_target_offset (new_rel) - new_rel->rela.r_addend;
+-  act = relax_info->action_list.head;
+   if (base_offset <= target_offset)
+     {
+-      int base_removed = removed_by_actions (&act, base_offset, FALSE);
+-      int addend_removed = removed_by_actions (&act, target_offset, FALSE);
++      int base_removed = removed_by_actions_map (&relax_info->action_list,
++						 base_offset, FALSE);
++      int addend_removed = removed_by_actions_map (&relax_info->action_list,
++						   target_offset, FALSE) -
++	base_removed;
++
+       new_rel->target_offset = target_offset - base_removed - addend_removed;
+       new_rel->rela.r_addend -= addend_removed;
+     }
+   else
+     {
+       /* Handle a negative addend.  The base offset comes first.  */
+-      int tgt_removed = removed_by_actions (&act, target_offset, FALSE);
+-      int addend_removed = removed_by_actions (&act, base_offset, FALSE);
++      int tgt_removed = removed_by_actions_map (&relax_info->action_list,
++						target_offset, FALSE);
++      int addend_removed = removed_by_actions_map (&relax_info->action_list,
++						   base_offset, FALSE) -
++	tgt_removed;
++
+       new_rel->target_offset = target_offset - tgt_removed;
+       new_rel->rela.r_addend += addend_removed;
+     }
+@@ -10138,9 +10259,10 @@ relax_property_section (bfd *abfd,
+ 	      bfd_vma old_offset = val.r_rel.target_offset;
+ 	      bfd_vma new_offset;
+ 	      long old_size, new_size;
+-	      text_action *act = target_relax_info->action_list.head;
+-	      new_offset = old_offset -
+-		removed_by_actions (&act, old_offset, FALSE);
++	      int removed_by_old_offset =
++		removed_by_actions_map (&target_relax_info->action_list,
++					old_offset, FALSE);
++	      new_offset = old_offset - removed_by_old_offset;
+ 
+ 	      /* Assert that we are not out of bounds.  */
+ 	      old_size = bfd_get_32 (abfd, size_p);
+@@ -10164,9 +10286,10 @@ relax_property_section (bfd *abfd,
+ 
+ 		      /* Recompute the new_offset, but this time don't
+ 			 include any fill inserted by relaxation.  */
+-		      act = target_relax_info->action_list.head;
+-		      new_offset = old_offset -
+-			removed_by_actions (&act, old_offset, TRUE);
++		      removed_by_old_offset =
++			removed_by_actions_map (&target_relax_info->action_list,
++						old_offset, TRUE);
++		      new_offset = old_offset - removed_by_old_offset;
+ 
+ 		      /* If it is not unreachable and we have not yet
+ 			 seen an unreachable at this address, place it
+@@ -10182,8 +10305,12 @@ relax_property_section (bfd *abfd,
+ 		    }
+ 		}
+ 	      else
+-		new_size -=
+-		    removed_by_actions (&act, old_offset + old_size, TRUE);
++		{
++		  int removed_by_old_offset_size =
++		    removed_by_actions_map (&target_relax_info->action_list,
++					    old_offset + old_size, TRUE);
++		  new_size -= removed_by_old_offset_size - removed_by_old_offset;
++		}
+ 
+ 	      if (new_size != old_size)
+ 		{
+@@ -10441,14 +10568,16 @@ relax_section_symbols (bfd *abfd, asection *sec)
+ 
+       if (isym->st_shndx == sec_shndx)
+ 	{
+-	  text_action *act = relax_info->action_list.head;
+ 	  bfd_vma orig_addr = isym->st_value;
++	  int removed = removed_by_actions_map (&relax_info->action_list,
++						orig_addr, FALSE);
+ 
+-	  isym->st_value -= removed_by_actions (&act, orig_addr, FALSE);
+-
++	  isym->st_value -= removed;
+ 	  if (ELF32_ST_TYPE (isym->st_info) == STT_FUNC)
+ 	    isym->st_size -=
+-	      removed_by_actions (&act, orig_addr + isym->st_size, FALSE);
++	      removed_by_actions_map (&relax_info->action_list,
++				      orig_addr + isym->st_size, FALSE) -
++	      removed;
+ 	}
+     }
+ 
+@@ -10466,15 +10595,17 @@ relax_section_symbols (bfd *abfd, asection *sec)
+ 	   || sym_hash->root.type == bfd_link_hash_defweak)
+ 	  && sym_hash->root.u.def.section == sec)
+ 	{
+-	  text_action *act = relax_info->action_list.head;
+ 	  bfd_vma orig_addr = sym_hash->root.u.def.value;
++	  int removed = removed_by_actions_map (&relax_info->action_list,
++						orig_addr, FALSE);
+ 
+-	  sym_hash->root.u.def.value -=
+-	    removed_by_actions (&act, orig_addr, FALSE);
++	  sym_hash->root.u.def.value -= removed;
+ 
+ 	  if (sym_hash->type == STT_FUNC)
+ 	    sym_hash->size -=
+-	      removed_by_actions (&act, orig_addr + sym_hash->size, FALSE);
++	      removed_by_actions_map (&relax_info->action_list,
++				      orig_addr + sym_hash->size, FALSE) -
++	      removed;
+ 	}
+     }
+ 
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.25/908-xtensa-optimize-find_removed_literal.patch b/package/binutils/2.25/908-xtensa-optimize-find_removed_literal.patch
new file mode 100644
index 0000000..96d526f
--- /dev/null
+++ b/package/binutils/2.25/908-xtensa-optimize-find_removed_literal.patch
@@ -0,0 +1,146 @@
+From 288c2b709e5e6841484e1a129eaccd299db36877 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 4 Apr 2015 14:49:42 +0300
+Subject: [PATCH 3/4] xtensa: optimize find_removed_literal
+
+find_removed_literal uses linear search to find removed literal by its
+VMA. The list of literals is fixed at that point, build an ordered index
+array and use binary search instead.
+
+Original profile:
+
+% time    self  children    called     name
+-----------------------------------------
+         56.72    0.00  297578/669392      translate_reloc
+         70.86    0.00  371814/669392      relax_section
+  67.9  127.58    0.00  669392         find_removed_literal
+-----------------------------------------
+
+Same data, after optimization:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.00    0.00  297578/669392      translate_reloc
+          0.00    0.00  371814/669392      relax_section
+   0.0    0.00    0.00  669392         find_removed_literal
+          0.00    0.00   23838/23838       map_removed_literal
+-----------------------------------------
+
+2015-04-03  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (removed_literal_map_entry): new typedef.
+	(removed_literal_map_entry_struct): new structure.
+	(removed_literal_list_struct): add new fields: n_map and map.
+	(map_removed_literal, removed_literal_compare): new functions.
+	(find_removed_literal): build index array for literals ordered
+	by VMA, use binary search to find removed literal.
+
+Backported from: 3439c466273378021821473d3fc84990e089ae34
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 58 insertions(+), 6 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 21b2871..51733ad 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -5832,6 +5832,7 @@ print_action_list (FILE *fp, text_action_list *action_list)
+    by the "from" offset field.  */
+ 
+ typedef struct removed_literal_struct removed_literal;
++typedef struct removed_literal_map_entry_struct removed_literal_map_entry;
+ typedef struct removed_literal_list_struct removed_literal_list;
+ 
+ struct removed_literal_struct
+@@ -5841,10 +5842,19 @@ struct removed_literal_struct
+   removed_literal *next;
+ };
+ 
++struct removed_literal_map_entry_struct
++{
++  bfd_vma addr;
++  removed_literal *literal;
++};
++
+ struct removed_literal_list_struct
+ {
+   removed_literal *head;
+   removed_literal *tail;
++
++  unsigned n_map;
++  removed_literal_map_entry *map;
+ };
+ 
+ 
+@@ -5893,6 +5903,39 @@ add_removed_literal (removed_literal_list *removed_list,
+     }
+ }
+ 
++static void
++map_removed_literal (removed_literal_list *removed_list)
++{
++  unsigned n_map = 0;
++  unsigned i;
++  removed_literal_map_entry *map = NULL;
++  removed_literal *r = removed_list->head;
++
++  for (i = 0; r; ++i, r = r->next)
++    {
++      if (i == n_map)
++	{
++	  n_map = (n_map * 2) + 2;
++	  map = bfd_realloc (map, n_map * sizeof (*map));
++	}
++      map[i].addr = r->from.target_offset;
++      map[i].literal = r;
++    }
++  removed_list->map = map;
++  removed_list->n_map = i;
++}
++
++static int
++removed_literal_compare (const void *a, const void *b)
++{
++  const removed_literal_map_entry *pa = a;
++  const removed_literal_map_entry *pb = b;
++
++  if (pa->addr == pb->addr)
++    return 0;
++  else
++    return pa->addr < pb->addr ? -1 : 1;
++}
+ 
+ /* Check if the list of removed literals contains an entry for the
+    given address.  Return the entry if found.  */
+@@ -5900,12 +5943,21 @@ add_removed_literal (removed_literal_list *removed_list,
+ static removed_literal *
+ find_removed_literal (removed_literal_list *removed_list, bfd_vma addr)
+ {
+-  removed_literal *r = removed_list->head;
+-  while (r && r->from.target_offset < addr)
+-    r = r->next;
+-  if (r && r->from.target_offset == addr)
+-    return r;
+-  return NULL;
++  removed_literal_map_entry *p;
++  removed_literal *r = NULL;
++
++  if (removed_list->map == NULL)
++    map_removed_literal (removed_list);
++
++  p = bsearch (&addr, removed_list->map, removed_list->n_map,
++	       sizeof (*removed_list->map), removed_literal_compare);
++  if (p)
++    {
++      while (p != removed_list->map && (p - 1)->addr == addr)
++	--p;
++      r = p->literal;
++    }
++  return r;
+ }
+ 
+ 
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.25/909-xtensa-replace-action-list-with-splay-tree.patch b/package/binutils/2.25/909-xtensa-replace-action-list-with-splay-tree.patch
new file mode 100644
index 0000000..3090cc2
--- /dev/null
+++ b/package/binutils/2.25/909-xtensa-replace-action-list-with-splay-tree.patch
@@ -0,0 +1,826 @@
+From e5409aedd3ee2192855018a564650ffb75c26e60 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 5 Apr 2015 17:04:22 +0300
+Subject: [PATCH 4/4] xtensa: replace action list with splay tree
+
+text_action_add uses linear list search to order text actions list by
+action VMA. The list is used at the first relaxation pass, when it's not
+fixed yet.
+Replace the list with splay tree from libiberty.
+
+Original profile:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.00    0.00      14/158225      compute_text_actions
+          3.62    0.00   25211/158225      remove_dead_literal
+          8.42    0.00   58645/158225      coalesce_shared_literal
+         10.68    0.00   74355/158225      text_action_add_proposed
+  38.8   22.73    0.00  158225         text_action_add
+          0.00    0.00  144527/293246      bfd_zmalloc
+-----------------------------------------
+
+Same data, after optimization:
+
+% time    self  children    called     name
+-----------------------------------------
+          0.00    0.00      14/158225      compute_text_actions
+          0.00    0.00   25211/158225      remove_dead_literal
+          0.00    0.01   58645/158225      coalesce_shared_literal
+          0.00    0.01   74355/158225      text_action_add_proposed
+   0.1    0.00    0.02  158225         text_action_add
+          0.01    0.00  144527/144527      splay_tree_insert
+          0.00    0.00  144527/195130      splay_tree_lookup
+          0.00    0.00  144527/293246      bfd_zmalloc
+-----------------------------------------
+
+2015-04-03  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (splay-tree.h): include header.
+	(text_action_struct): drop next pointer.
+	(text_action_list_struct): drop head pointer, add count and
+	tree fields.
+	(find_fill_action): instead of linear search in text_action_list
+	search in the tree.
+	(text_action_compare, action_first, action_next): new functions.
+	(text_action_add, text_action_add_literal): instead of linear
+	search and insertion insert new node into the tree.
+	(removed_by_actions): pass additional parameter: action_list,
+	use it to traverse the tree.
+	(offset_with_removed_text): pass additional action_list parameter
+	to removed_by_actions.
+	(map_action_fn_context): new typedef.
+	(map_action_fn_context_struct): new structure.
+	(map_action_fn): new function.
+	(map_removal_by_action): use splay_tree_foreach to build map.
+	(find_insn_action): replace linear search in text_action_list
+	with series of splay_tree_lookups.
+	(print_action, print_action_list_fn): new functions.
+	(print_action_list): use splay_tree_foreach.
+	(init_xtensa_relax_info): drop action_list.head initialization.
+	Initialize the tree.
+	(compute_text_actions): use non-zero action_list_count instead of
+	non-NULL action list.
+	(xlate_map_context): new typedef.
+	(xlate_map_context_struct): new structure.
+	(xlate_map_fn): new function.
+	(build_xlate_map): use splay_tree_foreach to build map.
+	(action_remove_bytes_fn): new function.
+	(relax_section): use zero action_list_count instead of NULL
+	action list. Use splay_tree_foreach to count final section size.
+	Drop unused variable 'removed'.
+
+Backported from: 4c2af04fe8b4452bf51d2debf1bb467fafcd0f08
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 488 +++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 282 insertions(+), 206 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 51733ad..53af1c6 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -28,6 +28,7 @@
+ #include "libbfd.h"
+ #include "elf-bfd.h"
+ #include "elf/xtensa.h"
++#include "splay-tree.h"
+ #include "xtensa-isa.h"
+ #include "xtensa-config.h"
+ 
+@@ -5416,8 +5417,6 @@ struct text_action_struct
+   bfd_vma virtual_offset;  /* Zero except for adding literals.  */
+   int removed_bytes;
+   literal_value value;	/* Only valid when adding literals.  */
+-
+-  text_action *next;
+ };
+ 
+ struct removal_by_action_entry_struct
+@@ -5440,7 +5439,8 @@ typedef struct removal_by_action_map_struct removal_by_action_map;
+ /* List of all of the actions taken on a text section.  */
+ struct text_action_list_struct
+ {
+-  text_action *head;
++  unsigned count;
++  splay_tree tree;
+   removal_by_action_map map;
+ };
+ 
+@@ -5448,20 +5448,18 @@ struct text_action_list_struct
+ static text_action *
+ find_fill_action (text_action_list *l, asection *sec, bfd_vma offset)
+ {
+-  text_action **m_p;
++  text_action a;
+ 
+   /* It is not necessary to fill at the end of a section.  */
+   if (sec->size == offset)
+     return NULL;
+ 
+-  for (m_p = &l->head; *m_p && (*m_p)->offset <= offset; m_p = &(*m_p)->next)
+-    {
+-      text_action *t = *m_p;
+-      /* When the action is another fill at the same address,
+-	 just increase the size.  */
+-      if (t->offset == offset && t->action == ta_fill)
+-	return t;
+-    }
++  a.offset = offset;
++  a.action = ta_fill;
++
++  splay_tree_node node = splay_tree_lookup (l->tree, (splay_tree_key)&a);
++  if (node)
++    return (text_action *)node->value;
+   return NULL;
+ }
+ 
+@@ -5509,6 +5507,49 @@ adjust_fill_action (text_action *ta, int fill_diff)
+ }
+ 
+ 
++static int
++text_action_compare (splay_tree_key a, splay_tree_key b)
++{
++  text_action *pa = (text_action *)a;
++  text_action *pb = (text_action *)b;
++  static const int action_priority[] =
++    {
++      [ta_fill] = 0,
++      [ta_none] = 1,
++      [ta_convert_longcall] = 2,
++      [ta_narrow_insn] = 3,
++      [ta_remove_insn] = 4,
++      [ta_remove_longcall] = 5,
++      [ta_remove_literal] = 6,
++      [ta_widen_insn] = 7,
++      [ta_add_literal] = 8,
++    };
++
++  if (pa->offset == pb->offset)
++    {
++      if (pa->action == pb->action)
++	  return 0;
++      return action_priority[pa->action] - action_priority[pb->action];
++    }
++  else
++    return pa->offset < pb->offset ? -1 : 1;
++}
++
++static text_action *
++action_first (text_action_list *action_list)
++{
++  splay_tree_node node = splay_tree_min (action_list->tree);
++  return node ? (text_action *)node->value : NULL;
++}
++
++static text_action *
++action_next (text_action_list *action_list, text_action *action)
++{
++  splay_tree_node node = splay_tree_successor (action_list->tree,
++					       (splay_tree_key)action);
++  return node ? (text_action *)node->value : NULL;
++}
++
+ /* Add a modification action to the text.  For the case of adding or
+    removing space, modify any current fill and assume that
+    "unreachable_space" bytes can be freely contracted.  Note that a
+@@ -5521,8 +5562,8 @@ text_action_add (text_action_list *l,
+ 		 bfd_vma offset,
+ 		 int removed)
+ {
+-  text_action **m_p;
+   text_action *ta;
++  text_action a;
+ 
+   /* It is not necessary to fill at the end of a section.  */
+   if (action == ta_fill && sec->size == offset)
+@@ -5532,34 +5573,30 @@ text_action_add (text_action_list *l,
+   if (action == ta_fill && removed == 0)
+     return;
+ 
+-  for (m_p = &l->head; *m_p && (*m_p)->offset <= offset; m_p = &(*m_p)->next)
++  a.action = action;
++  a.offset = offset;
++
++  if (action == ta_fill)
+     {
+-      text_action *t = *m_p;
++      splay_tree_node node = splay_tree_lookup (l->tree, (splay_tree_key)&a);
+ 
+-      if (action == ta_fill)
++      if (node)
+ 	{
+-	  /* When the action is another fill at the same address,
+-	     just increase the size.  */
+-	  if (t->offset == offset && t->action == ta_fill)
+-	    {
+-	      t->removed_bytes += removed;
+-	      return;
+-	    }
+-	  /* Fills need to happen before widens so that we don't
+-	     insert fill bytes into the instruction stream.  */
+-	  if (t->offset == offset && t->action == ta_widen_insn)
+-	    break;
++	  ta = (text_action *)node->value;
++	  ta->removed_bytes += removed;
++	  return;
+ 	}
+     }
++  else
++    BFD_ASSERT (splay_tree_lookup (l->tree, (splay_tree_key)&a) == NULL);
+ 
+-  /* Create a new record and fill it up.  */
+   ta = (text_action *) bfd_zmalloc (sizeof (text_action));
+   ta->action = action;
+   ta->sec = sec;
+   ta->offset = offset;
+   ta->removed_bytes = removed;
+-  ta->next = (*m_p);
+-  *m_p = ta;
++  splay_tree_insert (l->tree, (splay_tree_key)ta, (splay_tree_value)ta);
++  ++l->count;
+ }
+ 
+ 
+@@ -5570,7 +5607,6 @@ text_action_add_literal (text_action_list *l,
+ 			 const literal_value *value,
+ 			 int removed)
+ {
+-  text_action **m_p;
+   text_action *ta;
+   asection *sec = r_reloc_get_section (loc);
+   bfd_vma offset = loc->target_offset;
+@@ -5578,14 +5614,6 @@ text_action_add_literal (text_action_list *l,
+ 
+   BFD_ASSERT (action == ta_add_literal);
+ 
+-  for (m_p = &l->head; *m_p != NULL; m_p = &(*m_p)->next)
+-    {
+-      if ((*m_p)->offset > offset
+-	  && ((*m_p)->offset != offset
+-	      || (*m_p)->virtual_offset > virtual_offset))
+-	break;
+-    }
+-
+   /* Create a new record and fill it up.  */
+   ta = (text_action *) bfd_zmalloc (sizeof (text_action));
+   ta->action = action;
+@@ -5594,8 +5622,10 @@ text_action_add_literal (text_action_list *l,
+   ta->virtual_offset = virtual_offset;
+   ta->value = *value;
+   ta->removed_bytes = removed;
+-  ta->next = (*m_p);
+-  *m_p = ta;
++
++  BFD_ASSERT (splay_tree_lookup (l->tree, (splay_tree_key)ta) == NULL);
++  splay_tree_insert (l->tree, (splay_tree_key)ta, (splay_tree_value)ta);
++  ++l->count;
+ }
+ 
+ 
+@@ -5606,7 +5636,8 @@ text_action_add_literal (text_action_list *l,
+    so that each search may begin where the previous one left off.  */
+ 
+ static int
+-removed_by_actions (text_action **p_start_action,
++removed_by_actions (text_action_list *action_list,
++		    text_action **p_start_action,
+ 		    bfd_vma offset,
+ 		    bfd_boolean before_fill)
+ {
+@@ -5614,6 +5645,13 @@ removed_by_actions (text_action **p_start_action,
+   int removed = 0;
+ 
+   r = *p_start_action;
++  if (r)
++    {
++      splay_tree_node node = splay_tree_lookup (action_list->tree,
++						(splay_tree_key)r);
++      BFD_ASSERT (node != NULL && r == (text_action *)node->value);
++    }
++
+   while (r)
+     {
+       if (r->offset > offset)
+@@ -5625,7 +5663,7 @@ removed_by_actions (text_action **p_start_action,
+ 
+       removed += r->removed_bytes;
+ 
+-      r = r->next;
++      r = action_next (action_list, r);
+     }
+ 
+   *p_start_action = r;
+@@ -5636,68 +5674,74 @@ removed_by_actions (text_action **p_start_action,
+ static bfd_vma
+ offset_with_removed_text (text_action_list *action_list, bfd_vma offset)
+ {
+-  text_action *r = action_list->head;
+-  return offset - removed_by_actions (&r, offset, FALSE);
++  text_action *r = action_first (action_list);
++
++  return offset - removed_by_actions (action_list, &r, offset, FALSE);
+ }
+ 
+ 
+ static unsigned
+ action_list_count (text_action_list *action_list)
+ {
+-  text_action *r = action_list->head;
+-  unsigned count = 0;
+-  for (r = action_list->head; r != NULL; r = r->next)
+-    {
+-      count++;
+-    }
+-  return count;
++  return action_list->count;
+ }
+ 
+-static void
+-map_removal_by_action (text_action_list *action_list)
++typedef struct map_action_fn_context_struct map_action_fn_context;
++struct map_action_fn_context_struct
+ {
+-  text_action *r;
+-  int removed = 0;
++  int removed;
+   removal_by_action_map map;
+   bfd_boolean eq_complete;
++};
+ 
+-  map.n_entries = 0;
+-  map.entry = bfd_malloc (action_list_count (action_list) *
+-			  sizeof (removal_by_action_entry));
+-  eq_complete = FALSE;
++static int
++map_action_fn (splay_tree_node node, void *p)
++{
++  map_action_fn_context *ctx = p;
++  text_action *r = (text_action *)node->value;
++  removal_by_action_entry *ientry = ctx->map.entry + ctx->map.n_entries;
+ 
+-  for (r = action_list->head; r;)
++  if (ctx->map.n_entries && (ientry - 1)->offset == r->offset)
+     {
+-      removal_by_action_entry *ientry = map.entry + map.n_entries;
++      --ientry;
++    }
++  else
++    {
++      ++ctx->map.n_entries;
++      ctx->eq_complete = FALSE;
++      ientry->offset = r->offset;
++      ientry->eq_removed_before_fill = ctx->removed;
++    }
+ 
+-      if (map.n_entries && (ientry - 1)->offset == r->offset)
++  if (!ctx->eq_complete)
++    {
++      if (r->action != ta_fill || r->removed_bytes >= 0)
+ 	{
+-	  --ientry;
++	  ientry->eq_removed = ctx->removed;
++	  ctx->eq_complete = TRUE;
+ 	}
+       else
+-	{
+-	  ++map.n_entries;
+-	  eq_complete = FALSE;
+-	  ientry->offset = r->offset;
+-	  ientry->eq_removed_before_fill = removed;
+-	}
++	ientry->eq_removed = ctx->removed + r->removed_bytes;
++    }
+ 
+-      if (!eq_complete)
+-	{
+-	  if (r->action != ta_fill || r->removed_bytes >= 0)
+-	    {
+-	      ientry->eq_removed = removed;
+-	      eq_complete = TRUE;
+-	    }
+-	  else
+-	    ientry->eq_removed = removed + r->removed_bytes;
+-	}
++  ctx->removed += r->removed_bytes;
++  ientry->removed = ctx->removed;
++  return 0;
++}
+ 
+-      removed += r->removed_bytes;
+-      ientry->removed = removed;
+-      r = r->next;
+-    }
+-  action_list->map = map;
++static void
++map_removal_by_action (text_action_list *action_list)
++{
++  map_action_fn_context ctx;
++
++  ctx.removed = 0;
++  ctx.map.n_entries = 0;
++  ctx.map.entry = bfd_malloc (action_list_count (action_list) *
++			      sizeof (removal_by_action_entry));
++  ctx.eq_complete = FALSE;
++
++  splay_tree_foreach (action_list->tree, map_action_fn, &ctx);
++  action_list->map = ctx.map;
+ }
+ 
+ static int
+@@ -5754,28 +5798,26 @@ offset_with_removed_text_map (text_action_list *action_list, bfd_vma offset)
+ static text_action *
+ find_insn_action (text_action_list *action_list, bfd_vma offset)
+ {
+-  text_action *t;
+-  for (t = action_list->head; t; t = t->next)
++  static const text_action_t action[] =
+     {
+-      if (t->offset == offset)
+-	{
+-	  switch (t->action)
+-	    {
+-	    case ta_none:
+-	    case ta_fill:
+-	      break;
+-	    case ta_remove_insn:
+-	    case ta_remove_longcall:
+-	    case ta_convert_longcall:
+-	    case ta_narrow_insn:
+-	    case ta_widen_insn:
+-	      return t;
+-	    case ta_remove_literal:
+-	    case ta_add_literal:
+-	      BFD_ASSERT (0);
+-	      break;
+-	    }
+-	}
++      ta_convert_longcall,
++      ta_remove_longcall,
++      ta_widen_insn,
++      ta_narrow_insn,
++      ta_remove_insn,
++    };
++  text_action a;
++  unsigned i;
++
++  a.offset = offset;
++  for (i = 0; i < sizeof (action) / sizeof (*action); ++i)
++    {
++      splay_tree_node node;
++
++      a.action = action[i];
++      node = splay_tree_lookup (action_list->tree, (splay_tree_key)&a);
++      if (node)
++	return (text_action *)node->value;
+     }
+   return NULL;
+ }
+@@ -5784,40 +5826,50 @@ find_insn_action (text_action_list *action_list, bfd_vma offset)
+ #if DEBUG
+ 
+ static void
+-print_action_list (FILE *fp, text_action_list *action_list)
++print_action (FILE *fp, text_action *r)
++{
++  const char *t = "unknown";
++  switch (r->action)
++    {
++    case ta_remove_insn:
++      t = "remove_insn"; break;
++    case ta_remove_longcall:
++      t = "remove_longcall"; break;
++    case ta_convert_longcall:
++      t = "convert_longcall"; break;
++    case ta_narrow_insn:
++      t = "narrow_insn"; break;
++    case ta_widen_insn:
++      t = "widen_insn"; break;
++    case ta_fill:
++      t = "fill"; break;
++    case ta_none:
++      t = "none"; break;
++    case ta_remove_literal:
++      t = "remove_literal"; break;
++    case ta_add_literal:
++      t = "add_literal"; break;
++    }
++
++  fprintf (fp, "%s: %s[0x%lx] \"%s\" %d\n",
++	   r->sec->owner->filename,
++	   r->sec->name, (unsigned long) r->offset, t, r->removed_bytes);
++}
++
++static int
++print_action_list_fn (splay_tree_node node, void *p)
+ {
+-  text_action *r;
++  text_action *r = (text_action *)node->value;
+ 
+-  fprintf (fp, "Text Action\n");
+-  for (r = action_list->head; r != NULL; r = r->next)
+-    {
+-      const char *t = "unknown";
+-      switch (r->action)
+-	{
+-	case ta_remove_insn:
+-	  t = "remove_insn"; break;
+-	case ta_remove_longcall:
+-	  t = "remove_longcall"; break;
+-	case ta_convert_longcall:
+-	  t = "convert_longcall"; break;
+-	case ta_narrow_insn:
+-	  t = "narrow_insn"; break;
+-	case ta_widen_insn:
+-	  t = "widen_insn"; break;
+-	case ta_fill:
+-	  t = "fill"; break;
+-	case ta_none:
+-	  t = "none"; break;
+-	case ta_remove_literal:
+-	  t = "remove_literal"; break;
+-	case ta_add_literal:
+-	  t = "add_literal"; break;
+-	}
++  print_action (p, r);
++  return 0;
++}
+ 
+-      fprintf (fp, "%s: %s[0x%lx] \"%s\" %d\n",
+-	       r->sec->owner->filename,
+-	       r->sec->name, (unsigned long) r->offset, t, r->removed_bytes);
+-    }
++static void
++print_action_list (FILE *fp, text_action_list *action_list)
++{
++  fprintf (fp, "Text Action\n");
++  splay_tree_foreach (action_list->tree, print_action_list_fn, fp);
+ }
+ 
+ #endif /* DEBUG */
+@@ -6071,8 +6123,8 @@ init_xtensa_relax_info (asection *sec)
+   relax_info->removed_list.head = NULL;
+   relax_info->removed_list.tail = NULL;
+ 
+-  relax_info->action_list.head = NULL;
+-
++  relax_info->action_list.tree = splay_tree_new (text_action_compare,
++						 NULL, NULL);
+   relax_info->action_list.map.n_entries = 0;
+   relax_info->action_list.map.entry = NULL;
+ 
+@@ -7762,7 +7814,7 @@ compute_text_actions (bfd *abfd,
+   free_reloc_range_list (&relevant_relocs);
+ 
+ #if DEBUG
+-  if (relax_info->action_list.head)
++  if (action_list_count (&relax_info->action_list))
+     print_action_list (stderr, &relax_info->action_list);
+ #endif
+ 
+@@ -8263,6 +8315,54 @@ xlate_offset_with_removed_text (const xlate_map_t *map,
+   return e->new_address - e->orig_address + offset;
+ }
+ 
++typedef struct xlate_map_context_struct xlate_map_context;
++struct xlate_map_context_struct
++{
++  xlate_map_t *map;
++  xlate_map_entry_t *current_entry;
++  int removed;
++};
++
++static int
++xlate_map_fn (splay_tree_node node, void *p)
++{
++  text_action *r = (text_action *)node->value;
++  xlate_map_context *ctx = p;
++  unsigned orig_size = 0;
++
++  switch (r->action)
++    {
++    case ta_none:
++    case ta_remove_insn:
++    case ta_convert_longcall:
++    case ta_remove_literal:
++    case ta_add_literal:
++      break;
++    case ta_remove_longcall:
++      orig_size = 6;
++      break;
++    case ta_narrow_insn:
++      orig_size = 3;
++      break;
++    case ta_widen_insn:
++      orig_size = 2;
++      break;
++    case ta_fill:
++      break;
++    }
++  ctx->current_entry->size =
++    r->offset + orig_size - ctx->current_entry->orig_address;
++  if (ctx->current_entry->size != 0)
++    {
++      ctx->current_entry++;
++      ctx->map->entry_count++;
++    }
++  ctx->current_entry->orig_address = r->offset + orig_size;
++  ctx->removed += r->removed_bytes;
++  ctx->current_entry->new_address = r->offset + orig_size - ctx->removed;
++  ctx->current_entry->size = 0;
++  return 0;
++}
+ 
+ /* Build a binary searchable offset translation map from a section's
+    action list.  */
+@@ -8270,75 +8370,40 @@ xlate_offset_with_removed_text (const xlate_map_t *map,
+ static xlate_map_t *
+ build_xlate_map (asection *sec, xtensa_relax_info *relax_info)
+ {
+-  xlate_map_t *map = (xlate_map_t *) bfd_malloc (sizeof (xlate_map_t));
+   text_action_list *action_list = &relax_info->action_list;
+   unsigned num_actions = 0;
+-  text_action *r;
+-  int removed;
+-  xlate_map_entry_t *current_entry;
++  xlate_map_context ctx;
+ 
+-  if (map == NULL)
++  ctx.map = (xlate_map_t *) bfd_malloc (sizeof (xlate_map_t));
++
++  if (ctx.map == NULL)
+     return NULL;
+ 
+   num_actions = action_list_count (action_list);
+-  map->entry = (xlate_map_entry_t *)
++  ctx.map->entry = (xlate_map_entry_t *)
+     bfd_malloc (sizeof (xlate_map_entry_t) * (num_actions + 1));
+-  if (map->entry == NULL)
++  if (ctx.map->entry == NULL)
+     {
+-      free (map);
++      free (ctx.map);
+       return NULL;
+     }
+-  map->entry_count = 0;
++  ctx.map->entry_count = 0;
+ 
+-  removed = 0;
+-  current_entry = &map->entry[0];
++  ctx.removed = 0;
++  ctx.current_entry = &ctx.map->entry[0];
+ 
+-  current_entry->orig_address = 0;
+-  current_entry->new_address = 0;
+-  current_entry->size = 0;
++  ctx.current_entry->orig_address = 0;
++  ctx.current_entry->new_address = 0;
++  ctx.current_entry->size = 0;
+ 
+-  for (r = action_list->head; r != NULL; r = r->next)
+-    {
+-      unsigned orig_size = 0;
+-      switch (r->action)
+-	{
+-	case ta_none:
+-	case ta_remove_insn:
+-	case ta_convert_longcall:
+-	case ta_remove_literal:
+-	case ta_add_literal:
+-	  break;
+-	case ta_remove_longcall:
+-	  orig_size = 6;
+-	  break;
+-	case ta_narrow_insn:
+-	  orig_size = 3;
+-	  break;
+-	case ta_widen_insn:
+-	  orig_size = 2;
+-	  break;
+-	case ta_fill:
+-	  break;
+-	}
+-      current_entry->size =
+-	r->offset + orig_size - current_entry->orig_address;
+-      if (current_entry->size != 0)
+-	{
+-	  current_entry++;
+-	  map->entry_count++;
+-	}
+-      current_entry->orig_address = r->offset + orig_size;
+-      removed += r->removed_bytes;
+-      current_entry->new_address = r->offset + orig_size - removed;
+-      current_entry->size = 0;
+-    }
++  splay_tree_foreach (action_list->tree, xlate_map_fn, &ctx);
+ 
+-  current_entry->size = (bfd_get_section_limit (sec->owner, sec)
+-			 - current_entry->orig_address);
+-  if (current_entry->size != 0)
+-    map->entry_count++;
++  ctx.current_entry->size = (bfd_get_section_limit (sec->owner, sec)
++			     - ctx.current_entry->orig_address);
++  if (ctx.current_entry->size != 0)
++    ctx.map->entry_count++;
+ 
+-  return map;
++  return ctx.map;
+ }
+ 
+ 
+@@ -9302,6 +9367,16 @@ move_shared_literal (asection *sec,
+ 
+ /* Second relaxation pass.  */
+ 
++static int
++action_remove_bytes_fn (splay_tree_node node, void *p)
++{
++  bfd_size_type *final_size = p;
++  text_action *action = (text_action *)node->value;
++
++  *final_size -= action->removed_bytes;
++  return 0;
++}
++
+ /* Modify all of the relocations to point to the right spot, and if this
+    is a relaxable section, delete the unwanted literals and fix the
+    section size.  */
+@@ -9334,7 +9409,7 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 
+   internal_relocs = retrieve_internal_relocs (abfd, sec,
+ 					      link_info->keep_memory);
+-  if (!internal_relocs && !relax_info->action_list.head)
++  if (!internal_relocs && !action_list_count (&relax_info->action_list))
+     return TRUE;
+ 
+   contents = retrieve_contents (abfd, sec, link_info->keep_memory);
+@@ -9412,6 +9487,12 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 			}
+ 		      /* Update the action so that the code that moves
+ 			 the contents will do the right thing.  */
++		      /* ta_remove_longcall and ta_remove_insn actions are
++		         grouped together in the tree as well as
++			 ta_convert_longcall and ta_none, so that changes below
++			 can be done w/o removing and reinserting action into
++			 the tree.  */
++
+ 		      if (action->action == ta_remove_longcall)
+ 			action->action = ta_remove_insn;
+ 		      else
+@@ -9584,13 +9665,12 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 
+   if ((relax_info->is_relaxable_literal_section
+        || relax_info->is_relaxable_asm_section)
+-      && relax_info->action_list.head)
++      && action_list_count (&relax_info->action_list))
+     {
+       /* Walk through the planned actions and build up a table
+ 	 of move, copy and fill records.  Use the move, copy and
+ 	 fill records to perform the actions once.  */
+ 
+-      int removed = 0;
+       bfd_size_type final_size, copy_size, orig_insn_size;
+       bfd_byte *scratch = NULL;
+       bfd_byte *dup_contents = NULL;
+@@ -9601,15 +9681,12 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+       bfd_vma orig_dot_vo = 0; /* Virtual offset from orig_dot.  */
+       bfd_vma dup_dot = 0;
+ 
+-      text_action *action = relax_info->action_list.head;
++      text_action *action;
+ 
+       final_size = sec->size;
+-      for (action = relax_info->action_list.head; action;
+-	   action = action->next)
+-	{
+-	  final_size -= action->removed_bytes;
+-	}
+ 
++      splay_tree_foreach (relax_info->action_list.tree,
++			  action_remove_bytes_fn, &final_size);
+       scratch = (bfd_byte *) bfd_zmalloc (final_size);
+       dup_contents = (bfd_byte *) bfd_zmalloc (final_size);
+ 
+@@ -9618,8 +9695,8 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+       print_action_list (stderr, &relax_info->action_list);
+ #endif
+ 
+-      for (action = relax_info->action_list.head; action;
+-	   action = action->next)
++      for (action = action_first (&relax_info->action_list); action;
++	   action = action_next (&relax_info->action_list, action))
+ 	{
+ 	  virtual_action = FALSE;
+ 	  if (action->offset > orig_dot)
+@@ -9748,7 +9825,6 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 	      break;
+ 	    }
+ 
+-	  removed += action->removed_bytes;
+ 	  BFD_ASSERT (dup_dot <= final_size);
+ 	  BFD_ASSERT (orig_dot <= orig_size);
+ 	}
+-- 
+1.8.1.4
+
-- 
1.8.1.4
