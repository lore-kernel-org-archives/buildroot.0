From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 14:45:50 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/gcc: xtensa: fix
 atomic NAND code generation
Message-ID: <20180928124524.E1E858A384@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66e996581868d66b9bae42bca2da70a7b71018dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

xtensa gcc incorrectly generates code for atomic NAND operation as
~a1 & a2 instead of ~(a1 & a2). Fix that.

Backported from: r264087
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: drop gcc-8.x patch]
(cherry picked from commit 84efe72b785c7c2437a07a07d92f39a811c647f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nsa-fix-NAND-code-in-xtensa_expand_atomic.patch | 39 ++++++++++++++++++++++
 ...nsa-fix-NAND-code-in-xtensa_expand_atomic.patch | 39 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/package/gcc/6.4.0/872-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch b/package/gcc/6.4.0/872-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
new file mode 100644
index 0000000000..d62d7c1566
--- /dev/null
+++ b/package/gcc/6.4.0/872-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
@@ -0,0 +1,39 @@
+From 6765eecde2ed8d4be0fc217408b9e9b92a840aff Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 4 Sep 2018 00:39:32 -0700
+Subject: [PATCH] gcc: xtensa: fix NAND code in xtensa_expand_atomic
+
+NAND is ~(a1 & a2), but xtensa_expand_atomic does ~a1 & a2.
+That fixes libatomic tests atomic-op-{1,2}.
+
+gcc/
+2018-09-04  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/xtensa.c (xtensa_expand_atomic): Reorder AND and
+	XOR operations in NAND case.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: r264087
+---
+ gcc/config/xtensa/xtensa.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 7cfe64d42895..080bb4ad765d 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -1614,9 +1614,9 @@ xtensa_expand_atomic (enum rtx_code code, rtx target, rtx mem, rtx val,
+       break;
+ 
+     case MULT: /* NAND */
+-      tmp = expand_simple_binop (SImode, XOR, old, ac.modemask,
++      tmp = expand_simple_binop (SImode, AND, old, val,
+ 				 NULL_RTX, 1, OPTAB_DIRECT);
+-      tmp = expand_simple_binop (SImode, AND, tmp, val,
++      tmp = expand_simple_binop (SImode, XOR, tmp, ac.modemask,
+ 				 new_rtx, 1, OPTAB_DIRECT);
+       break;
+ 
+-- 
+2.11.0
+
diff --git a/package/gcc/7.3.0/0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch b/package/gcc/7.3.0/0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
new file mode 100644
index 0000000000..d62d7c1566
--- /dev/null
+++ b/package/gcc/7.3.0/0003-gcc-xtensa-fix-NAND-code-in-xtensa_expand_atomic.patch
@@ -0,0 +1,39 @@
+From 6765eecde2ed8d4be0fc217408b9e9b92a840aff Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 4 Sep 2018 00:39:32 -0700
+Subject: [PATCH] gcc: xtensa: fix NAND code in xtensa_expand_atomic
+
+NAND is ~(a1 & a2), but xtensa_expand_atomic does ~a1 & a2.
+That fixes libatomic tests atomic-op-{1,2}.
+
+gcc/
+2018-09-04  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/xtensa.c (xtensa_expand_atomic): Reorder AND and
+	XOR operations in NAND case.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Backported from: r264087
+---
+ gcc/config/xtensa/xtensa.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 7cfe64d42895..080bb4ad765d 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -1614,9 +1614,9 @@ xtensa_expand_atomic (enum rtx_code code, rtx target, rtx mem, rtx val,
+       break;
+ 
+     case MULT: /* NAND */
+-      tmp = expand_simple_binop (SImode, XOR, old, ac.modemask,
++      tmp = expand_simple_binop (SImode, AND, old, val,
+ 				 NULL_RTX, 1, OPTAB_DIRECT);
+-      tmp = expand_simple_binop (SImode, AND, tmp, val,
++      tmp = expand_simple_binop (SImode, XOR, tmp, ac.modemask,
+ 				 new_rtx, 1, OPTAB_DIRECT);
+       break;
+ 
+-- 
+2.11.0
+
