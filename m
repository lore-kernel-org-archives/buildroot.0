Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EEBC433FE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 17:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B70DC61103;
	Fri, 28 Jan 2022 17:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztGqtotMpTAN; Fri, 28 Jan 2022 17:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF19360C19;
	Fri, 28 Jan 2022 17:01:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D93C1C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4C4A82893
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCqvGKGZs6P4 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 17:00:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 160AB8283D
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 17:00:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A6ABF82A43; Fri, 28 Jan 2022 16:53:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 17:57:44 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 7f9b37303b63feb13514cee47e0ae3e66ce7c945
X-Git-Newrev: cfdca3ebf81bee54b3fc5e3a378c5e3131dfe2e0
X-Patchwork-Hint: ignore
Message-Id: <20220128165302.A6ABF82A43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/ghostscript: fix
 CVE-2021-45944
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfdca3ebf81bee54b3fc5e3a378c5e3131dfe2e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Ghostscript GhostPDL 9.50 through 9.53.3 has a use-after-free in
sampled_data_sample (called from sampled_data_continue and interp).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 70910c4092d9c9f359c26436fbc3c75918a90129)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ck-stack-limits-after-function-evaluation.patch | 52 ++++++++++++++++++++++
 package/ghostscript/ghostscript.mk                 |  3 ++
 2 files changed, 55 insertions(+)

diff --git a/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch b/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
new file mode 100644
index 0000000000..352f1754f6
--- /dev/null
+++ b/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
@@ -0,0 +1,52 @@
+From 7861fcad13c497728189feafb41cd57b5b50ea25 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 12 Feb 2021 10:34:23 +0000
+Subject: [PATCH] oss-fuzz 30715: Check stack limits after function evaluation.
+
+During function result sampling, after the callout to the Postscript
+interpreter, make sure there is enough stack space available before pushing
+or popping entries.
+
+In thise case, the Postscript procedure for the "function" is totally invalid
+(as a function), and leaves the op stack in an unrecoverable state (as far as
+function evaluation is concerned). We end up popping more entries off the
+stack than are available.
+
+To cope, add in stack limit checking to throw an appropriate error when this
+happens.
+
+[Retrieved from:
+https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=7861fcad13c497728189feafb41cd57b5b50ea25]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ psi/zfsample.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/psi/zfsample.c b/psi/zfsample.c
+index 290809405..652ae02c6 100644
+--- a/psi/zfsample.c
++++ b/psi/zfsample.c
+@@ -551,9 +551,17 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+     } else {
+         if (stack_depth_adjust) {
+             stack_depth_adjust -= num_out;
+-            push(O_STACK_PAD - stack_depth_adjust);
+-            for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
+-                make_null(op - i);
++            if ((O_STACK_PAD - stack_depth_adjust) < 0) {
++                stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
++                check_op(stack_depth_adjust);
++                pop(stack_depth_adjust);
++            }
++            else {
++                check_ostack(O_STACK_PAD - stack_depth_adjust);
++                push(O_STACK_PAD - stack_depth_adjust);
++                for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
++                    make_null(op - i);
++            }
+         }
+     }
+ 
+-- 
+2.25.1
+
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index d502d19206..91871728ba 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -24,6 +24,9 @@ GHOSTSCRIPT_DEPENDENCIES = \
 # 0002-Bug-704342-Include-device-specifier-strings-in-acces.patch
 GHOSTSCRIPT_IGNORE_CVES += CVE-2021-3781
 
+# 0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
+GHOSTSCRIPT_IGNORE_CVES += CVE-2021-45944
+
 # Ghostscript includes (old) copies of several libraries, delete them.
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
