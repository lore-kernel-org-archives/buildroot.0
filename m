Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBF6C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:26:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F2C06115B
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F2C06115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6360403BF;
	Tue,  9 Nov 2021 10:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mSo2RdJzoJsL; Tue,  9 Nov 2021 10:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52FF6403B7;
	Tue,  9 Nov 2021 10:26:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D34241BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFEBF80D5B
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:26:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k2BxSvY89aF0 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:26:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF8880D24
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:26:22 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODkmOaDR; Tue, 09 Nov 2021 11:19:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453159; bh=tURRMX6ZepmeToIcFBC4Js+7qBy7nXrxYuMvFbnZ/bc=;
 h=From:To:Subject:Date:MIME-Version;
 b=KL8h9+BrsDhVehKcWejQOOSuAE4tCBw4cv0Q7ere77073QuoBSmERcSI+WcgR+cfD
 QQlhuCGpRfDF7oXF4xDvoDSDY5TEnkCfB5nRB1LQ22y/udUhvk35y9D4WNAYYIwO88
 pCVizEgvFj8OnKJLe+JVC1Yv92WbBtR2y6oSToWPN/2d2YmQGCRrVMCuQY29BxX1sX
 Wyp+4rfQuA4NYRbeNVUhsUj8OxfbX5GVTbxOXs4xFJGxrh7ibDXn2FOJjWXJ3lzVYH
 AXgdB8VWsfDk6376ECRSDgLVLjHOo622GYVaTWlwCfcKg21J6wn7g29QMOp4pFCSpu
 zQMd6SpT6zJfA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:44 +0100
Message-Id: <20211109101844.1132067-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfD8WLrqstqMtFQoDFzgU2axQ3UBik0NQL1sVMlav+kU/FjBdw/cUioi79OKu0/037Wq26Gh8vAKwthk7qV6ajTGR4CGBFGuo683pr0p6kUO/uObP12qX
 WfUanWNM6Cg6vRjcvridm906Pug4Nlg+ePnpCyNE/4h/O1iP4kFgzHCA74UoNXcq4JN6cO7p4u+suidejBWr1q8A+Ne77uX2URE2+/eHiP4QYcjDdipVrVMh
 lTbKRZYD7b5lWbGi8tYw+2cSZDlkJ3IoSOUQPJmLRPYDjTxbCBn8MyG6jN6NtbexCAjKmUKFMmw+4ansD8lYHQJaV8tc4npNVtezY59XJVHzQvC2JRjSG5LO
 OoVHvv4fTUkFn0/Udrj9vIO8woZj2LoRJWh5KWZnLmJihU/SR4mXIqn9CWyp1Fru6RK7etkiT2KJsL+iuhMCmqkAHRG2WMgxb6SjgEoJ+2kvlTwiWJ2ZYK2F
 ZQNPM46XcF4NvFDEALwW2w7VZC5R4vwy+qfehoRHsHmXKs8QuX33PQGiQqP93yunTg0AfIDwh6MtuPZZ0ayJEcVhwyCvAmu1waljB6Qg3ilzwbhZjXt3pN3n
 YXI=
Subject: [Buildroot] [PATCH v2 9/9] board/nezha/genimage.cfg: fix offset
 value notation
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

Option "offset = 12288K" must be "offset = 12M" according to the new
guidelines specified in Buildroot Manual with previous patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/nezha/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/nezha/genimage.cfg b/board/nezha/genimage.cfg
index 9860b83eca..783391fb99 100644
--- a/board/nezha/genimage.cfg
+++ b/board/nezha/genimage.cfg
@@ -19,7 +19,7 @@ image sdcard.img {
 	partition u-boot-1 {
 		in-partition-table = "no"
 		image = "u-boot.toc1"
-		offset = 12288K
+		offset = 12M
 	}
 
 	partition u-boot-2 {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
