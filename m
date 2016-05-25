From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 25 May 2016 15:01:40 +0300
Subject: [Buildroot] [PATCH] toolchain: arc-2016.03: fix generation of
	dynamic relocs for -pie
Message-ID: <1464177700-23646-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently even if -pie flag is provided to LD dynamic relocations
won't be created. That in its turn will break U-Boot self-relocation
functionality.

This fix resolves mentioned problem.

Note as of today this is a sort of off-the-tree patch right from
our binutils guy but in coming day similar fix will be applied to
upstream binutils as well.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 ...ith-dynamic-relocs-not-being-generated-wi.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch

diff --git a/package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch b/package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch
new file mode 100644
index 0000000..c2967a3
--- /dev/null
+++ b/package/binutils/arc-2016.03/0700-Fix-issue-with-dynamic-relocs-not-being-generated-wi.patch
@@ -0,0 +1,34 @@
+From e59d8728f2fd57938ff28bb48cb47ddc7dbf8271 Mon Sep 17 00:00:00 2001
+From: Cupertino Miranda <cmiranda@synopsys.com>
+Date: Tue, 24 May 2016 18:00:28 +0200
+Subject: [PATCH] Fix issue with dynamic relocs not being generated with -pie.
+
+---
+ bfd/elf32-arc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
+index c2d05e4..00af1a5 100644
+--- a/bfd/elf32-arc.c
++++ b/bfd/elf32-arc.c
+@@ -1492,7 +1492,7 @@ elf_arc_relocate_section (bfd *		   output_bfd,
+ 	  case R_ARC_32_ME:
+ 	  case R_ARC_PC32:
+ 	  case R_ARC_32_PCREL:
+-	    if (bfd_link_pic (info) && !bfd_link_pie (info)
++	    if ((bfd_link_pic (info) || bfd_link_pie (info))
+ 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
+ 		    || (h != NULL
+ 			&& h->dynindx != -1
+@@ -1774,7 +1774,7 @@ elf_arc_check_relocs (bfd *		         abfd,
+ 	    /* FALLTHROUGH */
+ 	  case R_ARC_PC32:
+ 	  case R_ARC_32_PCREL:
+-	    if (bfd_link_pic (info) && !bfd_link_pie (info)
++	    if ((bfd_link_pic (info) || bfd_link_pie (info))
+ 		&& ((r_type != R_ARC_PC32 && r_type != R_ARC_32_PCREL)
+ 		    || (h != NULL
+ 			&& h->dynindx != -1
+-- 
+2.5.5
+
-- 
2.5.5
