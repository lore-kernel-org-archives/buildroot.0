From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Dec 2011 12:53:04 +0100
Subject: [Buildroot] [git commit] binutils: 2.22 powerpc textrels fix
Message-ID: <20111205134653.4F3428F7A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e96cbcc065b0ffdb5171e2701f4e6d7201fa867
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See http://thread.gmane.org/gmane.comp.embedded.crossdev/106 for details.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../binutils/binutils-2.22/999-ppc-textrels.patch  |   80 ++++++++++++++++++++
 1 files changed, 80 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils-2.22/999-ppc-textrels.patch b/package/binutils/binutils-2.22/999-ppc-textrels.patch
new file mode 100644
index 0000000..c1efacf
--- /dev/null
+++ b/package/binutils/binutils-2.22/999-ppc-textrels.patch
@@ -0,0 +1,80 @@
+http://bugs.gentoo.org/392645
+http://sourceware.org/bugzilla/show_bug.cgi?id=13470
+
+2011-12-03  Alan Modra  <amodra@gmail.com>
+
+	PR ld/13470
+	* elf32-ppc.c (ppc_elf_copy_indirect_symbol): Revert substantive
+	change in 2011-07-01 commit.  Comment.
+	* elf64-ppc.c (ppc64_elf_copy_indirect_symbol): Likewise.
+
+===================================================================
+RCS file: /cvs/src/src/bfd/elf32-ppc.c,v
+retrieving revision 1.302.2.1
+retrieving revision 1.302.2.2
+diff -u -r1.302.2.1 -r1.302.2.2
+--- src/bfd/elf32-ppc.c	2011/11/15 11:36:52	1.302.2.1
++++ src/bfd/elf32-ppc.c	2011/12/03 00:58:01	1.302.2.2
+@@ -2987,10 +2987,6 @@
+   edir->elf.needs_plt |= eind->elf.needs_plt;
+   edir->elf.pointer_equality_needed |= eind->elf.pointer_equality_needed;
+ 
+-  /* If we were called to copy over info for a weak sym, that's all.  */
+-  if (eind->elf.root.type != bfd_link_hash_indirect)
+-    return;
+-
+   if (eind->dyn_relocs != NULL)
+     {
+       if (edir->dyn_relocs != NULL)
+@@ -3022,6 +3018,16 @@
+       eind->dyn_relocs = NULL;
+     }
+ 
++  /* If we were called to copy over info for a weak sym, that's all.
++     You might think dyn_relocs need not be copied over;  After all,
++     both syms will be dynamic or both non-dynamic so we're just
++     moving reloc accounting around.  However, ELIMINATE_COPY_RELOCS 
++     code in ppc_elf_adjust_dynamic_symbol needs to check for
++     dyn_relocs in read-only sections, and it does so on what is the
++     DIR sym here.  */
++  if (eind->elf.root.type != bfd_link_hash_indirect)
++    return;
++
+   /* Copy over the GOT refcount entries that we may have already seen to
+      the symbol which just became indirect.  */
+   edir->elf.got.refcount += eind->elf.got.refcount;
+===================================================================
+RCS file: /cvs/src/src/bfd/elf64-ppc.c,v
+retrieving revision 1.363.2.4
+retrieving revision 1.363.2.5
+diff -u -r1.363.2.4 -r1.363.2.5
+--- src/bfd/elf64-ppc.c	2011/11/08 13:46:36	1.363.2.4
++++ src/bfd/elf64-ppc.c	2011/12/03 00:58:02	1.363.2.5
+@@ -4435,10 +4435,6 @@
+   edir->elf.ref_regular_nonweak |= eind->elf.ref_regular_nonweak;
+   edir->elf.needs_plt |= eind->elf.needs_plt;
+ 
+-  /* If we were called to copy over info for a weak sym, that's all.  */
+-  if (eind->elf.root.type != bfd_link_hash_indirect)
+-    return;
+-
+   /* Copy over any dynamic relocs we may have on the indirect sym.  */
+   if (eind->dyn_relocs != NULL)
+     {
+@@ -4471,6 +4467,16 @@
+       eind->dyn_relocs = NULL;
+     }
+ 
++  /* If we were called to copy over info for a weak sym, that's all.
++     You might think dyn_relocs need not be copied over;  After all,
++     both syms will be dynamic or both non-dynamic so we're just
++     moving reloc accounting around.  However, ELIMINATE_COPY_RELOCS 
++     code in ppc64_elf_adjust_dynamic_symbol needs to check for
++     dyn_relocs in read-only sections, and it does so on what is the
++     DIR sym here.  */
++  if (eind->elf.root.type != bfd_link_hash_indirect)
++    return;
++
+   /* Copy over got entries that we may have already seen to the
+      symbol which just became indirect.  */
+   if (eind->elf.got.glist != NULL)
