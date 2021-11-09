Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599BDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:20:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 209FD610C8
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 209FD610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F169C80DC6;
	Tue,  9 Nov 2021 10:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4AwTQwPm-5P; Tue,  9 Nov 2021 10:20:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4595980DAC;
	Tue,  9 Nov 2021 10:20:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 350CD1BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3198140149
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COnwDcEoMz5L for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:19:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id 603FA40113
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:19:11 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODbmOa26; Tue, 09 Nov 2021 11:19:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453150; bh=fP5C3BugJbd0UYJFoZ30qa67pcyA50yQWpWa4CVLEDs=;
 h=From:To:Subject:Date:MIME-Version;
 b=k6sUj0H2Zqn3gFYqjYM0Kpo4LvrembchPpTc8r84/V2W+bg4hfvSgVrmPfzGwX81r
 84TsbYkc0OMk5pZKzwuzWP9203R3BGttp/chPEQ15OiQZvFgnMC+T6VqF9po3N+639
 YvbIfCWZqeYuhvXYbDi9aO8LhC4JzdERMqjviH5c4nztfk02fdNVOvRA0AxpMme5bn
 psEolJhKBvj138anWyxN/iy/1wdS1QvFar2/QKNvpLLkigIhMyXEiiJTbrK5SxInyb
 NpodDAU79+w5j+olNdOLuVUFX9bKvbtYhW9L2EiaWNfmyqqoinWe51I6pKgGClUPNe
 XFTILU4GALXdA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:41 +0100
Message-Id: <20211109101844.1132067-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH0RFYYn9FDN4Rm+o6WsFCGXuaMLFyKTMDTr8cnoyv3fcBIdFrUQ+HL75xiJ7QVExy46MddWKC/xtwsUmtPTlZH1jyWlINCqocYgoXfAkKb70tRw+H1g
 gO8d2SlTMCXzGDzekiYQ0fiMGu0CxLxs/QXdiC9srO4b6Niw+sWz12WL2a8mIfCxv26Wh3TznhCHd1m79weJYTex/KR8W7WI2zFRli7nuspxDZXPy8WMdPGN
 8R9GRYHQ/le6Y7GmRCsBU2wKVMQA4vcgYqb/+ZzZ3h7dcGvhlIgnYYuicvEVbtkqcJQ69V18T7oXzvJCDbRyDMHN730P9Lnx2rWiV+JsCIgnoFEEr+y3JvSo
 9p2RXKq+STfAOnMGyNGvaYG+J4RvrSOBG8/aVQEHpNqoUpzzpBoqPAsqb9dEn1JDJZQFJ7iaB1EFjBWQRm85q/ahpTm57UNLSztKGDILfhPvZS5SkWaT+LZr
 +cMdkIdVbZ+9WizUxup7msjNF3nfvpzms4BXiICoobJ0l8cadDxtVqN4TuJwCFQiWspls0dt338YsrGC1J0FGfNCmKugn3XWTBIhGzF+qH5Pw1zHPy6I3OqD
 sQM=
Subject: [Buildroot] [PATCH v2 6/9] board/kontron/pitx-imx8m/genimage.cfg:
 fix option suffix
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Option 'offset = 4k' must be 'offset = 4K'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/kontron/pitx-imx8m/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
index c335b0c026..c78ef0f910 100644
--- a/board/kontron/pitx-imx8m/genimage.cfg
+++ b/board/kontron/pitx-imx8m/genimage.cfg
@@ -5,7 +5,7 @@ image sdcard.img {
 	partition imx-boot {
 		in-partition-table = "no"
 		image = "imx8-boot-sd.bin"
-		offset = 33k
+		offset = 33K
 	}
 
 	partition rootfs {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
