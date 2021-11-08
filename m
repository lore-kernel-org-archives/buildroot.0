Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA614C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:06:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717AC619E5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 717AC619E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1E94022D;
	Mon,  8 Nov 2021 23:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nmab5r3VHLfO; Mon,  8 Nov 2021 23:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B31A64021B;
	Mon,  8 Nov 2021 23:06:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D18721BF2C4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1A2780D94
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IC4YpzmZ_JNo for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 23:05:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id 070AB80D4E
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 23:05:27 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kDhZmJJDJNGRPkDhemjCDw; Tue, 09 Nov 2021 00:05:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636412727; bh=ZzijNeAmj3maMW/Bsphx7kuvOc9FhA2oxgWMQhBUwYo=;
 h=From:To:Subject:Date:MIME-Version;
 b=OxA5o9h82JAsPRlORi5oxprpwLOBogY2JP4jt38yLTZAlT+2WL2AMm0Vz7I+5uMgY
 u4UGxi75aDeDCjkk2MEGP7DvlDexXKplIWqBdjzfzfgigUcnQGYItm7CFaCjQjPtwd
 TIYXU2usv0ASGhQIoi75S9EaaCajdu21ssRSEiNbgQIQd96aGsE77UnYhqH+m5Af0U
 z3U8yJ1eLLO/5Q7dOnHaEly8tbCvBv4TbPEBsCkrHydHq3crCq2/QbKZ7bLz9vFQlm
 z7K2s/UygTjGxZO+0mnx2riTqFie5NI0egJgSXtLdmsnvuAiBE7PARDGssyqEgbO2d
 VLyCetqd4nLkw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 00:05:19 +0100
Message-Id: <20211108230520.4007148-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKVSCbIdivXx0KJ9BmbpFENCNXjxmbrigNaJtsrjoPLF4zRztkKD1xIB60FdS7YYmHmEzvkyoQ9Z2gKHCM9l2O6z0OyKqM8z4XaeUs2b7X/eBojOIQ6A
 gVreDcuo+AAxsC3I3IaBheSt399iW9kY+x/Oa3wfT3M0VRUcX9BxdtJqvBKnGmp0jF8N2zwiHWZp/aGcAa+s3fHpGEKLXgUs+VE+50hPpJVtHOugzc9Drvrb
 Ox5x2APqocvgv2DGF5Nutcin+9w9b7+ErUeFXF0bHmRalTqIHDWj6jybw76DmnTuxh9vr7dEDCwPul7S/kHxMDdrX3rT9L44CXK5cybbBjsk+d2xV2p+kJDE
 CdXr+v6+9fXStVBPuOZfbJ7Yyl+SfQvRTTJArVOlaWj6j1HVMLhMkUeTCGNYKWxpWq1+9Tbxql0zuO28TkmaftZkKLuMqr3XqQRnn5+2kBEPPNsIJDB379//
 V6hhceU4lhtBbcXZeAJqeq3Utc3lKtq3t+jRnSqXef9ZnJi0fpjYQsnY9YIt0LRb6XNj5vQZ5J1bMG585jRxz1azkuU48iiD01OlWQ==
Subject: [Buildroot] [PATCH 6/7] board/kontron/pitx-imx8m/genimage.cfg: fix
 option suffix
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

Option 'offset = 4k' must be 'option = 4K'.

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
