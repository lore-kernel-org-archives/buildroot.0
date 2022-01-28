Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1C1C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 17:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED6584C73;
	Fri, 28 Jan 2022 17:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tusYifCY7EcJ; Fri, 28 Jan 2022 17:00:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB5C83408;
	Fri, 28 Jan 2022 17:00:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D4901BF276
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 16:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48A3F82893
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 16:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39oJURmHgTy8 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 16:59:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60A308283D
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 16:59:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F08AF82AFE; Fri, 28 Jan 2022 16:52:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 17:59:15 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a11767de07d2d4fbb15e08002a0041b5c70e85b4
X-Git-Newrev: 1d908fb496b7bef62e7ccab27f68170685770a59
X-Patchwork-Hint: ignore
Message-Id: <20220128165257.F08AF82AFE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ghostscript: fix
 CVE-2021-45949
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d908fb496b7bef62e7ccab27f68170685770a59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Ghostscript GhostPDL 9.50 through 9.54.0 has a heap-based buffer
overflow in sampled_data_finish (called from sampled_data_continue and
interp).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c817641331431aeb6db7b487173d63dbd9c73295)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...stack-management-in-sampled_data_continue.patch | 68 ++++++++++++++++++++++
 package/ghostscript/ghostscript.mk                 |  3 +
 2 files changed, 71 insertions(+)

diff --git a/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch b/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
new file mode 100644
index 0000000000..72e07df0ac
--- /dev/null
+++ b/package/ghostscript/0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
@@ -0,0 +1,68 @@
+From 2a3129365d3bc0d4a41f107ef175920d1505d1f7 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 1 Jun 2021 19:57:16 +0100
+Subject: [PATCH] Bug 703902: Fix op stack management in
+ sampled_data_continue()
+
+Replace pop() (which does no checking, and doesn't handle stack extension
+blocks) with ref_stack_pop() which does do all that.
+
+We still use pop() in one case (it's faster), but we have to later use
+ref_stack_pop() before calling sampled_data_sample() which also accesses the
+op stack.
+
+Fixes:
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=34675
+
+[Retrieved from:
+https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=2a3129365d3bc0d4a41f107ef175920d1505d1f7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ psi/zfsample.c | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/psi/zfsample.c b/psi/zfsample.c
+index 0e8e4bc8d..00cd0cfdd 100644
+--- a/psi/zfsample.c
++++ b/psi/zfsample.c
+@@ -533,15 +533,19 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+         for (j = 0; j < bps; j++)
+             data_ptr[bps * i + j] = (byte)(cv >> ((bps - 1 - j) * 8));	/* MSB first */
+     }
+-    pop(num_out);		    /* Move op to base of result values */
+ 
+-    /* Check if we are done collecting data. */
++    pop(num_out); /* Move op to base of result values */
+ 
++    /* From here on, we have to use ref_stack_pop() rather than pop()
++       so that it handles stack extension blocks properly, before calling
++       sampled_data_sample() which also uses the op stack.
++     */
++    /* Check if we are done collecting data. */
+     if (increment_cube_indexes(params, penum->indexes)) {
+         if (stack_depth_adjust == 0)
+-            pop(O_STACK_PAD);	    /* Remove spare stack space */
++            ref_stack_pop(&o_stack, O_STACK_PAD);	    /* Remove spare stack space */
+         else
+-            pop(stack_depth_adjust - num_out);
++            ref_stack_pop(&o_stack, stack_depth_adjust - num_out);
+         /* Execute the closing procedure, if given */
+         code = 0;
+         if (esp_finish_proc != 0)
+@@ -554,11 +558,11 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+             if ((O_STACK_PAD - stack_depth_adjust) < 0) {
+                 stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
+                 check_op(stack_depth_adjust);
+-                pop(stack_depth_adjust);
++                ref_stack_pop(&o_stack, stack_depth_adjust);
+             }
+             else {
+                 check_ostack(O_STACK_PAD - stack_depth_adjust);
+-                push(O_STACK_PAD - stack_depth_adjust);
++                ref_stack_push(&o_stack, O_STACK_PAD - stack_depth_adjust);
+                 for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
+                     make_null(op - i);
+             }
+-- 
+2.25.1
+
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 91871728ba..9e13f29fe9 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -27,6 +27,9 @@ GHOSTSCRIPT_IGNORE_CVES += CVE-2021-3781
 # 0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
 GHOSTSCRIPT_IGNORE_CVES += CVE-2021-45944
 
+# 0004-Bug-703902-Fix-op-stack-management-in-sampled_data_continue.patch
+GHOSTSCRIPT_IGNORE_CVES += CVE-2021-45949
+
 # Ghostscript includes (old) copies of several libraries, delete them.
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
