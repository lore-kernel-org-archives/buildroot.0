Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D89C41535
	for <buildroot@archiver.kernel.org>; Tue, 19 Dec 2023 12:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B46DA43579;
	Tue, 19 Dec 2023 12:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B46DA43579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2ytJDrJon-4; Tue, 19 Dec 2023 12:16:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0634443598;
	Tue, 19 Dec 2023 12:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0634443598
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFA031BF360
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94A0A605EA
 for <buildroot@lists.busybox.net>; Tue, 19 Dec 2023 12:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A0A605EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LELJvgrb5kUF for <buildroot@lists.busybox.net>;
 Tue, 19 Dec 2023 12:15:21 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D224D60BAB
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 12:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D224D60BAB
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-55359dc0290so4231412a12.1
 for <buildroot@buildroot.org>; Tue, 19 Dec 2023 04:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702988119; x=1703592919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rku5KuVYAZKXdaRmP/zbKUlK0thsCU2Jg1MxxPV0WFo=;
 b=Lr4hx1Kj22nKLHPhXBChhLjz/jxAne1p2Y0j2DUP4NTYdB2FpsAKSR6k7EJN1mfxRs
 Vcv0LLWazdox/a0KmSsp2Lo4rvzMQbt5dTkp7LDZr9icIn6Lu7d6I8ef4UBYANdW+05k
 87SxD/+9OV0AyUYi/e79qNhXpsTshpLgZvtS0/cd70zmcV/Vfk72JdISYFFuhhEzwOlA
 Xc5YwARdFi1a8qrChHYf5mKNWBP1ttiSTzhSVCPaKlHgG1M7QG20b3uuVWEHxEBMypeH
 5cNVNDRU9fLVT/1H7FpXpUWDYmgn6RRBw3yJULcOyBdPPmdRxJTek02xDVR27s/sPR4y
 XqgA==
X-Gm-Message-State: AOJu0YxMZFOPoGOm+q9jQmTcmW9LRiDqxq3ItOY82hLsEkGXUhXbjqY0
 v0wO368hXXRheGSkoeMhsDlQx4aa532FmzfG7WU=
X-Google-Smtp-Source: AGHT+IGN+l3ffIPK+1Hi3JAUBS7tsLwMNUqyFGiBFw6XtVtChJrP1K8loHTxw+piUSVNxBlo5esSOA==
X-Received: by 2002:a50:931a:0:b0:553:826b:b2b with SMTP id
 m26-20020a50931a000000b00553826b0b2bmr1011038eda.13.1702988119122; 
 Tue, 19 Dec 2023 04:15:19 -0800 (PST)
Received: from marleenlaptop.. (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 bq18-20020a056402215200b0054db440489fsm11371363edb.60.2023.12.19.04.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:15:18 -0800 (PST)
X-Google-Original-From: marleen.vos@mind.be
To: buildroot@buildroot.org
Date: Tue, 19 Dec 2023 13:15:07 +0100
Message-Id: <20231219121508.1695768-7-marleen.vos@mind.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219121508.1695768-1-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1702988119; x=1703592919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rku5KuVYAZKXdaRmP/zbKUlK0thsCU2Jg1MxxPV0WFo=;
 b=ib9RtiDsU+me/s0WG+i7GCXf/nSmBzBeFOkAw29KIpU1xIJVTRTn0O4aWFaIb4K+Hr
 kso3yFgscOMsAJf4ZITBEPDu5ejrm73925zkmfiwZ4felU2/xdRjDXxgdOVcMWRs11RA
 t2wq2Ej63HN+daLTMc20XCTyS0WcoIbSr9CP9kovQZO3NA7ZjGyjlpgEDVA+zKnYflP1
 3QQmxpgKgbcey1D1bJjq765PGlVNp7EyRJz6XDi5qtMrWAzJjD7d/au6A1mU8i2i/1MP
 BpRfelsCHQSNERcjBl8VNBJIg0WonHVTmWu0Znkgro+tvOuYpBV/lymaKyi3p8+uqyjU
 k2YQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=ib9RtiDs
Subject: [Buildroot] [PATCH 6/7] configs/stm32mp157c_dk2_defconfig: update
 arm-trusted-firmware to lts-v2.8.13
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
From: Marleen Vos via buildroot <buildroot@buildroot.org>
Reply-To: marleen.vos@essensium.com
Cc: Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marleen Vos <marleen.vos@mind.be>

The assumption is that updates to the stable branch should not break anything,
so we use the latest LTS rather than a specific version.

Signed-off-by: Marleen Vos <marleen.vos@mind.be>
---
 configs/stm32mp157c_dk2_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/stm32mp157c_dk2_defconfig b/configs/stm32mp157c_dk2_defconfig
index 7472be38bb..8ef6c82f2e 100644
--- a/configs/stm32mp157c_dk2_defconfig
+++ b/configs/stm32mp157c_dk2_defconfig
@@ -27,8 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 
 # Bootloaders
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_v2_8_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
