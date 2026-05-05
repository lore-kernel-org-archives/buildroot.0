Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652EDFF8855
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D17F40B9D;
	Tue,  5 May 2026 19:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZjZJumABUrxb; Tue,  5 May 2026 19:54:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFEC740611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010841;
	bh=BpQrsdt/cEyrq1iVemdie1VwKpm1D2+df4H8251rOwI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YGAKIwy76B+3L3zPJHqDTZyZWwUU4C62J4dAS2O6z2NIqVOk+T4a9Q8Xl8DzQqV2K
	 eN/QtLyyXO2lYuA9FABK9QK6XxDq44k0ISqAfenqJkKzw5/pEV4io/1lLPEnYCL7+H
	 8sj2ujTMJP9QwCAlf5E1qFyHXkVX/Ndc+sB1HAbtIojZHbvZ6AaPY/kMdEZw6uG6xf
	 fDuijoA8OB48GjuDS0Jckii36Jsi0QPC0IDgHsK3bNp7o4Urh//SEjNLjw2vk4+9ws
	 Bmbs2aAeHQlc6agOs4RxMwGEWcuEy+bxtLtgF8Z8OvMeeM7oemU6Y4E7I/8s267Rjc
	 mRuYU70sYPsRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFEC740611;
	Tue,  5 May 2026 19:54:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 912A6280
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 839FC8136B
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHFEzttiCdfO for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB16D81324
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB16D81324
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF13D84650; Tue,  5 May 2026 19:53:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 21:53:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8dcebf4597d74dc12c86535118ae0bd16d272a0
X-Git-Newrev: 07f7ad9898d2412b66fec4492cc89d59063bdfd8
X-Patchwork-Hint: ignore
Message-Id: <20260505195355.EF13D84650@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: don't buffer
 whole file searching for infra
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07f7ad9898d2412b66fec4492cc89d59063bdfd8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The file handle can be iterated over directly and each line is used
exactly once, so the only effect of reading all lines into a list
first was higher memory use and complexity.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
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
