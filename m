From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 21:41:54 +0200
Subject: [Buildroot] [git commit] glibc: add patches to fix sh4 compile issue
Message-ID: <20170413195553.34FA182543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f2cff973a8a64411d85ccb9d5c9a40962d67552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=9756

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: rework patches as Git formatted patches, fix numbering.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../2.23/0005-sh-Fix-building-with-gcc5-6.patch    | 56 ++++++++++++++++++++++
 .../2.24/0001-sh-Fix-building-with-gcc5-6.patch    | 56 ++++++++++++++++++++++
 .../2.25/0001-sh-Fix-building-with-gcc5-6.patch    | 56 ++++++++++++++++++++++
 3 files changed, 168 insertions(+)

diff --git a/package/glibc/2.23/0005-sh-Fix-building-with-gcc5-6.patch b/package/glibc/2.23/0005-sh-Fix-building-with-gcc5-6.patch
new file mode 100644
index 0000000..fa43add
--- /dev/null
+++ b/package/glibc/2.23/0005-sh-Fix-building-with-gcc5-6.patch
@@ -0,0 +1,56 @@
+From dbb9ecfaac8db022292791936733e0841a0aa447 Mon Sep 17 00:00:00 2001
+From: Alexey Neyman <stilor@att.net>
+Date: Wed, 8 Feb 2017 16:00:57 -0200
+Subject: [PATCH] sh: Fix building with gcc5/6
+
+Build glibc for sh4-unknown-linux-gnu currently fails if one's
+using GCC5/6: in dl-conflict.c, the elf_machine_rela() function
+is called with NULL as its 3rd argument, sym. The implementation
+of that function in sysdeps/sh/dl-machine.h dereferences that pointer:
+
+const Elf32_Sym *const refsym = sym;
+...
+if (map == &GL(dl_rtld_map))
+  value -= map->l_addr + refsym->st_value + reloc->r_addend;
+
+GCC discovers a null pointer dereference, and in accordance with
+-fdelete-null-pointer-checks (which is enabled in -O2) replaces this
+code with a trap - which, as SH does not implement a trap pattern in
+GCC, evaluates to an abort() call. This abort() call pulls many more
+objects from libc_nonshared.a, eventually resulting in link failure
+due to multiple definitions for a number of symbols.
+
+As far as I see, the conditional before this code is always false in
+rtld: _dl_resolve_conflicts() is called with main_map as the first
+argument, not GL(_dl_rtld_map), but since that call is in yet another
+compilation unit, GCC does not know about it. Patch that wraps this
+conditional into !defined RESOLVE_CONFLICT_FIND_MAP attached.
+
+	* sysdeps/sh/dl-machine.h (elf_machine_rela): The condition
+	in R_SH_DIR32 case is always false when inlined from
+	dl-conflict.c. Ifdef out to prevent GCC from insertin an
+	abort() call.
+
+[Waldemar: backport of
+https://sourceware.org/git/?p=glibc.git;a=commit;h=d40dbe722f004f999b589de776f7e57e564dda01.]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ sysdeps/sh/dl-machine.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/sh/dl-machine.h b/sysdeps/sh/dl-machine.h
+index 5bb37d0..6509055 100644
+--- a/sysdeps/sh/dl-machine.h
++++ b/sysdeps/sh/dl-machine.h
+@@ -389,7 +389,7 @@ elf_machine_rela (struct link_map *map, const Elf32_Rela *reloc,
+ 	  break;
+ 	case R_SH_DIR32:
+ 	  {
+-#ifndef RTLD_BOOTSTRAP
++#if !defined RTLD_BOOTSTRAP && !defined RESOLVE_CONFLICT_FIND_MAP
+ 	   /* This is defined in rtld.c, but nowhere in the static
+ 	      libc.a; make the reference weak so static programs can
+ 	      still link.  This declaration cannot be done when
+-- 
+2.7.4
+
diff --git a/package/glibc/2.24/0001-sh-Fix-building-with-gcc5-6.patch b/package/glibc/2.24/0001-sh-Fix-building-with-gcc5-6.patch
new file mode 100644
index 0000000..821f2c6
--- /dev/null
+++ b/package/glibc/2.24/0001-sh-Fix-building-with-gcc5-6.patch
@@ -0,0 +1,56 @@
+From 98cadd4b9fa8e32d1d0dea8e46b5ba829af4e8a2 Mon Sep 17 00:00:00 2001
+From: Alexey Neyman <stilor@att.net>
+Date: Wed, 8 Feb 2017 16:00:57 -0200
+Subject: [PATCH] sh: Fix building with gcc5/6
+
+Build glibc for sh4-unknown-linux-gnu currently fails if one's
+using GCC5/6: in dl-conflict.c, the elf_machine_rela() function
+is called with NULL as its 3rd argument, sym. The implementation
+of that function in sysdeps/sh/dl-machine.h dereferences that pointer:
+
+const Elf32_Sym *const refsym = sym;
+...
+if (map == &GL(dl_rtld_map))
+  value -= map->l_addr + refsym->st_value + reloc->r_addend;
+
+GCC discovers a null pointer dereference, and in accordance with
+-fdelete-null-pointer-checks (which is enabled in -O2) replaces this
+code with a trap - which, as SH does not implement a trap pattern in
+GCC, evaluates to an abort() call. This abort() call pulls many more
+objects from libc_nonshared.a, eventually resulting in link failure
+due to multiple definitions for a number of symbols.
+
+As far as I see, the conditional before this code is always false in
+rtld: _dl_resolve_conflicts() is called with main_map as the first
+argument, not GL(_dl_rtld_map), but since that call is in yet another
+compilation unit, GCC does not know about it. Patch that wraps this
+conditional into !defined RESOLVE_CONFLICT_FIND_MAP attached.
+
+	* sysdeps/sh/dl-machine.h (elf_machine_rela): The condition
+	in R_SH_DIR32 case is always false when inlined from
+	dl-conflict.c. Ifdef out to prevent GCC from insertin an
+	abort() call.
+
+[Waldemar: backport of
+https://sourceware.org/git/?p=glibc.git;a=commit;h=d40dbe722f004f999b589de776f7e57e564dda01.]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ sysdeps/sh/dl-machine.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/sh/dl-machine.h b/sysdeps/sh/dl-machine.h
+index 5bb37d0..6509055 100644
+--- a/sysdeps/sh/dl-machine.h
++++ b/sysdeps/sh/dl-machine.h
+@@ -389,7 +389,7 @@ elf_machine_rela (struct link_map *map, const Elf32_Rela *reloc,
+ 	  break;
+ 	case R_SH_DIR32:
+ 	  {
+-#ifndef RTLD_BOOTSTRAP
++#if !defined RTLD_BOOTSTRAP && !defined RESOLVE_CONFLICT_FIND_MAP
+ 	   /* This is defined in rtld.c, but nowhere in the static
+ 	      libc.a; make the reference weak so static programs can
+ 	      still link.  This declaration cannot be done when
+-- 
+2.7.4
+
diff --git a/package/glibc/2.25/0001-sh-Fix-building-with-gcc5-6.patch b/package/glibc/2.25/0001-sh-Fix-building-with-gcc5-6.patch
new file mode 100644
index 0000000..fa43bdd
--- /dev/null
+++ b/package/glibc/2.25/0001-sh-Fix-building-with-gcc5-6.patch
@@ -0,0 +1,56 @@
+From 3840d4c2add1dd282f5f01fa51720b2d5b8fd8d2 Mon Sep 17 00:00:00 2001
+From: Alexey Neyman <stilor@att.net>
+Date: Wed, 8 Feb 2017 16:00:57 -0200
+Subject: [PATCH] sh: Fix building with gcc5/6
+
+Build glibc for sh4-unknown-linux-gnu currently fails if one's
+using GCC5/6: in dl-conflict.c, the elf_machine_rela() function
+is called with NULL as its 3rd argument, sym. The implementation
+of that function in sysdeps/sh/dl-machine.h dereferences that pointer:
+
+const Elf32_Sym *const refsym = sym;
+...
+if (map == &GL(dl_rtld_map))
+  value -= map->l_addr + refsym->st_value + reloc->r_addend;
+
+GCC discovers a null pointer dereference, and in accordance with
+-fdelete-null-pointer-checks (which is enabled in -O2) replaces this
+code with a trap - which, as SH does not implement a trap pattern in
+GCC, evaluates to an abort() call. This abort() call pulls many more
+objects from libc_nonshared.a, eventually resulting in link failure
+due to multiple definitions for a number of symbols.
+
+As far as I see, the conditional before this code is always false in
+rtld: _dl_resolve_conflicts() is called with main_map as the first
+argument, not GL(_dl_rtld_map), but since that call is in yet another
+compilation unit, GCC does not know about it. Patch that wraps this
+conditional into !defined RESOLVE_CONFLICT_FIND_MAP attached.
+
+	* sysdeps/sh/dl-machine.h (elf_machine_rela): The condition
+	in R_SH_DIR32 case is always false when inlined from
+	dl-conflict.c. Ifdef out to prevent GCC from insertin an
+	abort() call.
+
+[Waldemar: backport of
+https://sourceware.org/git/?p=glibc.git;a=commit;h=d40dbe722f004f999b589de776f7e57e564dda01.]
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ sysdeps/sh/dl-machine.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/sh/dl-machine.h b/sysdeps/sh/dl-machine.h
+index 449deea..2b468af 100644
+--- a/sysdeps/sh/dl-machine.h
++++ b/sysdeps/sh/dl-machine.h
+@@ -389,7 +389,7 @@ elf_machine_rela (struct link_map *map, const Elf32_Rela *reloc,
+ 	  break;
+ 	case R_SH_DIR32:
+ 	  {
+-#ifndef RTLD_BOOTSTRAP
++#if !defined RTLD_BOOTSTRAP && !defined RESOLVE_CONFLICT_FIND_MAP
+ 	   /* This is defined in rtld.c, but nowhere in the static
+ 	      libc.a; make the reference weak so static programs can
+ 	      still link.  This declaration cannot be done when
+-- 
+2.7.4
+
