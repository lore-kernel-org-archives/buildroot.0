From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 20:06:41 +0200
Subject: [Buildroot] [git commit] binutils: fix building of Linux kernel for
	ARCv2 ISA
Message-ID: <20150804180711.759BD81687@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d4e2e238a0ea9395152ae71d882d79b1f35094c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the fix for missing .tdata/.tbss sections we unintentionally
introduced a regression for ARCv2 ISA (read ARC HS38) kernel building.

That's what we got on attempt to build kernel:
----------------------------------->8--------------------------------------
  LD      drivers/video/fbdev/built-in.o
arc-linux-ld: ERROR: Attempting to link drivers/video/fbdev/omap2/built-in.o with a binary drivers/video/fbdev/built-in.o of different architecture
arc-linux-ld: failed to merge target specific data of file drivers/video/fbdev/omap2/built-in.o
scripts/Makefile.build:337: recipe for target 'drivers/video/fbdev/built-in.o' failed
make[3]: *** [drivers/video/fbdev/built-in.o] Error 1
scripts/Makefile.build:403: recipe for target 'drivers/video/fbdev' failed
make[2]: *** [drivers/video/fbdev] Error 2
scripts/Makefile.build:403: recipe for target 'drivers/video' failed
make[1]: *** [drivers/video] Error 2
Makefile:944: recipe for target 'drivers' failed
make: *** [drivers] Error 2
----------------------------------->8--------------------------------------

The reason was empty .tdata and .tbss sections in empty archives. And
later empty archives were linked in built-in.o with default architecture
(in our case ARCv1 ISA, read for ARC 700) and then expected failure
happened when objets for different architectures were attempted to link
together.

Now we have a fix for that issue, see
https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/commit/a65b844aed9153789356e098984452df2f5d9058

This fix is in arc-2.23-dev branch and will be a part of the next
release of ARC tools, so then this patch must be removed from buildroot.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-if-the-input-BFD-actually-contains-any-.patch |  132 ++++++++++++++++++++
 1 files changed, 132 insertions(+), 0 deletions(-)

diff --git a/package/binutils/arc-2015.06/0004-Check-to-see-if-the-input-BFD-actually-contains-any-.patch b/package/binutils/arc-2015.06/0004-Check-to-see-if-the-input-BFD-actually-contains-any-.patch
new file mode 100644
index 0000000..fe4808f
--- /dev/null
+++ b/package/binutils/arc-2015.06/0004-Check-to-see-if-the-input-BFD-actually-contains-any-.patch
@@ -0,0 +1,132 @@
+From a65b844aed9153789356e098984452df2f5d9058 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Tue, 4 Aug 2015 12:53:11 +0200
+Subject: [PATCH] Check to see if the input BFD actually contains any sections.
+
+---
+ bfd/elf32-arc.c   | 70 +++++++++++++++++++++++++++++++++++++------------------
+ 1 file changed, 47 insertions(+), 23 deletions(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 38f72b4..76bac6c 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -881,44 +881,68 @@ arc_elf_merge_private_bfd_data (bfd *ibfd, bfd *obfd)
+ {
+   unsigned short mach_ibfd;
+   static unsigned short mach_obfd = EM_NONE;
+-  flagword old_flags;
+-  flagword new_flags;
++  flagword out_flags;
++  flagword in_flags;
++  asection *sec;
++
++   /* Check if we have the same endianess.  */
++  if (! _bfd_generic_verify_endian_match (ibfd, obfd))
++    {
++      _bfd_error_handler (
++			  _("ERROR: Endian Match failed . Attempting to link %B with binary %s \
++of opposite endian-ness"),
++			  ibfd, bfd_get_filename (obfd));
++      return FALSE;
++    }
+ 
+   /* Collect ELF flags. */
+-  new_flags = elf_elfheader (ibfd)->e_flags & EF_ARC_MACH_MSK;
+-  old_flags = elf_elfheader (obfd)->e_flags & EF_ARC_MACH_MSK;
++  in_flags = elf_elfheader (ibfd)->e_flags & EF_ARC_MACH_MSK;
++  out_flags = elf_elfheader (obfd)->e_flags & EF_ARC_MACH_MSK;
+ 
+ #if DEBUG
+-  (*_bfd_error_handler) ("old_flags = 0x%.8lx, new_flags = 0x%.8lx, init = %s, filename = %s",
+-			 old_flags, new_flags, elf_flags_init (obfd) ? "yes" : "no",
++  (*_bfd_error_handler) ("out_flags = 0x%.8lx, in_flags = 0x%.8lx, init = %s, filename = %s",
++			 out_flags, in_flags, elf_flags_init (obfd) ? "yes" : "no",
+ 			 bfd_get_filename (ibfd));
+ #endif
+ 
+   if (!elf_flags_init (obfd))			/* First call, no flags set.  */
+     {
+       elf_flags_init (obfd) = TRUE;
+-      old_flags = new_flags;
++      out_flags = in_flags;
+     }
+ 
+   if (bfd_get_flavour (ibfd) != bfd_target_elf_flavour
+       || bfd_get_flavour (obfd) != bfd_target_elf_flavour)
+     return TRUE;
+ 
+-  if (bfd_count_sections (ibfd) == 0)
+-    return TRUE ; /* For the case of empty archive files */
++  /* Check to see if the input BFD actually contains any sections.  If
++     not, its flags may not have been initialised either, but it
++     cannot actually cause any incompatiblity.  Do not short-circuit
++     dynamic objects; their section list may be emptied by
++     elf_link_add_object_symbols.  */
++  if (!(ibfd->flags & DYNAMIC))
++    {
++      bfd_boolean null_input_bfd = TRUE;
++      bfd_boolean only_data_sections = TRUE;
+ 
+-  mach_ibfd = elf_elfheader (ibfd)->e_machine;
++      for (sec = ibfd->sections; sec != NULL; sec = sec->next)
++	{
++	  if ((bfd_get_section_flags (ibfd, sec)
++	       & (SEC_LOAD | SEC_CODE | SEC_HAS_CONTENTS))
++	      == (SEC_LOAD | SEC_CODE | SEC_HAS_CONTENTS))
++	    only_data_sections = FALSE;
+ 
+-   /* Check if we have the same endianess.  */
+-  if (! _bfd_generic_verify_endian_match (ibfd, obfd))
+-    {
+-      _bfd_error_handler (_("\
+-ERROR: Endian Match failed . Attempting to link %B with binary %s \
+-of opposite endian-ness"),
+-			  ibfd, bfd_get_filename (obfd));
+-      return FALSE;
++	  null_input_bfd = FALSE;
++	  break;
++	}
++
++      if (null_input_bfd || only_data_sections)
++	return TRUE;
+     }
+ 
++
++  /* Complain about various flag/architecture mismatches.  */
++  mach_ibfd = elf_elfheader (ibfd)->e_machine;
+   if (mach_obfd == EM_NONE)
+     {
+       mach_obfd = mach_ibfd;
+@@ -932,23 +956,23 @@ with a binary %s of different architecture"),
+ 			      ibfd, bfd_get_filename (obfd));
+ 	  return FALSE;
+ 	}
+-      else if (new_flags != old_flags)
++      else if (in_flags != out_flags)
+ 	{
+ 	  /* Warn if different flags. */
+ 	  (*_bfd_error_handler)
+ 	    (_("%s: uses different e_flags (0x%lx) fields than previous modules (0x%lx)"),
+-	     bfd_get_filename (ibfd), (long)new_flags, (long)old_flags);
+-	  if (new_flags && old_flags)
++	     bfd_get_filename (ibfd), (long)in_flags, (long)out_flags);
++	  if (in_flags && out_flags)
+ 	    return FALSE;
+ 	  /* MWDT doesnt set the eflags hence make sure we choose the
+ 	     eflags set by gcc.  */
+-	  new_flags = new_flags > old_flags ? new_flags : old_flags;
++	  in_flags = in_flags > out_flags ? in_flags : out_flags;
+ 	}
+ 
+     }
+ 
+   /* Update the flags. */
+-  elf_elfheader (obfd)->e_flags = new_flags;
++  elf_elfheader (obfd)->e_flags = in_flags;
+ 
+   if (bfd_get_mach (obfd) < bfd_get_mach (ibfd))
+     {
+-- 
+2.4.3
+
