From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 18 Jan 2016 13:17:31 +0300
Subject: [Buildroot] [PATCH] ARC: bump tools to arc-2015.12-rc1
Message-ID: <1453112251-13965-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change introduces newer ARC toolchain in Buildroot.
Note this is the first release candidate and we'll probably see another
RC before cutting the final release.

That new arc-2015.12 release doesn't bring any significant changes but
mostly is focused on fixes and minor improvements here and there.
Most noticeable changes are:
 * GCC updated to v4.8.5
 * GDB updated to 7.10

Here you may find more info on fixes and improvements in that release:
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.12-rc1

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: arc-buildroot at synopsys.com
---
 package/binutils/Config.in.host                    |   2 +-
 .../0002-ld-arc-Provide-the-.tdata-symbol.patch    | 145 ---------------------
 .../arc-2015.06/0003-Provide-.tbss-symbol.patch    |  70 ----------
 ...e-if-the-input-BFD-actually-contains-any-.patch | 132 -------------------
 ...tire-object-if-it-contains-only-data-sect.patch |  35 -----
 .../0001-PR-other-56780.patch                      |   0
 .../600-poison-system-directories.patch            |   0
 package/binutils/binutils.hash                     |   2 +-
 package/binutils/binutils.mk                       |   2 +-
 package/gcc/Config.in.host                         |   2 +-
 ...iate-between-a-bss-TLS-initialized-symbol.patch |  42 ------
 .../0001-Handle-correctly-compare-arguments.patch  |  71 ----------
 .../100-libstdcxx-uclibc-c99.patch                 |   0
 .../851-PR-other-56780.patch                       |   0
 package/gcc/gcc.hash                               |   2 +-
 package/gdb/Config.in.host                         |   2 +-
 package/gdb/gdb.hash                               |   2 +-
 17 files changed, 7 insertions(+), 502 deletions(-)
 delete mode 100644 package/binutils/arc-2015.06/0002-ld-arc-Provide-the-.tdata-symbol.patch
 delete mode 100644 package/binutils/arc-2015.06/0003-Provide-.tbss-symbol.patch
 delete mode 100644 package/binutils/arc-2015.06/0004-Check-to-see-if-the-input-BFD-actually-contains-any-.patch
 delete mode 100644 package/binutils/arc-2015.06/0005-Test-the-entire-object-if-it-contains-only-data-sect.patch
 rename package/binutils/{arc-2015.06 => arc-2015.12-rc1}/0001-PR-other-56780.patch (100%)
 rename package/binutils/{arc-2015.06 => arc-2015.12-rc1}/600-poison-system-directories.patch (100%)
 delete mode 100644 package/gcc/arc-2015.06/0001-Differentiate-between-a-bss-TLS-initialized-symbol.patch
 delete mode 100644 package/gcc/arc-2015.06/0001-Handle-correctly-compare-arguments.patch
 rename package/gcc/{arc-2015.06 => arc-2015.12-rc1}/100-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{arc-2015.06 => arc-2015.12-rc1}/851-PR-other-56780.patch (100%)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index f6aac5c..7a04d39 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -28,7 +28,7 @@ endchoice
 
 config BR2_BINUTILS_VERSION
 	string
-	default "arc-2015.06"	if BR2_arc
+	default "arc-2015.12-rc1"	if BR2_arc
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_X
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
diff --git a/package/binutils/arc-2015.06/0002-ld-arc-Provide-the-.tdata-symbol.patch b/package/binutils/arc-2015.06/0002-ld-arc-Provide-the-.tdata-symbol.patch
deleted file mode 100644
index 40341a5..0000000
--- a/package/binutils/arc-2015.06/0002-ld-arc-Provide-the-.tdata-symbol.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From daf1ff839fc68ef31e3263780de4604a95118702 Mon Sep 17 00:00:00 2001
-From: Andrew Burgess <andrew.burgess@embecosm.com>
-Date: Thu, 23 Jul 2015 14:44:15 +0100
-Subject: [PATCH 1/2] ld/arc: Provide the .tdata symbol.
-
-When creating local dynamic tls access we rely on a .tdata symbol being
-available to link against.  Normally, this is fine, as content is placed
-into the .tdata section the linker makes a .tdata symbol available and
-all is fine.
-
-However, these linker created section symbols only exist for input
-sections, not output sections, so, when we assemble with
--fdata-sections, and the content is placed not into '.tdata', but into
-sections like, '.tdata.variable' we end up in a situation where there is
-no input section called '.tdata', and so the linker does not create a
-symbol called '.tdata' for us, at which point the link fails.
-
-The solution it to have the linker script explicitly provide the symbol
-'.tdata', this should ensure that the symbol is always available.
-
-ld/ChangeLog:
-
-	* scripttempl/arclinux.sc (.tdata): Provide the .tdata symbol.
-
-ld/testsuite/ChangeLog:
-
-	* ld/testsuite/ld-arc/arc.exp: Run new test.
-	* ld/testsuite/ld-arc/tls-data-sections.d: New file.
-	* ld/testsuite/ld-arc/tls-data-sections.s: New file.
----
- ld/ChangeLog.ARC                        |  4 ++++
- ld/scripttempl/arclinux.sc              |  2 +-
- ld/testsuite/ChangeLog.ARC              |  6 ++++++
- ld/testsuite/ld-arc/arc.exp             |  1 +
- ld/testsuite/ld-arc/tls-data-sections.d | 12 ++++++++++++
- ld/testsuite/ld-arc/tls-data-sections.s | 30 ++++++++++++++++++++++++++++++
- 6 files changed, 54 insertions(+), 1 deletion(-)
- create mode 100644 ld/testsuite/ld-arc/tls-data-sections.d
- create mode 100644 ld/testsuite/ld-arc/tls-data-sections.s
-
-diff --git a/ld/ChangeLog.ARC b/ld/ChangeLog.ARC
-index fac6f48..0006bb3 100644
---- a/ld/ChangeLog.ARC
-+++ b/ld/ChangeLog.ARC
-@@ -1,3 +1,7 @@
-+2015-07-23  Andrew Burgess  <andrew.burgess@embecosm.com>
-+
-+	* scripttempl/arclinux.sc (.tdata): Provide the .tdata symbol.
-+
- 2015-03-26: Claudiu Zissulescu <claziss@synopsys.com>
- 
- 	* testsuite/ld-arc/sda_relocs.d: New file.
-diff --git a/ld/scripttempl/arclinux.sc b/ld/scripttempl/arclinux.sc
-index 9d43ca3..1385b30 100644
---- a/ld/scripttempl/arclinux.sc
-+++ b/ld/scripttempl/arclinux.sc
-@@ -326,7 +326,7 @@ cat <<EOF
-   .data1        ${RELOCATING-0} : { *(.data1) }
-   /* TLS local dynamic uses .tdata as a reference point.  */
-   ${RELOCATING+${CREATE_SHLIB+PROVIDE_HIDDEN (.tdata = .);}}
--  .tdata	${RELOCATING-0} : { *(.tdata${RELOCATING+ .tdata.* .gnu.linkonce.td.*}) }
-+  .tdata	${RELOCATING-0} : { PROVIDE_HIDDEN(.tdata = .); *(.tdata${RELOCATING+ .tdata.* .gnu.linkonce.td.*}) }
-   .tbss		${RELOCATING-0} : { *(.tbss${RELOCATING+ .tbss.* .gnu.linkonce.tb.*})${RELOCATING+ *(.tcommon)} }
-   .eh_frame     ${RELOCATING-0} : { KEEP (*(.eh_frame)) }
-   .gcc_except_table ${RELOCATING-0} : { *(.gcc_except_table) }
-diff --git a/ld/testsuite/ChangeLog.ARC b/ld/testsuite/ChangeLog.ARC
-index b6d3eff..79f7ea9 100644
---- a/ld/testsuite/ChangeLog.ARC
-+++ b/ld/testsuite/ChangeLog.ARC
-@@ -1,3 +1,9 @@
-+2015-07-23  Andrew Burgess  <andrew.burgess@embecosm.com>
-+
-+	* ld/testsuite/ld-arc/arc.exp: Run new test.
-+	* ld/testsuite/ld-arc/tls-data-sections.d: New file.
-+	* ld/testsuite/ld-arc/tls-data-sections.s: New file.
-+
- 2015-06-06  Andrew Burgess  <andrew.burgess@embecosm.com>
- 
- 	* ld-arc/unaligned-pc32.d: New file.
-diff --git a/ld/testsuite/ld-arc/arc.exp b/ld/testsuite/ld-arc/arc.exp
-index d2bfafe..74ab458 100644
---- a/ld/testsuite/ld-arc/arc.exp
-+++ b/ld/testsuite/ld-arc/arc.exp
-@@ -47,3 +47,4 @@ if {[check_shared_lib_support]} {
- 
- run_dump_test "sda_relocs"
- run_dump_test "unaligned-pc32"
-+run_dump_test "tls-data-sections"
-diff --git a/ld/testsuite/ld-arc/tls-data-sections.d b/ld/testsuite/ld-arc/tls-data-sections.d
-new file mode 100644
-index 0000000..9823bf0
---- /dev/null
-+++ b/ld/testsuite/ld-arc/tls-data-sections.d
-@@ -0,0 +1,12 @@
-+#source: tls-data-sections.s
-+#ld: --entry=main
-+#objdump: -rd
-+
-+
-+.*:     file format elf32-littlearc
-+
-+
-+Disassembly of section \.text:
-+
-+00010094 <main>:
-+   10094:	00 21 80 3f 00 00 08 00 	add        r0,r25,8
-diff --git a/ld/testsuite/ld-arc/tls-data-sections.s b/ld/testsuite/ld-arc/tls-data-sections.s
-new file mode 100644
-index 0000000..f0450c0
---- /dev/null
-+++ b/ld/testsuite/ld-arc/tls-data-sections.s
-@@ -0,0 +1,30 @@
-+        /* This file is not intended to be real code, however, the
-+           contents of the main function is real code as generated as
-+           part of a local dynamic tls model access.  The purpose of
-+           this test is to check that such an access will link
-+           correctly.
-+
-+           Notice that the relocation in main references '.tdata', and
-+           though we put content into '.tdata.pgsz.1362' we don't
-+           create a '.tdata' section.  This is intentional, this example
-+           was generated using -fdata-sections.
-+
-+           The '.tdata' section will be created in the linker script,
-+           and we do expect to be able to reference it.  This should link.
-+        */
-+
-+        .section ".text", "ax"
-+        .global main, _start
-+_start: 
-+        .type   main, @function
-+main:
-+        add r0,pcl, at .tdata@tlsgd                ;8
-+        .size   main, .-main
-+
-+        .section        .tdata.pgsz.1362,"awT", at progbits
-+        .align 8
-+        .type   pgsz.1362, @object
-+        .size   pgsz.1362, 4
-+
-+pgsz.1362:
-+        .word   1
--- 
-2.4.3
-
diff --git a/package/binutils/arc-2015.06/0003-Provide-.tbss-symbol.patch b/package/binutils/arc-2015.06/0003-Provide-.tbss-symbol.patch
deleted file mode 100644
index 34bb2a2..0000000
--- a/package/binutils/arc-2015.06/0003-Provide-.tbss-symbol.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From a6014a956a4f2263c28240bb9191bee8f924b5db Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Tue, 28 Jul 2015 13:34:47 +0200
-Subject: [PATCH 2/2] Provide .tbss symbol
-
----
- ld/ChangeLog.ARC           | 14 +++++++++-----
- ld/scripttempl/arclinux.sc |  2 +-
- 2 files changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/ld/ChangeLog.ARC b/ld/ChangeLog.ARC
-index 0006bb3..fb5c717 100644
---- a/ld/ChangeLog.ARC
-+++ b/ld/ChangeLog.ARC
-@@ -1,8 +1,12 @@
-+2015-07-28  Claudiu Zissulescu  <claziss@synopsys.com>
-+
-+	* scripttempl/arclinux.sc (.tbss): Provide the .tbss symbol.
-+
- 2015-07-23  Andrew Burgess  <andrew.burgess@embecosm.com>
- 
- 	* scripttempl/arclinux.sc (.tdata): Provide the .tdata symbol.
- 
--2015-03-26: Claudiu Zissulescu <claziss@synopsys.com>
-+2015-03-26  Claudiu Zissulescu <claziss@synopsys.com>
- 
- 	* testsuite/ld-arc/sda_relocs.d: New file.
- 	* testsuite/ld-arc/sda_relocs.ld: Likewise.
-@@ -13,21 +17,21 @@
- 	* scripttempl/arclinux.sc: PROVIDE_HIDDEN .tdata (in case the
- 	section won't be included).
- 
--2014-12-17: Claudiu Zissulescu <claziss@synopsys.com>
-+2014-12-17  Claudiu Zissulescu  <claziss@synopsys.com>
- 
- 	* scripttempl/elfarcv2.sc: Update .startup section.
- 
--2014-12-08: Claudiu Zissulescu <claziss@synopsys.com>
-+2014-12-08  Claudiu Zissulescu  <claziss@synopsys.com>
- 
- 	* emulparams/arcv2elf.sh :Add discarded sections.
- 	* emulparams/arcv2elfb.sh: Likewise
- 	* scripttempl/elfarcv2.sc: New sections.
- 
--2014-12-01: Claudiu Zissulescu <claziss@synopsys.com>
-+2014-12-01  Claudiu Zissulescu  <claziss@synopsys.com>
- 
- 	* scripttempl/elfarcv2.sc: Align the start of the stack.
- 
--2014-11-27: Claudiu Zissulescu <claziss@synopsys.com>
-+2014-11-27  Claudiu Zissulescu  <claziss@synopsys.com>
- 
- 	* Makefile.am: Add two new emulation scripts for ARCv2.
- 	* configure.tgt: Likewise.
-diff --git a/ld/scripttempl/arclinux.sc b/ld/scripttempl/arclinux.sc
-index 1385b30..bef5336 100644
---- a/ld/scripttempl/arclinux.sc
-+++ b/ld/scripttempl/arclinux.sc
-@@ -327,7 +327,7 @@ cat <<EOF
-   /* TLS local dynamic uses .tdata as a reference point.  */
-   ${RELOCATING+${CREATE_SHLIB+PROVIDE_HIDDEN (.tdata = .);}}
-   .tdata	${RELOCATING-0} : { PROVIDE_HIDDEN(.tdata = .); *(.tdata${RELOCATING+ .tdata.* .gnu.linkonce.td.*}) }
--  .tbss		${RELOCATING-0} : { *(.tbss${RELOCATING+ .tbss.* .gnu.linkonce.tb.*})${RELOCATING+ *(.tcommon)} }
-+  .tbss		${RELOCATING-0} : { PROVIDE_HIDDEN(.tbss = .); *(.tbss${RELOCATING+ .tbss.* .gnu.linkonce.tb.*})${RELOCATING+ *(.tcommon)} }
-   .eh_frame     ${RELOCATING-0} : { KEEP (*(.eh_frame)) }
-   .gcc_except_table ${RELOCATING-0} : { *(.gcc_except_table) }
-   ${WRITABLE_RODATA+${RODATA}}
--- 
-2.4.3
-
diff --git a/package/binutils/arc-2015.06/0004-Check-to-see-if-the-input-BFD-actually-contains-any-.patch b/package/binutils/arc-2015.06/0004-Check-to-see-if-the-input-BFD-actually-contains-any-.patch
deleted file mode 100644
index fe4808f..0000000
--- a/package/binutils/arc-2015.06/0004-Check-to-see-if-the-input-BFD-actually-contains-any-.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From a65b844aed9153789356e098984452df2f5d9058 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Tue, 4 Aug 2015 12:53:11 +0200
-Subject: [PATCH] Check to see if the input BFD actually contains any sections.
-
----
- bfd/elf32-arc.c   | 70 +++++++++++++++++++++++++++++++++++++------------------
- 1 file changed, 47 insertions(+), 23 deletions(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 38f72b4..76bac6c 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -881,44 +881,68 @@ arc_elf_merge_private_bfd_data (bfd *ibfd, bfd *obfd)
- {
-   unsigned short mach_ibfd;
-   static unsigned short mach_obfd = EM_NONE;
--  flagword old_flags;
--  flagword new_flags;
-+  flagword out_flags;
-+  flagword in_flags;
-+  asection *sec;
-+
-+   /* Check if we have the same endianess.  */
-+  if (! _bfd_generic_verify_endian_match (ibfd, obfd))
-+    {
-+      _bfd_error_handler (
-+			  _("ERROR: Endian Match failed . Attempting to link %B with binary %s \
-+of opposite endian-ness"),
-+			  ibfd, bfd_get_filename (obfd));
-+      return FALSE;
-+    }
- 
-   /* Collect ELF flags. */
--  new_flags = elf_elfheader (ibfd)->e_flags & EF_ARC_MACH_MSK;
--  old_flags = elf_elfheader (obfd)->e_flags & EF_ARC_MACH_MSK;
-+  in_flags = elf_elfheader (ibfd)->e_flags & EF_ARC_MACH_MSK;
-+  out_flags = elf_elfheader (obfd)->e_flags & EF_ARC_MACH_MSK;
- 
- #if DEBUG
--  (*_bfd_error_handler) ("old_flags = 0x%.8lx, new_flags = 0x%.8lx, init = %s, filename = %s",
--			 old_flags, new_flags, elf_flags_init (obfd) ? "yes" : "no",
-+  (*_bfd_error_handler) ("out_flags = 0x%.8lx, in_flags = 0x%.8lx, init = %s, filename = %s",
-+			 out_flags, in_flags, elf_flags_init (obfd) ? "yes" : "no",
- 			 bfd_get_filename (ibfd));
- #endif
- 
-   if (!elf_flags_init (obfd))			/* First call, no flags set.  */
-     {
-       elf_flags_init (obfd) = TRUE;
--      old_flags = new_flags;
-+      out_flags = in_flags;
-     }
- 
-   if (bfd_get_flavour (ibfd) != bfd_target_elf_flavour
-       || bfd_get_flavour (obfd) != bfd_target_elf_flavour)
-     return TRUE;
- 
--  if (bfd_count_sections (ibfd) == 0)
--    return TRUE ; /* For the case of empty archive files */
-+  /* Check to see if the input BFD actually contains any sections.  If
-+     not, its flags may not have been initialised either, but it
-+     cannot actually cause any incompatiblity.  Do not short-circuit
-+     dynamic objects; their section list may be emptied by
-+     elf_link_add_object_symbols.  */
-+  if (!(ibfd->flags & DYNAMIC))
-+    {
-+      bfd_boolean null_input_bfd = TRUE;
-+      bfd_boolean only_data_sections = TRUE;
- 
--  mach_ibfd = elf_elfheader (ibfd)->e_machine;
-+      for (sec = ibfd->sections; sec != NULL; sec = sec->next)
-+	{
-+	  if ((bfd_get_section_flags (ibfd, sec)
-+	       & (SEC_LOAD | SEC_CODE | SEC_HAS_CONTENTS))
-+	      == (SEC_LOAD | SEC_CODE | SEC_HAS_CONTENTS))
-+	    only_data_sections = FALSE;
- 
--   /* Check if we have the same endianess.  */
--  if (! _bfd_generic_verify_endian_match (ibfd, obfd))
--    {
--      _bfd_error_handler (_("\
--ERROR: Endian Match failed . Attempting to link %B with binary %s \
--of opposite endian-ness"),
--			  ibfd, bfd_get_filename (obfd));
--      return FALSE;
-+	  null_input_bfd = FALSE;
-+	  break;
-+	}
-+
-+      if (null_input_bfd || only_data_sections)
-+	return TRUE;
-     }
- 
-+
-+  /* Complain about various flag/architecture mismatches.  */
-+  mach_ibfd = elf_elfheader (ibfd)->e_machine;
-   if (mach_obfd == EM_NONE)
-     {
-       mach_obfd = mach_ibfd;
-@@ -932,23 +956,23 @@ with a binary %s of different architecture"),
- 			      ibfd, bfd_get_filename (obfd));
- 	  return FALSE;
- 	}
--      else if (new_flags != old_flags)
-+      else if (in_flags != out_flags)
- 	{
- 	  /* Warn if different flags. */
- 	  (*_bfd_error_handler)
- 	    (_("%s: uses different e_flags (0x%lx) fields than previous modules (0x%lx)"),
--	     bfd_get_filename (ibfd), (long)new_flags, (long)old_flags);
--	  if (new_flags && old_flags)
-+	     bfd_get_filename (ibfd), (long)in_flags, (long)out_flags);
-+	  if (in_flags && out_flags)
- 	    return FALSE;
- 	  /* MWDT doesnt set the eflags hence make sure we choose the
- 	     eflags set by gcc.  */
--	  new_flags = new_flags > old_flags ? new_flags : old_flags;
-+	  in_flags = in_flags > out_flags ? in_flags : out_flags;
- 	}
- 
-     }
- 
-   /* Update the flags. */
--  elf_elfheader (obfd)->e_flags = new_flags;
-+  elf_elfheader (obfd)->e_flags = in_flags;
- 
-   if (bfd_get_mach (obfd) < bfd_get_mach (ibfd))
-     {
--- 
-2.4.3
-
diff --git a/package/binutils/arc-2015.06/0005-Test-the-entire-object-if-it-contains-only-data-sect.patch b/package/binutils/arc-2015.06/0005-Test-the-entire-object-if-it-contains-only-data-sect.patch
deleted file mode 100644
index 2cc96fc..0000000
--- a/package/binutils/arc-2015.06/0005-Test-the-entire-object-if-it-contains-only-data-sect.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 5df50c61083165455aae5504c5c3566fa5ccebb1 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Fri, 16 Oct 2015 10:21:21 +0200
-Subject: [PATCH] Test the entire object if it contains only data sections.
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 76bac6c..eb4f8e0 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -915,11 +915,9 @@ of opposite endian-ness"),
-       || bfd_get_flavour (obfd) != bfd_target_elf_flavour)
-     return TRUE;
- 
--  /* Check to see if the input BFD actually contains any sections.  If
--     not, its flags may not have been initialised either, but it
--     cannot actually cause any incompatiblity.  Do not short-circuit
--     dynamic objects; their section list may be emptied by
--     elf_link_add_object_symbols.  */
-+  /* Check to see if the input BFD actually contains any sections.  Do
-+     not short-circuit dynamic objects; their section list may be
-+     emptied by elf_link_add_object_symbols.  */
-   if (!(ibfd->flags & DYNAMIC))
-     {
-       bfd_boolean null_input_bfd = TRUE;
-@@ -933,7 +931,6 @@ of opposite endian-ness"),
- 	    only_data_sections = FALSE;
- 
- 	  null_input_bfd = FALSE;
--	  break;
- 	}
- 
-       if (null_input_bfd || only_data_sections)
--- 
-2.4.3
-
diff --git a/package/binutils/arc-2015.06/0001-PR-other-56780.patch b/package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch
similarity index 100%
rename from package/binutils/arc-2015.06/0001-PR-other-56780.patch
rename to package/binutils/arc-2015.12-rc1/0001-PR-other-56780.patch
diff --git a/package/binutils/arc-2015.06/600-poison-system-directories.patch b/package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/arc-2015.06/600-poison-system-directories.patch
rename to package/binutils/arc-2015.12-rc1/600-poison-system-directories.patch
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 51499f0..5d4ddb3 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -4,4 +4,4 @@ sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none   xxx  binutils-arc-2015.06.tar.gz
+none   xxx  binutils-arc-2015.12-rc1.tar.gz
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 2074fae..7c5955e 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2015.06
+BINUTILS_VERSION = arc-2015.12-rc1
 else
 BINUTILS_VERSION = 2.24
 endif
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 57cafa4..4184ac7 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -114,7 +114,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.3.0"     if BR2_GCC_VERSION_5_X
-	default "arc-2015.06" if BR2_GCC_VERSION_4_8_ARC
+	default "arc-2015.12-rc1" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/arc-2015.06/0001-Differentiate-between-a-bss-TLS-initialized-symbol.patch b/package/gcc/arc-2015.06/0001-Differentiate-between-a-bss-TLS-initialized-symbol.patch
deleted file mode 100644
index 7a86b62..0000000
--- a/package/gcc/arc-2015.06/0001-Differentiate-between-a-bss-TLS-initialized-symbol.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 366cc86e4f8ff6f00f0b731dc6f78d22c7ac9e0a Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Tue, 7 Jul 2015 17:59:52 +0200
-Subject: [PATCH] Differentiate between a bss TLS initialized symbol.
-
-Back-port from https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/366cc86e4f8ff6f00f0b731dc6f78d22c7ac9e0a
-
-This patch fixes "undefined reference to .tdata" observed in many autobuilder
-results for ARC.
-
-Once the next release of ARC GNU tools happens this patch must be removed from
-Buildroot.
-
----
- gcc/config/arc/arc.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index b6eb3b5..73c3a87 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -5262,10 +5262,15 @@ arc_legitimize_tls_address (rtx addr, enum tls_model model)
-     {
-     case TLS_MODEL_LOCAL_DYNAMIC:
-       rtx base;
--      tree base_decl; base_decl
--	= lookup_attribute ("tls9", DECL_ATTRIBUTES (SYMBOL_REF_DECL (addr)));
-+      tree base_decl, decl;
-+      decl = SYMBOL_REF_DECL (addr);
-+      base_decl = lookup_attribute ("tls9", DECL_ATTRIBUTES (decl));
-       const char *base_name; base_name = DTPOFF_ZERO_SYM;
-       rtvec v;
-+
-+      if (bss_initializer_p (decl))
-+	base_name = ".tbss";
-+
-       if (base_decl && TREE_VALUE (base_decl)
- 	  && TREE_VALUE (TREE_VALUE (base_decl)))
- 	{
--- 
-2.4.3
-
diff --git a/package/gcc/arc-2015.06/0001-Handle-correctly-compare-arguments.patch b/package/gcc/arc-2015.06/0001-Handle-correctly-compare-arguments.patch
deleted file mode 100644
index b9a60d9..0000000
--- a/package/gcc/arc-2015.06/0001-Handle-correctly-compare-arguments.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From b4035128ba8f8bbbf9527f54f261a87b304ca4c5 Mon Sep 17 00:00:00 2001
-From: Claudiu Zissulescu <claziss@synopsys.com>
-Date: Mon, 9 Nov 2015 15:23:39 +0100
-Subject: [PATCH] Handle correctly compare arguments
-
----
- gcc/config/arc/arc.c | 24 ++++++++++++++++++------
- 1 files changed, 18 insertions(+), 6 deletions(-)
-
-diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
-index bd53525..caf483b 100644
---- a/gcc/config/arc/arc.c
-+++ b/gcc/config/arc/arc.c
-@@ -1998,7 +1998,7 @@ gen_compare_reg (rtx comparison, enum machine_mode omode)
-   rtx y = XEXP (comparison, 1);
-   rtx tmp, cc_reg;
-   enum machine_mode mode, cmode;
--
-+  bool swap = false;
- 
-   cmode = GET_MODE (x);
-   if (cmode == VOIDmode)
-@@ -2073,6 +2073,7 @@ gen_compare_reg (rtx comparison, enum machine_mode omode)
-       rtx op0 = gen_rtx_REG (cmode, 0);
-       rtx op1 = gen_rtx_REG (cmode, GET_MODE_SIZE (cmode) / UNITS_PER_WORD);
- 
-+      swap = false;
-       switch (code)
- 	{
- 	case NE: case EQ: case GT: case UNLE: case GE: case UNLT:
-@@ -2080,22 +2081,33 @@ gen_compare_reg (rtx comparison, enum machine_mode omode)
- 	  break;
- 	case LT: case UNGE: case LE: case UNGT:
- 	  code = swap_condition (code);
--	  tmp = x;
--	  x = y;
--	  y = tmp;
-+	  swap = true;
- 	  break;
- 	default:
- 	  gcc_unreachable ();
- 	}
-       if (currently_expanding_to_rtl)
- 	{
--	  emit_move_insn (op0, x);
--	  emit_move_insn (op1, y);
-+	  if (swap)
-+	    {
-+	      emit_move_insn (op0, y);
-+	      emit_move_insn (op1, x);
-+	    }
-+	  else
-+	    {
-+	      emit_move_insn (op0, x);
-+	      emit_move_insn (op1, y);
-+	    }
- 	}
-       else
- 	{
- 	  gcc_assert (rtx_equal_p (op0, x));
- 	  gcc_assert (rtx_equal_p (op1, y));
-+	  if (swap)
-+	    {
-+	      op0 = y;
-+	      op1 = x;
-+	    }
- 	}
-       emit_insn (gen_cmp_float (cc_reg, gen_rtx_COMPARE (mode, op0, op1)));
-     }
--- 
-2.5.0
diff --git a/package/gcc/arc-2015.06/100-libstdcxx-uclibc-c99.patch b/package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/arc-2015.06/100-libstdcxx-uclibc-c99.patch
rename to package/gcc/arc-2015.12-rc1/100-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/arc-2015.06/851-PR-other-56780.patch b/package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch
similarity index 100%
rename from package/gcc/arc-2015.06/851-PR-other-56780.patch
rename to package/gcc/arc-2015.12-rc1/851-PR-other-56780.patch
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 0a05151..064a727 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -9,4 +9,4 @@ sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a31
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/sha512.sum
 sha512  d619847383405fd389f5a2d7225f97fedb01f81478dbb8339047ccba7561a5c20045ab500a8744bffd19ea51892ce09fc37f862f2cfcb42de0f0f8cd8f8da37a  gcc-5.3.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-none  xxx  gcc-arc-2015.06.tar.gz
+none  xxx  gcc-arc-2015.12-rc1.tar.gz
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 6bf7e84..d5f08b2 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -52,7 +52,7 @@ endif
 config BR2_GDB_VERSION
 	string
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
-	default "arc-2015.06-gdb" if BR2_arc
+	default "arc-2015.12-rc1-gdb" if BR2_arc
 	default "6be65fb56ea6694a9260733a536a023a1e2d4d57" if BR2_microblaze
 	default "7.7.1"    if BR2_GDB_VERSION_7_7
 	default "7.8.2"	   if BR2_GDB_VERSION_7_8
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index b511a3e..64bc501 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -4,5 +4,5 @@ sha512	face5bf1b4ce144fc8604fc84620beed956177a11fd632b4e41906fc7f632910b2b43a50e
 sha512	eebdf88b24e52e792b8a4b89ea85790de72b462a7810b44975fdf4232c068f353b15506071f450102a9d4bcecdde8e93dc3748a10699b7f73f3e04fb2d9d8414	gdb-7.9.1.tar.xz
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 # No hash for the ARC & microblaze variants, comes from the github-helper:
-none	xxx	gdb-arc-2015.06-gdb.tar.gz
+none	xxx	gdb-arc-2015.12-rc1-gdb.tar.gz
 none	xxx	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
-- 
2.4.3
