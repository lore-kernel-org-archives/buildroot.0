Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0530CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DE24841F0;
	Fri, 15 May 2026 17:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuqrm4dxu6jM; Fri, 15 May 2026 17:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDD378454D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867103;
	bh=7icXe9rOPWGy1zWOQnuAzq8W253sfdeTmYD5oylM9LY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=huPKMtX0GLpGEfu6hqbiCaPrF8B7HGEiZfaE41RSEMMKWBDaMj7BcFL+Iqs7+D79n
	 5ApVrg4Ysr/ImtSg5oO7LpYNKLbPvLWrxw7wqS3NbPLzkoYkatzdb0yA1NwwJEOevY
	 /UITrU/T/OYo08MYN8QsfGZzyS62/joMVBOrwNN9iDdq7jF5NlRy/CEeR38HSPe2y1
	 UL5sRdZZZGdRaegqRzqdGtnZnjZ9vN98ld7Y90frkXuA322WpJs6It6+eVRiqxDAJZ
	 sXMH2QtrxThw0fw8ECHvaZvmo/pgLkGLsomVzlzk0hV5IeTV/DAJou2fEEpTezFVpN
	 xDalgYc9B2HDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDD378454D;
	Fri, 15 May 2026 17:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05AD349B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFDD684172
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRuFvuIuzWyu for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CD208417F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CD208417F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AE1186395; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:59:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c5c8f4b081262e697f07dfc7bcc9d7dd6dd36bf
X-Git-Newrev: 0b36bd22e8e3d8198493ef5dc12bf2cbdc584e71
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.5AE1186395@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b36bd22e8e3d8198493ef5dc12bf2cbdc584e71
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
