From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 17:19:33 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/binutils: xtensa:
 fix shrink_dynamic_reloc_sections
Message-ID: <20190405152520.134DC81320@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84a6ea6cb55637aa2e5bebb493a0bafdcc708f81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This fixes the following build error caused by link-time relaxation
removing copies of literals that reference undefined weak symbols with
PLT entries created due to -rdynamic option passed to g++ link command:

  ld: BFD (GNU Binutils) 2.31.1 internal error, aborting at
  elf32-xtensa.c:3292 in elf_xtensa_finish_dynamic_sections

Fixes:
http://autobuild.buildroot.net/results/d41/d41aae8a448c316187f9fbde40f1d077182bb244/
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop 2.32 patch]
(cherry picked from commit 881dae3a9c086ee3880834e10f72baea221f4945)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fix-shrink_dynamic_reloc_sections-for-exp.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/binutils/2.31.1/0015-bfd-xtensa-fix-shrink_dynamic_reloc_sections-for-exp.patch b/package/binutils/2.31.1/0015-bfd-xtensa-fix-shrink_dynamic_reloc_sections-for-exp.patch
new file mode 100644
index 0000000000..b80e1fa7ce
--- /dev/null
+++ b/package/binutils/2.31.1/0015-bfd-xtensa-fix-shrink_dynamic_reloc_sections-for-exp.patch
@@ -0,0 +1,41 @@
+From 278989f23735aa501be1052e085540c75c126dbb Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 28 Mar 2019 17:03:57 -0700
+Subject: [PATCH] bfd: xtensa: fix shrink_dynamic_reloc_sections for
+ export-dynamic
+
+shrink_dynamic_reloc_sections must remove PLT entry that was created for
+an undefined weak symbol in the presence of --export-dynamic option when
+relaxation coalesces literals pointing to that symbol. This fixes the
+following assertion:
+
+  ld: BFD (GNU Binutils) 2.31.1 internal error, aborting at
+  elf32-xtensa.c:3292 in elf_xtensa_finish_dynamic_sections
+
+2019-03-28  Max Filippov  <jcmvbkbc@gmail.com>
+bfd/
+	* elf32-xtensa.c (shrink_dynamic_reloc_sections): Add
+	info->export_dynamic to the conditional.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c                                         |  3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index c3df3d6db756..37ea200eea74 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -10083,7 +10083,8 @@ shrink_dynamic_reloc_sections (struct bfd_link_info *info,
+       && (input_section->flags & SEC_ALLOC) != 0
+       && (dynamic_symbol || bfd_link_pic (info))
+       && (!h || h->root.type != bfd_link_hash_undefweak
+-	  || (dynamic_symbol && bfd_link_dll (info))))
++	  || (dynamic_symbol
++	      && (bfd_link_dll (info) || info->export_dynamic))))
+     {
+       asection *srel;
+       bfd_boolean is_plt = FALSE;
+-- 
+2.11.0
+
