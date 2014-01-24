From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Fri, 24 Jan 2014 09:11:19 -0600
Subject: [Buildroot] [PATCH] gcc 4.8.2: arm fixes for stack corruption
Message-ID: <20140124151119.GA27232@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This seems to especially affect the kernel, but in an
interrupt-heavy system, this fixes a bug that can cause frequent
NULL pointer dereference crashes on ARM systems.
---
 .../4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch  | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gcc/4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch

diff --git a/package/gcc/4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch b/package/gcc/4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch
new file mode 100644
index 0000000..4927930
--- /dev/null
+++ b/package/gcc/4.8.2/842-gcc-4.8.2-Fix-PR-target-58854.patch
@@ -0,0 +1,32 @@
+From 9a228f68817f79bbd1d295b8e6fcaed25c47ee8f Mon Sep 17 00:00:00 2001
+From: ramana <ramana@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 30 Oct 2013 10:54:04 +0000
+Subject: [PATCH] Fix PR target/58854
+
+2013-10-30  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
+
+	PR target/58854
+	* config/arm/arm.c (arm_expand_epilogue_apcs_frame): Emit blockage.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 204203 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ (omitted from this patch) gcc/ChangeLog        |    5 +++++
+ gcc/config/arm/arm.c |    1 +
+ 2 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+index 212a4bc..23dfc0e 100644
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -26547,6 +26547,7 @@ arm_expand_epilogue_apcs_frame (bool really_return)
+   num_regs = bit_count (saved_regs_mask);
+   if ((offsets->outgoing_args != (1 + num_regs)) || cfun->calls_alloca)
+     {
++      emit_insn (gen_blockage ());
+       /* Unwind the stack to just below the saved registers.  */
+       emit_insn (gen_addsi3 (stack_pointer_rtx,
+                              hard_frame_pointer_rtx,
+-- 
+1.7.1
+
-- 
1.8.5.2
