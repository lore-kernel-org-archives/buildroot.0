From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 11:37:44 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/binutils: fix
 XTENSA_NDIFF handling for PR ld/25861
Message-ID: <20200508093729.9AE7B90FE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05e9d76c1271628abd138227f9063c5942e720ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix for xtensa PR ld/25861 introduced a regression in handling negative
symbol differences resulting in linker performing incorrect relaxation
or failing to link. Fix XTENSA_NDIFF relocation handling.

Backported from:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=d548f47df4d2e3d117d504a4c9977982c78a0556

Fixes: f0291ef4aba0 ("package/binutils: fix xtensa PR ld/25861")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f31db17a8d3accc7367e262c326f467f7dc879a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch | 128 +++++++++++++++++++++
 ...fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch | 128 +++++++++++++++++++++
 ...fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch | 128 +++++++++++++++++++++
 3 files changed, 384 insertions(+)

diff --git a/package/binutils/2.31.1/0020-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch b/package/binutils/2.31.1/0020-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch
new file mode 100644
index 0000000000..28f17d7c56
--- /dev/null
+++ b/package/binutils/2.31.1/0020-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch
@@ -0,0 +1,128 @@
+From 735321812435ae278d3766a3371f55937dc776d6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 25 Apr 2020 00:40:25 -0700
+Subject: [PATCH] xtensa: fix XTENSA_NDIFF handling for PR ld/25861
+
+Fields marked with XTENSA_NDIFF relocations are not negated, they only
+have sign bits removed. Don't negate their values when relaxation is
+performed. Don't add sign bits when the value is zero. Report overflow
+when the result has negative sign but all significant bits are zero.
+
+2020-04-29  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (relax_section): Don't negate diff_value for
+	XTENSA_NDIFF relocations. Don't add sign bits whe diff_value
+	equals 0. Report overflow when the result has negative sign but
+	all significant bits are zero.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: d548f47df4d2e3d117d504a4c9977982c78a0556
+---
+
+ bfd/elf32-xtensa.c                   | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index fded42d52a9a..4327b027911f 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -9670,37 +9670,44 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		  switch (r_type)
+ 		    {
+ 		    case R_XTENSA_DIFF8:
++		      diff_mask = 0x7f;
+ 		      diff_value =
+ 			bfd_get_signed_8 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF16:
++		      diff_mask = 0x7fff;
+ 		      diff_value =
+ 			bfd_get_signed_16 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF32:
++		      diff_mask = 0x7fffffff;
+ 		      diff_value =
+ 			bfd_get_signed_32 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF8:
+ 		    case R_XTENSA_NDIFF8:
++		      diff_mask = 0xff;
+ 		      diff_value =
+ 			bfd_get_8 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF16:
+ 		    case R_XTENSA_NDIFF16:
++		      diff_mask = 0xffff;
+ 		      diff_value =
+ 			bfd_get_16 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF32:
+ 		    case R_XTENSA_NDIFF32:
++		      diff_mask = 0xffffffff;
+ 		      diff_value =
+ 			bfd_get_32 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    }
+ 
+ 		  if (r_type >= R_XTENSA_NDIFF8
+-		      && r_type <= R_XTENSA_NDIFF32)
+-		    diff_value = -diff_value;
++		      && r_type <= R_XTENSA_NDIFF32
++		      && diff_value)
++		    diff_value |= ~diff_mask;
+ 
+ 		  new_end_offset = offset_with_removed_text_map
+ 		    (&target_relax_info->action_list,
+@@ -9710,43 +9717,40 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		  switch (r_type)
+ 		    {
+ 		    case R_XTENSA_DIFF8:
+-		      diff_mask = 0x7f;
+ 		      bfd_put_signed_8 (abfd, diff_value,
+ 				 &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF16:
+-		      diff_mask = 0x7fff;
+ 		      bfd_put_signed_16 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF32:
+-		      diff_mask = 0x7fffffff;
+ 		      bfd_put_signed_32 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF8:
+ 		    case R_XTENSA_NDIFF8:
+-		      diff_mask = 0xff;
+ 		      bfd_put_8 (abfd, diff_value,
+ 				 &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF16:
+ 		    case R_XTENSA_NDIFF16:
+-		      diff_mask = 0xffff;
+ 		      bfd_put_16 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF32:
+ 		    case R_XTENSA_NDIFF32:
+-		      diff_mask = 0xffffffff;
+ 		      bfd_put_32 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    }
+ 
+-		  /* Check for overflow. Sign bits must be all zeroes or all ones */
+-		  if ((diff_value & ~diff_mask) != 0 &&
+-		      (diff_value & ~diff_mask) != (-1 & ~diff_mask))
++		  /* Check for overflow. Sign bits must be all zeroes or
++		     all ones.  When sign bits are all ones diff_value
++		     may not be zero.  */
++		  if (((diff_value & ~diff_mask) != 0
++		       && (diff_value & ~diff_mask) != ~diff_mask)
++		      || (diff_value && (bfd_vma) diff_value == ~diff_mask))
+ 		    {
+ 		      (*link_info->callbacks->reloc_dangerous)
+ 			(link_info, _("overflow after relaxation"),
+-- 
+2.20.1
+
diff --git a/package/binutils/2.32/0009-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch b/package/binutils/2.32/0009-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch
new file mode 100644
index 0000000000..28f17d7c56
--- /dev/null
+++ b/package/binutils/2.32/0009-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch
@@ -0,0 +1,128 @@
+From 735321812435ae278d3766a3371f55937dc776d6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 25 Apr 2020 00:40:25 -0700
+Subject: [PATCH] xtensa: fix XTENSA_NDIFF handling for PR ld/25861
+
+Fields marked with XTENSA_NDIFF relocations are not negated, they only
+have sign bits removed. Don't negate their values when relaxation is
+performed. Don't add sign bits when the value is zero. Report overflow
+when the result has negative sign but all significant bits are zero.
+
+2020-04-29  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (relax_section): Don't negate diff_value for
+	XTENSA_NDIFF relocations. Don't add sign bits whe diff_value
+	equals 0. Report overflow when the result has negative sign but
+	all significant bits are zero.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: d548f47df4d2e3d117d504a4c9977982c78a0556
+---
+
+ bfd/elf32-xtensa.c                   | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index fded42d52a9a..4327b027911f 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -9670,37 +9670,44 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		  switch (r_type)
+ 		    {
+ 		    case R_XTENSA_DIFF8:
++		      diff_mask = 0x7f;
+ 		      diff_value =
+ 			bfd_get_signed_8 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF16:
++		      diff_mask = 0x7fff;
+ 		      diff_value =
+ 			bfd_get_signed_16 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF32:
++		      diff_mask = 0x7fffffff;
+ 		      diff_value =
+ 			bfd_get_signed_32 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF8:
+ 		    case R_XTENSA_NDIFF8:
++		      diff_mask = 0xff;
+ 		      diff_value =
+ 			bfd_get_8 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF16:
+ 		    case R_XTENSA_NDIFF16:
++		      diff_mask = 0xffff;
+ 		      diff_value =
+ 			bfd_get_16 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF32:
+ 		    case R_XTENSA_NDIFF32:
++		      diff_mask = 0xffffffff;
+ 		      diff_value =
+ 			bfd_get_32 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    }
+ 
+ 		  if (r_type >= R_XTENSA_NDIFF8
+-		      && r_type <= R_XTENSA_NDIFF32)
+-		    diff_value = -diff_value;
++		      && r_type <= R_XTENSA_NDIFF32
++		      && diff_value)
++		    diff_value |= ~diff_mask;
+ 
+ 		  new_end_offset = offset_with_removed_text_map
+ 		    (&target_relax_info->action_list,
+@@ -9710,43 +9717,40 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		  switch (r_type)
+ 		    {
+ 		    case R_XTENSA_DIFF8:
+-		      diff_mask = 0x7f;
+ 		      bfd_put_signed_8 (abfd, diff_value,
+ 				 &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF16:
+-		      diff_mask = 0x7fff;
+ 		      bfd_put_signed_16 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF32:
+-		      diff_mask = 0x7fffffff;
+ 		      bfd_put_signed_32 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF8:
+ 		    case R_XTENSA_NDIFF8:
+-		      diff_mask = 0xff;
+ 		      bfd_put_8 (abfd, diff_value,
+ 				 &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF16:
+ 		    case R_XTENSA_NDIFF16:
+-		      diff_mask = 0xffff;
+ 		      bfd_put_16 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF32:
+ 		    case R_XTENSA_NDIFF32:
+-		      diff_mask = 0xffffffff;
+ 		      bfd_put_32 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    }
+ 
+-		  /* Check for overflow. Sign bits must be all zeroes or all ones */
+-		  if ((diff_value & ~diff_mask) != 0 &&
+-		      (diff_value & ~diff_mask) != (-1 & ~diff_mask))
++		  /* Check for overflow. Sign bits must be all zeroes or
++		     all ones.  When sign bits are all ones diff_value
++		     may not be zero.  */
++		  if (((diff_value & ~diff_mask) != 0
++		       && (diff_value & ~diff_mask) != ~diff_mask)
++		      || (diff_value && (bfd_vma) diff_value == ~diff_mask))
+ 		    {
+ 		      (*link_info->callbacks->reloc_dangerous)
+ 			(link_info, _("overflow after relaxation"),
+-- 
+2.20.1
+
diff --git a/package/binutils/2.33.1/0006-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch b/package/binutils/2.33.1/0006-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch
new file mode 100644
index 0000000000..28f17d7c56
--- /dev/null
+++ b/package/binutils/2.33.1/0006-xtensa-fix-XTENSA_NDIFF-handling-for-PR-ld-25861.patch
@@ -0,0 +1,128 @@
+From 735321812435ae278d3766a3371f55937dc776d6 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Sat, 25 Apr 2020 00:40:25 -0700
+Subject: [PATCH] xtensa: fix XTENSA_NDIFF handling for PR ld/25861
+
+Fields marked with XTENSA_NDIFF relocations are not negated, they only
+have sign bits removed. Don't negate their values when relaxation is
+performed. Don't add sign bits when the value is zero. Report overflow
+when the result has negative sign but all significant bits are zero.
+
+2020-04-29  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (relax_section): Don't negate diff_value for
+	XTENSA_NDIFF relocations. Don't add sign bits whe diff_value
+	equals 0. Report overflow when the result has negative sign but
+	all significant bits are zero.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: d548f47df4d2e3d117d504a4c9977982c78a0556
+---
+
+ bfd/elf32-xtensa.c                   | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index fded42d52a9a..4327b027911f 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -9670,37 +9670,44 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		  switch (r_type)
+ 		    {
+ 		    case R_XTENSA_DIFF8:
++		      diff_mask = 0x7f;
+ 		      diff_value =
+ 			bfd_get_signed_8 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF16:
++		      diff_mask = 0x7fff;
+ 		      diff_value =
+ 			bfd_get_signed_16 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF32:
++		      diff_mask = 0x7fffffff;
+ 		      diff_value =
+ 			bfd_get_signed_32 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF8:
+ 		    case R_XTENSA_NDIFF8:
++		      diff_mask = 0xff;
+ 		      diff_value =
+ 			bfd_get_8 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF16:
+ 		    case R_XTENSA_NDIFF16:
++		      diff_mask = 0xffff;
+ 		      diff_value =
+ 			bfd_get_16 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF32:
+ 		    case R_XTENSA_NDIFF32:
++		      diff_mask = 0xffffffff;
+ 		      diff_value =
+ 			bfd_get_32 (abfd, &contents[old_source_offset]);
+ 		      break;
+ 		    }
+ 
+ 		  if (r_type >= R_XTENSA_NDIFF8
+-		      && r_type <= R_XTENSA_NDIFF32)
+-		    diff_value = -diff_value;
++		      && r_type <= R_XTENSA_NDIFF32
++		      && diff_value)
++		    diff_value |= ~diff_mask;
+ 
+ 		  new_end_offset = offset_with_removed_text_map
+ 		    (&target_relax_info->action_list,
+@@ -9710,43 +9717,40 @@ relax_section (bfd *abfd, asection *sec, struct bfd_link_info *link_info)
+ 		  switch (r_type)
+ 		    {
+ 		    case R_XTENSA_DIFF8:
+-		      diff_mask = 0x7f;
+ 		      bfd_put_signed_8 (abfd, diff_value,
+ 				 &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF16:
+-		      diff_mask = 0x7fff;
+ 		      bfd_put_signed_16 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_DIFF32:
+-		      diff_mask = 0x7fffffff;
+ 		      bfd_put_signed_32 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF8:
+ 		    case R_XTENSA_NDIFF8:
+-		      diff_mask = 0xff;
+ 		      bfd_put_8 (abfd, diff_value,
+ 				 &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF16:
+ 		    case R_XTENSA_NDIFF16:
+-		      diff_mask = 0xffff;
+ 		      bfd_put_16 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    case R_XTENSA_PDIFF32:
+ 		    case R_XTENSA_NDIFF32:
+-		      diff_mask = 0xffffffff;
+ 		      bfd_put_32 (abfd, diff_value,
+ 				  &contents[old_source_offset]);
+ 		      break;
+ 		    }
+ 
+-		  /* Check for overflow. Sign bits must be all zeroes or all ones */
+-		  if ((diff_value & ~diff_mask) != 0 &&
+-		      (diff_value & ~diff_mask) != (-1 & ~diff_mask))
++		  /* Check for overflow. Sign bits must be all zeroes or
++		     all ones.  When sign bits are all ones diff_value
++		     may not be zero.  */
++		  if (((diff_value & ~diff_mask) != 0
++		       && (diff_value & ~diff_mask) != ~diff_mask)
++		      || (diff_value && (bfd_vma) diff_value == ~diff_mask))
+ 		    {
+ 		      (*link_info->callbacks->reloc_dangerous)
+ 			(link_info, _("overflow after relaxation"),
+-- 
+2.20.1
+
