From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:26:36 +0200
Subject: [Buildroot] [git commit] package/gcc: backport fix for xtensa PR
 91880
Message-ID: <20190927202141.599B38E95F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a88e87eee0a48cf9de51dde3e721d1b4b2fe6f0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
inserted as the first instruction of the function.
Insert zero overhead loop instruction into new basic block before the
loop when basic block that precedes the loop is empty.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../7.4.0/1003-xtensa-fix-PR-target-91880.patch    | 49 ++++++++++++++++++++++
 .../8.3.0/0002-xtensa-fix-PR-target-91880.patch    | 49 ++++++++++++++++++++++
 .../9.2.0/0002-xtensa-fix-PR-target-91880.patch    | 49 ++++++++++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/package/gcc/7.4.0/1003-xtensa-fix-PR-target-91880.patch b/package/gcc/7.4.0/1003-xtensa-fix-PR-target-91880.patch
new file mode 100644
index 0000000000..e75588bf4e
--- /dev/null
+++ b/package/gcc/7.4.0/1003-xtensa-fix-PR-target-91880.patch
@@ -0,0 +1,49 @@
+From 7c11710230921246156aecc20eb4b6ccaeaaa473 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 24 Sep 2019 04:15:17 -0700
+Subject: [PATCH] xtensa: fix PR target/91880
+
+Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
+inserted as the first instruction of the function.
+Insert zero overhead loop instruction into new basic block before the
+loop when basic block that precedes the loop is empty.
+
+2019-09-26  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/xtensa.c (hwloop_optimize): Insert zero overhead
+	loop instruction into new basic block before the loop when basic
+	block that precedes the loop is empty.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r276166
+
+ gcc/config/xtensa/xtensa.c                 |  5 ++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index ee5612441e25..2527468d57db 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -4174,7 +4174,9 @@ hwloop_optimize (hwloop_info loop)
+ 
+   seq = get_insns ();
+ 
+-  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1)
++  entry_after = BB_END (entry_bb);
++  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1
++      || !entry_after)
+     {
+       basic_block new_bb;
+       edge e;
+@@ -4195,7 +4197,6 @@ hwloop_optimize (hwloop_info loop)
+     }
+   else
+     {
+-      entry_after = BB_END (entry_bb);
+       while (DEBUG_INSN_P (entry_after)
+              || (NOTE_P (entry_after)
+                  && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK
+-- 
+2.11.0
+
diff --git a/package/gcc/8.3.0/0002-xtensa-fix-PR-target-91880.patch b/package/gcc/8.3.0/0002-xtensa-fix-PR-target-91880.patch
new file mode 100644
index 0000000000..e653525011
--- /dev/null
+++ b/package/gcc/8.3.0/0002-xtensa-fix-PR-target-91880.patch
@@ -0,0 +1,49 @@
+From 7c11710230921246156aecc20eb4b6ccaeaaa473 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 24 Sep 2019 04:15:17 -0700
+Subject: [PATCH] xtensa: fix PR target/91880
+
+Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
+inserted as the first instruction of the function.
+Insert zero overhead loop instruction into new basic block before the
+loop when basic block that precedes the loop is empty.
+
+2019-09-26  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/xtensa.c (hwloop_optimize): Insert zero overhead
+	loop instruction into new basic block before the loop when basic
+	block that precedes the loop is empty.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r276166
+
+ gcc/config/xtensa/xtensa.c                 |  5 ++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index ee5612441e25..2527468d57db 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -4232,7 +4232,9 @@ hwloop_optimize (hwloop_info loop)
+ 
+   seq = get_insns ();
+ 
+-  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1)
++  entry_after = BB_END (entry_bb);
++  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1
++      || !entry_after)
+     {
+       basic_block new_bb;
+       edge e;
+@@ -4253,7 +4255,6 @@ hwloop_optimize (hwloop_info loop)
+     }
+   else
+     {
+-      entry_after = BB_END (entry_bb);
+       while (DEBUG_INSN_P (entry_after)
+              || (NOTE_P (entry_after)
+ 		 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
+-- 
+2.11.0
+
diff --git a/package/gcc/9.2.0/0002-xtensa-fix-PR-target-91880.patch b/package/gcc/9.2.0/0002-xtensa-fix-PR-target-91880.patch
new file mode 100644
index 0000000000..0dbf1124a3
--- /dev/null
+++ b/package/gcc/9.2.0/0002-xtensa-fix-PR-target-91880.patch
@@ -0,0 +1,49 @@
+From 7c11710230921246156aecc20eb4b6ccaeaaa473 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 24 Sep 2019 04:15:17 -0700
+Subject: [PATCH] xtensa: fix PR target/91880
+
+Xtensa hwloop_optimize segfaults when zero overhead loop is about to be
+inserted as the first instruction of the function.
+Insert zero overhead loop instruction into new basic block before the
+loop when basic block that precedes the loop is empty.
+
+2019-09-26  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/xtensa.c (hwloop_optimize): Insert zero overhead
+	loop instruction into new basic block before the loop when basic
+	block that precedes the loop is empty.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r276166
+
+ gcc/config/xtensa/xtensa.c                 |  5 ++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index ee5612441e25..2527468d57db 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -4235,7 +4235,9 @@ hwloop_optimize (hwloop_info loop)
+ 
+   seq = get_insns ();
+ 
+-  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1)
++  entry_after = BB_END (entry_bb);
++  if (!single_succ_p (entry_bb) || vec_safe_length (loop->incoming) > 1
++      || !entry_after)
+     {
+       basic_block new_bb;
+       edge e;
+@@ -4256,7 +4258,6 @@ hwloop_optimize (hwloop_info loop)
+     }
+   else
+     {
+-      entry_after = BB_END (entry_bb);
+       while (DEBUG_INSN_P (entry_after)
+              || (NOTE_P (entry_after)
+ 		 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
+-- 
+2.11.0
+
