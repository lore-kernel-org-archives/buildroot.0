Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA81FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D288A84C78;
	Fri, 24 Apr 2026 16:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m02-q-Fcai6u; Fri, 24 Apr 2026 16:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF66884D5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048707;
	bh=xNeUEaV4Odn55Mox0OymFk1WMQ1zUYx/8irF6AoCgBU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dLum9vbPyuhrptuMDMxonlqPlcJqUi0fXggU0DtdbTqy4BvJi1PEO4Gzzn3IYYVHq
	 RqNDxBYvJ3faFHnzuN4uABRK6rdGPW7OkTSgl6CTxHUV4g0VxHyV+qlc/qC1zhzFEp
	 AZs11nvawypq8hfjq3pd5h9HkUuLWXYnIo75j1/x1KwC8Q1QttZghfKFaUooo6eFTZ
	 oeS1J/19Cf70DgF69Ul9KdretB9EzGsW59Blp/di1b7qUtSmVZis6YuUjCtPO8DwyB
	 FDk/g6M9xB4Bm0pqn8RWRQ4vmlny/A/5xVDDNa3sRE3y+/fPzwI9Kj8BE92l0P21O2
	 kv76rooLlDzhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF66884D5B;
	Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C10E24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E4C7423F6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLV2fomrRVj5 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F3FD40776
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F3FD40776
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1528382B2E; Fri, 24 Apr 2026 16:38:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Apr 2026 14:10:48 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: b79ab7b8126a04d41edc343750054b60ce4533eb
X-Git-Newrev: 66a249753e3b65acdd7eef42eba6b26570d70cb9
X-Patchwork-Hint: ignore
Message-Id: <20260424163825.1528382B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/c-icap: fix musl
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66a249753e3b65acdd7eef42eba6b26570d70cb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
