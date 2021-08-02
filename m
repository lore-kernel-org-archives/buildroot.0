Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C33EC4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 21:10:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4CEA60F36
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 21:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4CEA60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE1C83D86;
	Mon,  2 Aug 2021 21:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qT_QOP6Qj0Nr; Mon,  2 Aug 2021 21:10:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFEB6833CA;
	Mon,  2 Aug 2021 21:10:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F5801BF31C
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 21:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19B0A401FF
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 21:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iLoFsuIabQm3 for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 21:10:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E9FC400ED
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 21:10:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4C4E020003;
 Mon,  2 Aug 2021 21:10:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon,  2 Aug 2021 23:10:39 +0200
Message-Id: <20210802211040.2535969-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python3: add patch to fix highly
 parallel builds
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Highly parallel host-python3 builds sometimes fail with:

Exception in thread Thread-1:
Traceback (most recent call last):
  File "/tmp/instance-3/output-1/host/lib/python3.9/threading.py", line 973, in _bootstrap_inner
    self.run()
  File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 317, in run
    result_item, is_broken, cause = self.wait_result_broken_or_wakeup()
  File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 376, in wait_result_broken_or_wakeup
    worker_sentinels = [p.sentinel for p in self.processes.values()]
  File "/tmp/instance-3/output-1/host/lib/python3.9/concurrent/futures/process.py", line 376, in <listcomp>
    worker_sentinels = [p.sentinel for p in self.processes.values()]
RuntimeError: dictionary changed size during iteration

During the compile_all.py step of host-python3. This issue is reported
upstream at https://bugs.python.org/issue43498, and while not yet
fixed upstream, a PR was proposed with a possible fix for it. Seems
the PR seems reasonable, let's give it a chance and see if it improves
the situation.

Hopefully Fixes:

  http://autobuild.buildroot.net/results/ae6c4ab292589a4e4442dfb0a1286349a9bf4d29/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...teration-error-in-_ExecutorManagerTh.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch

diff --git a/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch b/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
new file mode 100644
index 0000000000..fbe44c7753
--- /dev/null
+++ b/package/python3/0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch
@@ -0,0 +1,29 @@
+From 331966be70c371b268a4fcce9e97280cd869f137 Mon Sep 17 00:00:00 2001
+From: Jakub Kulik <kulikjak@gmail.com>
+Date: Mon, 15 Mar 2021 08:49:28 +0100
+Subject: [PATCH] Fix dictionary iteration error in _ExecutorManagerThread
+
+[Thomas: Taken from upstream pull request
+https://github.com/python/cpython/pull/24868, which is aimed at fixing
+https://bugs.python.org/issue43498]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Lib/concurrent/futures/process.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/concurrent/futures/process.py b/Lib/concurrent/futures/process.py
+index 90bc98bf2ec..e3b36dff572 100644
+--- a/Lib/concurrent/futures/process.py
++++ b/Lib/concurrent/futures/process.py
+@@ -373,7 +373,7 @@ class _ExecutorManagerThread(threading.Thread):
+         assert not self.thread_wakeup._closed
+         wakeup_reader = self.thread_wakeup._reader
+         readers = [result_reader, wakeup_reader]
+-        worker_sentinels = [p.sentinel for p in self.processes.values()]
++        worker_sentinels = [p.sentinel for p in self.processes.copy().values()]
+         ready = mp.connection.wait(readers + worker_sentinels)
+ 
+         cause = None
+-- 
+2.31.1
+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
