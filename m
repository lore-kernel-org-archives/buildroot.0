Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593E2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 17:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA9A181902;
	Mon, 27 Dec 2021 17:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kpy-oykxJEEc; Mon, 27 Dec 2021 17:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4553A812EE;
	Mon, 27 Dec 2021 17:34:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD3D1BF3E1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CE2A40335
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 17:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVbE4CQ4Nyaf for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 17:34:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 62679402DC
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 17:34:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id v15so26999592ljc.0
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 09:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CL6lgbh4XZFk/58BBV4qSx8m6iStNqRmsPMGqne4FvE=;
 b=LLjuTEPPl9A6Rf5r6Mvchhzm8JKby/NxFRwUSP3wfEVNt3xgTpVaVZG/AiBJ1sbd6D
 FuAnAC05j47vPmLhcK2eA6qsgd9PTPUF3J3QKxt5dXR4nG71oJevZE1ddYP8EnjyGap9
 bN9KEL5IS1HqO6VM1bZ7cxGqkP/cDn8N+O6qbOhJYJO62H04nqA+56c3tLkrMunUHaMP
 p3KLR/DHfqBIplbz8bF5Laky5Zv9EB7248MmgHZagJqOCI2ytCpqKx+7MG/n+UHydDHa
 N+vXatSepSfqxmrdcfIiEcjNLTG0a7bQfvMSOBDc/OnriFIWAV2hv78um5Kp9ti9BEB/
 o/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CL6lgbh4XZFk/58BBV4qSx8m6iStNqRmsPMGqne4FvE=;
 b=fIB7mFev7FV/w9jDmJDquY2HvhrYgkGbRaTTzxnZsoQ/cCbC2sdu/VT+TEuIN4Uk/q
 EbJueXSpvUzpEoi9Xbk044I6IGBySX3m5XZOvv0fL95RsrF6HtddFRP4gVcMvn/zNrRb
 yKjSgTVaLAjz5WNuB01os7SzlZuhRzvpXtQ1ZZSddS9oQgfsTAdIZLv2IfEdiqVWGvG6
 e/yWiW8Z3AGmueeFEqM1EnIhdANTwupn7rf6Cge7+qkBD+nwSR4TrC1xxViAGbgi2cBR
 RRFkdlP1Pgxx6WlQJkVqBtEXZ9aRa9EbxesipTxhCnguRidwU1vkeiVcdz0AVn4z7S1N
 9/JQ==
X-Gm-Message-State: AOAM533GDRJpxVIkdCP0loL0UdDFdJGAEiKzP+BSToC76fgla8Be9wEL
 kfqNzPEnXzf5RpBiumUDMmFXhG1vCMU=
X-Google-Smtp-Source: ABdhPJxWVTJWEodRATkLY/Jft4yVry92ZgafTn1yAgdbtQSzLR9Dj117bx9kDMrD+SIdWzw+yGVWzg==
X-Received: by 2002:a2e:9c4e:: with SMTP id t14mr3679573ljj.281.1640626473246; 
 Mon, 27 Dec 2021 09:34:33 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id j2sm490222lji.16.2021.12.27.09.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 09:34:32 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 20:34:30 +0300
Message-Id: <20211227173430.1007471-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/orangepi/orangepi-pc-plus: fix build
 after genimage update
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

To fix the first genimage error report, change 'partition-type' entries
to the appropriate 'partition-type-uuid'. Then genimage starts to
complain about overlaps:

ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.

To fix the second genimage error report, update the size of bootloader
file. Do not reserve additional space for GPT partition table since
new genimage is able to keep track of it.

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006300

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/orangepi/orangepi-pc-plus/genimage.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
index e730b38096..3812d785d5 100644
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -24,11 +24,11 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1032K # 1MB - 8KB + 16KB(GPT)
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid  = "F"
 		bootable = "true"
 		image = "boot.vfat"
 	}
@@ -36,7 +36,7 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = "L"
 		image = "rootfs.ext4"
 		size = 512M
 	}
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
