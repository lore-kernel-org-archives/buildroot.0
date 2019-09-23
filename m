From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 23 Sep 2019 13:47:03 -0700
Subject: [Buildroot] [PATCH v2] package/gcc: backport fix for xtensa PR 90922
Message-ID: <20190923204703.18313-1-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stack pointer adjustment code in xtensa call0 ABI prologue missed a case
of no callee-saved registers and a stack frame size bigger than 128 bytes.
Handle that case.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v1->v2:
- fix subject line

 ...2-xtensa-backport-fix-for-PR-target-90922.patch | 43 ++++++++++++++++++++++
 ...1-xtensa-backport-fix-for-PR-target-90922.patch | 43 ++++++++++++++++++++++
 ...1-xtensa-backport-fix-for-PR-target-90922.patch | 43 ++++++++++++++++++++++
 3 files changed, 129 insertions(+)
 create mode 100644 package/gcc/7.4.0/1002-xtensa-backport-fix-for-PR-target-90922.patch
 create mode 100644 package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
 create mode 100644 package/gcc/9.2.0/0001-xtensa-backport-fix-for-PR-target-90922.patch

diff --git a/package/gcc/7.4.0/1002-xtensa-backport-fix-for-PR-target-90922.patch b/package/gcc/7.4.0/1002-xtensa-backport-fix-for-PR-target-90922.patch
new file mode 100644
index 000000000000..38e0309e5c5d
--- /dev/null
+++ b/package/gcc/7.4.0/1002-xtensa-backport-fix-for-PR-target-90922.patch
@@ -0,0 +1,43 @@
+From a592242578e573778241cae6d3928c064dcdfda4 Mon Sep 17 00:00:00 2001
+From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 18 Jun 2019 22:19:12 +0000
+Subject: [PATCH] xtensa: fix for PR target/90922
+
+Stack pointer adjustment code in prologue missed a case of no
+callee-saved registers and a stack frame size bigger than 128 bytes.
+Handle that case.
+
+This fixes the following gcc tests with call0 ABI:
+  gcc.c-torture/execute/stdarg-2.c
+  gcc.dg/torture/pr55882.c
+  gcc.dg/torture/pr57569.c
+
+gcc/
+2019-06-18  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/xtensa.c (xtensa_expand_prologue): Add stack
+	pointer adjustment for the case of no callee-saved registers and
+	stack frame bigger than 128 bytes.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gcc/config/xtensa/xtensa.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 19bd616d67f6..ee5612441e25 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -2802,7 +2802,8 @@ xtensa_expand_prologue (void)
+ 			    gen_rtx_SET (mem, reg));
+ 	    }
+ 	}
+-      if (total_size > 1024)
++      if (total_size > 1024
++	  || (!callee_save_size && total_size > 128))
+ 	{
+ 	  rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
+ 	  emit_move_insn (tmp_reg, GEN_INT (total_size -
+-- 
+2.11.0
+
diff --git a/package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch b/package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
new file mode 100644
index 000000000000..c961ce5d24e9
--- /dev/null
+++ b/package/gcc/8.3.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
@@ -0,0 +1,43 @@
+From a592242578e573778241cae6d3928c064dcdfda4 Mon Sep 17 00:00:00 2001
+From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 18 Jun 2019 22:19:12 +0000
+Subject: [PATCH] xtensa: fix for PR target/90922
+
+Stack pointer adjustment code in prologue missed a case of no
+callee-saved registers and a stack frame size bigger than 128 bytes.
+Handle that case.
+
+This fixes the following gcc tests with call0 ABI:
+  gcc.c-torture/execute/stdarg-2.c
+  gcc.dg/torture/pr55882.c
+  gcc.dg/torture/pr57569.c
+
+gcc/
+2019-06-18  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/xtensa.c (xtensa_expand_prologue): Add stack
+	pointer adjustment for the case of no callee-saved registers and
+	stack frame bigger than 128 bytes.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gcc/config/xtensa/xtensa.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 19bd616d67f6..ee5612441e25 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -2862,7 +2862,8 @@ xtensa_expand_prologue (void)
+ 			    gen_rtx_SET (mem, reg));
+ 	    }
+ 	}
+-      if (total_size > 1024)
++      if (total_size > 1024
++	  || (!callee_save_size && total_size > 128))
+ 	{
+ 	  rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
+ 	  emit_move_insn (tmp_reg, GEN_INT (total_size -
+-- 
+2.11.0
+
diff --git a/package/gcc/9.2.0/0001-xtensa-backport-fix-for-PR-target-90922.patch b/package/gcc/9.2.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
new file mode 100644
index 000000000000..bc1d13a9e4bb
--- /dev/null
+++ b/package/gcc/9.2.0/0001-xtensa-backport-fix-for-PR-target-90922.patch
@@ -0,0 +1,43 @@
+From a592242578e573778241cae6d3928c064dcdfda4 Mon Sep 17 00:00:00 2001
+From: jcmvbkbc <jcmvbkbc@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 18 Jun 2019 22:19:12 +0000
+Subject: [PATCH] xtensa: fix for PR target/90922
+
+Stack pointer adjustment code in prologue missed a case of no
+callee-saved registers and a stack frame size bigger than 128 bytes.
+Handle that case.
+
+This fixes the following gcc tests with call0 ABI:
+  gcc.c-torture/execute/stdarg-2.c
+  gcc.dg/torture/pr55882.c
+  gcc.dg/torture/pr57569.c
+
+gcc/
+2019-06-18  Max Filippov  <jcmvbkbc@gmail.com>
+
+	* config/xtensa/xtensa.c (xtensa_expand_prologue): Add stack
+	pointer adjustment for the case of no callee-saved registers and
+	stack frame bigger than 128 bytes.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gcc/config/xtensa/xtensa.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 19bd616d67f6..ee5612441e25 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -2865,7 +2865,8 @@ xtensa_expand_prologue (void)
+ 			    gen_rtx_SET (mem, reg));
+ 	    }
+ 	}
+-      if (total_size > 1024)
++      if (total_size > 1024
++	  || (!callee_save_size && total_size > 128))
+ 	{
+ 	  rtx tmp_reg = gen_rtx_REG (Pmode, A9_REG);
+ 	  emit_move_insn (tmp_reg, GEN_INT (total_size -
+-- 
+2.11.0
+
-- 
2.11.0
