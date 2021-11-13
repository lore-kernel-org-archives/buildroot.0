Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E838DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 21:43:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ACFB60E8B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 21:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4ACFB60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBCA1402B5;
	Sat, 13 Nov 2021 21:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nm-wZhuR70WR; Sat, 13 Nov 2021 21:43:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 317BF40284;
	Sat, 13 Nov 2021 21:43:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFDB41BF8C7
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5EBF6060B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2MCFweRbqwto for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 21:43:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA6E860607
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 21:43:00 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id y5so8457653ual.7
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 13:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XuhHTi++Kw8Q3HXq38ZxBYdzAGKBO3LtNeWkCPcVv48=;
 b=HD3I781JbG5d9NgEAFDYAb3uO6I194XC4XBh2+Esg/Q5smzGiesICgX6xMxrOABCqP
 c1Eb6dhb26rOeAtRJ1GBr47kfcfQFDv63cH+zQfpaM7ldArefhLOfSO+lGpFjuntd0kg
 7vWMAgJNHHvtV2doanMSuNAkuAqrQBK+r2qrvCEuyR9sTveusbMvjsjb0+0DSOZizQmh
 psCfml3NZ92Nfpj97DqTmu2fUw/8yGBBV/ja8PGFHpRQEDwnxTOrHjfFeBtl80v0sEfZ
 cYAoSyCWRqSIxVK1RiQng0MHiDPyvcMpevnawG08/9oRLkKSBe0q4AyDgYx+riVtcmJq
 PhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XuhHTi++Kw8Q3HXq38ZxBYdzAGKBO3LtNeWkCPcVv48=;
 b=4sFn+gQGqk9Rsuu3gYBN4RcU09MF1kWWEscgo69NcyQPQqObBoVK8gEANbB649WKsV
 4QIMSExKD+PF5hvDyihO2/CoCnkrSCWDp8L5xS0aWcu/nL3BCXWI+lH82w+rEhHqw6lS
 FFIWwTIUSROye2FPZaqljxQG9ppyitHW3VW67FRUvXY+UNuKPZzUJB75beu06VvUGiaY
 KAxkiDAQ+8yvqI1SkfzI/fUlMupPaWVMO0uJjJJXyrRNJ2f2Oftn5X53yj2iuWT4Ecsk
 81zIimWZgwvFcPboilu0ET/xyrKG6tHceiRlH6sgUlY5deXIjcsTu7ehrMtzf/Ginv96
 LOjQ==
X-Gm-Message-State: AOAM5328qae+yDDDufSzSjOLfmL7IykabQkiggHQ4bOShpOHrK41hpFG
 YW14JVem93lX9zX4gf2s2i/RPHRzk28=
X-Google-Smtp-Source: ABdhPJzz4DUQ1axyjVAOh1cF+b2xIca4xfv7K7eg9Rr1hDQrPMmllC1Uzm47z7DJCtw1N/+iKF2pWQ==
X-Received: by 2002:a67:e0d6:: with SMTP id m22mr24461247vsl.15.1636839779699; 
 Sat, 13 Nov 2021 13:42:59 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:5df3:29c1:7d51:d484])
 by smtp.gmail.com with ESMTPSA id
 v1sm7243209uac.18.2021.11.13.13.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 13:42:59 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:42:45 -0300
Message-Id: <20211113214245.4067687-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] imx/genimage: Place the rootfs at a proper
 offset when BR2_LINUX_KERNEL_INSTALL_TARGET=y
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
Cc: Fabio Estevam <festevam@gmail.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when BR2_LINUX_KERNEL_INSTALL_TARGET=y is selected, issuing
a "saveenv" command in the U-Boot prompt may lead to rootfs corruption.

When BR2_LINUX_KERNEL_INSTALL_TARGET is not selected, then
board/freescale/common/imx/genimage.cfg.template is used as per the logic
inside board/freescale/common/imx/post-image.sh.

board/freescale/common/imx/genimage.cfg.template correctly puts the
rootfs at a safe offset.

With BR2_LINUX_KERNEL_INSTALL_TARGET=y, then
board/freescale/common/imx/genimage.cfg.template_no_boot_part or
board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
are used and no offset to the rootfs is given, which may cause U-Boot
environment area to write into the rootfs area, causing the rootfs
corruption.

Avoid this problem by placing the rootfs at an 8MB offset, just like
it is done in board/freescale/common/imx/genimage.cfg.

Tested on a imx6qp-wandboard and also on a custom imx6ull based board.

"saveenv" does not corrupt the rootfs anymore after this change.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Improve commit log (Yann)

 board/freescale/common/imx/genimage.cfg.template_no_boot_part    | 1 +
 .../freescale/common/imx/genimage.cfg.template_no_boot_part_spl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
index edc34d0fcd12..b8fa43210b91 100644
--- a/board/freescale/common/imx/genimage.cfg.template_no_boot_part
+++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
@@ -11,5 +11,6 @@ image sdcard.img {
   partition rootfs {
     partition-type = 0x83
     image = "rootfs.ext2"
+    offset = 8M
   }
 }
diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
index c29032572aef..ef015918a5b2 100644
--- a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
+++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
@@ -26,5 +26,6 @@ image sdcard.img {
   partition rootfs {
     partition-type = 0x83
     image = "rootfs.ext2"
+    offset = 8M
   }
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
