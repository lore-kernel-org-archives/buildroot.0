Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073A7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:40:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6AF610FE
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 14:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD6AF610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9231960668;
	Sat, 13 Nov 2021 14:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejKcDIVesxez; Sat, 13 Nov 2021 14:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7721605D0;
	Sat, 13 Nov 2021 14:39:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DC711BF23C
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A82540401
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 14:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5oagks5CODG for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 14:39:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FCED40157
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 14:39:07 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id k83so5870890vke.7
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 06:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i2RPaAqK6PT44nsCg7Yh8b4Nz51z8RvO+fEzGl9oPjQ=;
 b=f7B7Clc8HMK/0BS9hGgyE4BsLIWYlaarwrA+38aZ3es9Op0t8zdlnoXVjzjUY3pFS+
 ukU3u3BpqbbKKp27JWjtzchWQNZ1AbC3PZ0Nq1JeBshsYZOv5SIo2QbX71JDXIT6Q11a
 aiVepS9JJPsUYyPHKTgD6T7ezcXoopmJdnbQjFLVmnkafuqIKdSJ8gzO+k6Faz4X6zaG
 eZAlbfqLD1rvxKtsaH35xAqg5vmYEphi6DmSkHIE1yEb9PXTuXJk+F0GHGIWlEpJuhfa
 xiOPUPsbFGhMyz4nHUA3fYK8pL9zyYH9mnu0UMxymdZ1I1vTmARk9imubGF4BW9puD+X
 hLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i2RPaAqK6PT44nsCg7Yh8b4Nz51z8RvO+fEzGl9oPjQ=;
 b=K/RmyVxz5qTUoNcwVZvzfc96sfwt/l2AW2Fu36sKxrLg+sxth2yOJcPdDtneA9UPp2
 Usa/gVPN9T3hy6Ii0zqoKk1vN0n1iK5G3iemaslViredasU52lrl5AvJfXns8KPL5t4f
 MshhpffqdFzrFG9VU3tyomN9qdmYchpOatB9fPqxYHwXtdYb4ZkMHPdo7ULGgK4eHxOM
 QE0Bk1dJpTzTeE4BbQYj4xWErtOjnzf/nECrIUde9qZbimynQ6jS0H54I6tFuRc+9DQf
 MEzobCH/mXb2/56/s2qSLyHns1LNPAdKtScnoatDWC+GUaMCgCcFgRpppzvEfY+2lWhS
 P4FQ==
X-Gm-Message-State: AOAM5338ifM9o1QQ5OgsKgE68np7vWU6SQa2gTOUT2dGH9imycfK8U6r
 YffjAx+3cStq9lSCrhziY5s5Ji3c5h0=
X-Google-Smtp-Source: ABdhPJytEw9PVBakYldDXsidkxzBdHO5qWup7x6MJ2oc9uzJTZz/uKu8ZM64E6uplBa18pfGYzPjfA==
X-Received: by 2002:a05:6122:8cf:: with SMTP id
 15mr36059183vkg.16.1636814346233; 
 Sat, 13 Nov 2021 06:39:06 -0800 (PST)
Received: from localhost.localdomain ([2804:431:d77e:e6a0:3c83:520:4c95:1619])
 by smtp.gmail.com with ESMTPSA id
 64sm6400570vsz.15.2021.11.13.06.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 06:39:06 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 11:38:57 -0300
Message-Id: <20211113143857.2741808-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RESEND] imx/genimage: Place the rootfs at a
 proper offset when BR2_LINUX_KERNEL_INSTALL_TARGET=y
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
