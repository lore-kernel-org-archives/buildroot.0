Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B72BC77B7C
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 20:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A49CE60FF1;
	Sat, 29 Apr 2023 20:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A49CE60FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFECpBXv5tTe; Sat, 29 Apr 2023 20:45:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B2360D65;
	Sat, 29 Apr 2023 20:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B2360D65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 677591BF405
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 413F860F8D
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 413F860F8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0P7j1NJ-sOu4 for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 20:45:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F51C60D65
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F51C60D65
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 20:45:24 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2a7af0cb2e6so10285271fa.0
 for <buildroot@buildroot.org>; Sat, 29 Apr 2023 13:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682801122; x=1685393122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gwlagAfTsLUzSYjAajXLM6Du4WhPTri7sLj3bcNYtEk=;
 b=UO43nHvcdiDDWo5dnJKogN0CH2HMt2SANqpt7AKmfvza49ujvZrHOrWkvLannOcUKQ
 MSJ6oMzGyNBWAl5/CwitH7hKm3PLhhtvCWbYWFQ8qMxneJWyKyMwsABeKKC1taHUcm/U
 H4agqskNDmyDCwG+M3AplaOtSF0gwPaxwCRQVHIo0i1iAsrDawSTjg4ovpghQ2Whh76p
 ePzyFHy+e67Saj+5oBsVAXzxg9ZWcpkSPjnErwoAGFVxpPZzVLw+pPZCnMF8TckMcxbl
 o0Ah+fWCOzqNrmIoqasF2MzMRqDpBo9cawzWIhq82u6xPO8AwiomsaKnKeSJVT5zMpAm
 NwOQ==
X-Gm-Message-State: AC+VfDyLVGWljR94cwnsm0oMrhbwnJWIodkOv104xn0e4V0E3KBZugKC
 6wCFLw2SRAP3maRTc0zn1FOITgiivOJi5g==
X-Google-Smtp-Source: ACHHUZ5o7laN8SkQ5a4iJTfyfpfEt1De83h4dxDmxstes+TyDw1wFybZilzo3m/782gSXELpKXr+pQ==
X-Received: by 2002:a2e:97c4:0:b0:2a8:ca28:e4e with SMTP id
 m4-20020a2e97c4000000b002a8ca280e4emr2676119ljj.24.1682801121628; 
 Sat, 29 Apr 2023 13:45:21 -0700 (PDT)
Received: from localhost.localdomain ([80.211.22.60])
 by smtp.googlemail.com with ESMTPSA id
 z10-20020a2e350a000000b002a8abe6f094sm3721906ljz.104.2023.04.29.13.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 13:45:21 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Apr 2023 23:45:10 +0300
Message-Id: <20230429204511.750377-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429204511.750377-1-geomatsi@gmail.com>
References: <20230429204511.750377-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682801122; x=1685393122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gwlagAfTsLUzSYjAajXLM6Du4WhPTri7sLj3bcNYtEk=;
 b=M9d7/yffCpLM005c19Z4FWoGPaaPRZVQQlrr++E1LvJCAHdqLPOG2r8rpPBmaGTOF1
 acmBqy+Bqyc68xbmK9Zps6h+d+kmQDT6gVRFMpzpeHV51juVgTD6RTNf1lvGtSG3K5Xr
 BpaHsdqkJ6H4cEpvjF4B2OmblRglJWG33gFM3Uh5EjObmjiE/HA8aEoM6iWwFHadukKB
 XVlaUHkypUoi8ogKFEIoQ798sxwF8gSfzcEBJ0XT6nupicty/534S5qeKrj+arEhzGUH
 vq8g42L+1+xpbqlAoTT7cmHSKZPnEbfDgNGJfSnko29kCh3MPh9kRRxMWf9Cu2/oljjl
 0ctA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=M9d7/yff
Subject: [Buildroot] [PATCH 2/3] configs: orangepi_zero_defconfig: U-Boot
 requires OpenSSL
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building U-Boot for OrangePi Zero requires host OpenSSL.
Build error is masked only because Linux kernel is built
before U-Boot for this specific image configuration were
wireless driver is enabled.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_zero_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 40269db233..e286f0b7f1 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -36,6 +36,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
