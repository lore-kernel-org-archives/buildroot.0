Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739BEC19776
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 10:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF46860805;
	Fri, 28 Feb 2025 10:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqGUZHM5-K_l; Fri, 28 Feb 2025 10:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16FF760ADD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FF760ADD;
	Fri, 28 Feb 2025 10:52:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D882711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 10:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EC8F4000B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 10:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ys_fL9D10qXd for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 10:52:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AF7440131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF7440131
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AF7440131
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 10:52:29 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so19071865e9.1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 02:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740739948; x=1741344748;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s0EtD6VuoMKDo3U6BNSSjyhnxmeprj8ROJTMAdM9mqQ=;
 b=d6iHVQM1nHIdDT+Mz9CS6FGGGMMwB+T6HVj/WtbKs/XOSlq1KRl9sOLqPM/CBJVA+H
 RI6PHTeubsTDYDLup8tmws9KtxjIzv2hdJKiEZkTqd5YpJHqphzQgRSUKSfUBGgnWuua
 aV4RGD7XrjBq5i97GxFqibGPFgnSOM0e7z7FfapP9IC6V62AaQR9mHB4vBDRHdXeURQa
 CTcuM95252kclwrlc/XfOWR3QEQgXZDKHasipJb9uqq+m1vZuujDuQrBz0JYp/FEpv08
 aj45Y9z0WDzF9Qvi4EDoGB8QYGpsotkUgJOYB0ujtF/BNp8uUfJFxusw3B8OleV5U40k
 DT1g==
X-Gm-Message-State: AOJu0YxVPP/BSHTsV+whqIGrz1GtjysUUJ35wLJfQa+YnqGBaNazB1Km
 iAc+bmpDkCq1oJtCYTAOCQc8DBRL3x38UMTeivcWTJYQHieGzcHNP7i3j8QO
X-Gm-Gg: ASbGncvw6d6sDGZGo7g66v6PkEHQcpKMdGJIfOVcPBIuy5SFe3qoaY4YZvX0t4Cdm4T
 Yx04qqp0vT+IG9dtcqA/nzB90BiWLGj4lacLc3EJvy57jZXI+23dJ+nT5VESAcEGRqUEB8KejY1
 H/D1hfVPdeAQwKMtPvxL8YIzwLhFHDQSmKPMRWClZOC/YxiMIjaErlTB84INtWASUcreu1KLrT5
 2Pxc9nS3KK4vl1qXB2iLyXnCt57MYGmuvOMFRMg53IOWQPG8dP1qf1DKJnJ1ZL+vz14LoqZ2k1H
 e2Hm+dj0yCJ2vLNf8KHr56TOHg==
X-Google-Smtp-Source: AGHT+IFhzYC348bl1E+oV9TEDLOTNmoike9mrq2JYBtVQ+JXt4N08HwtFK0897ZuQIFuk2rA1DbuGQ==
X-Received: by 2002:a5d:5f94:0:b0:38d:e0a9:7e5e with SMTP id
 ffacd0b85a97d-390e164b4bcmr5713592f8f.6.1740739947896; 
 Fri, 28 Feb 2025 02:52:27 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-390e47b6f22sm4752392f8f.47.2025.02.28.02.52.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 02:52:27 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Fri, 28 Feb 2025 11:52:27 +0100
MIME-Version: 1.0
Message-Id: <20250228-master-v1-1-5711275f36cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGqVwWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMz3dzE4pLUIl1z4yRjI8uk1DSTJEMloOKCotS0zAqwQdGxtbUAC4f
 fjFgAAAA=
X-Change-ID: 20250226-master-73b329bef4b1
To: buildroot@buildroot.org
Cc: 
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=rgallaispou@gmail.com; 
 h=from:subject:message-id;
 bh=0Qp/Cu1vefwJ8teAtm2ti9h6p+BFUUEh7ZVEe5k9IMI=; 
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnwZVrtglip3fmlfObjPPB1hBWuhjt3qCa3iznD
 nxurAKKIniJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ8GVawAKCRDnIYpo1BLC
 tcNDEACRyozYV9nksNDUJASGpi58/KijQgMMHODxLVriU+3cNb4k/8uBgMTZ++O45D1QBSEsn+v
 EkGEdohh58Ywkzqr4yAA963wCqE5o7nA+2W7E6bRsrVeaBviDpgJ0363jcCr7Cs/WAOe0HImgJT
 /qIbw1nz+XE88C5nRh9G8jARqbTFnyfHNx4XG1qi5SN3xjOEEJasTNNFYRef1BI4NUurn6Y59Zj
 CxTLb6qSwuDZrAuJlpuZ/ctv5j/nJhR+XlglyxMUYJs8brgzlDInmsSOoIRIzVOGe6r7lm5R8KG
 hEoh7c7A+U+4qbG2b3OrLaDE4F7ShzPCtcrumyauNq2M7qvZh41ymM/adT+T20O6hSe3hqWjXbi
 sQexGsHWcmEMCXBm3U4rPZj8o91Qn8DZGZSXEb350SCXGuT4xXTBMgg0/+CapPLeqNY/9AaqIWX
 67xAhDJiEYGS8oUfgc4FYbo0Kub5ot3CE21IerUJiJiwJOzJm2ddruT/RuaLRTZlh18v/mvYHuR
 Kqcj5NhnRb5+epB48YhSyAn1AjLlTGb3xHY0GwQvzXg1OemB3wsR8qUzGMeoIGYnNg2vK0NCy6a
 w03j0/W1z6yevKlKEY6Vycdxs67Im6WVULtKizWfg2GLa74zvLSd4Bi89XFTD9lD+ALq7lJzKEs
 vKodFtgXF5NeKtg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740739948; x=1741344748; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s0EtD6VuoMKDo3U6BNSSjyhnxmeprj8ROJTMAdM9mqQ=;
 b=f/tJr5Y8pRfWC6oFM2tlKLikvXRnTwpS61Lfwalu1CX77NI7dhSvCnHy7KCpgDtrE0
 fEW5sXhD6nVWWXCW4FqlCJzPhe7KBaAAftY3nS/LsosfTI3SPsw0gq5v2PT95TH4XDF0
 0IcDi8AGhyWVeg0Xi4U818cecIF0YXhMZfkTR8QDvW1PgJriwMxq9/2V16gnQzkUipoA
 v/SDEl3278qK3TsNNtTNReyojs6YR9HCFzHI19yAO3xmv0eDhUDhao9wlKFTuSTS539M
 lr455H+ZWHkLULSUt+V5f3QaS/Zyf5KWxSaXQDkt0BsYHECFL0CBZCoOT03Tjbw96wqs
 zuOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f/tJr5Y8
Subject: [Buildroot] [PATCH] configs/stm32mp135f-dk: switch toolchain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As Arnout stated[1], defconfigs should use a Bootlin toolchain (stable, glibc).

[1] https://lore.kernel.org/buildroot/e9576c4f-243b-4a89-a74d-3fee591100a8@mind.be/

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 configs/stm32mp135f_dk_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
index 387fe3a4143235dfca12a97d1ccbd7e34e4fe149..59c09e8ecd10c14c48338038fbd9263a78442488 100644
--- a/configs/stm32mp135f_dk_defconfig
+++ b/configs/stm32mp135f_dk_defconfig
@@ -1,6 +1,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/common/stm32mp1xx/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y

---
base-commit: 5a1515b5976aed8f1b15eacf513d40ab70b908a8
change-id: 20250226-master-73b329bef4b1

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
