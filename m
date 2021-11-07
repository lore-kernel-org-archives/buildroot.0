Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D8A8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC4F61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FC4F61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EFC8402DF;
	Sun,  7 Nov 2021 02:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w125RB5IfeHj; Sun,  7 Nov 2021 02:52:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 806B8401F0;
	Sun,  7 Nov 2021 02:52:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB26E1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBD1F80D71
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ECvhHQDCd05X for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1762080D34
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBSmR7uV; Sun, 07 Nov 2021 03:45:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253126; bh=zAnKcJTO90PAM1NySnTJ033MoeQnNqvR9UZhqDynqiw=;
 h=From:To:Subject:Date:MIME-Version;
 b=QcyLLgQhS0ypaFM1cvTWMP0iOjuJjJivftkJ81gkwgsaX6J6nqbTAhyOrAj1q2oHG
 nVnCcsXc/Yf6sluk2Qf99bYVgVMgLfyOLbeCR+i8PxDnqiWsna0G715NXuas+vZ0qc
 xfaxQpPlfHWi5Td7WYYCqom8svbWwS5THbLx88hYpDgRoEDxEUkQTfCSzDPNBtc4Fu
 9paButYarN1aE54H0+na5PN7/k619ebiJxiqn4BWLFrG7uz0duzTUUGz0a18uUgSKr
 dSXL6YKcRvh4Hle7FBBGshMbG1aLJrgIBxqDusAbNhnBgb9KuaT/q5JB08SknZYQwa
 iDxPethbdusow==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:27 +0100
Message-Id: <20211107024330.3061378-40-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfI2ZX5vb3j8ksrHQly43rt/fCEftNPuncqB3HpKHYDyYTT7I0Z1UPlLd6rDOHOAO5BmcTKDdzfsyYeWAP8v3Cs4G4iTjdCrv7XQQ0LLrtqa7+ZUOjsGb
 fk8vDZaXjI6l/exI28d0eh2P1c5zl1KQMSr4SADrO+E+jwTxu0V8/c+6CqW4Jl8it+5DQ2ODZ8YOVn94oR4eIp7I4kh+VixGWeoJYFSUuYzx42KVMtIeExTr
 EWF3FrPjbrGiZbOHrZz+of8qVHgMHUOsplOcZdhmTOQ=
Subject: [Buildroot] [PATCH 099/102] board/toradex/apalis-imx6/genimage.cfg:
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
 board/toradex/apalis-imx6/genimage.cfg | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/toradex/apalis-imx6/genimage.cfg b/board/toradex/apalis-imx6/genimage.cfg
index fe359bd93e..a277decaa8 100644
--- a/board/toradex/apalis-imx6/genimage.cfg
+++ b/board/toradex/apalis-imx6/genimage.cfg
@@ -4,12 +4,12 @@
 # from its internal flash memory (eMMC).
 
 image sdcard.img {
-  hdimage {
-  }
+	hdimage {
+	}
 
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext2"
-    size = 512M
-  }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 512M
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
