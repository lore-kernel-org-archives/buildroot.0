Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7F4C0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 13:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53D4840C2C;
	Tue, 15 Aug 2023 13:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53D4840C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ECNL_MX0kTFd; Tue, 15 Aug 2023 13:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B8BB405B7;
	Tue, 15 Aug 2023 13:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B8BB405B7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 559201BF3D8
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 13:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B0A981EE9
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 13:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B0A981EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpoU1Yn9OV_7 for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 13:16:31 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9F67881EE8
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 13:16:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F67881EE8
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68871bbfe33so172110b3a.0
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 06:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692105390; x=1692710190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8MG2p9JqNkME/BYwQwGSy7mK8LZyt0EBFxW0GC34UGY=;
 b=NOUr28djQ8m46a36uCV9VcJkwNKTa0EgNrFUFiKSGlvkf2p4d8M1kZaxnFa5aIwCeK
 a+9ZNjDjHPhjOkEELHsKBUZjIuZC0J9TrXAUmn4E9xTK0rZgdABhS+D4cjP1ST0w9osy
 vz/b1RBqlWpeLaUyWXjhfDw8vLLks8xN20xwjnl88egFhOw/dzlmApeBTBN5dnyRH7XS
 74KtLY+USf3hP9psmb6EU+vbsWZ07tRr7XCqlGqEPTC3bof8lJ7aGkyBHaN+0bhT9Dn5
 s9drmVo/KUPFPDfJWp1FT++Jps6AGef8jEfwSOXiacvZ4bgmDB6FKEG+QwIhbu7nOXlB
 oJvg==
X-Gm-Message-State: AOJu0YwXZcIxo1RTHxE88WyDK9uS83JthSYJLN4ze145LM3M51Scu3mf
 300IBnBggW2L/mUZ3qMlawLAGCl7gkwAnr1fYs0=
X-Google-Smtp-Source: AGHT+IHodhouUOgqwbkQbM9uUiEVjH7b3O5Qyo/YvkcnPCatLndcQaCEAtWa8T7ClQjb4WfaCaK85w==
X-Received: by 2002:a05:6a00:a88:b0:687:4bd8:159a with SMTP id
 b8-20020a056a000a8800b006874bd8159amr14939687pfl.19.1692105390472; 
 Tue, 15 Aug 2023 06:16:30 -0700 (PDT)
Received: from localhost.localdomain ([45.133.6.75])
 by smtp.gmail.com with ESMTPSA id
 i11-20020aa7908b000000b0066f37665a6asm9335551pfa.117.2023.08.15.06.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 06:16:29 -0700 (PDT)
From: Javad Rahimi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 16:45:41 +0330
Message-Id: <20230815131542.1402848-3-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815131542.1402848-1-javad321javad@gmail.com>
References: <20230815131542.1402848-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692105390; x=1692710190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8MG2p9JqNkME/BYwQwGSy7mK8LZyt0EBFxW0GC34UGY=;
 b=eGklaEDOV4KaTLCVfRnWaK4qLONWl3liSbQIeS5pjC4bzNHMjYJBU0Msdc9ZTz4TbX
 +x8Nct8dsMZwvHjX/mToWLaonn8EDSE6kN1JMVqLBSdH/Tk48fwZvHHmcoOHOCtldTc6
 yuiSa2S3k/JfQtIVQx1rbUPXXWd93oZh0WdKUoKw6qocdMDNdwyC3T5IrQD6M3r2s1aj
 Im+X1S0FcdRNB0hEnroGF+5AtBcEg51umXhCw+zyUfX5wTfZyU0MlpS+p+elrFL3Irbb
 TjaDMwdGS6j8tiZO7FfRMQ/UWLm93vutX2FO2dYZix822ChwYMTv84+59nySrA56m5DR
 BYyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eGklaEDO
Subject: [Buildroot] [PATCH 3/4] configs/orangepi_pc2: bump ATF version to
 v2.9
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
Cc: Javad Rahimi <javad321javad@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimi <javad321javad@gmail.com>
---
 configs/orangepi_pc2_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index a1fb9a112c..29939ea1fb 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
