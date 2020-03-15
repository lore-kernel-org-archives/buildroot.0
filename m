From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:53:16 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/binutils: fix
 assertion failure in xtensa ld
Message-ID: <20200315104035.BAAD8821C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96cc0af8e57a8ccc6f8e2a21facfa0dde54b6756
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

xtensa ld fails with the following message

  ld: BFD (GNU Binutils) 2.31.1 internal error, aborting at
  elf32-xtensa.c:3283 in elf_xtensa_finish_dynamic_sections

during domoticz package build. It happens because of mismatch between
the size allocated for dynamic relocations in the executable image and
the number of PLT relocations actually written to the image. The
mismatch is caused by the fact that undefined weak symbol is treated as
dynamic (and thus needing PLT relocation), but xtensa linker not
expecting that.

Fixes: http://autobuild.buildroot.net/results/7885705f1b1c0f31cf21b464150f5509929c1906/
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Backported from: e15a8da9c71336b06cb5f2706c3f6b7e6ddd95a3
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1b887cfc69d0fc080e973416f4d3563af778ea07)
[Peter; drop 2.33.1 patch]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../2.31.1/0018-bfd-xtensa-fix-PR-ld-25630.patch   | 37 ++++++++++++++++++++++
 .../2.32/0007-bfd-xtensa-fix-PR-ld-25630.patch     | 37 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/package/binutils/2.31.1/0018-bfd-xtensa-fix-PR-ld-25630.patch b/package/binutils/2.31.1/0018-bfd-xtensa-fix-PR-ld-25630.patch
new file mode 100644
index 0000000000..f499426b70
--- /dev/null
+++ b/package/binutils/2.31.1/0018-bfd-xtensa-fix-PR-ld-25630.patch
@@ -0,0 +1,37 @@
+From 85dcca5997cf3822d6456a5c9c59c46b56adfbb8 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Wed, 4 Mar 2020 14:54:27 -0800
+Subject: [PATCH] bfd: xtensa: fix PR ld/25630
+
+bfd/
+2020-03-05  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* elf32-xtensa.c (shrink_dynamic_reloc_sections): Shrink dynamic
+	relocation sections for any removed reference to a dynamic symbol.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 12ff9f772aaf..65e14d87940c 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -10148,10 +10148,9 @@ shrink_dynamic_reloc_sections (struct bfd_link_info *info,
+ 
+   if ((r_type == R_XTENSA_32 || r_type == R_XTENSA_PLT)
+       && (input_section->flags & SEC_ALLOC) != 0
+-      && (dynamic_symbol || bfd_link_pic (info))
+-      && (!h || h->root.type != bfd_link_hash_undefweak
+-	  || (dynamic_symbol
+-	      && (bfd_link_dll (info) || info->export_dynamic))))
++      && (dynamic_symbol
++	  || (bfd_link_pic (info)
++	      && (!h || h->root.type != bfd_link_hash_undefweak))))
+     {
+       asection *srel;
+       bfd_boolean is_plt = FALSE;
+-- 
+2.20.1
+
diff --git a/package/binutils/2.32/0007-bfd-xtensa-fix-PR-ld-25630.patch b/package/binutils/2.32/0007-bfd-xtensa-fix-PR-ld-25630.patch
new file mode 100644
index 0000000000..f499426b70
--- /dev/null
+++ b/package/binutils/2.32/0007-bfd-xtensa-fix-PR-ld-25630.patch
@@ -0,0 +1,37 @@
+From 85dcca5997cf3822d6456a5c9c59c46b56adfbb8 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Wed, 4 Mar 2020 14:54:27 -0800
+Subject: [PATCH] bfd: xtensa: fix PR ld/25630
+
+bfd/
+2020-03-05  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* elf32-xtensa.c (shrink_dynamic_reloc_sections): Shrink dynamic
+	relocation sections for any removed reference to a dynamic symbol.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ bfd/elf32-xtensa.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/bfd/elf32-xtensa.c b/bfd/elf32-xtensa.c
+index 12ff9f772aaf..65e14d87940c 100644
+--- a/bfd/elf32-xtensa.c
++++ b/bfd/elf32-xtensa.c
+@@ -10148,10 +10148,9 @@ shrink_dynamic_reloc_sections (struct bfd_link_info *info,
+ 
+   if ((r_type == R_XTENSA_32 || r_type == R_XTENSA_PLT)
+       && (input_section->flags & SEC_ALLOC) != 0
+-      && (dynamic_symbol || bfd_link_pic (info))
+-      && (!h || h->root.type != bfd_link_hash_undefweak
+-	  || (dynamic_symbol
+-	      && (bfd_link_dll (info) || info->export_dynamic))))
++      && (dynamic_symbol
++	  || (bfd_link_pic (info)
++	      && (!h || h->root.type != bfd_link_hash_undefweak))))
+     {
+       asection *srel;
+       bfd_boolean is_plt = FALSE;
+-- 
+2.20.1
+
