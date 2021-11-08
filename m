Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F7FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:06:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DBC7619BB
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DBC7619BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28A33402F1;
	Mon,  8 Nov 2021 23:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBRS0RSyyhKZ; Mon,  8 Nov 2021 23:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FD44402D5;
	Mon,  8 Nov 2021 23:06:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8D51BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F39D40216
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87o5g5JvxxGV for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 23:05:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C3164021A
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 23:05:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kDhZmJJDJNGRPkDhdmjCCj; Tue, 09 Nov 2021 00:05:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636412726; bh=CPWdfdIuZb4wbobXqrAuYwI3R6uLddtwKQhoxj2tsGA=;
 h=From:To:Subject:Date:MIME-Version;
 b=UMUG72yZLxA4gHJEPGLQ4lG/7GSKdKSu9sOm05s0A5CEpS5Ox0XV26zrljsi9ag4F
 +TLwysmskvq9B7UMCisrhgzIkmps3JmmOk4QGmNReuEBnppCRaFoPcgLAvjrSALAbm
 8H5Aft77aWMdu+MLap5hy4u84Pkv+sRtOU4iOVFydfLR/KTCGoQw0o67BynS1WaSGY
 PRqEGiEyFQPeqdCGEqYXF+ebutoG9EzowJOjR/LQibk0Kxz+baD8mzPKWorON6TPfm
 9Z42qopRPD0gW2uX0QXhDfz+Pu1urCncwBTRv1g8G75X9hcxZ4vJaAR6AG0yCk35CX
 frsCdUGMm23uw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 00:05:17 +0100
Message-Id: <20211108230520.4007148-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDnPwiqr6rpLvRQvakjfUjOwTDru+8h80gnYk6wN0fVCf8gjhJu8tAvQyAPElo388RaBySOlyxuh5aqZW9DEfzqd+PjQJ+lQt9Om8kb2MszHdy1cNQI0
 izZBEpMxQBkGvrKVNjsnGPmu4KT+X/WWPvDCribEJvkev3zF8KD4HdoGeUeumzesKVqOsE0qZCCyVuFnT2/UV9leahLexdM4f+FNZM9UnORh7Npp2u+rKFc4
 zIre4A835rLcfSyO/wJxfVAeVq4/ji2W72x72SHHeKct/R4ivWR+/PPCl46zkjuivcHRrIi00hZW2fq+BHYcytHHudwh8xIIXZ5ptGJOXvseh9EhqgIVigO/
 6olh4IA5zIkrLmFb+5S2BjYMmJXTUUS2Of0TvTOtHgHIRVzsoHZp8vGbRiLBCBRuUqztwIxq2spUznsO7tBMzeK7vciERajRdlz6FU8GacXSznrvlPQT4Pr4
 ho8oWUh+m/8RBURhFBbDWmvNHilEtKvDhl4TgUOGXutFaQEDDD0IzcN6/rphxiE6DJvbViYHizCT/RBHQuplouGeY8sJqGAz+l1UKQ==
Subject: [Buildroot] [PATCH 4/7] board/orangepi/orangepi-pc2/genimage.cfg:
 fix comment
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For consistency comment '# 1MB - 40K' must be '# 1MB - 40KB'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-pc2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-pc2/genimage.cfg b/board/orangepi/orangepi-pc2/genimage.cfg
index 72adc47518..cc8695c9f1 100644
--- a/board/orangepi/orangepi-pc2/genimage.cfg
+++ b/board/orangepi/orangepi-pc2/genimage.cfg
@@ -24,7 +24,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 1M # 1MB - 40KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
