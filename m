Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B42DC0015E
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 13:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7CE840191;
	Tue, 15 Aug 2023 13:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7CE840191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhgzpAbgUguh; Tue, 15 Aug 2023 13:16:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4BAA4053D;
	Tue, 15 Aug 2023 13:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4BAA4053D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 529701BF3D8
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 13:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2897F81EEB
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 13:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2897F81EEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLP-V3in1Ypf for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 13:16:39 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 875E281EE9
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 13:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 875E281EE9
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68843ed67a8so1129679b3a.2
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 06:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692105398; x=1692710198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KAHUg1EEz4hepQn+dqeP0Nogfp0GcM51sHmjHIHOlhA=;
 b=QQYOulcAJ7HOeAIONRRVJ3JmUeTNCrCb0HXe71jQXgMkAlC8sExuYDscqALtA5BsQm
 1ZX8e45U7aVXsoG4CwLJirbCHqNvIhVZDXgyu7LT6LQ75SXIgtph1zYAo7DJ7Vq9HInU
 RvX0PR3pMT5cZ/gOqAu12mtTXE0PliIMLSWEsJ5bdKOHtQ4T+NscgHmdnCTpBG922Wjz
 QYHnae1nUtJVL3eIydUMw3N5GB5D6LgD8OkjwOi9UduJ++fmrqUbr6/2jejM/IwkVXA3
 QtsB2+I0+CVkpYnlMtdjnlTQt/Rvd+c+sohfiP9RvVM5jlo1wzvx4PVCdAq8iHroALq9
 HHHQ==
X-Gm-Message-State: AOJu0YxJfp2x8vjk/TEYthPosslTh8Md5l5hIL4J7vXS98kB/B/Xu/GC
 bTJkVzmEyY50aFOPPfJmuCFmslKICLSftwXOEKQ=
X-Google-Smtp-Source: AGHT+IGePTY51Z2hHR4LhOKMCXiqRbnow9JntoLzFivuFuTZZO/V/GE6k6tu7XMH+dMc5RBsNO9s/A==
X-Received: by 2002:a05:6a21:4849:b0:138:5a28:e8cc with SMTP id
 au9-20020a056a21484900b001385a28e8ccmr15311218pzc.37.1692105398318; 
 Tue, 15 Aug 2023 06:16:38 -0700 (PDT)
Received: from localhost.localdomain ([45.133.6.75])
 by smtp.gmail.com with ESMTPSA id
 i11-20020aa7908b000000b0066f37665a6asm9335551pfa.117.2023.08.15.06.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 06:16:37 -0700 (PDT)
From: Javad Rahimi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 16:45:42 +0330
Message-Id: <20230815131542.1402848-4-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815131542.1402848-1-javad321javad@gmail.com>
References: <20230815131542.1402848-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692105398; x=1692710198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAHUg1EEz4hepQn+dqeP0Nogfp0GcM51sHmjHIHOlhA=;
 b=NwAmw/08Tou8kSCiBmTTcbYsS4XS6S7Ktiuotc520tD8MvjQ8G5uCJOuBlusOX+v91
 Xp3JrBCgK/hSXtgvNzg8bOONu4JMFqiIDRaM46ujNSpzssWsFXzZtqngeNpHzchsHppu
 8YaqDURocbBwratBIZ9Zql0jzSd4D0vKGLKpGNv5zeE+Hhq2q2SMZESdePE1QDaXg4Cj
 fSuE2qktvfS7TmiNYruHfQM1dsjCvxEQZ42PBDe0kwnaVzB3f6Ljvh5/Giuai2H7FvQI
 pkBITKBkkp8ANoo9IEo2NdFM0+h1Z4r3PAXlcrKDDxN/vnmcX4Np5hOTjAKMGaDv0z/U
 3ljA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NwAmw/08
Subject: [Buildroot] [PATCH 4/4] configs/orangepi_pc2: bump Uboot version to
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
index 29939ea1fb..46d04b34c8 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -25,7 +25,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
