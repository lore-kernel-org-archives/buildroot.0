Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB58EC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 13:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB8481E0D;
	Thu,  8 Aug 2024 13:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7e94Ce-b3tYs; Thu,  8 Aug 2024 13:39:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D1081E02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D1081E02;
	Thu,  8 Aug 2024 13:39:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 935C01BF33A
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 13:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80B5A606D4
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 13:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loCz4TtXFeNz for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 13:39:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E33FB60669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33FB60669
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E33FB60669
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 13:39:05 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A465A3521203; Thu,  8 Aug 2024 15:39:01 +0200 (CEST)
Date: Thu, 8 Aug 2024 15:39:01 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZrTKdR2FH9o0gwD+@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1723124342; bh=OsaKGEbpDsVPoKcgLn8GMPK0hy9O0lQevNqVb13+KGQ=;
 h=Date:From:To:Subject:From;
 b=rn0jESJI5ezBZa2Og7eTm0Xt9mhZLs2tq2VjRPcAmlt9YxuwiRAHQwEHR7RhYSgT1
 moO+SPHuRSpCbXalPflYgTr5/D3av72MttrQjwkLhBEyrstHp5Il1gbm5KyQeX02th
 jH/b11OaNWOFz4dhoVcgWkAq4CPMtdLgQ4Iljsv0YAjx3ltmXVcvuDpketX6r5ZGbi
 7kCeKoFKkr1dTdRajfRKyUkoC+h0BmdVt5/4iHJX1XFTEXk0UQpArEGaMUM99E1Jzw
 hANLNggiCsXg7fXqaPkfv/0R+zfQKD4B7kNAwM6xhKU4MV9sOeQ0SdbVUWYFPY/+0X
 5bbUJkecB81UQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=rn0jESJI
Subject: [Buildroot] [PATCH] package/valgrind: fix MIPS compile issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add two patches from upstream to fix MIPS compile issues.

Fixes:
 - http://autobuild.buildroot.net/results/4cb/4cb021207d341b412ef6921c3368da3b644d7eb0
 - http://autobuild.buildroot.net/results/d0e/d0ef7145960695bbbec23909b1ca24a5336f3c23

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...ninitialized-err-in-handle_extension.patch | 47 +++++++++++++++++++
 ...st_IP_AT_SYSCALL-in-handle_extension.patch | 33 +++++++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 package/valgrind/0003-Fix-uninitialized-err-in-handle_extension.patch
 create mode 100644 package/valgrind/0004-Avoid-use-of-guest_IP_AT_SYSCALL-in-handle_extension.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
