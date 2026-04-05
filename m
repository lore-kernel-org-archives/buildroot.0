Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E88E64019
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 10:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1E0B81211;
	Sun,  5 Apr 2026 10:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRV9nSS7LoCi; Sun,  5 Apr 2026 10:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E70288120C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775385539;
	bh=7ALWEzkJtt5JsB9NAa0AIUzKckTUKp/j6+KlzK8EwyI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QKW9sAMA1F2vZiFAamIqtZbV28blFqV6ssLjJxOqXWY+r/DcjvsCJeHinKc3228j2
	 u8VThhrcUHBV6k2UeMIXa8RBGEBw79zADRZAgmQuNIzJ5I1WSZQsqr8KW74XvNaURW
	 sgn8qJpCRT5CWGA5e6aRpAQr2nOgQpp4GN2jeScwH5hFhrg9Loo3sOQhJF8mNBgE2z
	 n4eubSWiPOZQBlRUQzla1Hvfeg5CtkZWgna0/YiPqQokogjFBbDVbDCLXl+5ZPqFOw
	 teaNR3K3azX4RKCyFQJhZ3BTL5pRij8IF+0VuSAfsQKjtKBMUkROIiUcl4yBBFPt11
	 4gjZ2ZuxnpI1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E70288120C;
	Sun,  5 Apr 2026 10:38:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF232EF
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBE3640060
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kewe1mJT4lT2 for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 10:38:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1458A4005B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1458A4005B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1458A4005B
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:38:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97492A4C33F0
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 12:38:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53282)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9KsV-000000007LA-0zq9
 for buildroot@buildroot.org; Sun, 05 Apr 2026 10:38:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Apr 2026 12:38:47 +0200
Message-ID: <20260405103851.2855053-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775385531;
 bh=JAgcMVtTmqIJNMGKA5YoixTjoIRrAIIdQNnIdJIC4nU=;
 h=From:To:Subject:Date:From;
 b=DOEYqKrxcJlghesgke7qvZhsGHvQkvpOIdWZsyANT1IlQM0Cdx2QxzQTovUnQ3NTo
 KEzv93fJR/n4wjoDoAVRowst/RlyibHCegnbo+chHuC2qP1OjUmgMy5h4moHw3hlzy
 sYxM63srfArD5d+lS31X98kKdMlgIF5IJ5hSOMoDkA13kJIWQB6LLhuTmmqzf2M/A4
 SQQaSxPpVyT0K09XfFG7NfVvJWC3VsuY+NRdGjShpWMaCu8n/hFYe3LpxrcfJ2rDIg
 M2pkvGykEmZlXiFrOjXMxIzIGXnToCiPnNrkfbjRNzqgrQ/52HouqwSfI6lTVbuaGN
 L7LMTRroU5Iuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DOEYqKrx
Subject: [Buildroot] [PATCH 1/4] package/c-icap: fix musl build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/33b/33bb3ea8ac36da7f40a82c580d3614f0b34a7ab2/

The oldest build error dates back to June 2024 so this patch should be
backported to LTS branches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ting-in-various-printf-to-avoid-warn.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
