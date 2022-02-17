Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53678C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0484341B41;
	Thu, 17 Feb 2022 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7_9mMnWJE8O; Thu, 17 Feb 2022 15:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D4FD41844;
	Thu, 17 Feb 2022 15:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53D741BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4206E61B82
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghRWptswzHiC for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:11:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3454460BD4
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:11:04 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4JzyvT6CbMz9sm5;
 Thu, 17 Feb 2022 16:11:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645110659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gdi/NQbvaV2egK9UqNYONBO+Ihc34Xz30T7vww5rD40=;
 b=hC6CS7kRCdzlHFhIWVIREaW4lemPm1h71HIJYxuoD9QuvUq4eaOOHQnoy0zUsXeHdwhNFA
 TtG/QQvGvelGImW7XA2jg1mr7gkqjkaLVspNafd9nCsvSSbUfv7VY1ci0ekI/XjhDViUbg
 2JILjoLZTc9tfpXNFJGflaBwdoBjvSzMwyjj3dAI52Rsul1dw5eN0LLQ+C8y78QiqMKEft
 9RE90xopMOa2GGNpA61/KMC8oQtUjf7XBJMjmPP+dgneTuGLrBkd4TLfr5uAYVnpYKZ42y
 RlQoJxDM60ULZysj8MjFcNUzEBPKOtI23OTIYfOWGwsj15cv3z3y7qXPP1JWWw==
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 16:10:54 +0100
Message-Id: <20220217151054.865073-3-marcus.hoffmann@othermo.de>
In-Reply-To: <20220217151054.865073-1-marcus.hoffmann@othermo.de>
References: <20220217151054.865073-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] board/orangepi/orangepi-rk3399/genimage:
 fix partition types for gpt
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
  ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid
  for mbr and hybrid partition-table-type

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 board/orangepi/orangepi-rk3399/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
index c94e0bc7cc..a02166172f 100644
--- a/board/orangepi/orangepi-rk3399/genimage.cfg
+++ b/board/orangepi/orangepi-rk3399/genimage.cfg
@@ -26,14 +26,13 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type = 0x83
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
