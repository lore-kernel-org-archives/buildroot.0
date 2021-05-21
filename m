From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 May 2021 10:31:00 +0200
Subject: [Buildroot] [git commit] package/binutils: update or1k patches for
 plt link version with upstream
Message-ID: <20210521081133.93FA281369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5978dae8527ec7a6714920f3ae5112e2cbffa41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Actual patches are stubs suggested but now they are available as upstream.
So let's substitute them since they make part of a or1k patchset and next
patch will add the others.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: remove the PATCH M/N parts - cfr. check-package]
---
 .../2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch   | 35 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch | 59 ++++++++++++++++++++++
 .../2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch   | 35 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch | 59 ++++++++++++++++++++++
 .../2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch | 35 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch | 59 ++++++++++++++++++++++
 .../2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch | 35 -------------
 ...sue-with-plt-link-failure-for-local-calls.patch | 59 ++++++++++++++++++++++
 8 files changed, 236 insertions(+), 140 deletions(-)

diff --git a/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
deleted file mode 100644
index 824c9ce3e5..0000000000
--- a/package/binutils/2.32/0010-bfd-elf32-or1k-fix-ld-assert.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 93cf62b662499e560812145dd989056fcf14f00e Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 22 Mar 2021 13:30:07 +0100
-Subject: [PATCH] bfd/elf32-or1k: fix ld assert
-
-Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 2f200b197b..ae508540f5 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2535,11 +2535,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+         || (SYMBOL_CALLS_LOCAL (info, h)
-+         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+             && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.32/0010-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.32/0010-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
new file mode 100644
index 0000000000..a67d12789e
--- /dev/null
+++ b/package/binutils/2.32/0010-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
@@ -0,0 +1,59 @@
+From 788cda9f9447e0fe67e582e8fb5adafd678d08b2 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:14 +0900
+Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
+
+When building protobuf we were seeing the assert failure:
+
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    collect2: error: ld returned 1 exit status
+
+This failure happens while writing out PLT entries, there is a check
+"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
+symbol attributes.  This was failing for symbols that were
+"forced_local" in previous linking code.
+
+The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
+"forced_local" symbols and exclude them from the the PLT.
+
+bfd/ChangeLog:
+
+	PR 27624
+	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
+	condition used to cleanup plt entries to cleanup forced local
+	entries.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 2f200b197b8..1f2c88b0b3a 100644
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
++	  || (SYMBOL_CALLS_LOCAL (info, h)
++	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++	      && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
deleted file mode 100644
index 756493667f..0000000000
--- a/package/binutils/2.34/0003-bfd-elf32-or1k-fix-ld-assert.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 22 Mar 2021 13:30:07 +0100
-Subject: [PATCH] bfd/elf32-or1k: fix ld assert
-
-Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 65938e5137..41908f8938 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+         || (SYMBOL_CALLS_LOCAL (info, h)
-+         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+             && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.34/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.34/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
new file mode 100644
index 0000000000..bc0ef2b224
--- /dev/null
+++ b/package/binutils/2.34/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
@@ -0,0 +1,59 @@
+From 651c3617a04a1d1f78e89623b81be7ba32ff59a5 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:14 +0900
+Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
+
+When building protobuf we were seeing the assert failure:
+
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    collect2: error: ld returned 1 exit status
+
+This failure happens while writing out PLT entries, there is a check
+"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
+symbol attributes.  This was failing for symbols that were
+"forced_local" in previous linking code.
+
+The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
+"forced_local" symbols and exclude them from the the PLT.
+
+bfd/ChangeLog:
+
+	PR 27624
+	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
+	condition used to cleanup plt entries to cleanup forced local
+	entries.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 31ef758a926..58246875546 100644
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
++	  || (SYMBOL_CALLS_LOCAL (info, h)
++	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++	      && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
deleted file mode 100644
index 756493667f..0000000000
--- a/package/binutils/2.35.2/0003-bfd-elf32-or1k-fix-ld-assert.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 22 Mar 2021 13:30:07 +0100
-Subject: [PATCH] bfd/elf32-or1k: fix ld assert
-
-Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 65938e5137..41908f8938 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+         || (SYMBOL_CALLS_LOCAL (info, h)
-+         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+             && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
new file mode 100644
index 0000000000..81fb6b8518
--- /dev/null
+++ b/package/binutils/2.35.2/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
@@ -0,0 +1,59 @@
+From baf313f84b106a5a29f01796afd857e69abf8b08 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:14 +0900
+Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
+
+When building protobuf we were seeing the assert failure:
+
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    collect2: error: ld returned 1 exit status
+
+This failure happens while writing out PLT entries, there is a check
+"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
+symbol attributes.  This was failing for symbols that were
+"forced_local" in previous linking code.
+
+The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
+"forced_local" symbols and exclude them from the the PLT.
+
+bfd/ChangeLog:
+
+	PR 27624
+	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
+	condition used to cleanup plt entries to cleanup forced local
+	entries.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 7c02d004cc7..bbfa2bfe614 100644
+--- a/bfd/elf32-or1k.c
++++ b/bfd/elf32-or1k.c
+@@ -2568,11 +2568,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
+   if (h->type == STT_FUNC
+       || h->needs_plt)
+     {
+-      if (! bfd_link_pic (info)
+-	  && !h->def_dynamic
+-	  && !h->ref_dynamic
+-	  && h->root.type != bfd_link_hash_undefweak
+-	  && h->root.type != bfd_link_hash_undefined)
++      if (h->plt.refcount <= 0
++	  || (SYMBOL_CALLS_LOCAL (info, h)
++	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++	      && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
diff --git a/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch b/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch
deleted file mode 100644
index 756493667f..0000000000
--- a/package/binutils/2.36.1/0003-bfd-elf32-or1k-fix-ld-assert.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1659226a96b1daecfd08c057d0d5c39309d207ee Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 22 Mar 2021 13:30:07 +0100
-Subject: [PATCH] bfd/elf32-or1k: fix ld assert
-
-Fixes https://sourceware.org/bugzilla/show_bug.cgi?id=27624
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- bfd/elf32-or1k.c | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
-index 65938e5137..41908f8938 100644
---- a/bfd/elf32-or1k.c
-+++ b/bfd/elf32-or1k.c
-@@ -2566,11 +2566,10 @@ or1k_elf_adjust_dynamic_symbol (struct bfd_link_info *info,
-   if (h->type == STT_FUNC
-       || h->needs_plt)
-     {
--      if (! bfd_link_pic (info)
--	  && !h->def_dynamic
--	  && !h->ref_dynamic
--	  && h->root.type != bfd_link_hash_undefweak
--	  && h->root.type != bfd_link_hash_undefined)
-+      if (h->plt.refcount <= 0
-+         || (SYMBOL_CALLS_LOCAL (info, h)
-+         || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
-+             && h->root.type == bfd_link_hash_undefweak)))
- 	{
- 	  /* This case can occur if we saw a PLT reloc in an input
- 	     file, but the symbol was never referred to by a dynamic
--- 
-2.25.1
-
diff --git a/package/binutils/2.36.1/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch b/package/binutils/2.36.1/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
new file mode 100644
index 0000000000..85931ff661
--- /dev/null
+++ b/package/binutils/2.36.1/0003-or1k-Fix-issue-with-plt-link-failure-for-local-calls.patch
@@ -0,0 +1,59 @@
+From b5fdaa85790dff45fd2c3fd15405c16dbc50a074 Mon Sep 17 00:00:00 2001
+From: Stafford Horne <shorne@gmail.com>
+Date: Sun, 2 May 2021 06:02:14 +0900
+Subject: [PATCH] or1k: Fix issue with plt link failure for local calls
+
+When building protobuf we were seeing the assert failure:
+
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    /home/giuliobenetti/git/upstream/or1k-binutils-2.36.1/host/lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld:
+    BFD (GNU Binutils) 2.36.1 assertion fail elf32-or1k.c:2377
+    collect2: error: ld returned 1 exit status
+
+This failure happens while writing out PLT entries, there is a check
+"BFD_ASSERT (h->dynindx != -1)" to confirm all plt entries have dynamic
+symbol attributes.  This was failing for symbols that were
+"forced_local" in previous linking code.
+
+The fix adds logic to or1k_elf_adjust_dynamic_symbol to identify
+"forced_local" symbols and exclude them from the the PLT.
+
+bfd/ChangeLog:
+
+	PR 27624
+	* elf32-or1k.c (or1k_elf_adjust_dynamic_symbol): Change
+	condition used to cleanup plt entries to cleanup forced local
+	entries.
+
+Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ bfd/elf32-or1k.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf32-or1k.c b/bfd/elf32-or1k.c
+index 65938e51378..4f82cc4c667 100644
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
++	  || (SYMBOL_CALLS_LOCAL (info, h)
++	  || (ELF_ST_VISIBILITY (h->other) != STV_DEFAULT
++	      && h->root.type == bfd_link_hash_undefweak)))
+ 	{
+ 	  /* This case can occur if we saw a PLT reloc in an input
+ 	     file, but the symbol was never referred to by a dynamic
+-- 
+2.25.1
+
