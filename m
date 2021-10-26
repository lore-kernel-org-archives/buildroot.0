Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A61C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:58:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F84560F70
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F84560F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 075574026D;
	Tue, 26 Oct 2021 12:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fsCFUFAc-mYA; Tue, 26 Oct 2021 12:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2637F401EF;
	Tue, 26 Oct 2021 12:58:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07E271BF38D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9F01401EF
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GLhViOs-MPG for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A20E401D3
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:58:53 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so17125853ote.8
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 05:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i2RPaAqK6PT44nsCg7Yh8b4Nz51z8RvO+fEzGl9oPjQ=;
 b=DyY5CHZMFsNn8hpEEtQoKRv+Gp0/zAXDd38NlANsOK0CkOGg3HYfCBph5a0qiYhasH
 c5uLvTeUcnflklqcsmt5g332oafJfhxJWalkOyvX4dgPqlpF0uSshB28W91LKP0pC6sT
 iCUeCgcSRkCxw+FdlE/mwPEV3eQpqtiy0iGh0PcMvfuaNMJrJYbrXokioHSbyy207StJ
 opNfffkd1H2DUnzypvkIaTlqWeBQESyUrQzJlkChcx+pjEH2ZhJScT7yZfoAq+Arok+M
 yA0/woDYfuHu3f9qTMuA5AphcOKbc96B9vUU15bfiJnPcitX4AAbRwfSTuKw/KvOijPo
 09iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i2RPaAqK6PT44nsCg7Yh8b4Nz51z8RvO+fEzGl9oPjQ=;
 b=cFTLMNF4IvMttSSVpO5WLODzsTjgHvulY5kOVTogZMmm3ftHmYA695N+8Pa5e2i/QH
 g0Sq8Ce3uQts8CyLFD1imYsxJrZF7r2cRGXhyspRsDW4rm4UvtlZju5LioffHLe7NBX6
 +WR1Z3w4lJZilbdBn/dqjsFCeSSuMjz3Aa5uYxmmhehnfUW4rHfyvnkJLrjYGF1ODDBW
 d5WH/bCXM27KH35l/8SkCsMyyp2VAszrUW2eYhmMt7rQNRv7Qzv90aGyyy/Q2gHwxZGQ
 B4ec8a+u+xrNdw2I81OzxCOX6mAtwiMEmhuQTjl5HDxPHSlGZwVOeNVHYaPNu3SMX/6x
 ZHzw==
X-Gm-Message-State: AOAM530XeVLiTAk2nfTp8L5IbHTA2c3KOeKDTGznnpwsrz8KSlhUzmaX
 uhFSVhGwHT20c4p66Mo5jihe2YA49FY=
X-Google-Smtp-Source: ABdhPJxEcfD/1XgSKDJXkivKbTZOwy30Ob2hFvpIBceLXXtckDjpDfzWCFIBE1HMm7HTVvOYi8RcDg==
X-Received: by 2002:a9d:3b8:: with SMTP id f53mr20155407otf.253.1635253131799; 
 Tue, 26 Oct 2021 05:58:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:42ce:e117:2dc6:70d3])
 by smtp.gmail.com with ESMTPSA id
 bj14sm4943134oib.3.2021.10.26.05.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 05:58:51 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 09:58:39 -0300
Message-Id: <20211026125839.3588413-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] imx/genimage: Place the rootfs at a proper
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when BR2_LINUX_KERNEL_INSTALL_TARGET=y is selected, issuing
a "saveenv" command in the U-Boot prompt may lead to rootfs corruption.

Avoid this problem by placing the rootfs at an 8MB offset, just like
it is done in genimage.cfg.template.

Tested on a imx6qp-wandboard and also on a custom imx6ull based board.

"saveenv" does not corrupt the rootfs anymore after this change.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
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
