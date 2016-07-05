From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 12:16:03 +0200
Subject: [Buildroot] [git commit] binutils: add required upstream patch for
	bfin
Message-ID: <20160705101621.EA00582133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d248bd8cae278cd0c797768cb3fb19e7c6e4657
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is required to build uClibc-ng with threading support and FDPIC
binary format.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../binutils/2.26.1/0904-bfin-fdpic-upstream.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/binutils/2.26.1/0904-bfin-fdpic-upstream.patch b/package/binutils/2.26.1/0904-bfin-fdpic-upstream.patch
new file mode 100644
index 0000000..ffbacc4
--- /dev/null
+++ b/package/binutils/2.26.1/0904-bfin-fdpic-upstream.patch
@@ -0,0 +1,30 @@
+From ed3056ebdb9795446157af03d3e08fbb93c1b01d Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 29 Mar 2016 10:24:16 +0100
+Subject: [PATCH] Relax assertion in BFIN linker to allow for discard GOT relocs.
+
+	PR 17334
+	* elf32-bfin.c (elf32_bfinfdpic_finish_dynamic_sections): Relax
+	assertion on the size of the got section to allow it to be bigger
+	than the number of relocs.
+diff --git a/bfd/elf32-bfin.c b/bfd/elf32-bfin.c
+index 7cc8b6d..b2fcf38 100644
+--- a/bfd/elf32-bfin.c
++++ b/bfd/elf32-bfin.c
+@@ -4457,7 +4457,13 @@ elf32_bfinfdpic_finish_dynamic_sections (bfd *output_bfd,
+   if (bfinfdpic_got_section (info))
+     {
+       BFD_ASSERT (bfinfdpic_gotrel_section (info)->size
+-		  == (bfinfdpic_gotrel_section (info)->reloc_count
++		  /* PR 17334: It appears that the GOT section can end up
++		     being bigger than the number of relocs.  Presumably
++		     because some relocs have been deleted.  A test case has
++		     yet to be generated for verify this, but in the meantime
++		     the test below has been changed from == to >= so that
++		     applications can continue to be built.  */
++		  >= (bfinfdpic_gotrel_section (info)->reloc_count
+ 		      * sizeof (Elf32_External_Rel)));
+ 
+       if (bfinfdpic_gotfixup_section (info))
+-- 
+1.7.1
