Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CB9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D58AE619E5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D58AE619E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B21FE60870;
	Mon,  8 Nov 2021 23:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jPW_lzudgb0y; Mon,  8 Nov 2021 23:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BE4360667;
	Mon,  8 Nov 2021 23:06:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 455EB1BF2C4
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34C5E80D4E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ds3y0zxOW4sU for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 23:05:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6961F80D6C
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 23:05:28 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kDhZmJJDJNGRPkDhfmjCET; Tue, 09 Nov 2021 00:05:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636412727; bh=n3oeuvtK9hPkdW70+xeTIuICApU1CTfYWtB9IJXxQyg=;
 h=From:To:Subject:Date:MIME-Version;
 b=amOwl+LDoguU5CIfJE7NPCs9GkTy+60TeeFCJCGjqZxbN9inI4LNsHRI91LG2BX0J
 Af2xiIipMtu0bad+EdB8WLAORcm3dUCHA1fIyryITaMfaHVgXn73fxFY95WKwy/RMA
 Z0mPUEbjdx/2+b0y7ZVEvuPVBq2P8LqJVjscvdvy5srHihADspB62HychLBKsEg8MW
 NZpjeimev3cnt+XYU4JY0yoBbPiq/xBDBOHmhMp2EAJMAxmjCRIut906ptVEZPhSKM
 vMuIdDnVyW15+WRH+Vv7HAK3GDSHFN0zmsYpIu+sUHbmSC3XUrU9eEB8tHgYz7mDQH
 GhwlDxGCBSTbA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 00:05:20 +0100
Message-Id: <20211108230520.4007148-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKVSCbIdivXx0KJ9BmbpFENCNXjxmbrigNaJtsrjoPLF4zRztkKD1xIB60FdS7YYmHmEzvkyoQ9Z2gKHCM9l2O6z0OyKqM8z4XaeUs2b7X/eBojOIQ6A
 gVreDcuo+AAxsC3I3IaBheSt399iW9kY+x/Oa3wfT3M0VRUcX9BxdtJqvBKnGmp0jF8N2zwiHWZp/aGcAa+s3fHpGEKLXgUs+VE+50hPpJVtHOugzc9Drvrb
 Ox5x2APqocvgv2DGF5Nutcin+9w9b7+ErUeFXF0bHmRalTqIHDWj6jybw76DmnTuxh9vr7dEDCwPul7S/kHxMDdrX3rT9L44CXK5cybbBjsk+d2xV2p+kJDE
 CdXr+v6+9fXStVBPuOZfbJ7Yyl+SfQvRTTJArVOlaWj6j1HVMLhMkUeTCGNYKWxpWq1+9Tbxql0zuO28TkmaftZkKLuMqr3XqQRnn5+2kBEPPNsIJDB379//
 V6hhceU4lhtBbcXZeAJqeq3Utc3lKtq3t+jRnSqXef9ZnJi0fpjYQsnY9YIt0LRb6XNj5vQZ5J1bMG585jRxz1azkuU48iiD01OlWQ==
Subject: [Buildroot] [PATCH 7/7] board/kontron/smarc-sal28/genimage.cfg: fix
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
 board/kontron/smarc-sal28/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index f3fb77e00a..8c8a7baaae 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -4,7 +4,7 @@ image sdcard-emmc.img {
 	}
 
 	partition rcw {
-		offset = 4k
+		offset = 4K
 		in-partition-table = "no"
 		image = "rcw.bin"
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
