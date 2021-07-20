Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44072C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02DDD61004
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 20:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02DDD61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C893A4050F;
	Tue, 20 Jul 2021 20:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_PL31j42eAR; Tue, 20 Jul 2021 20:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB663404EE;
	Tue, 20 Jul 2021 20:47:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2F52E1BF45A
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EAE9402BC
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 20:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4v_9-C_DoVBr for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 20:47:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35EDE401BA
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 20:47:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so2226774wmb.3
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0xNv5utghu8ZuonBWkRBDd8V10TxNOIMGOtKjSwrv8Y=;
 b=dfXe61kDkbNqiVpAVwxr7v0PEjrrGWn3XcIt1QnZVeRVSzEueCZ5eteYWhF5wQgmsR
 UHE17GYQN2nMxnvKdyyh1SGQHtDS1pA74aFKpNC8GdzXTxV9Lk3wl9y0zeuakQkSjg8s
 CTAd79Ci2lTcJi6aHswYIvX2OiVKROGjGa8+TXDqv8Ab6VXbGiLxBTBi8n54KViP+XQz
 r3qg0Hw1VSWqduEYpWPir46g0uPhfy93o9fvvxmwlW1WTmXquFHPyS0Dxtk8PAOGXX/H
 1uAQ4S3+Dke8SNTO7FkPAZmu3x87Lrs9UMl4Fh7QyTTA5oj+UEh7sHL37CkG5Nnr/naC
 tdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0xNv5utghu8ZuonBWkRBDd8V10TxNOIMGOtKjSwrv8Y=;
 b=daJnS1BriAknPgria19C1H7Zy+y+kxGZa2Tl9CK/SrxMjwecRzPd4p+6yJC0hM1uQR
 SC0imYfD3e+QmMVJeohtkYtsb5tuWJM24QBbLVZoFco1yxE1WBdsc88dyJlKUIEJOAyA
 +aM9kBroXkSEY+UYbvY9Y7jFFF9CuIDw/kWPVw9xrLFnnJO2rrLe+VeNbZ0HOk5Xev+6
 SsaqFc1hqhCQjal2ef1P2jxBjH/MXI32/LgohyulyNc0VlnVoKuXQvd8tfABh2bCMArR
 6k5257US1cYEa9f/VgLb1vej1N/rlusb2n6UjTAIrhulml9EaGt1FZdbBIpxJ1PZljTx
 tCuQ==
X-Gm-Message-State: AOAM530tgwLKKhAnp2v8ptYTX9Pma8lDKLZPxB2s8/+qBnUtgBqVmAxD
 879jB43Ctesyzv4VHtd712MMzXr/ZNrbzw==
X-Google-Smtp-Source: ABdhPJwpUaLwh7kNrV0a8H+n8G98EDe/G7udNItB4SldmbxF4+9u5tq6B2k0XvgSpQCAtyz4rqpH1Q==
X-Received: by 2002:a05:600c:6d8:: with SMTP id
 b24mr331789wmn.111.1626814067258; 
 Tue, 20 Jul 2021 13:47:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id a10sm24336357wrm.12.2021.07.20.13.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 13:47:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:47:21 +0200
Message-ID: <20210720204721.80821-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: use official tarball
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720204721.fl-_N0Q5yeBS8CrK3QgDg_MC0xsRvHe3lcMoYrqat9Y@z>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-firmware/linux-firmware.hash | 6 ++++--
 package/linux-firmware/linux-firmware.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 22d6ddf88f..41a17b021e 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,7 @@
-# Locally calculated
-sha256  4341b33c64afd8e471de06f1459f63a76445b1ea83055fe3d4103dfb2e1b25ec  linux-firmware-20210511-br1.tar.gz
+# From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
+sha256  2aa6ae8b9808408f9811ac38f00c188e53e984a2b3990254f6c9c02c1ab13417  linux-firmware-20210511.tar.xz
+
+# Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 69b1226cca..f29d9cf65d 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 LINUX_FIRMWARE_VERSION = 20210511
-LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
-LINUX_FIRMWARE_SITE_METHOD = git
+LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
+LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
 
 LINUX_FIRMWARE_CPE_ID_VENDOR = kernel
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
