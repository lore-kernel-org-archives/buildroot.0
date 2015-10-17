From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 16:16:53 +0200
Subject: [Buildroot] [git commit] binutils: fix building perf on ARC
Message-ID: <20151017141702.7135080497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5642c89e70255d93a5b6523123001d5c09651307
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It turned out one of the previous fixes (required to build Linux
kernel)
------------------>8-------------------
ARC Binutils: https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/commit/a65b844aed9153789356e098984452df2f5d9058
Buildroot: http://git.buildroot.net/buildroot/commit/?id=2d4e2e238a0ea9395152ae71d882d79b1f35094c
------------------>8-------------------
broke building of some other software packages.

In particular perf built for ARCv2 had corrupted .plt entries that lead
to immediate crash on perf execution.

That's an example of normal .plt entries:
------------------>8-------------------
< 1-st PLT entry >:
   12c24:    30 27 8c 7f 0d 00 74 95    ld         r12,[pcl,0x000d9574]
   12c2c:    21 20 00 03                j.d        [r12]
   12c30:    0a 24 c0 1f                mov        r12,pcl

< 2-nd PLT entry >:
   12c34:    30 27 8c 7f 0d 00 68 95    ld         r12,[pcl,0x000d9568]
   12c3c:    21 20 00 03                j.d        [r12]
   12c40:    0a 24 c0 1f                mov        r12,pcl
------------------>8-------------------
Note right after jump in its delay-slot r12 gets set with current value
of program counter. This is required for the first symbol resolution,
see implementation of _dl_linux_resolve here:
http://git.uclibc.org/uClibc/tree/ldso/ldso/arc/resolve.S#n46

And that's what we got in .plt after mentioned fixes:
------------------>8-------------------
< 1-st PLT entry>:
   13384:    30 27 8c 7f 0f 00 84 75     ld         r12,[pcl,0x000f7584]
   1338c:    21 20 00 03                 j.d        [r12]

< 2-nd PLT entry>:
   13390:    30 27 8c 7f 0f 00 78 75     ld         r12,[pcl,0x000f7578]
   13398:    21 20 00 03                 j.d        [r12]
------------------>8-------------------

Note r12 setup is missing.

That happened because linker thought the size of PLT entry is 12 bytes
(which is exactly the size of PLT entry for ARCv1, read ARC750/770)
while for ARCv2 PLT entry is 16-bytes long. And erroneously trailing 4
bytes were truncated.

Current commit fixes this misbehavior and PLT gets generated properly
again.

Now we have a fix for that issue, see
https://github.com/foss-for-synopsys-dwc-arc-processors/binutils-gdb/commit/5df50c61083165455aae5504c5c3566fa5ccebb1

This fix is in arc-2.23-dev branch and will be a part of the next
release of ARC tools, so then this patch must be removed from buildroot.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...tire-object-if-it-contains-only-data-sect.patch |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/binutils/arc-2015.06/0005-Test-the-entire-object-if-it-contains-only-data-sect.patch b/package/binutils/arc-2015.06/0005-Test-the-entire-object-if-it-contains-only-data-sect.patch
new file mode 100644
index 0000000..2cc96fc
--- /dev/null
+++ b/package/binutils/arc-2015.06/0005-Test-the-entire-object-if-it-contains-only-data-sect.patch
@@ -0,0 +1,35 @@
+From 5df50c61083165455aae5504c5c3566fa5ccebb1 Mon Sep 17 00:00:00 2001
+From: Claudiu Zissulescu <claziss@synopsys.com>
+Date: Fri, 16 Oct 2015 10:21:21 +0200
+Subject: [PATCH] Test the entire object if it contains only data sections.
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index 76bac6c..eb4f8e0 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -915,11 +915,9 @@ of opposite endian-ness"),
+       || bfd_get_flavour (obfd) != bfd_target_elf_flavour)
+     return TRUE;
+ 
+-  /* Check to see if the input BFD actually contains any sections.  If
+-     not, its flags may not have been initialised either, but it
+-     cannot actually cause any incompatiblity.  Do not short-circuit
+-     dynamic objects; their section list may be emptied by
+-     elf_link_add_object_symbols.  */
++  /* Check to see if the input BFD actually contains any sections.  Do
++     not short-circuit dynamic objects; their section list may be
++     emptied by elf_link_add_object_symbols.  */
+   if (!(ibfd->flags & DYNAMIC))
+     {
+       bfd_boolean null_input_bfd = TRUE;
+@@ -933,7 +931,6 @@ of opposite endian-ness"),
+ 	    only_data_sections = FALSE;
+ 
+ 	  null_input_bfd = FALSE;
+-	  break;
+ 	}
+ 
+       if (null_input_bfd || only_data_sections)
+-- 
+2.4.3
+
