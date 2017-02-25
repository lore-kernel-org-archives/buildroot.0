From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Feb 2017 16:47:17 +0100
Subject: [Buildroot] [git commit] binutils: fix for ld segfault for
	microblaze when --gc-sections is used
Message-ID: <20170225154733.72C5681979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a384ce7d4b8485460d342ee54cfee491fc11a5a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The workarounds for kmod/libnss can be removed when the patch is
applied and the autobuilder toolchains got rebuild.

kmod: 0d81107f021bf2a663f102bace1e3f9590641170
libnss: fceb1afd5dda45cf180f22877a6ab0e51d1b3dac

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../binutils/2.25.1/916-microblaze-pr21180.patch   | 33 ++++++++++++++++++++++
 .../binutils/2.26.1/0906-microblaze-pr21180.patch  | 33 ++++++++++++++++++++++
 .../binutils/2.27/0906-microblaze-pr21180.patch    | 33 ++++++++++++++++++++++
 3 files changed, 99 insertions(+)

diff --git a/package/binutils/2.25.1/916-microblaze-pr21180.patch b/package/binutils/2.25.1/916-microblaze-pr21180.patch
new file mode 100644
index 0000000..2ffae49
--- /dev/null
+++ b/package/binutils/2.25.1/916-microblaze-pr21180.patch
@@ -0,0 +1,33 @@
+Fix ld segfault for microblaze when --gc-sections is used
+Upstream: pending
+https://sourceware.org/bugzilla/show_bug.cgi?id=21180
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur binutils-2.25.1.orig/bfd/elf32-microblaze.c binutils-2.25.1/bfd/elf32-microblaze.c
+--- binutils-2.25.1.orig/bfd/elf32-microblaze.c	2015-07-21 10:20:58.000000000 +0200
++++ binutils-2.25.1/bfd/elf32-microblaze.c	2017-02-23 19:43:24.560776208 +0100
+@@ -3297,13 +3297,20 @@
+           && h->def_regular)
+         {
+           asection *sec = h->root.u.def.section;
++	  bfd_vma value;
++
++	  value = h->root.u.def.value;
++	  if (sec->output_section != NULL)
++	    /* PR 21180: If the output section is NULL, then the symbol is no
++	       longer needed, and in theory the GOT entry is redundant.  But
++	       it is too late to change our minds now...  */
++	    value += sec->output_section->vma + sec->output_offset;
++
+           microblaze_elf_output_dynamic_relocation (output_bfd,
+                                                     srela, srela->reloc_count++,
+                                                     /* symindex= */ 0,
+                                                     R_MICROBLAZE_REL, offset,
+-                                                    h->root.u.def.value
+-                                                    + sec->output_section->vma
+-                                                    + sec->output_offset);
++                                                    value);
+         }
+       else
+         {
diff --git a/package/binutils/2.26.1/0906-microblaze-pr21180.patch b/package/binutils/2.26.1/0906-microblaze-pr21180.patch
new file mode 100644
index 0000000..8104db3
--- /dev/null
+++ b/package/binutils/2.26.1/0906-microblaze-pr21180.patch
@@ -0,0 +1,33 @@
+Fix ld segfault for microblaze when --gc-sections is used
+Upstream: pending
+https://sourceware.org/bugzilla/show_bug.cgi?id=21180
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur binutils-2.26.1.orig/bfd/elf32-microblaze.c binutils-2.26.1/bfd/elf32-microblaze.c
+--- binutils-2.26.1.orig/bfd/elf32-microblaze.c	2015-11-13 09:27:40.000000000 +0100
++++ binutils-2.26.1/bfd/elf32-microblaze.c	2017-02-23 19:43:18.536542964 +0100
+@@ -3300,13 +3300,20 @@
+           && h->def_regular)
+         {
+           asection *sec = h->root.u.def.section;
++	  bfd_vma value;
++
++	  value = h->root.u.def.value;
++	  if (sec->output_section != NULL)
++	    /* PR 21180: If the output section is NULL, then the symbol is no
++	       longer needed, and in theory the GOT entry is redundant.  But
++	       it is too late to change our minds now...  */
++	    value += sec->output_section->vma + sec->output_offset;
++
+           microblaze_elf_output_dynamic_relocation (output_bfd,
+                                                     srela, srela->reloc_count++,
+                                                     /* symindex= */ 0,
+                                                     R_MICROBLAZE_REL, offset,
+-                                                    h->root.u.def.value
+-                                                    + sec->output_section->vma
+-                                                    + sec->output_offset);
++                                                    value);
+         }
+       else
+         {
diff --git a/package/binutils/2.27/0906-microblaze-pr21180.patch b/package/binutils/2.27/0906-microblaze-pr21180.patch
new file mode 100644
index 0000000..48e5e14
--- /dev/null
+++ b/package/binutils/2.27/0906-microblaze-pr21180.patch
@@ -0,0 +1,33 @@
+Fix ld segfault for microblaze when --gc-sections is used
+Upstream: pending
+https://sourceware.org/bugzilla/show_bug.cgi?id=21180
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur binutils-2.27.orig/bfd/elf32-microblaze.c binutils-2.27/bfd/elf32-microblaze.c
+--- binutils-2.27.orig/bfd/elf32-microblaze.c	2016-08-03 09:36:50.000000000 +0200
++++ binutils-2.27/bfd/elf32-microblaze.c	2017-02-23 19:43:12.612313590 +0100
+@@ -3297,13 +3297,20 @@
+ 	      || h->dynindx == -1))
+         {
+           asection *sec = h->root.u.def.section;
++	  bfd_vma value;
++
++	  value = h->root.u.def.value;
++	  if (sec->output_section != NULL)
++	    /* PR 21180: If the output section is NULL, then the symbol is no
++	       longer needed, and in theory the GOT entry is redundant.  But
++	       it is too late to change our minds now...  */
++	    value += sec->output_section->vma + sec->output_offset;
++
+           microblaze_elf_output_dynamic_relocation (output_bfd,
+                                                     srela, srela->reloc_count++,
+                                                     /* symindex= */ 0,
+                                                     R_MICROBLAZE_REL, offset,
+-                                                    h->root.u.def.value
+-                                                    + sec->output_section->vma
+-                                                    + sec->output_offset);
++                                                    value);
+         }
+       else
+         {
