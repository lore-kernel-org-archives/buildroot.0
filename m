Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE021C52D7B
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 16:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E50860B10;
	Thu,  8 Aug 2024 16:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grMzVhMb7IlE; Thu,  8 Aug 2024 16:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D255360ABB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D255360ABB;
	Thu,  8 Aug 2024 16:56:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5337F1BF28E
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40F0881E57
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 16:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2iUCZ7y5lfp for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 16:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8338281E54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8338281E54
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 16:56:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66E2D847A8; Thu,  8 Aug 2024 16:56:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 18:56:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18ae3b5d7e4c4f85d1323bf797216d6de28d4c0b
X-Git-Newrev: 038af921dc90d54a0bf5dabad8b03327cfe44247
X-Patchwork-Hint: ignore
Message-Id: <20240808165646.66E2D847A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: fix MIPS build issues
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=038af921dc90d54a0bf5dabad8b03327cfe44247
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two patches from upstream to fix MIPS build issues.

Fixes:
 - http://autobuild.buildroot.net/results/4cb021207d341b412ef6921c3368da3b644d7eb0
 - http://autobuild.buildroot.net/results/d0ef7145960695bbbec23909b1ca24a5336f3c23

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-uninitialized-err-in-handle_extension.patch | 47 ++++++++++++++++++++++
 ...f-guest_IP_AT_SYSCALL-in-handle_extension.patch | 33 +++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch b/package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch
new file mode 100644
index 0000000000..c6a6b3dce3
--- /dev/null
+++ b/package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch
@@ -0,0 +1,47 @@
+From 94c2e5c6be23c6323f24deacdad5f98fb9f0b1c2 Mon Sep 17 00:00:00 2001
+From: Andreas Arnez <arnez@linux.ibm.com>
+Date: Wed, 15 May 2024 14:32:42 +0200
+Subject: [PATCH] Fix uninitialized `err' in handle_extension()
+
+In handle_extension(), in the case of a second return from SCHEDSETJMP the
+variable `err' would be used uninitialized.  Fix this by avoiding any
+access to `err' in this case.
+
+Signed-off-by: Andreas Arnez <arnez@linux.ibm.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://sourceware.org/git/?p=valgrind.git;a=commit;h=94c2e5c6be23c6323f24deacdad5f98fb9f0b1c2
+---
+ coregrind/m_scheduler/scheduler.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/coregrind/m_scheduler/scheduler.c b/coregrind/m_scheduler/scheduler.c
+index fc8cf7c9c..29751bb28 100644
+--- a/coregrind/m_scheduler/scheduler.c
++++ b/coregrind/m_scheduler/scheduler.c
+@@ -1233,7 +1233,10 @@ static void handle_extension(ThreadId tid)
+    SCHEDSETJMP(tid, jumped, err = VG_(client_extension)(tid));
+    vg_assert(VG_(is_running_thread)(tid));
+ 
+-   if (err != ExtErr_OK) {
++   if (jumped != (UWord)0) {
++      block_signals();
++      VG_(poll_signals)(tid);
++   } else if (err != ExtErr_OK) {
+       ThreadState* tst = VG_(get_ThreadState)(tid);
+       Addr addr = tst->arch.vex.guest_IP_AT_SYSCALL;
+       switch (err) {
+@@ -1244,11 +1247,6 @@ static void handle_extension(ThreadId tid)
+          VG_(core_panic)("scheduler: bad return code from extension");
+       }
+    }
+-
+-   if (jumped != (UWord)0) {
+-      block_signals();
+-      VG_(poll_signals)(tid);
+-   }
+ }
+ 
+ /* tid just requested a jump to the noredir version of its current
+-- 
+2.39.2
+
diff --git a/package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch b/package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch
new file mode 100644
index 0000000000..006e24096e
--- /dev/null
+++ b/package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch
@@ -0,0 +1,33 @@
+From 16249b21456d681b5d98400287b8dbd926050c75 Mon Sep 17 00:00:00 2001
+From: Andreas Arnez <arnez@linux.ibm.com>
+Date: Wed, 15 May 2024 14:32:42 +0200
+Subject: [PATCH] Avoid use of guest_IP_AT_SYSCALL in handle_extension()
+
+The guest state field guest_IP_AT_SYSCALL is referenced in
+handle_extension(), even though it may not be defined by all
+architectures.  Avoid its use altogether.
+
+Signed-off-by: Andreas Arnez <arnez@linux.ibm.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://sourceware.org/git/?p=valgrind.git;a=commit;h=16249b21456d681b5d98400287b8dbd926050c75
+---
+ coregrind/m_scheduler/scheduler.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/coregrind/m_scheduler/scheduler.c b/coregrind/m_scheduler/scheduler.c
+index 29751bb28..cc8d070b7 100644
+--- a/coregrind/m_scheduler/scheduler.c
++++ b/coregrind/m_scheduler/scheduler.c
+@@ -1237,8 +1237,7 @@ static void handle_extension(ThreadId tid)
+       block_signals();
+       VG_(poll_signals)(tid);
+    } else if (err != ExtErr_OK) {
+-      ThreadState* tst = VG_(get_ThreadState)(tid);
+-      Addr addr = tst->arch.vex.guest_IP_AT_SYSCALL;
++      Addr addr = VG_(get_IP)(tid);
+       switch (err) {
+       case ExtErr_Illop:
+          VG_(synth_sigill)(tid, addr);
+-- 
+2.39.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
