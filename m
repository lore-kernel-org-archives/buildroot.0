From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 13:39:55 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/binutils: add
 patches to fix OpenRisc bug 27624
Message-ID: <20210403112726.C1A2183A06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23e1391bb8d2d7794bd3820f841e3261024d98c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

These patches fix OpenRisc linker bug 27624 that affects packages
libtheora, protobuf and zeromq.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit da2c1d9c56b54c6022689c3696cd54ea7282b4d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch   | 35 ++++++++++++++++++++++
 .../2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch   | 35 ++++++++++++++++++++++
 .../2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch | 35 ++++++++++++++++++++++
 .../2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch | 35 ++++++++++++++++++++++
 4 files changed, 140 insertions(+)

diff --git a/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
new file mode 100644
index 0000000000..824c9ce3e5
--- /dev/null
+++ b/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
@@ -0,0 +1,35 @@
+From 93cf62b662499e560812145dd989056fcf14f00e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 22 Mar 2021 13:30:07 +0100
+Subject: [PATCH] bfd/elf32-or1k: fix ld assert
+
+Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 2f200b197b..ae508540f5 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2535,11 +2535,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++         || (SYMBOL_CALLS_LOCAL (info, h)
++         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++             && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
new file mode 100644
index 0000000000..756493667f
--- /dev/null
+++ b/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
@@ -0,0 +1,35 @@
+From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 22 Mar 2021 13:30:07 +0100
+Subject: [PATCH] bfd/elf32-or1k: fix ld assert
+
+Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 65938e5137..41908f8938 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++         || (SYMBOL_CALLS_LOCAL (info, h)
++         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++             && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
new file mode 100644
index 0000000000..756493667f
--- /dev/null
+++ b/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
@@ -0,0 +1,35 @@
+From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 22 Mar 2021 13:30:07 +0100
+Subject: [PATCH] bfd/elf32-or1k: fix ld assert
+
+Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 65938e5137..41908f8938 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++         || (SYMBOL_CALLS_LOCAL (info, h)
++         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++             && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch
new file mode 100644
index 0000000000..756493667f
--- /dev/null
+++ b/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch
@@ -0,0 +1,35 @@
+From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 22 Mar 2021 13:30:07 +0100
+Subject: [PATCH] bfd/elf32-or1k: fix ld assert
+
+Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 65938e5137..41908f8938 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++         || (SYMBOL_CALLS_LOCAL (info, h)
++         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++             && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
