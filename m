From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 17 Mar 2019 22:18:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/binutils: upstream fixes for
 2.31.1
Message-ID: <20190317211848.3721-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

combining musl and binutils 2.31.1 will
produce static applications that crash
immediately.
Picked 3 upstream commits to remedy this.

see https://sourceware.org/bugzilla/show_bug.cgi?id=23428

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...OPERTY_X86_ISA_1_USED-note-if-needed.patch | 568 +++++++++++++++++
 ...ly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch | 588 ++++++++++++++++++
 ...operly-add-X86_ISA_1_NEEDED-property.patch | 140 +++++
 3 files changed, 1296 insertions(+)
 create mode 100644 package/binutils/2.31.1/0012-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch
 create mode 100644 package/binutils/2.31.1/0013-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch
 create mode 100644 package/binutils/2.31.1/0014-x86-Properly-add-X86_ISA_1_NEEDED-property.patch

diff --git a/package/binutils/2.31.1/0012-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch b/package/binutils/2.31.1/0012-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch
new file mode 100644
index 0000000000..a17065a6dc
--- /dev/null
+++ b/package/binutils/2.31.1/0012-x86-Add-a-GNU_PROPERTY_X86_ISA_1_USED-note-if-needed.patch
@@ -0,0 +1,568 @@
+From 6737a6b34f4823deb7142f27b4074831a37ac1e1 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Fri, 20 Jul 2018 09:18:47 -0700
+Subject: [PATCH] x86: Add a GNU_PROPERTY_X86_ISA_1_USED note if needed
+
+When -z separate-code, which is enabled by default for Linux/x86, is
+used to create executable, ld won't place any data in the code-only
+PT_LOAD segment.  If there are no data sections placed before the
+code-only PT_LOAD segment, the program headers won't be mapped into
+any PT_LOAD segment.  When the executable tries to access it (based
+on the program header address passed in AT_PHDR), it will lead to
+segfault.  This patch inserts a GNU_PROPERTY_X86_ISA_1_USED note if
+there may be no data sections before the text section so that the
+first PT_LOAD segment won't be code-only and will contain the program
+header.
+
+Testcases are adjusted to either pass "-z noseparate-code" to ld or
+discard the .note.gnu.property section.  A Linux/x86 run-time test is
+added.
+
+bfd/
+
+	PR ld/23428
+	* elfxx-x86.c (_bfd_x86_elf_link_setup_gnu_properties): If the
+	separate code program header is needed, make sure that the first
+	read-only PT_LOAD segment has no code by adding a
+	GNU_PROPERTY_X86_ISA_1_USED note.
+
+ld/
+
+	PR ld/23428
+	* testsuite/ld-elf/linux-x86.S: New file.
+	* testsuite/ld-elf/linux-x86.exp: Likewise.
+	* testsuite/ld-elf/pr23428.c: Likewise.
+	* testsuite/ld-elf/sec64k.exp: Pass "-z noseparate-code" to ld
+	for Linux/x86 targets.
+	* testsuite/ld-i386/abs-iamcu.d: Likewise.
+	* testsuite/ld-i386/abs.d: Likewise.
+	* testsuite/ld-i386/pr12718.d: Likewise.
+	* testsuite/ld-i386/pr12921.d: Likewise.
+	* testsuite/ld-x86-64/abs-k1om.d: Likewise.
+	* testsuite/ld-x86-64/abs-l1om.d: Likewise.
+	* testsuite/ld-x86-64/abs.d: Likewise.
+	* testsuite/ld-x86-64/pr12718.d: Likewise.
+	* testsuite/ld-x86-64/pr12921.d: Likewise.
+	* testsuite/ld-linkonce/zeroeh.ld: Discard .note.gnu.property
+	section.
+	* testsuite/ld-scripts/print-memory-usage.t: Likewise.
+	* testsuite/ld-scripts/size-2.t: Likewise.
+	* testsuite/lib/ld-lib.exp (run_ld_link_exec_tests): Use ld
+	to create executable if language is "asm".
+
+(cherry picked from commit 241e64e3b42cd9eba514b8e0ad2ef39a337f10a5)
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ bfd/ChangeLog                                |  8 ++++
+ bfd/elfxx-x86.c                              | 60 +++++++++++++++++++-------
+ ld/ChangeLog                                 | 24 +++++++++++
+ ld/testsuite/ld-elf/linux-x86.S              | 63 ++++++++++++++++++++++++++++
+ ld/testsuite/ld-elf/linux-x86.exp            | 46 ++++++++++++++++++++
+ ld/testsuite/ld-elf/pr23428.c                | 43 +++++++++++++++++++
+ ld/testsuite/ld-elf/sec64k.exp               |  2 +
+ ld/testsuite/ld-i386/abs-iamcu.d             |  2 +-
+ ld/testsuite/ld-i386/abs.d                   |  2 +-
+ ld/testsuite/ld-i386/pr12718.d               |  2 +-
+ ld/testsuite/ld-i386/pr12921.d               |  2 +-
+ ld/testsuite/ld-linkonce/zeroeh.ld           |  1 +
+ ld/testsuite/ld-scripts/print-memory-usage.t |  2 +
+ ld/testsuite/ld-scripts/size-2.t             |  1 +
+ ld/testsuite/ld-x86-64/abs-k1om.d            |  2 +-
+ ld/testsuite/ld-x86-64/abs-l1om.d            |  2 +-
+ ld/testsuite/ld-x86-64/abs.d                 |  2 +-
+ ld/testsuite/ld-x86-64/pr12718.d             |  2 +-
+ ld/testsuite/ld-x86-64/pr12921.d             |  2 +-
+ ld/testsuite/lib/ld-lib.exp                  |  5 ++-
+ 20 files changed, 248 insertions(+), 25 deletions(-)
+ create mode 100644 ld/testsuite/ld-elf/linux-x86.S
+ create mode 100644 ld/testsuite/ld-elf/linux-x86.exp
+ create mode 100644 ld/testsuite/ld-elf/pr23428.c
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 1c1174a..d3831b7 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,11 @@
++2018-07-23  H.J. Lu  <hongjiu.lu@intel.com>
++
++	PR ld/23428
++	* elfxx-x86.c (_bfd_x86_elf_link_setup_gnu_properties): If the
++	separate code program header is needed, make sure that the first
++	read-only PT_LOAD segment has no code by adding a
++	GNU_PROPERTY_X86_ISA_1_USED note.
++
+ 2018-07-18  Nick Clifton  <nickc@redhat.com>
+
+ 	* development.sh: Set to true.
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index a2497aa..2e4ff88 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2524,6 +2524,7 @@ _bfd_x86_elf_link_setup_gnu_properties
+   const struct elf_backend_data *bed;
+   unsigned int class_align = ABI_64_P (info->output_bfd) ? 3 : 2;
+   unsigned int got_align;
++  bfd_boolean has_text = FALSE;
+
+   features = 0;
+   if (info->ibt)
+@@ -2538,24 +2539,59 @@ _bfd_x86_elf_link_setup_gnu_properties
+     if (bfd_get_flavour (pbfd) == bfd_target_elf_flavour
+ 	&& bfd_count_sections (pbfd) != 0)
+       {
++	if (!has_text)
++	  {
++	    /* Check if there is no non-empty text section.  */
++	    sec = bfd_get_section_by_name (pbfd, ".text");
++	    if (sec != NULL && sec->size != 0)
++	      has_text = TRUE;
++	  }
++
+ 	ebfd = pbfd;
+
+ 	if (elf_properties (pbfd) != NULL)
+ 	  break;
+       }
+
+-  if (ebfd != NULL && features)
++  bed = get_elf_backend_data (info->output_bfd);
++
++  htab = elf_x86_hash_table (info, bed->target_id);
++  if (htab == NULL)
++    return pbfd;
++
++  if (ebfd != NULL)
+     {
+-      /* If features is set, add GNU_PROPERTY_X86_FEATURE_1_IBT and
+-	 GNU_PROPERTY_X86_FEATURE_1_SHSTK.  */
+-      prop = _bfd_elf_get_property (ebfd,
+-				    GNU_PROPERTY_X86_FEATURE_1_AND,
+-				    4);
+-      prop->u.number |= features;
+-      prop->pr_kind = property_number;
++      prop = NULL;
++      if (features)
++	{
++	  /* If features is set, add GNU_PROPERTY_X86_FEATURE_1_IBT and
++	     GNU_PROPERTY_X86_FEATURE_1_SHSTK.  */
++	  prop = _bfd_elf_get_property (ebfd,
++					GNU_PROPERTY_X86_FEATURE_1_AND,
++					4);
++	  prop->u.number |= features;
++	  prop->pr_kind = property_number;
++	}
++      else if (has_text
++	       && elf_properties (ebfd) == NULL
++	       && elf_tdata (info->output_bfd)->o->build_id.sec == NULL
++	       && !htab->elf.dynamic_sections_created
++	       && !info->traditional_format
++	       && (info->output_bfd->flags & D_PAGED) != 0
++	       && info->separate_code)
++	{
++	  /* If the separate code program header is needed, make sure
++	     that the first read-only PT_LOAD segment has no code by
++	     adding a GNU_PROPERTY_X86_ISA_1_USED note.  */
++	  prop = _bfd_elf_get_property (ebfd,
++					GNU_PROPERTY_X86_ISA_1_USED,
++					4);
++	  prop->u.number = GNU_PROPERTY_X86_ISA_1_486;
++	  prop->pr_kind = property_number;
++	}
+
+       /* Create the GNU property note section if needed.  */
+-      if (pbfd == NULL)
++      if (prop != NULL && pbfd == NULL)
+ 	{
+ 	  sec = bfd_make_section_with_flags (ebfd,
+ 					     NOTE_GNU_PROPERTY_SECTION_NAME,
+@@ -2581,12 +2617,6 @@ error_alignment:
+
+   pbfd = _bfd_elf_link_setup_gnu_properties (info);
+
+-  bed = get_elf_backend_data (info->output_bfd);
+-
+-  htab = elf_x86_hash_table (info, bed->target_id);
+-  if (htab == NULL)
+-    return pbfd;
+-
+   htab->r_info = init_table->r_info;
+   htab->r_sym = init_table->r_sym;
+
+diff --git a/ld/ChangeLog b/ld/ChangeLog
+index c07e442..cfadbd4 100644
+--- a/ld/ChangeLog
++++ b/ld/ChangeLog
+@@ -1,3 +1,27 @@
++2018-07-23  H.J. Lu  <hongjiu.lu@intel.com>
++
++	PR ld/23428
++	* testsuite/ld-elf/linux-x86.S: New file.
++	* testsuite/ld-elf/linux-x86.exp: Likewise.
++	* testsuite/ld-elf/pr23428.c: Likewise.
++	* testsuite/ld-elf/sec64k.exp: Pass "-z noseparate-code" to ld
++	for Linux/x86 targets.
++	* testsuite/ld-i386/abs-iamcu.d: Likewise.
++	* testsuite/ld-i386/abs.d: Likewise.
++	* testsuite/ld-i386/pr12718.d: Likewise.
++	* testsuite/ld-i386/pr12921.d: Likewise.
++	* testsuite/ld-x86-64/abs-k1om.d: Likewise.
++	* testsuite/ld-x86-64/abs-l1om.d: Likewise.
++	* testsuite/ld-x86-64/abs.d: Likewise.
++	* testsuite/ld-x86-64/pr12718.d: Likewise.
++	* testsuite/ld-x86-64/pr12921.d: Likewise.
++	* testsuite/ld-linkonce/zeroeh.ld: Discard .note.gnu.property
++	section.
++	* testsuite/ld-scripts/print-memory-usage.t: Likewise.
++	* testsuite/ld-scripts/size-2.t: Likewise.
++	* testsuite/lib/ld-lib.exp (run_ld_link_exec_tests): Use ld to
++	create executable if language is "asm".
++
+ 2018-07-18  Nick Clifton  <nickc@redhat.com>
+
+ 	2.31.1 Release point.
+diff --git a/ld/testsuite/ld-elf/linux-x86.S b/ld/testsuite/ld-elf/linux-x86.S
+new file mode 100644
+index 0000000..bdf40c6
+--- /dev/null
++++ b/ld/testsuite/ld-elf/linux-x86.S
+@@ -0,0 +1,63 @@
++	.text
++	.globl _start
++	.type _start, at function
++	.p2align 4
++_start:
++	xorl %ebp, %ebp
++#ifdef __LP64__
++	popq %rdi
++	movq %rsp, %rsi
++	andq  $~15, %rsp
++#elif defined __x86_64__
++	mov (%rsp),%edi
++	addl $4,%esp
++	movl %esp, %esi
++	andl  $~15, %esp
++#else
++	popl %esi
++	movl %esp, %ecx
++	andl  $~15, %esp
++
++	subl $8,%esp
++	pushl %ecx
++	pushl %esi
++#endif
++
++	call main
++
++	hlt
++
++	.type syscall,  @function
++	.globl syscall
++	.p2align 4
++syscall:
++#ifdef __x86_64__
++	movq %rdi, %rax		/* Syscall number -> rax.  */
++	movq %rsi, %rdi		/* shift arg1 - arg5.  */
++	movq %rdx, %rsi
++	movq %rcx, %rdx
++	movq %r8, %r10
++	movq %r9, %r8
++	movq 8(%rsp),%r9	/* arg6 is on the stack.  */
++	syscall			/* Do the system call.  */
++#else
++	push %ebp
++	push %edi
++	push %esi
++	push %ebx
++	mov 0x2c(%esp),%ebp
++	mov 0x28(%esp),%edi
++	mov 0x24(%esp),%esi
++	mov 0x20(%esp),%edx
++	mov 0x1c(%esp),%ecx
++	mov 0x18(%esp),%ebx
++	mov 0x14(%esp),%eax
++	int $0x80
++	pop %ebx
++	pop %esi
++	pop %edi
++	pop %ebp
++#endif
++	ret			/* Return to caller.  */
++	.size syscall, .-syscall
++	.section .note.GNU-stack,"", at progbits
+diff --git a/ld/testsuite/ld-elf/linux-x86.exp b/ld/testsuite/ld-elf/linux-x86.exp
+new file mode 100644
+index 0000000..36217c6
+--- /dev/null
++++ b/ld/testsuite/ld-elf/linux-x86.exp
+@@ -0,0 +1,46 @@
++# Expect script for simple native Linux/x86 tests.
++#   Copyright (C) 2018 Free Software Foundation, Inc.
++#
++# This file is part of the GNU Binutils.
++#
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston,
++# MA 02110-1301, USA.
++#
++
++# Test very simple native Linux/x86 programs with linux-x86.S.
++if { ![isnative] || [which $CC] == 0 \
++     || (![istarget "i?86-*-linux*"] \
++         && ![istarget "x86_64-*-linux*"] \
++         && ![istarget "amd64-*-linux*"]) } {
++    return
++}
++
++# Add $PLT_CFLAGS if PLT is expected.
++global PLT_CFLAGS
++# Add $NOPIE_CFLAGS and $NOPIE_LDFLAGS if non-PIE is required.
++global NOPIE_CFLAGS NOPIE_LDFLAGS
++
++run_ld_link_exec_tests [list \
++    [list \
++	"Run PR ld/23428 test" \
++	"--no-dynamic-linker -z separate-code" \
++	"" \
++	{ linux-x86.S pr23428.c } \
++	"pr23428" \
++	"pass.out" \
++	"$NOPIE_CFLAGS -fno-asynchronous-unwind-tables" \
++	"asm" \
++    ] \
++]
+diff --git a/ld/testsuite/ld-elf/pr23428.c b/ld/testsuite/ld-elf/pr23428.c
+new file mode 100644
+index 0000000..3631ed7
+--- /dev/null
++++ b/ld/testsuite/ld-elf/pr23428.c
+@@ -0,0 +1,43 @@
++#include <unistd.h>
++#include <link.h>
++#include <syscall.h>
++
++#define STRING_COMMA_LEN(STR) (STR), (sizeof (STR) - 1)
++
++int
++main (int argc, char **argv)
++{
++  char **ev = &argv[argc + 1];
++  char **evp = ev;
++  ElfW(auxv_t) *av;
++  const ElfW(Phdr) *phdr = NULL;
++  size_t phnum = 0;
++  size_t loadnum = 0;
++  int fd = STDOUT_FILENO;
++  size_t i;
++
++  while (*evp++ != NULL)
++    ;
++
++  av = (ElfW(auxv_t) *) evp;
++
++  for (; av->a_type != AT_NULL; ++av)
++    switch (av->a_type)
++      {
++      case AT_PHDR:
++	phdr = (const void *) av->a_un.a_val;
++	break;
++      case AT_PHNUM:
++	phnum = av->a_un.a_val;
++	break;
++      }
++
++  for (i = 0; i < phnum; i++, phdr++)
++    if (phdr->p_type == PT_LOAD)
++      loadnum++;
++
++  syscall (SYS_write, fd, STRING_COMMA_LEN ("PASS\n"));
++
++  syscall (SYS_exit, !loadnum);
++  return 0;
++}
+diff --git a/ld/testsuite/ld-elf/sec64k.exp b/ld/testsuite/ld-elf/sec64k.exp
+index b58139e..3909c0e 100644
+--- a/ld/testsuite/ld-elf/sec64k.exp
++++ b/ld/testsuite/ld-elf/sec64k.exp
+@@ -177,6 +177,8 @@ if { ![istarget "d10v-*-*"]
+     foreach sfile $sfiles { puts $ofd "#source: $sfile" }
+     if { [istarget spu*-*-*] } {
+ 	puts $ofd "#ld: --local-store 0:0"
++    } elseif { [istarget "i?86-*-linux*"] || [istarget "x86_64-*-linux*"] } {
++	puts $ofd "#ld: -z noseparate-code"
+     } else {
+ 	puts $ofd "#ld:"
+     }
+diff --git a/ld/testsuite/ld-i386/abs-iamcu.d b/ld/testsuite/ld-i386/abs-iamcu.d
+index ac9beff..aba7d6b 100644
+--- a/ld/testsuite/ld-i386/abs-iamcu.d
++++ b/ld/testsuite/ld-i386/abs-iamcu.d
+@@ -2,7 +2,7 @@
+ #source: abs.s
+ #source: zero.s
+ #as: --32 -march=iamcu
+-#ld: -m elf_iamcu
++#ld: -m elf_iamcu -z noseparate-code
+ #objdump: -rs -j .text
+
+ .*:     file format .*
+diff --git a/ld/testsuite/ld-i386/abs.d b/ld/testsuite/ld-i386/abs.d
+index e660aca..191ee44 100644
+--- a/ld/testsuite/ld-i386/abs.d
++++ b/ld/testsuite/ld-i386/abs.d
+@@ -2,7 +2,7 @@
+ #as: --32
+ #source: abs.s
+ #source: zero.s
+-#ld: -melf_i386
++#ld: -melf_i386 -z noseparate-code
+ #objdump: -rs
+
+ .*:     file format .*
+diff --git a/ld/testsuite/ld-i386/pr12718.d b/ld/testsuite/ld-i386/pr12718.d
+index ec51540..7eba52d 100644
+--- a/ld/testsuite/ld-i386/pr12718.d
++++ b/ld/testsuite/ld-i386/pr12718.d
+@@ -1,6 +1,6 @@
+ #name: PR ld/12718
+ #as: --32
+-#ld: -melf_i386
++#ld: -melf_i386 -z noseparate-code
+ #readelf: -S
+
+ There are 5 section headers, starting at offset 0x[0-9a-f]+:
+diff --git a/ld/testsuite/ld-i386/pr12921.d b/ld/testsuite/ld-i386/pr12921.d
+index e49079b..ea2da3e 100644
+--- a/ld/testsuite/ld-i386/pr12921.d
++++ b/ld/testsuite/ld-i386/pr12921.d
+@@ -1,6 +1,6 @@
+ #name: PR ld/12921
+ #as: --32
+-#ld: -melf_i386
++#ld: -melf_i386 -z noseparate-code
+ #readelf: -S --wide
+
+ There are 7 section headers, starting at offset 0x[0-9a-f]+:
+diff --git a/ld/testsuite/ld-linkonce/zeroeh.ld b/ld/testsuite/ld-linkonce/zeroeh.ld
+index b22eaa1..f89855a 100644
+--- a/ld/testsuite/ld-linkonce/zeroeh.ld
++++ b/ld/testsuite/ld-linkonce/zeroeh.ld
+@@ -2,4 +2,5 @@ SECTIONS {
+  .text 0xa00 : { *(.text); *(.gnu.linkonce.t.*) }
+  .gcc_except_table 0x2000 : { *(.gcc_except_table) }
+  .eh_frame 0x4000 : { *(.eh_frame) }
++  /DISCARD/ : { *(.note.gnu.property) }
+ }
+diff --git a/ld/testsuite/ld-scripts/print-memory-usage.t b/ld/testsuite/ld-scripts/print-memory-usage.t
+index 5ff057a..6eda1d2 100644
+--- a/ld/testsuite/ld-scripts/print-memory-usage.t
++++ b/ld/testsuite/ld-scripts/print-memory-usage.t
+@@ -11,4 +11,6 @@ SECTIONS
+     *(.data)
+     *(.rw)
+   }
++
++  /DISCARD/ : { *(.note.gnu.property) }
+ }
+diff --git a/ld/testsuite/ld-scripts/size-2.t b/ld/testsuite/ld-scripts/size-2.t
+index 7238639..c3c4edd 100644
+--- a/ld/testsuite/ld-scripts/size-2.t
++++ b/ld/testsuite/ld-scripts/size-2.t
+@@ -18,4 +18,5 @@ SECTIONS
+     LONG (SIZEOF (.tdata))
+     LONG (SIZEOF (.tbss))
+   } :image
++  /DISCARD/ : { *(.note.gnu.property) }
+ }
+diff --git a/ld/testsuite/ld-x86-64/abs-k1om.d b/ld/testsuite/ld-x86-64/abs-k1om.d
+index 2c26639..6b0fde0 100644
+--- a/ld/testsuite/ld-x86-64/abs-k1om.d
++++ b/ld/testsuite/ld-x86-64/abs-k1om.d
+@@ -2,7 +2,7 @@
+ #source: ../ld-i386/abs.s
+ #source: ../ld-i386/zero.s
+ #as: --64 -march=k1om
+-#ld: -m elf_k1om
++#ld: -m elf_k1om -z noseparate-code
+ #objdump: -rs -j .text
+
+ .*:     file format .*
+diff --git a/ld/testsuite/ld-x86-64/abs-l1om.d b/ld/testsuite/ld-x86-64/abs-l1om.d
+index 1fb96d4..f87869f 100644
+--- a/ld/testsuite/ld-x86-64/abs-l1om.d
++++ b/ld/testsuite/ld-x86-64/abs-l1om.d
+@@ -2,7 +2,7 @@
+ #source: ../ld-i386/abs.s
+ #source: ../ld-i386/zero.s
+ #as: --64 -march=l1om
+-#ld: -m elf_l1om
++#ld: -m elf_l1om -z noseparate-code
+ #objdump: -rs -j .text
+ #target: x86_64-*-linux*
+
+diff --git a/ld/testsuite/ld-x86-64/abs.d b/ld/testsuite/ld-x86-64/abs.d
+index b24b018..d99ab46 100644
+--- a/ld/testsuite/ld-x86-64/abs.d
++++ b/ld/testsuite/ld-x86-64/abs.d
+@@ -1,7 +1,7 @@
+ #name: Absolute non-overflowing relocs
+ #source: ../ld-i386/abs.s
+ #source: ../ld-i386/zero.s
+-#ld:
++#ld: -z noseparate-code
+ #objdump: -rs
+
+ .*:     file format .*
+diff --git a/ld/testsuite/ld-x86-64/pr12718.d b/ld/testsuite/ld-x86-64/pr12718.d
+index 07d1732..2c503ff 100644
+--- a/ld/testsuite/ld-x86-64/pr12718.d
++++ b/ld/testsuite/ld-x86-64/pr12718.d
+@@ -1,6 +1,6 @@
+ #name: PR ld/12718
+ #as: --64
+-#ld: -melf_x86_64
++#ld: -melf_x86_64 -z noseparate-code
+ #readelf: -S --wide
+
+ There are 5 section headers, starting at offset 0x[0-9a-f]+:
+diff --git a/ld/testsuite/ld-x86-64/pr12921.d b/ld/testsuite/ld-x86-64/pr12921.d
+index 6fe6abe..1162d55 100644
+--- a/ld/testsuite/ld-x86-64/pr12921.d
++++ b/ld/testsuite/ld-x86-64/pr12921.d
+@@ -1,6 +1,6 @@
+ #name: PR ld/12921
+ #as: --64
+-#ld: -melf_x86_64
++#ld: -melf_x86_64 -z noseparate-code
+ #readelf: -S --wide
+
+ There are 7 section headers, starting at offset 0x[0-9a-f]+:
+diff --git a/ld/testsuite/lib/ld-lib.exp b/ld/testsuite/lib/ld-lib.exp
+index cfbefe9..1095091 100644
+--- a/ld/testsuite/lib/ld-lib.exp
++++ b/ld/testsuite/lib/ld-lib.exp
+@@ -1482,7 +1482,10 @@ proc run_ld_link_exec_tests { ldtests args } {
+ 	    continue
+ 	}
+
+-	if { [ string match "c++" $lang ] } {
++	if { [ string match "asm" $lang ] } {
++	    set link_proc ld_link
++	    set link_cmd $ld
++	} elseif { [ string match "c++" $lang ] } {
+ 	    set link_proc ld_link
+ 	    set link_cmd $CXX
+ 	} else {
+--
+2.9.3
+
diff --git a/package/binutils/2.31.1/0013-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch b/package/binutils/2.31.1/0013-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch
new file mode 100644
index 0000000000..1ffd36b336
--- /dev/null
+++ b/package/binutils/2.31.1/0013-x86-Properly-merge-GNU_PROPERTY_X86_ISA_1_USED.patch
@@ -0,0 +1,588 @@
+From d55c3e36094f06bb1fb02f5eac19fdccf1d91f7e Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Wed, 8 Aug 2018 06:09:15 -0700
+Subject: [PATCH] x86: Properly merge GNU_PROPERTY_X86_ISA_1_USED
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Without the GNU_PROPERTY_X86_ISA_1_USED property, all ISAs may be used.
+If a bit in the GNU_PROPERTY_X86_ISA_1_USED property is unset, the
+corresponding x86 instruction set isn???t used.  When merging properties
+from 2 input files and one input file doesn't have the
+GNU_PROPERTY_X86_ISA_1_USED property, the output file shouldn't have
+it neither.  This patch removes the GNU_PROPERTY_X86_ISA_1_USED
+property if an input file doesn't have it.
+
+This patch replaces the GNU_PROPERTY_X86_ISA_1_USED property with the
+GNU_PROPERTY_X86_ISA_1_NEEDED property which is the minimum ISA
+requirement.
+
+bfd/
+
+	PR ld/23486
+	* elfxx-x86.c (_bfd_x86_elf_merge_gnu_properties): Remove
+	GNU_PROPERTY_X86_ISA_1_USED if an input file doesn't have it.
+	(_bfd_x86_elf_link_setup_gnu_properties): Adding the
+	GNU_PROPERTY_X86_ISA_1_NEEDED, instead of
+	GNU_PROPERTY_X86_ISA_1_USED, property.
+
+ld/
+
+	PR ld/23486
+	* testsuite/ld-i386/i386.exp: Run PR ld/23486 tests.
+	* testsuite/ld-x86-64/x86-64.exp: Likewise.
+	* testsuite/ld-i386/pr23486a.d: New file.
+	* testsuite/ld-i386/pr23486b.d: Likewise.
+	* testsuite/ld-x86-64/pr23486a-x32.d: Likewise.
+	* testsuite/ld-x86-64/pr23486a.d: Likewise.
+	* testsuite/ld-x86-64/pr23486a.s: Likewise.
+	* testsuite/ld-x86-64/pr23486b-x32.d: Likewise.
+	* testsuite/ld-x86-64/pr23486b.d: Likewise.
+	* testsuite/ld-x86-64/pr23486b.s: Likewise.
+	* testsuite/ld-i386/property-3.r: Remove "x86 ISA used".
+	* testsuite/ld-i386/property-4.r: Likewise.
+	* testsuite/ld-i386/property-5.r: Likewise.
+	* testsuite/ld-i386/property-x86-ibt3a.d: Likewise.
+	* testsuite/ld-i386/property-x86-ibt3b.d: Likewise.
+	* testsuite/ld-i386/property-x86-shstk3a.d: Likewise.
+	* testsuite/ld-i386/property-x86-shstk3b.d: Likewise.
+	* testsuite/ld-x86-64/property-3.r: Likewise.
+	* testsuite/ld-x86-64/property-4.r: Likewise.
+	* testsuite/ld-x86-64/property-5.r: Likewise.
+	* testsuite/ld-x86-64/property-x86-ibt3a-x32.d: Likewise.
+	* testsuite/ld-x86-64/property-x86-ibt3a.d: Likewise.
+	* testsuite/ld-x86-64/property-x86-ibt3b-x32.d: Likewise.
+	* testsuite/ld-x86-64/property-x86-ibt3b.d: Likewise.
+	* testsuite/ld-x86-64/property-x86-shstk3a-x32.d: Likewise.
+	* testsuite/ld-x86-64/property-x86-shstk3a.d: Likewise.
+	* testsuite/ld-x86-64/property-x86-shstk3b-x32.d: Likewise.
+	* testsuite/ld-x86-64/property-x86-shstk3b.d: Likewise.
+
+(cherry picked from commit f7309df20c4e787041cedc4a6aced89c15259e54)
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ bfd/ChangeLog                                     |  9 +++++++
+ bfd/elfxx-x86.c                                   | 25 ++++++++++++++----
+ ld/ChangeLog                                      | 32 +++++++++++++++++++++++
+ ld/testsuite/ld-i386/i386.exp                     |  2 ++
+ ld/testsuite/ld-i386/pr23486a.d                   | 10 +++++++
+ ld/testsuite/ld-i386/pr23486b.d                   | 10 +++++++
+ ld/testsuite/ld-i386/property-3.r                 |  1 -
+ ld/testsuite/ld-i386/property-4.r                 |  1 -
+ ld/testsuite/ld-i386/property-5.r                 |  1 -
+ ld/testsuite/ld-i386/property-x86-ibt3a.d         |  5 ++--
+ ld/testsuite/ld-i386/property-x86-ibt3b.d         |  5 ++--
+ ld/testsuite/ld-i386/property-x86-shstk3a.d       |  5 ++--
+ ld/testsuite/ld-i386/property-x86-shstk3b.d       |  5 ++--
+ ld/testsuite/ld-x86-64/pr23486a-x32.d             | 10 +++++++
+ ld/testsuite/ld-x86-64/pr23486a.d                 | 10 +++++++
+ ld/testsuite/ld-x86-64/pr23486a.s                 | 30 +++++++++++++++++++++
+ ld/testsuite/ld-x86-64/pr23486b-x32.d             | 10 +++++++
+ ld/testsuite/ld-x86-64/pr23486b.d                 | 10 +++++++
+ ld/testsuite/ld-x86-64/pr23486b.s                 | 30 +++++++++++++++++++++
+ ld/testsuite/ld-x86-64/property-3.r               |  1 -
+ ld/testsuite/ld-x86-64/property-4.r               |  1 -
+ ld/testsuite/ld-x86-64/property-5.r               |  1 -
+ ld/testsuite/ld-x86-64/property-x86-ibt3a-x32.d   |  5 ++--
+ ld/testsuite/ld-x86-64/property-x86-ibt3a.d       |  5 ++--
+ ld/testsuite/ld-x86-64/property-x86-ibt3b-x32.d   |  5 ++--
+ ld/testsuite/ld-x86-64/property-x86-ibt3b.d       |  5 ++--
+ ld/testsuite/ld-x86-64/property-x86-shstk3a-x32.d |  5 ++--
+ ld/testsuite/ld-x86-64/property-x86-shstk3a.d     |  5 ++--
+ ld/testsuite/ld-x86-64/property-x86-shstk3b-x32.d |  5 ++--
+ ld/testsuite/ld-x86-64/property-x86-shstk3b.d     |  5 ++--
+ ld/testsuite/ld-x86-64/x86-64.exp                 |  4 +++
+ 31 files changed, 211 insertions(+), 47 deletions(-)
+ create mode 100644 ld/testsuite/ld-i386/pr23486a.d
+ create mode 100644 ld/testsuite/ld-i386/pr23486b.d
+ create mode 100644 ld/testsuite/ld-x86-64/pr23486a-x32.d
+ create mode 100644 ld/testsuite/ld-x86-64/pr23486a.d
+ create mode 100644 ld/testsuite/ld-x86-64/pr23486a.s
+ create mode 100644 ld/testsuite/ld-x86-64/pr23486b-x32.d
+ create mode 100644 ld/testsuite/ld-x86-64/pr23486b.d
+ create mode 100644 ld/testsuite/ld-x86-64/pr23486b.s
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 2e4ff88..7ccfd25 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2407,12 +2407,27 @@ _bfd_x86_elf_merge_gnu_properties (struct bfd_link_info *info,
+   switch (pr_type)
+     {
+     case GNU_PROPERTY_X86_ISA_1_USED:
++      if (aprop == NULL || bprop == NULL)
++	{
++	  /* Only one of APROP and BPROP can be NULL.  */
++	  if (aprop != NULL)
++	    {
++	      /* Remove this property since the other input file doesn't
++		 have it.  */
++	      aprop->pr_kind = property_remove;
++	      updated = TRUE;
++	    }
++	  break;
++	}
++      goto or_property;
++
+     case GNU_PROPERTY_X86_ISA_1_NEEDED:
+       if (aprop != NULL && bprop != NULL)
+ 	{
++or_property:
+ 	  number = aprop->u.number;
+ 	  aprop->u.number = number | bprop->u.number;
+-	  /* Remove the property if ISA bits are empty.  */
++	  /* Remove the property if all bits are empty.  */
+ 	  if (aprop->u.number == 0)
+ 	    {
+ 	      aprop->pr_kind = property_remove;
+@@ -2428,14 +2443,14 @@ _bfd_x86_elf_merge_gnu_properties (struct bfd_link_info *info,
+ 	    {
+ 	      if (aprop->u.number == 0)
+ 		{
+-		  /* Remove APROP if ISA bits are empty.  */
++		  /* Remove APROP if all bits are empty.  */
+ 		  aprop->pr_kind = property_remove;
+ 		  updated = TRUE;
+ 		}
+ 	    }
+ 	  else
+ 	    {
+-	      /* Return TRUE if APROP is NULL and ISA bits of BPROP
++	      /* Return TRUE if APROP is NULL and all bits of BPROP
+ 		 aren't empty to indicate that BPROP should be added
+ 		 to ABFD.  */
+ 	      updated = bprop->u.number != 0;
+@@ -2582,9 +2597,9 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 	{
+ 	  /* If the separate code program header is needed, make sure
+ 	     that the first read-only PT_LOAD segment has no code by
+-	     adding a GNU_PROPERTY_X86_ISA_1_USED note.  */
++	     adding a GNU_PROPERTY_X86_ISA_1_NEEDED note.  */
+ 	  prop = _bfd_elf_get_property (ebfd,
+-					GNU_PROPERTY_X86_ISA_1_USED,
++					GNU_PROPERTY_X86_ISA_1_NEEDED,
+ 					4);
+ 	  prop->u.number = GNU_PROPERTY_X86_ISA_1_486;
+ 	  prop->pr_kind = property_number;
+diff --git a/ld/testsuite/ld-i386/i386.exp b/ld/testsuite/ld-i386/i386.exp
+index 6d794fe..78dad02 100644
+--- a/ld/testsuite/ld-i386/i386.exp
++++ b/ld/testsuite/ld-i386/i386.exp
+@@ -462,6 +462,8 @@ run_dump_test "pr23189"
+ run_dump_test "pr23194"
+ run_dump_test "pr23372a"
+ run_dump_test "pr23372b"
++run_dump_test "pr23486a"
++run_dump_test "pr23486b"
+
+ if { !([istarget "i?86-*-linux*"]
+        || [istarget "i?86-*-gnu*"]
+diff --git a/ld/testsuite/ld-i386/pr23486a.d b/ld/testsuite/ld-i386/pr23486a.d
+new file mode 100644
+index 0000000..41a6dcf
+--- /dev/null
++++ b/ld/testsuite/ld-i386/pr23486a.d
+@@ -0,0 +1,10 @@
++#source: ../ld-x86-64/pr23486a.s
++#source: ../ld-x86-64/pr23486b.s
++#as: --32
++#ld: -r -m elf_i386
++#readelf: -n
++
++Displaying notes found in: .note.gnu.property
++  Owner                 Data size	Description
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586
+diff --git a/ld/testsuite/ld-i386/pr23486b.d b/ld/testsuite/ld-i386/pr23486b.d
+new file mode 100644
+index 0000000..08019b7
+--- /dev/null
++++ b/ld/testsuite/ld-i386/pr23486b.d
+@@ -0,0 +1,10 @@
++#source: ../ld-x86-64/pr23486b.s
++#source: ../ld-x86-64/pr23486a.s
++#as: --32
++#ld: -r -m elf_i386
++#readelf: -n
++
++Displaying notes found in: .note.gnu.property
++  Owner                 Data size	Description
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586
+diff --git a/ld/testsuite/ld-i386/property-3.r b/ld/testsuite/ld-i386/property-3.r
+index 0ed91f5..d03203c 100644
+--- a/ld/testsuite/ld-i386/property-3.r
++++ b/ld/testsuite/ld-i386/property-3.r
+@@ -3,6 +3,5 @@ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+   GNU                  0x[0-9a-f]+	NT_GNU_PROPERTY_TYPE_0
+       Properties: stack size: 0x800000
+-	x86 ISA used: 586, SSE
+ 	x86 ISA needed: i486, 586
+ #pass
+diff --git a/ld/testsuite/ld-i386/property-4.r b/ld/testsuite/ld-i386/property-4.r
+index cb2bc15..da295eb 100644
+--- a/ld/testsuite/ld-i386/property-4.r
++++ b/ld/testsuite/ld-i386/property-4.r
+@@ -3,6 +3,5 @@ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+   GNU                  0x[0-9a-f]+	NT_GNU_PROPERTY_TYPE_0
+       Properties: stack size: 0x800000
+-	x86 ISA used: i486, 586, SSE
+ 	x86 ISA needed: i486, 586, SSE
+ #pass
+diff --git a/ld/testsuite/ld-i386/property-5.r b/ld/testsuite/ld-i386/property-5.r
+index 5529650..e414159 100644
+--- a/ld/testsuite/ld-i386/property-5.r
++++ b/ld/testsuite/ld-i386/property-5.r
+@@ -3,6 +3,5 @@ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+   GNU                  0x[0-9a-f]+	NT_GNU_PROPERTY_TYPE_0
+       Properties: stack size: 0x900000
+-	x86 ISA used: i486, 586, SSE
+ 	x86 ISA needed: i486, 586, SSE
+ #pass
+diff --git a/ld/testsuite/ld-i386/property-x86-ibt3a.d b/ld/testsuite/ld-i386/property-x86-ibt3a.d
+index 4bb35b0..0aedea1 100644
+--- a/ld/testsuite/ld-i386/property-x86-ibt3a.d
++++ b/ld/testsuite/ld-i386/property-x86-ibt3a.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000018	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: i486, 586, SSE2, SSE3
+-	x86 ISA needed: 586, SSE, SSE3, SSE4_1
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: 586, SSE, SSE3, SSE4_1
+diff --git a/ld/testsuite/ld-i386/property-x86-ibt3b.d b/ld/testsuite/ld-i386/property-x86-ibt3b.d
+index 418d58a..bd69ac6 100644
+--- a/ld/testsuite/ld-i386/property-x86-ibt3b.d
++++ b/ld/testsuite/ld-i386/property-x86-ibt3b.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000018	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: i486, 586, SSE2, SSE3
+-	x86 ISA needed: 586, SSE, SSE3, SSE4_1
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: 586, SSE, SSE3, SSE4_1
+diff --git a/ld/testsuite/ld-i386/property-x86-shstk3a.d b/ld/testsuite/ld-i386/property-x86-shstk3a.d
+index e261038..76d2a39 100644
+--- a/ld/testsuite/ld-i386/property-x86-shstk3a.d
++++ b/ld/testsuite/ld-i386/property-x86-shstk3a.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000018	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: i486, 586, SSE2, SSE3
+-	x86 ISA needed: 586, SSE, SSE3, SSE4_1
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: 586, SSE, SSE3, SSE4_1
+diff --git a/ld/testsuite/ld-i386/property-x86-shstk3b.d b/ld/testsuite/ld-i386/property-x86-shstk3b.d
+index 25f3d23..e770ecf 100644
+--- a/ld/testsuite/ld-i386/property-x86-shstk3b.d
++++ b/ld/testsuite/ld-i386/property-x86-shstk3b.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000018	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: i486, 586, SSE2, SSE3
+-	x86 ISA needed: 586, SSE, SSE3, SSE4_1
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: 586, SSE, SSE3, SSE4_1
+diff --git a/ld/testsuite/ld-x86-64/pr23486a-x32.d b/ld/testsuite/ld-x86-64/pr23486a-x32.d
+new file mode 100644
+index 0000000..6d9fa68
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/pr23486a-x32.d
+@@ -0,0 +1,10 @@
++#source: pr23486a.s
++#source: pr23486b.s
++#as: --x32
++#ld: -r -m elf32_x86_64
++#readelf: -n
++
++Displaying notes found in: .note.gnu.property
++  Owner                 Data size	Description
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586
+diff --git a/ld/testsuite/ld-x86-64/pr23486a.d b/ld/testsuite/ld-x86-64/pr23486a.d
+new file mode 100644
+index 0000000..dc2b7bf
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/pr23486a.d
+@@ -0,0 +1,10 @@
++#source: pr23486a.s
++#source: pr23486b.s
++#as: --64 -defsym __64_bit__=1
++#ld: -r -m elf_x86_64
++#readelf: -n
++
++Displaying notes found in: .note.gnu.property
++  Owner                 Data size	Description
++  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586
+diff --git a/ld/testsuite/ld-x86-64/pr23486a.s b/ld/testsuite/ld-x86-64/pr23486a.s
+new file mode 100644
+index 0000000..a07d0c7
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/pr23486a.s
+@@ -0,0 +1,30 @@
++	.section ".note.gnu.property", "a"
++.ifdef __64_bit__
++	.p2align 3
++.else
++	.p2align 2
++.endif
++	.long 1f - 0f		/* name length.  */
++	.long 4f - 1f		/* data length.  */
++	/* NT_GNU_PROPERTY_TYPE_0 */
++	.long 5			/* note type.  */
++0:
++	.asciz "GNU"		/* vendor name.  */
++1:
++.ifdef __64_bit__
++	.p2align 3
++.else
++	.p2align 2
++.endif
++	/* GNU_PROPERTY_X86_ISA_1_USED */
++	.long 0xc0000000	/* pr_type.  */
++	.long 3f - 2f		/* pr_datasz.  */
++2:
++	.long 0xa
++3:
++.ifdef __64_bit__
++	.p2align 3
++.else
++	.p2align 2
++.endif
++4:
+diff --git a/ld/testsuite/ld-x86-64/pr23486b-x32.d b/ld/testsuite/ld-x86-64/pr23486b-x32.d
+new file mode 100644
+index 0000000..0445e69
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/pr23486b-x32.d
+@@ -0,0 +1,10 @@
++#source: pr23486b.s
++#source: pr23486a.s
++#as: --x32
++#ld: -r -m elf32_x86_64
++#readelf: -n
++
++Displaying notes found in: .note.gnu.property
++  Owner                 Data size	Description
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586
+diff --git a/ld/testsuite/ld-x86-64/pr23486b.d b/ld/testsuite/ld-x86-64/pr23486b.d
+new file mode 100644
+index 0000000..dc2b7bf
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/pr23486b.d
+@@ -0,0 +1,10 @@
++#source: pr23486a.s
++#source: pr23486b.s
++#as: --64 -defsym __64_bit__=1
++#ld: -r -m elf_x86_64
++#readelf: -n
++
++Displaying notes found in: .note.gnu.property
++  Owner                 Data size	Description
++  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586
+diff --git a/ld/testsuite/ld-x86-64/pr23486b.s b/ld/testsuite/ld-x86-64/pr23486b.s
+new file mode 100644
+index 0000000..c5167ee
+--- /dev/null
++++ b/ld/testsuite/ld-x86-64/pr23486b.s
+@@ -0,0 +1,30 @@
++	.section ".note.gnu.property", "a"
++.ifdef __64_bit__
++	.p2align 3
++.else
++	.p2align 2
++.endif
++	.long 1f - 0f		/* name length.  */
++	.long 4f - 1f		/* data length.  */
++	/* NT_GNU_PROPERTY_TYPE_0 */
++	.long 5			/* note type.  */
++0:
++	.asciz "GNU"		/* vendor name.  */
++1:
++.ifdef __64_bit__
++	.p2align 3
++.else
++	.p2align 2
++.endif
++	/* GNU_PROPERTY_X86_ISA_1_NEEDED */
++	.long 0xc0000001	/* pr_type.  */
++	.long 3f - 2f		/* pr_datasz.  */
++2:
++	.long 0x3
++3:
++.ifdef __64_bit__
++	.p2align 3
++.else
++	.p2align 2
++.endif
++4:
+diff --git a/ld/testsuite/ld-x86-64/property-3.r b/ld/testsuite/ld-x86-64/property-3.r
+index 0ed91f5..d03203c 100644
+--- a/ld/testsuite/ld-x86-64/property-3.r
++++ b/ld/testsuite/ld-x86-64/property-3.r
+@@ -3,6 +3,5 @@ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+   GNU                  0x[0-9a-f]+	NT_GNU_PROPERTY_TYPE_0
+       Properties: stack size: 0x800000
+-	x86 ISA used: 586, SSE
+ 	x86 ISA needed: i486, 586
+ #pass
+diff --git a/ld/testsuite/ld-x86-64/property-4.r b/ld/testsuite/ld-x86-64/property-4.r
+index cb2bc15..da295eb 100644
+--- a/ld/testsuite/ld-x86-64/property-4.r
++++ b/ld/testsuite/ld-x86-64/property-4.r
+@@ -3,6 +3,5 @@ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+   GNU                  0x[0-9a-f]+	NT_GNU_PROPERTY_TYPE_0
+       Properties: stack size: 0x800000
+-	x86 ISA used: i486, 586, SSE
+ 	x86 ISA needed: i486, 586, SSE
+ #pass
+diff --git a/ld/testsuite/ld-x86-64/property-5.r b/ld/testsuite/ld-x86-64/property-5.r
+index 5529650..e414159 100644
+--- a/ld/testsuite/ld-x86-64/property-5.r
++++ b/ld/testsuite/ld-x86-64/property-5.r
+@@ -3,6 +3,5 @@ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+   GNU                  0x[0-9a-f]+	NT_GNU_PROPERTY_TYPE_0
+       Properties: stack size: 0x900000
+-	x86 ISA used: i486, 586, SSE
+ 	x86 ISA needed: i486, 586, SSE
+ #pass
+diff --git a/ld/testsuite/ld-x86-64/property-x86-ibt3a-x32.d b/ld/testsuite/ld-x86-64/property-x86-ibt3a-x32.d
+index 011426f..4cec728 100644
+--- a/ld/testsuite/ld-x86-64/property-x86-ibt3a-x32.d
++++ b/ld/testsuite/ld-x86-64/property-x86-ibt3a-x32.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000018	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
+-	x86 ISA needed: i486, 586, SSE2, SSE3
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586, SSE2, SSE3
+diff --git a/ld/testsuite/ld-x86-64/property-x86-ibt3a.d b/ld/testsuite/ld-x86-64/property-x86-ibt3a.d
+index 1b4229a..a8df49a 100644
+--- a/ld/testsuite/ld-x86-64/property-x86-ibt3a.d
++++ b/ld/testsuite/ld-x86-64/property-x86-ibt3a.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000020	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
+-	x86 ISA needed: i486, 586, SSE2, SSE3
++  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586, SSE2, SSE3
+diff --git a/ld/testsuite/ld-x86-64/property-x86-ibt3b-x32.d b/ld/testsuite/ld-x86-64/property-x86-ibt3b-x32.d
+index 290ed6a..c112626 100644
+--- a/ld/testsuite/ld-x86-64/property-x86-ibt3b-x32.d
++++ b/ld/testsuite/ld-x86-64/property-x86-ibt3b-x32.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000018	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
+-	x86 ISA needed: i486, 586, SSE2, SSE3
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586, SSE2, SSE3
+diff --git a/ld/testsuite/ld-x86-64/property-x86-ibt3b.d b/ld/testsuite/ld-x86-64/property-x86-ibt3b.d
+index 1142e03..f10dffd 100644
+--- a/ld/testsuite/ld-x86-64/property-x86-ibt3b.d
++++ b/ld/testsuite/ld-x86-64/property-x86-ibt3b.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000020	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
+-	x86 ISA needed: i486, 586, SSE2, SSE3
++  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586, SSE2, SSE3
+diff --git a/ld/testsuite/ld-x86-64/property-x86-shstk3a-x32.d b/ld/testsuite/ld-x86-64/property-x86-shstk3a-x32.d
+index 819542d..0147a3c 100644
+--- a/ld/testsuite/ld-x86-64/property-x86-shstk3a-x32.d
++++ b/ld/testsuite/ld-x86-64/property-x86-shstk3a-x32.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000018	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
+-	x86 ISA needed: i486, 586, SSE2, SSE3
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586, SSE2, SSE3
+diff --git a/ld/testsuite/ld-x86-64/property-x86-shstk3a.d b/ld/testsuite/ld-x86-64/property-x86-shstk3a.d
+index 4c5d0e0..1f8c2dc 100644
+--- a/ld/testsuite/ld-x86-64/property-x86-shstk3a.d
++++ b/ld/testsuite/ld-x86-64/property-x86-shstk3a.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000020	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
+-	x86 ISA needed: i486, 586, SSE2, SSE3
++  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586, SSE2, SSE3
+diff --git a/ld/testsuite/ld-x86-64/property-x86-shstk3b-x32.d b/ld/testsuite/ld-x86-64/property-x86-shstk3b-x32.d
+index ba181e0..7ca2539 100644
+--- a/ld/testsuite/ld-x86-64/property-x86-shstk3b-x32.d
++++ b/ld/testsuite/ld-x86-64/property-x86-shstk3b-x32.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000018	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
+-	x86 ISA needed: i486, 586, SSE2, SSE3
++  GNU                  0x0000000c	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586, SSE2, SSE3
+diff --git a/ld/testsuite/ld-x86-64/property-x86-shstk3b.d b/ld/testsuite/ld-x86-64/property-x86-shstk3b.d
+index 5216f38..f66a40e 100644
+--- a/ld/testsuite/ld-x86-64/property-x86-shstk3b.d
++++ b/ld/testsuite/ld-x86-64/property-x86-shstk3b.d
+@@ -6,6 +6,5 @@
+
+ Displaying notes found in: .note.gnu.property
+   Owner                 Data size	Description
+-  GNU                  0x00000020	NT_GNU_PROPERTY_TYPE_0
+-      Properties: x86 ISA used: 586, SSE, SSE3, SSE4_1
+-	x86 ISA needed: i486, 586, SSE2, SSE3
++  GNU                  0x00000010	NT_GNU_PROPERTY_TYPE_0
++      Properties: x86 ISA needed: i486, 586, SSE2, SSE3
+diff --git a/ld/testsuite/ld-x86-64/x86-64.exp b/ld/testsuite/ld-x86-64/x86-64.exp
+index 6edb9e8..ae21e55 100644
+--- a/ld/testsuite/ld-x86-64/x86-64.exp
++++ b/ld/testsuite/ld-x86-64/x86-64.exp
+@@ -403,6 +403,10 @@ run_dump_test "pr23372a"
+ run_dump_test "pr23372a-x32"
+ run_dump_test "pr23372b"
+ run_dump_test "pr23372b-x32"
++run_dump_test "pr23486a"
++run_dump_test "pr23486a-x32"
++run_dump_test "pr23486b"
++run_dump_test "pr23486b-x32"
+
+ if { ![istarget "x86_64-*-linux*"] && ![istarget "x86_64-*-nacl*"]} {
+     return
+--
+2.9.3
+
diff --git a/package/binutils/2.31.1/0014-x86-Properly-add-X86_ISA_1_NEEDED-property.patch b/package/binutils/2.31.1/0014-x86-Properly-add-X86_ISA_1_NEEDED-property.patch
new file mode 100644
index 0000000000..a53dfc4e72
--- /dev/null
+++ b/package/binutils/2.31.1/0014-x86-Properly-add-X86_ISA_1_NEEDED-property.patch
@@ -0,0 +1,140 @@
+From 28a27bdbb9500797e6767f80c8128b09112aeed5 Mon Sep 17 00:00:00 2001
+From: "H.J. Lu" <hjl.tools@gmail.com>
+Date: Sat, 11 Aug 2018 06:41:33 -0700
+Subject: [PATCH] x86: Properly add X86_ISA_1_NEEDED property
+
+Existing properties may be removed during property merging.  We avoid
+adding X86_ISA_1_NEEDED property only if existing properties won't be
+removed.
+
+bfd/
+
+	PR ld/23428
+	* elfxx-x86.c (_bfd_x86_elf_link_setup_gnu_properties): Don't
+	add X86_ISA_1_NEEDED property only if existing properties won't
+	be removed.
+
+ld/
+
+	PR ld/23428
+	* testsuite/ld-elf/dummy.s: New file.
+	* testsuite/ld-elf/linux-x86.S: Add X86_FEATURE_1_AND property.
+	* testsuite/ld-elf/linux-x86.exp: Add dummy.s to pr23428.
+
+(cherry picked from commit ab9e342807d132182892de1be1a92d6e91a5c1da)
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+---
+ bfd/ChangeLog                     |  7 +++++++
+ bfd/elfxx-x86.c                   | 28 ++++++++++++++++++++++------
+ ld/ChangeLog                      |  7 +++++++
+ ld/testsuite/ld-elf/dummy.s       |  1 +
+ ld/testsuite/ld-elf/linux-x86.S   | 28 ++++++++++++++++++++++++++++
+ ld/testsuite/ld-elf/linux-x86.exp |  2 +-
+ 6 files changed, 66 insertions(+), 7 deletions(-)
+ create mode 100644 ld/testsuite/ld-elf/dummy.s
+
+diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
+index 7ccfd25..2d8f7b6 100644
+--- a/bfd/elfxx-x86.c
++++ b/bfd/elfxx-x86.c
+@@ -2588,7 +2588,6 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 	  prop->pr_kind = property_number;
+ 	}
+       else if (has_text
+-	       && elf_properties (ebfd) == NULL
+ 	       && elf_tdata (info->output_bfd)->o->build_id.sec == NULL
+ 	       && !htab->elf.dynamic_sections_created
+ 	       && !info->traditional_format
+@@ -2598,11 +2597,28 @@ _bfd_x86_elf_link_setup_gnu_properties
+ 	  /* If the separate code program header is needed, make sure
+ 	     that the first read-only PT_LOAD segment has no code by
+ 	     adding a GNU_PROPERTY_X86_ISA_1_NEEDED note.  */
+-	  prop = _bfd_elf_get_property (ebfd,
+-					GNU_PROPERTY_X86_ISA_1_NEEDED,
+-					4);
+-	  prop->u.number = GNU_PROPERTY_X86_ISA_1_486;
+-	  prop->pr_kind = property_number;
++	  elf_property_list *list;
++	  bfd_boolean need_property = TRUE;
++
++	  for (list = elf_properties (ebfd); list; list = list->next)
++	    switch (list->property.pr_type)
++	      {
++	      case GNU_PROPERTY_STACK_SIZE:
++	      case GNU_PROPERTY_NO_COPY_ON_PROTECTED:
++	      case GNU_PROPERTY_X86_ISA_1_NEEDED:
++		/* These properties won't be removed during merging.  */
++		need_property = FALSE;
++		break;
++	      }
++
++	  if (need_property)
++	    {
++	      prop = _bfd_elf_get_property (ebfd,
++					    GNU_PROPERTY_X86_ISA_1_NEEDED,
++					    4);
++	      prop->u.number = GNU_PROPERTY_X86_ISA_1_486;
++	      prop->pr_kind = property_number;
++	    }
+ 	}
+
+       /* Create the GNU property note section if needed.  */
+diff --git a/ld/testsuite/ld-elf/dummy.s b/ld/testsuite/ld-elf/dummy.s
+new file mode 100644
+index 0000000..403f980
+--- /dev/null
++++ b/ld/testsuite/ld-elf/dummy.s
+@@ -0,0 +1 @@
++# Dummy
+diff --git a/ld/testsuite/ld-elf/linux-x86.S b/ld/testsuite/ld-elf/linux-x86.S
+index bdf40c6..d94abc1 100644
+--- a/ld/testsuite/ld-elf/linux-x86.S
++++ b/ld/testsuite/ld-elf/linux-x86.S
+@@ -61,3 +61,31 @@ syscall:
+ 	ret			/* Return to caller.  */
+ 	.size syscall, .-syscall
+ 	.section .note.GNU-stack,"", at progbits
++
++	.section ".note.gnu.property", "a"
++#ifdef __LP64__
++	.p2align 3
++#else
++	.p2align 2
++#endif
++	.long 1f - 0f		/* name length */
++	.long 5f - 2f		/* data length */
++	.long 5			/* note type */
++0:	.asciz "GNU"		/* vendor name */
++1:
++#ifdef __LP64__
++	.p2align 3
++#else
++	.p2align 2
++#endif
++2:	.long 0xc0000002	/* pr_type.  */
++	.long 4f - 3f		/* pr_datasz.  */
++3:
++	.long 0x2
++4:
++#ifdef __LP64__
++	.p2align 3
++#else
++	.p2align 2
++#endif
++5:
+diff --git a/ld/testsuite/ld-elf/linux-x86.exp b/ld/testsuite/ld-elf/linux-x86.exp
+index 36217c6..f6f5a80 100644
+--- a/ld/testsuite/ld-elf/linux-x86.exp
++++ b/ld/testsuite/ld-elf/linux-x86.exp
+@@ -37,7 +37,7 @@ run_ld_link_exec_tests [list \
+ 	"Run PR ld/23428 test" \
+ 	"--no-dynamic-linker -z separate-code" \
+ 	"" \
+-	{ linux-x86.S pr23428.c } \
++	{ linux-x86.S pr23428.c dummy.s } \
+ 	"pr23428" \
+ 	"pass.out" \
+ 	"$NOPIE_CFLAGS -fno-asynchronous-unwind-tables" \
+--
+2.9.3
+
-- 
2.20.1
