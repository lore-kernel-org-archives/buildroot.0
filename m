From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 23:03:38 +0200
Subject: [Buildroot] [git commit] binutils: backport first section frag
	alignment fix for xtensa gas
Message-ID: <20140512212752.04D0C9CB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aae48f1c6f40edffd747e545164e3b305a9d4935
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following build error often seen during linux kernel
linking step with relaxation enabled:

  dangerous relocation: call8: misaligned call target: (.text.unlikely+0x63)

Backported from: a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../2.22/901-xtensa-gas-first-frag-alignment.patch |   51 ++++++++++++++++++++
 .../901-xtensa-gas-first-frag-alignment.patch      |   51 ++++++++++++++++++++
 .../901-xtensa-gas-first-frag-alignment.patch      |   51 ++++++++++++++++++++
 .../2.24/901-xtensa-gas-first-frag-alignment.patch |   51 ++++++++++++++++++++
 4 files changed, 204 insertions(+), 0 deletions(-)

diff --git a/package/binutils/2.22/901-xtensa-gas-first-frag-alignment.patch b/package/binutils/2.22/901-xtensa-gas-first-frag-alignment.patch
new file mode 100644
index 0000000..e1c2d85
--- /dev/null
+++ b/package/binutils/2.22/901-xtensa-gas-first-frag-alignment.patch
@@ -0,0 +1,51 @@
+From a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 15 Apr 2014 19:12:46 +0400
+Subject: [PATCH] Fix alignment for the first section frag on xtensa
+
+Linking object files produced by partial linking with link-time
+relaxation enabled sometimes fails with the following error message:
+
+dangerous relocation: call8: misaligned call target: (.text.unlikely+0x63)
+
+This happens because no basic block with an XTENSA_PROP_ALIGN flag in the
+property table is generated for the first basic block, even if the
+.align directive is present.
+It was believed that the first frag alignment could be derived from the
+section alignment, but this was not implemented for the partial linking
+case: after partial linking first frag of a section may become not
+first, but no additional alignment frag is inserted before it.
+Basic block for such frag may be merged with previous basic block into
+extended basic block during relaxation pass losing its alignment
+restrictions.
+
+Fix this by always recording alignment for the first section frag.
+
+2014-04-22  Max Filippov  <jcmvbkbc@gmail.com>
+
+gas/
+    * config/tc-xtensa.c (xtensa_handle_align): record alignment for the
+    first section frag.
+
+---
+Backported from: a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1
+Changes to Changelog files and tests are dropped.
+
+ gas/config/tc-xtensa.c                      | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index ea23c96..58ace38 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -5609,7 +5609,6 @@ xtensa_handle_align (fragS *fragP)
+       && ! fragP->tc_frag_data.is_literal
+       && (fragP->fr_type == rs_align
+ 	  || fragP->fr_type == rs_align_code)
+-      && fragP->fr_address + fragP->fr_fix > 0
+       && fragP->fr_offset > 0
+       && now_seg != bss_section)
+     {
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch b/package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch
new file mode 100644
index 0000000..e1c2d85
--- /dev/null
+++ b/package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch
@@ -0,0 +1,51 @@
+From a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 15 Apr 2014 19:12:46 +0400
+Subject: [PATCH] Fix alignment for the first section frag on xtensa
+
+Linking object files produced by partial linking with link-time
+relaxation enabled sometimes fails with the following error message:
+
+dangerous relocation: call8: misaligned call target: (.text.unlikely+0x63)
+
+This happens because no basic block with an XTENSA_PROP_ALIGN flag in the
+property table is generated for the first basic block, even if the
+.align directive is present.
+It was believed that the first frag alignment could be derived from the
+section alignment, but this was not implemented for the partial linking
+case: after partial linking first frag of a section may become not
+first, but no additional alignment frag is inserted before it.
+Basic block for such frag may be merged with previous basic block into
+extended basic block during relaxation pass losing its alignment
+restrictions.
+
+Fix this by always recording alignment for the first section frag.
+
+2014-04-22  Max Filippov  <jcmvbkbc@gmail.com>
+
+gas/
+    * config/tc-xtensa.c (xtensa_handle_align): record alignment for the
+    first section frag.
+
+---
+Backported from: a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1
+Changes to Changelog files and tests are dropped.
+
+ gas/config/tc-xtensa.c                      | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index ea23c96..58ace38 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -5609,7 +5609,6 @@ xtensa_handle_align (fragS *fragP)
+       && ! fragP->tc_frag_data.is_literal
+       && (fragP->fr_type == rs_align
+ 	  || fragP->fr_type == rs_align_code)
+-      && fragP->fr_address + fragP->fr_fix > 0
+       && fragP->fr_offset > 0
+       && now_seg != bss_section)
+     {
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.23.2/901-xtensa-gas-first-frag-alignment.patch b/package/binutils/2.23.2/901-xtensa-gas-first-frag-alignment.patch
new file mode 100644
index 0000000..e1c2d85
--- /dev/null
+++ b/package/binutils/2.23.2/901-xtensa-gas-first-frag-alignment.patch
@@ -0,0 +1,51 @@
+From a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 15 Apr 2014 19:12:46 +0400
+Subject: [PATCH] Fix alignment for the first section frag on xtensa
+
+Linking object files produced by partial linking with link-time
+relaxation enabled sometimes fails with the following error message:
+
+dangerous relocation: call8: misaligned call target: (.text.unlikely+0x63)
+
+This happens because no basic block with an XTENSA_PROP_ALIGN flag in the
+property table is generated for the first basic block, even if the
+.align directive is present.
+It was believed that the first frag alignment could be derived from the
+section alignment, but this was not implemented for the partial linking
+case: after partial linking first frag of a section may become not
+first, but no additional alignment frag is inserted before it.
+Basic block for such frag may be merged with previous basic block into
+extended basic block during relaxation pass losing its alignment
+restrictions.
+
+Fix this by always recording alignment for the first section frag.
+
+2014-04-22  Max Filippov  <jcmvbkbc@gmail.com>
+
+gas/
+    * config/tc-xtensa.c (xtensa_handle_align): record alignment for the
+    first section frag.
+
+---
+Backported from: a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1
+Changes to Changelog files and tests are dropped.
+
+ gas/config/tc-xtensa.c                      | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index ea23c96..58ace38 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -5609,7 +5609,6 @@ xtensa_handle_align (fragS *fragP)
+       && ! fragP->tc_frag_data.is_literal
+       && (fragP->fr_type == rs_align
+ 	  || fragP->fr_type == rs_align_code)
+-      && fragP->fr_address + fragP->fr_fix > 0
+       && fragP->fr_offset > 0
+       && now_seg != bss_section)
+     {
+-- 
+1.8.1.4
+
diff --git a/package/binutils/2.24/901-xtensa-gas-first-frag-alignment.patch b/package/binutils/2.24/901-xtensa-gas-first-frag-alignment.patch
new file mode 100644
index 0000000..e1c2d85
--- /dev/null
+++ b/package/binutils/2.24/901-xtensa-gas-first-frag-alignment.patch
@@ -0,0 +1,51 @@
+From a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 15 Apr 2014 19:12:46 +0400
+Subject: [PATCH] Fix alignment for the first section frag on xtensa
+
+Linking object files produced by partial linking with link-time
+relaxation enabled sometimes fails with the following error message:
+
+dangerous relocation: call8: misaligned call target: (.text.unlikely+0x63)
+
+This happens because no basic block with an XTENSA_PROP_ALIGN flag in the
+property table is generated for the first basic block, even if the
+.align directive is present.
+It was believed that the first frag alignment could be derived from the
+section alignment, but this was not implemented for the partial linking
+case: after partial linking first frag of a section may become not
+first, but no additional alignment frag is inserted before it.
+Basic block for such frag may be merged with previous basic block into
+extended basic block during relaxation pass losing its alignment
+restrictions.
+
+Fix this by always recording alignment for the first section frag.
+
+2014-04-22  Max Filippov  <jcmvbkbc@gmail.com>
+
+gas/
+    * config/tc-xtensa.c (xtensa_handle_align): record alignment for the
+    first section frag.
+
+---
+Backported from: a35d5e823fdfe8a6e7e05ca8e3fb8bb5697335b1
+Changes to Changelog files and tests are dropped.
+
+ gas/config/tc-xtensa.c                      | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index ea23c96..58ace38 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -5609,7 +5609,6 @@ xtensa_handle_align (fragS *fragP)
+       && ! fragP->tc_frag_data.is_literal
+       && (fragP->fr_type == rs_align
+ 	  || fragP->fr_type == rs_align_code)
+-      && fragP->fr_address + fragP->fr_fix > 0
+       && fragP->fr_offset > 0
+       && now_seg != bss_section)
+     {
+-- 
+1.8.1.4
+
