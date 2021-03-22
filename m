From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Mar 2021 16:56:55 +0100
Subject: [Buildroot] [PATCH] package/binutils: add patches to fix OpenRisc
 bug 27624
Message-ID: <20210322155655.547476-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches fix OpenRisc linker bug 27624 that affects packages
libtheora, protobuf and zeromq.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0010-bfd-elf32-or1k-fix-ld-assert.patch   | 33 +++++++++++++++++++
 .../0003-bfd-elf32-or1k-fix-ld-assert.patch   | 33 +++++++++++++++++++
 .../0003-bfd-elf32-or1k-fix-ld-assert.patch   | 33 +++++++++++++++++++
 .../0003-bfd-elf32-or1k-fix-ld-assert.patch   | 33 +++++++++++++++++++
 4 files changed, 132 insertions(+)
 create mode 100644 package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
 create mode 100644 package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
 create mode 100644 package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
 create mode 100644 package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch

diff --git a/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
new file mode 100644
index 0000000000..07121c3d0d
--- /dev/null
+++ b/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
@@ -0,0 +1,33 @@
+From 93cf62b662499e560812145dd989056fcf14f00e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 22 Mar 2021 13:30:07 +0100
+Subject: [PATCH] bfd/elf32-or1k: fix ld assert
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
index 0000000000..4aedc40e51
--- /dev/null
+++ b/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
@@ -0,0 +1,33 @@
+From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 22 Mar 2021 13:30:07 +0100
+Subject: [PATCH] bfd/elf32-or1k: fix ld assert
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
index 0000000000..4aedc40e51
--- /dev/null
+++ b/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
@@ -0,0 +1,33 @@
+From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 22 Mar 2021 13:30:07 +0100
+Subject: [PATCH] bfd/elf32-or1k: fix ld assert
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
index 0000000000..4aedc40e51
--- /dev/null
+++ b/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch
@@ -0,0 +1,33 @@
+From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 22 Mar 2021 13:30:07 +0100
+Subject: [PATCH] bfd/elf32-or1k: fix ld assert
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
-- 
2.25.1
