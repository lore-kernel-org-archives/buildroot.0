Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64211C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 07:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03A4A8228D;
	Sat,  4 Nov 2023 07:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A4A8228D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDKeqisNkfTq; Sat,  4 Nov 2023 07:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43FB982290;
	Sat,  4 Nov 2023 07:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43FB982290
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 532C81BF397
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 396EB81B53
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 07:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 396EB81B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tmqW-j8nveEj for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 07:25:14 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64FFD81B3E
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 07:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64FFD81B3E
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507c5249d55so3678810e87.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 00:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699082711; x=1699687511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3LFTqy7tdVgrPGMHrrHWxWyQg6YLVtl2oKHqVVjVGak=;
 b=U5UPjXzs4yfInJJ7+g6s9XVfqOvnb5g5byajy2bRzBQpZQKvEEbWywFMOSsN6IdCjK
 C+dQz9JdpI2jE/qXQCLkkM8hX1fCF8J3RgTOXg02t5tYL4bh+nWsoFetkDHDegoWbQA2
 dDSfQcyzTsHQrCT5VkO+LZso8EuxFlNNkP4g0IxYnspBtuUmcx82+n+NtTAiMHzjhfcw
 8a9+sqcwqDNpZCYZfaNKWWWgBNb5gL8G8SX/6CRgl6EQmBe0S7eCREsj8qo26GvrKy6L
 q/cLBTuFPWkfljaVRDHFjNNTr2IrI6DyFFoLsuj9z2AR88+a9IHgsGYfZ2+ZN+Mpi/Hg
 SMgw==
X-Gm-Message-State: AOJu0YzRIv3zXTa6e7AK7V+4TdqHWwtrxghaqBP9ocOsaJX09grpIyhD
 6bUf5lNKIY5m5CsNG+9iSHmN593FUXaF1tjQBSzHUw==
X-Google-Smtp-Source: AGHT+IGPX3Y0Awz8INsV1LSJnBEDiMtzP0NdHze6eofoZn0wLxSikNaOL6SdB0fzBky+JVwhvJpRQg==
X-Received: by 2002:a05:6512:3b10:b0:507:9b70:1f0e with SMTP id
 f16-20020a0565123b1000b005079b701f0emr22211452lfv.24.1699082711240; 
 Sat, 04 Nov 2023 00:25:11 -0700 (PDT)
Received: from jpl.. ([151.238.102.70]) by smtp.gmail.com with ESMTPSA id
 c18-20020a5d5292000000b0032da87e32e2sm3686742wrv.4.2023.11.04.00.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 00:25:11 -0700 (PDT)
From: Javad Rahimipetroudi <javad321javad@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 10:54:56 +0330
Message-Id: <20231104072458.7369-5-javad321javad@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231104072458.7369-1-javad321javad@gmail.com>
References: <20231104072458.7369-1-javad321javad@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699082711; x=1699687511; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LFTqy7tdVgrPGMHrrHWxWyQg6YLVtl2oKHqVVjVGak=;
 b=MyNWFESrwtVrwI3VBrajybz1edmG/byjHCwBv9QUeQb0mZbjAEaYA4P7xHuzKDDbmS
 NJ30+UUGxoWFVv+zpoeeodHUHGCiAN66S7KZgImbo4tcs45GGiSzuEKQ+pDjA0HaYWmy
 0/W9bN6pUxBfI4miN1lyzKFdhaDiWYx5NAd0nNTFTSt2JedJyP70oNAymWfagihyd0E0
 4aL2c5ERSxyZVoPAX1uo4EDJOd22FUsfWQVpepBaZHj5dfmU1QZesomBkzoCFPWZWe9a
 NOfxar2AE/lD4ZD0CnIpS6ISq8v46piFoAXIkZV7P8GdH3bYKNEAJugyy94m787uYMWN
 ovkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MyNWFESr
Subject: [Buildroot] [PATCH 5/7] configs/pine64_defconfig: remove
 unnecessary configs
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
Cc: Javad Rahimipetroudi <javad321javad@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Javad Rahimipetroudi <javad321javad@gmail.com>
---
 configs/pine64_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index 5cb4b4a0b5..c58bb12d94 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -1,5 +1,4 @@
 BR2_aarch64=y
-BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
 # Linux headers same as kernel, a 6.1 series
@@ -10,7 +9,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+
 
 # Bootloader
 BR2_TARGET_UBOOT=y
@@ -22,8 +21,6 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
