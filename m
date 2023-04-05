Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120BFC7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 10:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 939F181F88;
	Wed,  5 Apr 2023 10:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 939F181F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aa_eV6gEGI_B; Wed,  5 Apr 2023 10:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F228681F7E;
	Wed,  5 Apr 2023 10:21:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F228681F7E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 82CAB1C2A51
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 10:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A2014058C
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 10:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A2014058C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wYXak1uMvBd3 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 10:21:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B0044054C
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B0044054C
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 10:21:22 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50263dfe37dso1481391a12.0
 for <buildroot@buildroot.org>; Wed, 05 Apr 2023 03:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680690080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iULhQhBCIWX9VyEaGPDsARqc2USghAjW/gk6LkXHK0s=;
 b=c+9jBVhbJLIhyHCj8tkiGDJP75Wqll6+9hoKBnU82z7CBuHMSH8cYtNu2bnd9iasIp
 eDs0S/dWTHd9c+HhsyiuKAaMDbI7BKb6MWcm4owwPS+9WDX1/UJFmCb2HQCm32XLs1aR
 gnGPqIxn5y5hlUwbKuYseBFGQWr/foSIirMDhhYxWGZHU9+zNavA15OLsoV+zXGeNzNE
 SDDhmCxxSukAhYTEx57CFCnlSPF3BrYotZN8/2M842/sI36Sde4k08C6l1bnUAF7cAT4
 TAWfVMyfFVJNPow9nx/YnbqGyOxY6EfAXmeQNOHugpw+bvPWMRtU9VCC4AonsA/ySxHQ
 P9Kw==
X-Gm-Message-State: AAQBX9eVj7K7KB+DjknwoGzRwu2h7ui94XZL6slJ3fvUDnOeCgJ+dVb8
 t2zgvI43+xtFMSSoklPLyQqdBB69cw69FBNTz7U=
X-Google-Smtp-Source: AKy350Zy1dfeUrUwXNIHTomRoBp+Eb6J8aXRaSz+7mTaiq9/Oz+eiNs5Gj+oFYLcbbt9DfUndygevA==
X-Received: by 2002:aa7:de8c:0:b0:4fa:785d:121 with SMTP id
 j12-20020aa7de8c000000b004fa785d0121mr1172419edv.16.1680690079852; 
 Wed, 05 Apr 2023 03:21:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-60-28-18.retail.telecomitalia.it. [82.60.28.18])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a508718000000b005024aff3bb5sm7044723edb.80.2023.04.05.03.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:21:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 12:21:12 +0200
Message-Id: <20230405102112.525785-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680690080;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iULhQhBCIWX9VyEaGPDsARqc2USghAjW/gk6LkXHK0s=;
 b=NQMQ3HpGtLlGDhj0ssVKk7qe3cG9c8Huuqo33RbTO4zpsI7eyosl8QZDEnC4N8fPti
 +cZveSmBEqrRAvg5vfJ2jnl6ZNZ1wrQkVcRJew6kxfoxcraGcSW0lKrfZW6mabw+vmGD
 wfrK8B6a0ALJcR5Z4miAliJV0Hv1J512YLM24=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NQMQ3HpG
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone: bump U-Boot version to
 2023.04
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump U-Boot to version 2023.04.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/beaglebone_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index d0aa5ad8603f..c2d444c3ce6d 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -34,7 +34,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
