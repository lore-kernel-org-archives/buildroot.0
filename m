From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:44:31 +0100
Subject: [Buildroot] [git commit] package/gcc: fix ICE on xtensa, 5.x and 6.x,
	PR target/78603
Message-ID: <20161130214916.C242E7FB29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1816f875409de16b91d002fd383ade793c93f504
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Zero overhead loop optimization pass may incorrectly put start of the
loop between a call and its CALL_ARG_LOCATION note, resulting in the
following build error:

  ../src/pjlib-test/thread.c: In function 'thread_test':
  ../src/pjlib-test/thread.c:328:1: internal compiler error: in
    dwarf2out_var_location, at dwarf2out.c:21846

Fixes:
  http://autobuild.buildroot.net/results/d919e1276ce1d39b4b3eb09937927d5959cd69a3/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch | 37 ++++++++++++++++++++++
 .../gcc/6.2.0/871-xtensa-Fix-PR-target-78603.patch | 37 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/package/gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch b/package/gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch
new file mode 100644
index 0000000..628268a
--- /dev/null
+++ b/package/gcc/5.4.0/876-xtensa-Fix-PR-target-78603.patch
@@ -0,0 +1,37 @@
+From e178289a12a829ec47dc5038d91401f65381e71d Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 29 Nov 2016 13:09:17 -0800
+Subject: [PATCH 8/8] xtensa: Fix PR target/78603
+
+2016-11-29  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/xtensa.c (hwloop_optimize): Don't emit zero
+	overhead loop start between a call and its CALL_ARG_LOCATION
+	note.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r242979
+
+ gcc/config/xtensa/xtensa.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index 206ff80..36ab1e3 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -4182,7 +4182,10 @@ hwloop_optimize (hwloop_info loop)
+       entry_after = BB_END (entry_bb);
+       while (DEBUG_INSN_P (entry_after)
+              || (NOTE_P (entry_after)
+-                 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
++                 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK
++		 /* Make sure we don't split a call and its corresponding
++		    CALL_ARG_LOCATION note.  */
++                 && NOTE_KIND (entry_after) != NOTE_INSN_CALL_ARG_LOCATION))
+         entry_after = PREV_INSN (entry_after);
+ 
+       emit_insn_after (seq, entry_after);
+-- 
+2.1.4
+
diff --git a/package/gcc/6.2.0/871-xtensa-Fix-PR-target-78603.patch b/package/gcc/6.2.0/871-xtensa-Fix-PR-target-78603.patch
new file mode 100644
index 0000000..0331814
--- /dev/null
+++ b/package/gcc/6.2.0/871-xtensa-Fix-PR-target-78603.patch
@@ -0,0 +1,37 @@
+From 59cce7b304a8cbbb508ba21ab2f9052d3ee9a9e3 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Tue, 29 Nov 2016 13:09:17 -0800
+Subject: [PATCH 2/2] xtensa: Fix PR target/78603
+
+2016-11-29  Max Filippov  <jcmvbkbc@gmail.com>
+gcc/
+	* config/xtensa/xtensa.c (hwloop_optimize): Don't emit zero
+	overhead loop start between a call and its CALL_ARG_LOCATION
+	note.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: r242979
+
+ gcc/config/xtensa/xtensa.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/xtensa/xtensa.c b/gcc/config/xtensa/xtensa.c
+index e49f784..70f698a 100644
+--- a/gcc/config/xtensa/xtensa.c
++++ b/gcc/config/xtensa/xtensa.c
+@@ -4158,7 +4158,10 @@ hwloop_optimize (hwloop_info loop)
+       entry_after = BB_END (entry_bb);
+       while (DEBUG_INSN_P (entry_after)
+              || (NOTE_P (entry_after)
+-                 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK))
++                 && NOTE_KIND (entry_after) != NOTE_INSN_BASIC_BLOCK
++		 /* Make sure we don't split a call and its corresponding
++		    CALL_ARG_LOCATION note.  */
++                 && NOTE_KIND (entry_after) != NOTE_INSN_CALL_ARG_LOCATION))
+         entry_after = PREV_INSN (entry_after);
+ 
+       emit_insn_after (seq, entry_after);
+-- 
+2.1.4
+
