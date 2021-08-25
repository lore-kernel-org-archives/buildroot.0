Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE85C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:20:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FE2160EAF
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:20:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9FE2160EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 689A86061B;
	Wed, 25 Aug 2021 19:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYJVnl4F-Bx5; Wed, 25 Aug 2021 19:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC4976069C;
	Wed, 25 Aug 2021 19:20:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F21CC1BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1769613AB
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BstaGz3h5Swe for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:20:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 091FE6061B
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:20:21 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so509992wma.0
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k8hDioVYKtQ0VvDKfOTvxZg21hi6USfRshpH0U+Y594=;
 b=RR7MpXfino92/FNjybMwJXuefT6YghEaxKhi5HpKTh1XWNAOmM0UXnT/0FTZFhOBN0
 Z9+oT4OyG1jZhSQ+Qc1b7oL5Ig2Ujz8KxelfquPJPihnPHcnuml8WDeHlT1h7tIiaJ6q
 COJb/PQisUCbSA1HZLJSpW8lam0u2/pZ90Pi6TSoVX9ihp2ypje+Levzlxa9beTVlkIv
 ewuD+XOStskSjxq1Jbj/6vvNUDSyoMo2Qc3oZ4tJgeJo7SN4uEhzJh58BFB00h/bCUsy
 MamrkQenxmcyFr3Yy4IDD8mqKReaeCY6mx4rMjQeo4nZ4RpaXBiGLxpr+vu79qWq3f73
 /adQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k8hDioVYKtQ0VvDKfOTvxZg21hi6USfRshpH0U+Y594=;
 b=RGu5t4BmkUfx3ptNJVjagojMsq2ZZaXgy4D/L7Hoe99XfSPoFv5dCNC/Ycv23T3fM2
 hTQhdQIQbSzkTo31sgJT0oVK6Cw4NxyniJhRCl2a6/QMile33BZbOsHlLhTRarprLTz8
 OaOGB61pe+Y2UaiJON0gGiqfXYawjnCBQdIWhZjh7oOTHxfi3EHM8tWIRLX6e4mjAPKV
 8LIBWpPKII1lFQOYhZjs0UHPRbsz6JNySRi6SdKSOazCq0uxd6mzT7f3Eo0M0hWzJCMU
 +ymKqhTIEbpl3QuEEWB5pl1bmnPE3zCLjE8c5UhhbUvTUCRsuxakIBLghQvVuQRGC5cp
 laBA==
X-Gm-Message-State: AOAM533wkmzqlEdrluSaJRglGUeBm5saF1ZCktSPQEca0JHa2Rhoutk3
 2Q5aBcNfbPgjmTY+ef7AB0ZagAT3poA=
X-Google-Smtp-Source: ABdhPJziLidkK8jciXyIOm6h2+SCV6kqjaEQNjB4um2bTtnvlrJLtD+JAOY9hYXjkNsKXgVEV+yBfg==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr98337wmc.150.1629919220302;
 Wed, 25 Aug 2021 12:20:20 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id c2sm759465wrs.60.2021.08.25.12.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 12:20:19 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 21:20:13 +0200
Message-Id: <20210825192014.1203727-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/beaglev_defconfig: update linux-headers
 to 5.13.
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The beaglev kernel is based on the 5.13 branch, update
the expected linux-headers version to 5.13.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1525740895

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/beaglev_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 82a6e9abc4..70459bf3e8 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -4,7 +4,7 @@ BR2_RISCV_ISA_CUSTOM_RVM=y
 BR2_RISCV_ISA_CUSTOM_RVF=y
 BR2_RISCV_ISA_CUSTOM_RVD=y
 BR2_RISCV_ISA_CUSTOM_RVC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglev/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglev/genimage.cfg"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
