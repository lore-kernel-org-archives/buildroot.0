Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23640EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CDFC4154E;
	Mon, 19 Jun 2023 19:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CDFC4154E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNKHj79SNa9O; Mon, 19 Jun 2023 19:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD26B403F8;
	Mon, 19 Jun 2023 19:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD26B403F8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 275E91BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0598E405ED
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0598E405ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jwITQ4fZgsdA for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59150403C0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59150403C0
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:56:33 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b46b7b356cso227252a34.0
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687204592; x=1689796592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ervsqliQ/QgVrKhOGLw1OefEp62+uTsXvxiIj2BmE8M=;
 b=Er1VJFzVBQpcNGrCkoB8VEdUXQyKHgQdWc66zdISpVS6DWeFnKL8mtUZt5AYBazykM
 EUcBtANOpPkzAT8BqKmbwdkmLslxcagc9ZCrszkE7HRq9gkQa8hlcrgOi4drfvVPdVEL
 U3twSjbtr4Ak55jCmsCDfWYb4QKEb0+Im2VwbzeXYN4GjafNTJXdsPfoumS2WIGAduKd
 AXp8mm4I8ZDFGtQHP3XWWmCy0+QPGginIM8FcFCB1VYA6RFlocHzlIUBZayizx0jtWqx
 Sy79yIjKljckwWfdcrHaxCJvKueTJ7cZLeGmj5I+llz0l/yzNYDAFzQg8TtUwwXZGtbW
 mcng==
X-Gm-Message-State: AC+VfDwuelvKJUm3lpqeNelaecO6aYtzPzytEbYK0/Xd9oOsTNqOdrtH
 wLG888TpB0HaqGXtDEs1ayXpBeYVng8=
X-Google-Smtp-Source: ACHHUZ5sBeYlbBx66czsxbkAx43rKUf37hwimKF6GBB63sAQE2BvaEIzv6eLKN+aiDQmtHZNIQicdQ==
X-Received: by 2002:aca:f0c6:0:b0:39c:8250:4ebc with SMTP id
 o189-20020acaf0c6000000b0039c82504ebcmr7652101oih.3.1687204591953; 
 Mon, 19 Jun 2023 12:56:31 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:242a:9de7:857c:2e7d])
 by smtp.gmail.com with ESMTPSA id
 fa4-20020a0568082a4400b0039ee18b23c5sm315964oib.25.2023.06.19.12.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 12:56:31 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jun 2023 16:56:22 -0300
Message-Id: <20230619195622.595545-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687204592; x=1689796592;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ervsqliQ/QgVrKhOGLw1OefEp62+uTsXvxiIj2BmE8M=;
 b=BowCCby5gQ5a/9Btmhl3g66OYmtkyXu6a+kUeE4qfOAqrh3/3r4mM5eOw5yn+h0OF8
 2aRKkqRl1Gt0NhNw8jlWjwCTEKNWGgPc3hp02Lj/8Nvye5diDKlQNbzeqcCuf5P1457l
 cD94ZClkwTYwbDm7Qg5VorM3VGv9X0MJ25v2fbAE0YnXMI2c3k7zhIx2Z962qDoTKTu2
 XP2VGcaaHNZDOA4v2/XDzB3W0lXR3UKbTKQcEkxXZTVt2wbRbmNA3NuLHz+mvLPx05zh
 P+J8RMPUvB6hfMJIR4Um2vXMvZveY0PQpyPykdhvRUq7vgB8Y+XPD5HkED5SLc23+4eW
 p7Yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BowCCby5
Subject: [Buildroot] [PATCH] configs/imx7d-sdb: bump the kernel version
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

Bump the kernel version to 6.1.34.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx7d-sdb_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index 8ee5e1fc40..cf4da342c1 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,7 +12,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.34"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
