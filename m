Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B7EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1282F61884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1282F61884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5A27400EA;
	Sun,  7 Nov 2021 02:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-5q5Tm_amfY; Sun,  7 Nov 2021 02:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E17F740248;
	Sun,  7 Nov 2021 02:48:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61DB01BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52F3280E44
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFmoJr8wbOvS for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E90E80CE8
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:32 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAamR7YT; Sun, 07 Nov 2021 03:44:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253072; bh=MqNehe0KrUAJ6l1ArQqYmjJYQd7khKmzn1e6NmjaeJE=;
 h=From:To:Subject:Date:MIME-Version;
 b=hdXn3WMAnDwdwYfH7Ff4TxxTzVVUF56UC5a77j+STuJ9BkbCmijLfpuB8G//ax1yx
 Dexq0E/7NqijJbDNL8ad7TS7tamtkKBllT2pDFpNUQo4vSot2SVZbO0DtIVVwvrQjr
 BTcYAvUd5pGEdaH/81Xdvm9+Fsqncyo0UPpCkw8AS+4OUnrIi2wzRyqM5om+hPuf0+
 Xd9RyG8GJqN6UOgnxsYaECXDtxSEo6KdckPiYkQyFDjOwykz0hripzAq9mp4t1Fecz
 K0LXaeW9DiKIOI51wonQ+9+j1i9HZd0zMq/lKOJgDCtzUMP4KXHc5uJE5k2f5smYnz
 043abWny+gC5Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:07 +0100
Message-Id: <20211107024330.3061378-20-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNpOSUEPQ0LUK80Lm77810Fp5tm3C+cv/CIkXUb00xpvAgvPBfPhxDI9Y/nPGjWFmGxw0F796rBBW0Xm7M2G9xJtjoJ4eihPn2oz4Mxt/mqIasgBNRb3
 clRRE1TIQ7NqXd3tBJbnxZsEkYDFTnLYQyYZJky6RGHZApQ0OItvYsqYDHnKe2FTGNE5Foj0231XEiwz8pxjfwyWR2SAMaJNX/8OWRIhggEb1/SVOSCpC93g
 Ktb2C2RcnyY87oDK1srWqJlAZGIlg7z32tbcpAKKTNA=
Subject: [Buildroot] [PATCH 079/102] board/radxa/rockpi-n10/genimage.cfg:
 beautify file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/radxa/rockpi-n10/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/radxa/rockpi-n10/genimage.cfg b/board/radxa/rockpi-n10/genimage.cfg
index 8fbf562f28..b3ade327d6 100644
--- a/board/radxa/rockpi-n10/genimage.cfg
+++ b/board/radxa/rockpi-n10/genimage.cfg
@@ -6,11 +6,11 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 112M
 }
 
 image sdcard.img {
-
 	hdimage {
 		gpt = true
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
