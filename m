Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD670CF396A
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 20:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7E13414DA;
	Thu, 19 Sep 2024 20:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XyOeRnE8se5Q; Thu, 19 Sep 2024 20:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69232414E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69232414E2;
	Thu, 19 Sep 2024 20:28:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6D51BF343
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 20:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE70A414E2
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 20:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWnq1DUMdymb for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 20:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9A68414D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9A68414D8
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 20:28:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8A4083D8E; Thu, 19 Sep 2024 20:28:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 22:27:33 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e5b4c7980debefa30af64a1438aecdfa304525bf
X-Git-Newrev: 82fbd44f3f908423dfc2dd767bd60f4bd7e0d2cf
X-Patchwork-Hint: ignore
Message-Id: <20240919202834.A8A4083D8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/xenomai: fix
 build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=82fbd44f3f908423dfc2dd767bd60f4bd7e0d2cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The commit adds an upstream patch to fix the following build failure:

latency.c: In function 'dump_histo_gnuplot':
latency.c:415:9: error: 'fclose' called on pointer returned from a mismatched allocation function [-Werror=mismatched-dealloc]
  415 |         fclose(ifp);
      |         ^~~~~~~~~~~
latency.c:404:15: note: returned from 'popen'
  404 |         ifp = popen(xconf, "r");
      |               ^~~~~~~~~~~~~~~~~

Fixes:
- http://autobuild.buildroot.org/results/e15ccef2f2bd58482204b5061f77e76a8a540ebd

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 17642f50323041e4f9fa0cb1d6f703e646ee4548)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...atency-Use-corresponding-pclose-for-popen.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch b/package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch
new file mode 100644
index 0000000000..a144c4ece3
--- /dev/null
+++ b/package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch
@@ -0,0 +1,30 @@
+From 6fe6b75bef4b4bb9723b12f0e9ebfd9877e00a44 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sat, 16 Oct 2021 19:52:28 +0200
+Subject: [PATCH] testsuite/latency: Use corresponding pclose for popen
+
+Was found by latest gcc-11 and -Werror=mismatched-dealloc.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://source.denx.de/Xenomai/xenomai/-/commit/6fe6b75bef4b4bb9723b12f0e9ebfd9877e00a44
+---
+ testsuite/latency/latency.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testsuite/latency/latency.c b/testsuite/latency/latency.c
+index a0e6f4826084..6cd3a28b44f6 100644
+--- a/testsuite/latency/latency.c
++++ b/testsuite/latency/latency.c
+@@ -412,7 +412,7 @@ static void dump_histo_gnuplot(int32_t *histogram, time_t duration)
+ 		fputs(buf, ofp);
+ 	}
+ 
+-	fclose(ifp);
++	pclose(ifp);
+ 
+ dump_data:
+ 	for (n = 0; n < histogram_size && histogram[n] == 0; n++)
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
