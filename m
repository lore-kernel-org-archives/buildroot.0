From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:35:54 +0100
Subject: [Buildroot] [git commit] binutils: add upstream patch to fix open
	microblaze issue
Message-ID: <20161105223617.C319D817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27a20609c288e5d13a91b064c54c1d3f93ad7c48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reenables the use of 2.27 for microblaze.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-Set-dynamic-tag-VMA-and-size-from-dynami.patch | 36 ++++++++++++++++++++++
 package/binutils/Config.in.host                    |  3 --
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch b/package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
new file mode 100644
index 0000000..f1ec259
--- /dev/null
+++ b/package/binutils/2.27/0900-Revert-part-Set-dynamic-tag-VMA-and-size-from-dynami.patch
@@ -0,0 +1,36 @@
+From c646b02fdcae5f37bd88f33a0c4683ef13ad5c82 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 31 Oct 2016 12:46:38 +1030
+Subject: [PATCH] Revert part "Set dynamic tag VMA and size from dynamic
+ section when possible"
+
+	PR 20748
+	* elf32-microblaze.c (microblaze_elf_finish_dynamic_sections): Revert
+	2016-05-13 change.
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+
+diff --git a/bfd/elf32-microblaze.c b/bfd/elf32-microblaze.c
+index 477e7b3..5c66808 100644
+--- a/bfd/elf32-microblaze.c
++++ b/bfd/elf32-microblaze.c
+@@ -3396,13 +3396,13 @@ microblaze_elf_finish_dynamic_sections (bfd *output_bfd,
+             {
+               asection *s;
+ 
+-              s = bfd_get_linker_section (dynobj, name);
++              s = bfd_get_section_by_name (output_bfd, name);
+               if (s == NULL)
+                 dyn.d_un.d_val = 0;
+               else
+                 {
+                   if (! size)
+-                    dyn.d_un.d_ptr = s->output_section->vma + s->output_offset;
++                    dyn.d_un.d_ptr = s->vma;
+                   else
+                     dyn.d_un.d_val = s->size;
+                 }
+-- 
+2.1.4
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index dce6996..3e0c357 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -17,9 +17,6 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_27_X
 		bool "binutils 2.27"
-		# supported but broken on Microblaze
-		# see https://sourceware.org/bugzilla/show_bug.cgi?id=20748
-		depends on !BR2_microblaze
 
 endchoice
 
