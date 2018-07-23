From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 23 Jul 2018 12:37:53 -0700
Subject: [Buildroot] [PATCH] package/binutils: fix xtensa linker relaxation
 regression in 2.31.1
Message-ID: <20180723193753.15922-1-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the following xtensa ld error observed when building uClibc-ng
libthread_db with binutils-2.31:

  BFD (GNU Binutils) 2.31 internal error, aborting at
  elf32-xtensa.c:3269 in elf_xtensa_finish_dynamic_sections

Fixes: https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82264912
Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...relaxation-of-undefined-weak-references-i.patch | 48 ++++++++++++
 ...-dynamic-relocations-sections-consistency.patch | 90 ++++++++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 package/binutils/2.31.1/0010-xtensa-fix-relaxation-of-undefined-weak-references-i.patch
 create mode 100644 package/binutils/2.31.1/0011-xtensa-move-dynamic-relocations-sections-consistency.patch

diff --git a/package/binutils/2.31.1/0010-xtensa-fix-relaxation-of-undefined-weak-references-i.patch b/package/binutils/2.31.1/0010-xtensa-fix-relaxation-of-undefined-weak-references-i.patch
new file mode 100644
index 000000000000..660d30c38925
--- /dev/null
+++ b/package/binutils/2.31.1/0010-xtensa-fix-relaxation-of-undefined-weak-references-i.patch
@@ -0,0 +1,48 @@
+From 5d3a462f05cba5b0c0c96de899b84fb84155c760 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 22 Jul 2018 13:52:28 -0700
+Subject: [PATCH] xtensa: fix relaxation of undefined weak references in
+ shared objects
+
+The change c451bb34ae8b ("xtensa: don't emit dynamic relocation for weak
+undefined symbol") didn't properly handle shrinking of relocation
+sections due to coalescing of references to a dynamic undefined weak
+symbol in a shared object, which resulted in the following assertion
+failure in ld when linking uClibc-ng libthread_db for xtensa:
+
+  BFD (GNU Binutils) 2.31 internal error, aborting at elf32-xtensa.c:3269
+  in elf_xtensa_finish_dynamic_sections
+
+Shrink dynamic relocations section for dynamic undefined weak symbols
+when linking a shared object.
+
+bfd/
+2018-07-23  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* elf32-xtensa.c (shrink_dynamic_reloc_sections): Shrink dynamic
+	relocations section for dynamic undefined weak symbols when
+	linking a shared object.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: 5d3a462f05cba5b0c0c96de899b84fb84155c760
+---
+ bfd/elf32-xtensa.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index f7f569d0c086..a4b046e445f1 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -10022,7 +10022,8 @@ shrink_dynamic_reloc_sections (struct bfd_link_info *info,
+   if ((r_type == R_XTENSA_32 || r_type == R_XTENSA_PLT)
+       && (input_section->flags & SEC_ALLOC) != 0
+       && (dynamic_symbol || bfd_link_pic (info))
+-      && (!h || h->root.type != bfd_link_hash_undefweak))
++      && (!h || h->root.type != bfd_link_hash_undefweak
++	  || (dynamic_symbol && bfd_link_dll (info))))
+     {
+       asection *srel;
+       bfd_boolean is_plt = FALSE;
+-- 
+2.11.0
+
diff --git a/package/binutils/2.31.1/0011-xtensa-move-dynamic-relocations-sections-consistency.patch b/package/binutils/2.31.1/0011-xtensa-move-dynamic-relocations-sections-consistency.patch
new file mode 100644
index 000000000000..2c12ce3db1d9
--- /dev/null
+++ b/package/binutils/2.31.1/0011-xtensa-move-dynamic-relocations-sections-consistency.patch
@@ -0,0 +1,90 @@
+From f82863d797e461b936dff2b659a3aa65088ee87e Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sun, 22 Jul 2018 18:59:11 -0700
+Subject: [PATCH] xtensa: move dynamic relocations sections consistency
+ check
+
+The function elf_xtensa_finish_dynamic_sections checks that sizes of
+sections .rela.dyn and .rela.plt match number of corresponding relocation
+records, but the check is only done when .rela.plt is non-empty, so, e.g.
+it is never run for the static PIE.
+Rearrange the test so that .rela.dyn and .rela.plt are checked always.
+
+bfd/
+2018-07-23  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* elf32-xtensa.c (elf_xtensa_finish_dynamic_sections): Move
+	relocation sections consistency check to always check both
+	.rela.dyn and .rela.plt when they exist. Rearrange variable
+	definition and assignment places.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: f82863d797e461b936dff2b659a3aa65088ee87e
+---
+ bfd/elf32-xtensa.c | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index a4b046e445f1..cf085b7b0751 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -3156,7 +3156,7 @@ elf_xtensa_finish_dynamic_sections (bfd *output_bfd,
+ {
+   struct elf_xtensa_link_hash_table *htab;
+   bfd *dynobj;
+-  asection *sdyn, *srelplt, *sgot, *sxtlit, *sgotloc;
++  asection *sdyn, *srelplt, *srelgot, *sgot, *sxtlit, *sgotloc;
+   Elf32_External_Dyn *dyncon, *dynconend;
+   int num_xtlit_entries = 0;
+ 
+@@ -3186,15 +3186,15 @@ elf_xtensa_finish_dynamic_sections (bfd *output_bfd,
+     }
+ 
+   srelplt = htab->elf.srelplt;
++  srelgot = htab->elf.srelgot;
+   if (srelplt && srelplt->size != 0)
+     {
+-      asection *sgotplt, *srelgot, *spltlittbl;
++      asection *sgotplt, *spltlittbl;
+       int chunk, plt_chunks, plt_entries;
+       Elf_Internal_Rela irela;
+       bfd_byte *loc;
+       unsigned rtld_reloc;
+ 
+-      srelgot = htab->elf.srelgot;
+       spltlittbl = htab->spltlittbl;
+       BFD_ASSERT (srelgot != NULL && spltlittbl != NULL);
+ 
+@@ -3260,14 +3260,6 @@ elf_xtensa_finish_dynamic_sections (bfd *output_bfd,
+ 		      spltlittbl->contents + (chunk * 8) + 4);
+ 	}
+ 
+-      /* All the dynamic relocations have been emitted at this point.
+-	 Make sure the relocation sections are the correct size.  */
+-      if (srelgot->size != (sizeof (Elf32_External_Rela)
+-			    * srelgot->reloc_count)
+-	  || srelplt->size != (sizeof (Elf32_External_Rela)
+-			       * srelplt->reloc_count))
+-	abort ();
+-
+      /* The .xt.lit.plt section has just been modified.  This must
+ 	happen before the code below which combines adjacent literal
+ 	table entries, and the .xt.lit.plt contents have to be forced to
+@@ -3282,6 +3274,14 @@ elf_xtensa_finish_dynamic_sections (bfd *output_bfd,
+       spltlittbl->flags &= ~SEC_HAS_CONTENTS;
+     }
+ 
++  /* All the dynamic relocations have been emitted at this point.
++     Make sure the relocation sections are the correct size.  */
++  if ((srelgot && srelgot->size != (sizeof (Elf32_External_Rela)
++				    * srelgot->reloc_count))
++      || (srelplt && srelplt->size != (sizeof (Elf32_External_Rela)
++				       * srelplt->reloc_count)))
++    abort ();
++
+   /* Combine adjacent literal table entries.  */
+   BFD_ASSERT (! bfd_link_relocatable (info));
+   sxtlit = bfd_get_section_by_name (output_bfd, ".xt.lit");
+-- 
+2.11.0
+
-- 
2.11.0
