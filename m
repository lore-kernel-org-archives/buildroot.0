From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 20 May 2015 23:00:37 +0300
Subject: [Buildroot] [PATCH] gcc: fix PR 65730 (ICE on xtensa cores w/o
	hardware multiplication)
Message-ID: <1432152037-6346-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gcc/4.7.4/111-pr65730.patch | 37 +++++++++++++++++++++++++++++++++++++
 package/gcc/4.8.4/111-pr65730.patch | 37 +++++++++++++++++++++++++++++++++++++
 package/gcc/4.9.2/111-pr65730.patch | 37 +++++++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)
 create mode 100644 package/gcc/4.7.4/111-pr65730.patch
 create mode 100644 package/gcc/4.8.4/111-pr65730.patch
 create mode 100644 package/gcc/4.9.2/111-pr65730.patch

diff --git a/package/gcc/4.7.4/111-pr65730.patch b/package/gcc/4.7.4/111-pr65730.patch
new file mode 100644
index 0000000..f195e30
--- /dev/null
+++ b/package/gcc/4.7.4/111-pr65730.patch
@@ -0,0 +1,37 @@
+From b9a7775674d91c7af8043a83211ffeaa576327d7 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 10 Apr 2015 17:46:30 +0300
+Subject: [PATCH] Fix PR target/65730
+
+2015-05-20  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/xtensa.c (init_alignment_context): Replace MULT
+	by BITS_PER_UNIT with ASHIFT by exact_log2 (BITS_PER_UNIT).
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223452
+Changes to ChangeLog are dropped.
+
+ gcc/config/xtensa/xtensa.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index eb039ba..7296e36 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -1461,8 +1461,9 @@ init_alignment_context (struct alignment_context *ac, rtx mem)
+   if (ac->shift != NULL_RTX)
+     {
+       /* Shift is the byte count, but we need the bitcount.  */
+-      ac->shift = expand_simple_binop (SImode, MULT, ac->shift,
+-				       GEN_INT (BITS_PER_UNIT),
++      gcc_assert (exact_log2 (BITS_PER_UNIT) >= 0);
++      ac->shift = expand_simple_binop (SImode, ASHIFT, ac->shift,
++				       GEN_INT (exact_log2 (BITS_PER_UNIT)),
+ 				       NULL_RTX, 1, OPTAB_DIRECT);
+       ac->modemask = expand_simple_binop (SImode, ASHIFT,
+ 					  GEN_INT (GET_MODE_MASK (mode)),
+-- 
+1.8.1.4
+
diff --git a/package/gcc/4.8.4/111-pr65730.patch b/package/gcc/4.8.4/111-pr65730.patch
new file mode 100644
index 0000000..f195e30
--- /dev/null
+++ b/package/gcc/4.8.4/111-pr65730.patch
@@ -0,0 +1,37 @@
+From b9a7775674d91c7af8043a83211ffeaa576327d7 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 10 Apr 2015 17:46:30 +0300
+Subject: [PATCH] Fix PR target/65730
+
+2015-05-20  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/xtensa.c (init_alignment_context): Replace MULT
+	by BITS_PER_UNIT with ASHIFT by exact_log2 (BITS_PER_UNIT).
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223452
+Changes to ChangeLog are dropped.
+
+ gcc/config/xtensa/xtensa.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index eb039ba..7296e36 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -1461,8 +1461,9 @@ init_alignment_context (struct alignment_context *ac, rtx mem)
+   if (ac->shift != NULL_RTX)
+     {
+       /* Shift is the byte count, but we need the bitcount.  */
+-      ac->shift = expand_simple_binop (SImode, MULT, ac->shift,
+-				       GEN_INT (BITS_PER_UNIT),
++      gcc_assert (exact_log2 (BITS_PER_UNIT) >= 0);
++      ac->shift = expand_simple_binop (SImode, ASHIFT, ac->shift,
++				       GEN_INT (exact_log2 (BITS_PER_UNIT)),
+ 				       NULL_RTX, 1, OPTAB_DIRECT);
+       ac->modemask = expand_simple_binop (SImode, ASHIFT,
+ 					  GEN_INT (GET_MODE_MASK (mode)),
+-- 
+1.8.1.4
+
diff --git a/package/gcc/4.9.2/111-pr65730.patch b/package/gcc/4.9.2/111-pr65730.patch
new file mode 100644
index 0000000..f195e30
--- /dev/null
+++ b/package/gcc/4.9.2/111-pr65730.patch
@@ -0,0 +1,37 @@
+From b9a7775674d91c7af8043a83211ffeaa576327d7 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Fri, 10 Apr 2015 17:46:30 +0300
+Subject: [PATCH] Fix PR target/65730
+
+2015-05-20  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/xtensa.c (init_alignment_context): Replace MULT
+	by BITS_PER_UNIT with ASHIFT by exact_log2 (BITS_PER_UNIT).
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 223452
+Changes to ChangeLog are dropped.
+
+ gcc/config/xtensa/xtensa.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index eb039ba..7296e36 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -1461,8 +1461,9 @@ init_alignment_context (struct alignment_context *ac, rtx mem)
+   if (ac->shift != NULL_RTX)
+     {
+       /* Shift is the byte count, but we need the bitcount.  */
+-      ac->shift = expand_simple_binop (SImode, MULT, ac->shift,
+-				       GEN_INT (BITS_PER_UNIT),
++      gcc_assert (exact_log2 (BITS_PER_UNIT) >= 0);
++      ac->shift = expand_simple_binop (SImode, ASHIFT, ac->shift,
++				       GEN_INT (exact_log2 (BITS_PER_UNIT)),
+ 				       NULL_RTX, 1, OPTAB_DIRECT);
+       ac->modemask = expand_simple_binop (SImode, ASHIFT,
+ 					  GEN_INT (GET_MODE_MASK (mode)),
+-- 
+1.8.1.4
+
-- 
1.8.1.4
