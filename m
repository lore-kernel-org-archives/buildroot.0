Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE667FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81FD284DD1;
	Fri, 24 Apr 2026 16:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-fneXajLs2M; Fri, 24 Apr 2026 16:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10BCA84DC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777047960;
	bh=YmiK00okIGC7TYNPhAJyist5CE7C+APtTP6HbJKeY0o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rQ+xAIgSdIlGt091As396fz2zRCQq3uxH3b1ErILdXo+4dEXnRWYJ5xvrTNQVwr8l
	 u9roie80EzScswrRRutTQCa76PsbqSxdx2k26bnJQcnY0dXdLtfIWHJPLgBDHI/MW0
	 xF1UQsqvqrpcfObaUnLjJH7Ax4X/VSvML7O6aClJkg4eHJ615nHnHTpvfNWftmVEVb
	 ya7QzzuL6ju+xol+xulg/vBr2n7/johXwvl80NkElhjCf3yWSo9SRMV46xEmLi+8OS
	 kuxvjtzBhZbCWYozzMM5X9bt6ePiZU3SBfvV06shajkEW5X15aSU2qDWm7vYkKKxpo
	 xdw0eXl/LzK3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10BCA84DC9;
	Fri, 24 Apr 2026 16:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DDB2206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2A554295F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lumZB4VBabGw for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70456428ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70456428ED
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A74D82B33; Fri, 24 Apr 2026 16:25:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:20:36 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 953c7fb20d79be66a8fc99844c2b83d61361c7b1
X-Git-Newrev: c4bf25dcdf8947c6c89df2cdbd479f0d6969943e
X-Patchwork-Hint: ignore
Message-Id: <20260424162539.1A74D82B33@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/c-icap: fix musl
 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c4bf25dcdf8947c6c89df2cdbd479f0d6969943e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/33b/33bb3ea8ac36da7f40a82c580d3614f0b34a7ab2/

The oldest build error dates back to June 2024 so this patch should be
backported to LTS branches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 428e0e292be4d6b41af9db893a97e90cc1730e4e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-printing-in-various-printf-to-avoid-warn.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch b/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
new file mode 100644
index 0000000000..7183efa46f
--- /dev/null
+++ b/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
@@ -0,0 +1,47 @@
+From 8ef8966237865ec699ab16d208ff56edaac4ff7b Mon Sep 17 00:00:00 2001
+From: Christos Tsantilas <christos@chtsanti.net>
+Date: Fri, 1 Nov 2019 08:00:52 -0700
+Subject: [PATCH] Fix integer printing in various printf to avoid warnings
+ about integer sizes
+
+Upstream: https://github.com/c-icap/c-icap-server/commit/8ef8966237865ec699ab16d208ff56edaac4ff7b
+
+[Bernd: partially backported to 0.5.10]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ mpmt_server.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/mpmt_server.c b/mpmt_server.c
+index a30d55d4..9b178a66 100644
+--- a/mpmt_server.c
++++ b/mpmt_server.c
+@@ -74,7 +74,7 @@ typedef struct server_decl {
+ 
+ ci_thread_mutex_t threads_list_mtx;
+ server_decl_t **threads_list = NULL;
+-ci_thread_t listener_thread_id = -1;
++ci_thread_t listener_thread_id;
+ int listener_running = 0;
+ 
+ ci_thread_cond_t free_server_cond;
+@@ -242,8 +242,8 @@ static void cancel_all_threads()
+         for (i=0; i<CI_CONF.THREADS_PER_CHILD; i++) {
+             if (threads_list[i] != NULL) { /* if the i thread is still alive*/
+                 if (!threads_list[i]->running) { /*if the i thread is not running any more*/
+-                    ci_debug_printf(5, "Cancel server %d, thread_id %lu (%d)\n",
+-                                    threads_list[i]->srv_id, threads_list[i]->srv_pthread,
++                    ci_debug_printf(5, "Cancel server %" PRIu64 ", thread_id %" PRIu64 " (%d)\n",
++                                    (uint64_t)threads_list[i]->srv_id, (uint64_t)threads_list[i]->srv_pthread,
+                                     i);
+                     ci_thread_join(threads_list[i]->srv_pthread);
+                     release_thread_i(i);
+@@ -252,7 +252,7 @@ static void cancel_all_threads()
+                     /*The thread is still running, and we have a timeout for waiting
+                       the thread to exit. */
+                     if (wait_for_workers <= 2) {
+-                        ci_debug_printf(5, "Thread %ld still running near the timeout. Try to kill it\n", threads_list[i]->srv_pthread);
++		        ci_debug_printf(5, "Thread %" PRIu64 " still running near the timeout. Try to kill it\n", (uint64_t)threads_list[i]->srv_pthread);
+                         pthread_kill( threads_list[i]->srv_pthread, SIGTERM);
+                     }
+                 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
