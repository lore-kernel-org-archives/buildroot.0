Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A13CC19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 19:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B47B0402C4;
	Wed,  3 Aug 2022 19:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B47B0402C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id puxRgjYOoF8l; Wed,  3 Aug 2022 19:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A7540291;
	Wed,  3 Aug 2022 19:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2A7540291
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01B6E1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6D6940151
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 19:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6D6940151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0AVlnIRrtsi for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 19:24:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69F3B40156
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69F3B40156
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 19:24:07 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0C3F3240006;
 Wed,  3 Aug 2022 19:24:03 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Date: Wed,  3 Aug 2022 21:23:59 +0200
Message-Id: <20220803192400.208270-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659554644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=f92EKUnTrviS4bECn0CifIUmNE5IaxEt/DHKXogI8E8=;
 b=e6GoLd8NzKcYaAEVZ0NRvUDjfIEqFtOz6QjMdi2myg4wcxds2e89ad8SsOkzLUOJBTiJd8
 z/qIBzmGKmiwqT1KYh53IACQGK26TxEUSs2eydWi1LovywCsk8AKYy02zWrhWS+5zo4lkz
 HOoicjef+6ox//3Kc4MzMKjVIfCpLKUSwTziioHocP/2b4ruGOUMPYwV/1rfmulpkGx+If
 FpJOub8qsYURnteJSAxCMkyltY+SBSxvLXZ3iDaKUrwpArdlApblzWivVxSJCFZNcQHEzi
 jL0hYjW1xRNUuW06vUHWN2RnM1QfCMukMDhDBvvBBvjqIgd+5agkT41yjgoamA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=e6GoLd8N
Subject: [Buildroot] [PATCH] Makefile: ignore *.orig and *.rej in
 check-package target
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When one is applying patches, it is pretty common to end up with .orig
and/or .rej files lying around. Unfortunately, our 'Config.*' match in
check-package ends up matching those files, causing false positives
when running "make check-package". To avoid this, this commit
excludes *.orig and *.rej files for the find logic used in the
check-package target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5f266e36b2..14b7ecd475 100644
--- a/Makefile
+++ b/Makefile
@@ -1253,6 +1253,7 @@ check-flake8:
 
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
+		-a -not -name '*.orig' -a -not -name '*.rej' \
 		-exec ./utils/check-package --exclude=Sob {} +
 
 include docs/manual/manual.mk
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
