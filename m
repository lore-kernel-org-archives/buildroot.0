Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1C3CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E690E41D50;
	Fri, 15 May 2026 17:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdssR2k4Q_8D; Fri, 15 May 2026 17:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26F6C41DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867232;
	bh=QMNYJDUbdb55fBbVxNrkx8G4eZu8Bkbyxsrn/0nZ94E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sTFefCG1Xvuf2cMSZwuSx9Hexo93r8csMpiEYi+7l6K2xrREqUR8x1XpiXsDE90F6
	 VWGturXoTV5VNuYlTQ33qV/GJpiwY5+5eIeQOpeozZBJWTqhWwKOlQtpESkSxr0Tfw
	 Ga2thdc+iBueU5wrrx6qpYmSZYh2k8i4NlH3Eq+7B6EXpTos0IxoO1kI9hFfsLHAQA
	 jwItlUNZEvN41NSCvHmkLj/Nj279sUr/s0FDcMSmyvwiFTtSoTSuORZ8ZafRJ1v5vX
	 9tEVnoYQ/XDb56Am52zHOCzYY54YeX8v8+7L9/kkAnNKBS5TdNM/bpA5ZavALPjPte
	 GgjWN/SFs5I/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F6C41DE1;
	Fri, 15 May 2026 17:47:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE12523F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A078740FB7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQN4uFmyUq6r for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C9F40FAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6C9F40FAD
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30AA3863D7; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:22:25 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 34204529e0b19971991c458ce997ce180fe46aba
X-Git-Newrev: 071ba58f000d528b3d8b02dae808a5ada45452a5
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.30AA3863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 support/scripts/pkg-stats: don't buffer whole file searching for infra
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/071ba58f000d528b3d8b02dae808a5ada45452a5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The file handle can be iterated over directly and each line is used
exactly once, so the only effect of reading all lines into a list
first was higher memory use and complexity.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 07f7ad9898d2412b66fec4492cc89d59063bdfd8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/scripts/pkg-stats | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index bbd1e3e6f0..5dcc812e2b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -197,8 +197,7 @@ class Package:
 
         self.infras = list()
         with open(self.pkgfile, 'r') as f:
-            lines = f.readlines()
-            for line in lines:
+            for line in f:
                 match = INFRA_RE.match(line)
                 if not match:
                     continue
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
