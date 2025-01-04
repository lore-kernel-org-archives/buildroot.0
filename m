Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE22E77188
	for <buildroot@archiver.kernel.org>; Sat,  4 Jan 2025 18:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02FB64068F;
	Sat,  4 Jan 2025 18:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1eQ7-dRAHvz; Sat,  4 Jan 2025 17:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8C2E4072B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C2E4072B;
	Sat,  4 Jan 2025 17:59:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1754DAF0
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 05CE240278
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3EzH8N5jveV for <buildroot@buildroot.org>;
 Sat,  4 Jan 2025 17:59:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 89C43400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89C43400C8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89C43400C8
 for <buildroot@buildroot.org>; Sat,  4 Jan 2025 17:59:51 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso121403115e9.2
 for <buildroot@buildroot.org>; Sat, 04 Jan 2025 09:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736013589; x=1736618389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UMZfOgrQ5qvyeC0T/YYUQZIYB3i9YxVhKI6f5ZyZ0R4=;
 b=NPzglZUgurtdboEkvDlGcM4COlRCsiqLA/MDJOeGrrOGrNG/J57yq7vJAYVh5rvVLR
 Mt8+M88B1Lgjpa2Mcvbb1JOvT2PYRH2/9RdOINxoBQY98krAVj8BFF472Ra/oMmDknGQ
 lmOP89NdzIqaM+hkKvXmuwiFfnVWqdgl04KcGYe96LS0j+eBBhc5cFP19bqHZY77O8+V
 xT6+eKkszHyALBw5PaDgSvYAbPVDETYOAMyCccZrcKAf4L0jXytotLbmUeb3SB7pOnkg
 mJO6YElbLHLiBZveHzOmk+WGsN47YoGBfitTLP5alfctUDrcOeQQzLH9Z/H8xEs6WFq8
 uscw==
X-Gm-Message-State: AOJu0YzGADOhQ3/8HqztHdLtIWtkzcLqZMEc9QR5zQrCEL5yLo0dAfFF
 upkSG4KK9V10ltAqBWompSegV8iFQfx2/A3FMJpXzB+NmgUFvGpEjKaF+Je4rC4zjRwDRrzaj73
 Q
X-Gm-Gg: ASbGnct/UKM6qKbvtK/tybpHUshE0vjox50odb0AwbB4aXmBx+MtE/1SPu8b7ctjyo0
 21UFsn+0XxYhykLoftxGq1n8RI0KiC9DW5eEU6I1VOKv2Sl41XcP7LR987HRiqI5y+Bj+RsKnG1
 9bF6h+m6umuNAK/5t+fhPodren7HQ4LZHFRfieioAAYvGHf7uwz7aUlyut9uBUfuLZVvGba1bYY
 ZiSskh2fcB+IViS7dF7vxL/x9s+KknoYP3e8dkY08ED0bDIqnKDaYQMNLJLGaeiMo9Uxce+bxVG
 gLaKBY7qOHE0XLTPZZ94fwXCJHzGpxwayhkwlDrDNgqXYZCcm//8HQ==
X-Google-Smtp-Source: AGHT+IEPus9OwT9JbCarkNADFjEyqmUoRi8AQ6DL8V3WArvRG3PSK5bcxpXOrfk7JNrUFcYMeA5W3w==
X-Received: by 2002:a05:600c:3ca4:b0:436:6460:e680 with SMTP id
 5b1f17b1804b1-43668646b20mr472095695e9.16.1736013589578; 
 Sat, 04 Jan 2025 09:59:49 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828bd3sm43030487f8f.10.2025.01.04.09.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 09:59:49 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat,  4 Jan 2025 18:59:43 +0100
Message-ID: <20250104175945.916723-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104175945.916723-1-romain.naour@smile.fr>
References: <20250104175945.916723-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736013589; x=1736618389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UMZfOgrQ5qvyeC0T/YYUQZIYB3i9YxVhKI6f5ZyZ0R4=;
 b=Ob9Ao2/Cnhs0wYkgb4GK1jS0QPkjvgkrp1GwN1MLwoKKulD3T02HpH+ph61Adfd/DS
 h1X7hdksnEys6utCFBOrTD5P+LR9f5a8v538er1NZM9vfaNPfhSdS1xP4gIJaXqhi4LX
 IfS4GJ2LF33wA6sqKYK9Ib1JuPSZnRKC8M56Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Ob9Ao2/C
Subject: [Buildroot] [PATCH 3/5] configs/qemu_aarch64_sbsa_defconfig: bump
 ATF to 2.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since edk2-202408, ATF >= 2.12 is required for qemu aarch64 sbsa target
to support CPU topology information provided by edk2 firmware [1].

If ATF <= 2.11 is used, the boot will hand with the following error:

      sbsa_sip_smc_handler: unhandled SMC (0xc20000ca) (function id: 202)

In order to update edk2 package to a newer version, update ATF version
used by qemu_aarch64_sbsa_defconfig to 2.12.

[1] https://github.com/ARM-software/arm-trusted-firmware/commit/c891b4d83578db25d24d2a8e3e7e419e65773ac8

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_aarch64_sbsa_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index 6df2b2e273..04bb2832d3 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_EDK2=y
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
