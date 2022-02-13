Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72959C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098FA60A9C;
	Sun, 13 Feb 2022 22:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NmatIa2dXzW; Sun, 13 Feb 2022 22:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4415D60736;
	Sun, 13 Feb 2022 22:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E8F11BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AB46402A4
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vFwuHzof8MY for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb150.aruba.it (smtpweb150.aruba.it [62.149.158.150])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACC534029F
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:57 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkinv808; Sun, 13 Feb 2022 23:53:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792836; bh=0k38j4ad+73ag7K1yiuCRM4vpmKgqTn2amCqjVUyfRQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=c2n0mJLDQIEtnanepUrdgAlQtFt6PQwHtUjODWPo0SpcAuIUhjZ0F8uBcynSvrYMB
 k9X273Xd6xLTpTX+bELXfySc1DDcoaueYqeV1H60X7v15/B41gUaT+6HSz6iUgalJJ
 XzRcn2ipNhFFW4tTcdPgBbu8XN/b106hHGiCQ3a5e6H28VlYJhNcgBjG8HpSS0Gf7N
 FpZyaL7DzXpbzIXCMJHXIidVr+o1FK7keEcCu+OeZpwWnM9FMt+3qxHDQR9+rLNha0
 sA6PtmaI952vUhXtyoKf03iv+WsGXYU7/rIzIhvyiGACSoaR1icmkCR12BhFGkKGGN
 qOporcvkpF+7g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:42 +0100
Message-Id: <20220213225350.3466696-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBLieSnjckLb0sKi+oBzwZ3A5HUUsEnToauXMdCfLBq/JdBjawpE6mnkuka9f03vKssaG2lNLakmT0gtST2ilApEia6hNF5ZYAfAtAA+5xx1zH0Fn6f/
 nGHfHL0coehHyvunTvrZxUrjzg5p2wew218mHRtcoMNZRHj8MNRobE/OKjPFljLyVhiT5C5a7D8qOPUstOyLufXEc9dt0EQJZNFlYZ1urJ+LSYGyb7vKrUH2
 z++SgQOSDwrs0uVGmLWulMSY3zRGWDl8L0N4FRzJqTWkUOOX6N20PXy7Yqm7EhzLTuzeD9ZRdQ4Eyn6IzITmajGDfoWYa8Rb+xYiCpKGeWDIwFsrVO5QZ4j9
 eEjgYERphPPkEZZld/DOduXVwqkODNk2pG7stoovp+GZspwJfFaqCY8nM69CZsdbwLLn5N5ejZOWmpGqCyP5h7yWCU9djKAbZh8HWrBHnUZSWtBgKapdUBRz
 HtaUTPbwu1ClTWhqLJBaDHh6HhIVs3D++6sLpGj2LEeHd1YyVMD5rZ6b1h9PORytfNbqg9XIIaL1xtfa/9KM1L+ytp/dgXsgsRxGXMIj3C1dAn8zkR3j1yMn
 +sjMK9NTByEaZwT2WxZUSAD2vvd7szWRgbE3zojZXEm9xckjBVrzERN2cDgHRmBKrtd11j01X5tx+a4Rh/z1fPEV
Subject: [Buildroot] [PATCH v2 08/16] board/pc/genimage-efi: convert
 partition-type-uuid to single letter notation
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that rootfs doesn't need partition-type-uuid = L since L(rootfs) is
the default value. So let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pc/genimage-efi.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index 035a077a78..68498772a1 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -19,13 +19,12 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
 
 	partition root {
-		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
 		partition-uuid = UUID_TMP
 		image = "rootfs.ext2"
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
