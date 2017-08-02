From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:42:22 +0200
Subject: [Buildroot] [git commit] package/binutils: fix assertion in 2.29
	xtensa ld
Message-ID: <20170802193813.79FFD81E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33ac54cee2f0704aa6dfccbfd235f88098c1c6dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Section sorting code in xtensa ld was incorrectly cleaned up in release
2.29, resulting in the following assertion when --sort-section,alignment
option is used:

  BFD (GNU Binutils) 2.29 assertion fail elf32-xtensa.c:3965

Backport the fix that restores original section sorting.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...a-ld-restore-old-section-sorting-behavior.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/binutils/2.29/0007-xtensa-ld-restore-old-section-sorting-behavior.patch b/package/binutils/2.29/0007-xtensa-ld-restore-old-section-sorting-behavior.patch
new file mode 100644
index 0000000..b411837
--- /dev/null
+++ b/package/binutils/2.29/0007-xtensa-ld-restore-old-section-sorting-behavior.patch
@@ -0,0 +1,48 @@
+From 3a399127ead1ba3c8b8d0b9e7206fce39311ee72 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Wed, 2 Aug 2017 02:49:56 -0700
+Subject: [PATCH] xtensa: ld: restore old section sorting behavior
+
+With the recent change 535b785fb0c9 ("Don't compare boolean values
+against TRUE or FALSE") the following assertion is observed when
+linking with --sort-section,alignment option:
+
+  BFD (GNU Binutils) 2.29 assertion fail elf32-xtensa.c:3965
+
+It appears that xtensa linker only supported sorting sections by name,
+and the code that checks for the section sorting type in
+ld/emultempl/xtensaelf.em was not updated in the change bcaa7b3eb957
+("ld/"), that replaced boolean wildcard_spec::sorted with enumeration.
+
+Restore the original behavior of the section sorting code.
+
+ld/
+2017-08-02  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* emultempl/xtensaelf.em
+	(xtensa_wild_group_interleave_callback): Only check for by_name
+	sorting.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: 73d5923e480944e2d66bde8c59f4dff298ec57e3
+
+ ld/emultempl/xtensaelf.em | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ld/emultempl/xtensaelf.em b/ld/emultempl/xtensaelf.em
+index 1447d526a25b..3827d91b6291 100644
+--- a/ld/emultempl/xtensaelf.em
++++ b/ld/emultempl/xtensaelf.em
+@@ -1432,7 +1432,7 @@ xtensa_wild_group_interleave_callback (lang_statement_union_type *statement)
+ 	  struct wildcard_list *l;
+ 	  for (l = w->section_list; l != NULL; l = l->next)
+ 	    {
+-	      if (l->spec.sorted != none)
++	      if (l->spec.sorted == by_name)
+ 		{
+ 		  no_reorder = TRUE;
+ 		  break;
+-- 
+2.1.4
+
