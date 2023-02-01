Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F1C05027
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17555417A7;
	Wed,  1 Feb 2023 08:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17555417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0LxTl3Ptb7m; Wed,  1 Feb 2023 08:30:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E784A4175F;
	Wed,  1 Feb 2023 08:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E784A4175F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D51E1BF2F2
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 08:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24A2D81440
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 08:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24A2D81440
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuU1OmsvrVrS for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 08:30:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A2EC8140A
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A2EC8140A
 for <buildroot@busybox.net>; Wed,  1 Feb 2023 08:30:13 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 41D2D4403AA;
 Wed,  1 Feb 2023 10:26:12 +0200 (IST)
To: buildroot@busybox.net
Date: Wed,  1 Feb 2023 10:29:54 +0200
Message-Id: <00c897a75f46008a2e4ddfa3a17eeef7641420a6.1675240194.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1675239972;
 bh=dAC1vwn9Vh06+ImcoHZp0bP2r5Mp4vYJvDh9Ej/G4sY=;
 h=From:To:Cc:Subject:Date:From;
 b=DOokZuM7oyhAeai5OD0RsvwR0YcO1B6YalIo3Uq1Equ6Nx13DGpOCbryXP0CXjRcu
 cvBzKfB3cWCL+QWQtfPj5EqyuFP6VJLiSHe+Dx5dlCPNgap1X1ef9UqcQCEXmLl9SO
 3Z4PP4Qei17MJMTDfqj3xcPg6KjZfno9jwzLO61WuuTrSEkvtwj5YbwsIXaElcZB/n
 vNiwv0nPB2XZX/jHAnlEvXWBFMh2565QwVp3+b3r0f0M5ZHJ8fsc/nljY3yWKHZ9+4
 0qGtm39yTMcOan20aeXlPpONEpTrLYRUvpAHVGhBZBBP0QZOpKGZYRkRdku4vG9uLY
 ebsF8wEHVx/Rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=DOokZuM7
Subject: [Buildroot] [PATCH] package/sexpect: requires MMU
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable when MMU is not available for target.

Fixes:
http://autobuild.buildroot.net/results/a2b69fdf67d520aa4d2718bd688d88d102842cdf

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sexpect/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sexpect/Config.in b/package/sexpect/Config.in
index bdf5c3bbf59c..e558af26f0a6 100644
--- a/package/sexpect/Config.in
+++ b/package/sexpect/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SEXPECT
 	bool "sexpect"
+	depends on BR2_USE_MMU # fork()
 	help
 	  sexpect is another implementation of Expect which is
 	  specifically designed for Shell scripts
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
