Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993BAD5CCAF
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 14:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BF1860590;
	Wed, 30 Oct 2024 14:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuqzKVmllLld; Wed, 30 Oct 2024 14:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B41C608A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B41C608A8;
	Wed, 30 Oct 2024 14:18:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C00A1494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A130540583
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QE5v0nRyNVc for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 14:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=jean-christophe.bauduin@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A81B8404EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A81B8404EB
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A81B8404EB
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 14:18:16 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9a1be34cc9so73937466b.1
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 07:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730297894; x=1730902694;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PIVIor45gu+q32rvi6H+z+3MB2CPQz3xqPQrh0nWc2c=;
 b=deqU/ax++IIa0sRdGzYMnD5cVzQGEdq6aZV2oohs0uiIPko/nHx4zEZrlQwNh6lPPr
 I2pYeYHZI2eFi2KATjS3f600y2NTbra0W2BlcblZI6tzTOfsiadiE2uqD+KqgYxs2kB8
 W6YLlfArmJWViaLCeRn4Z9BpnTszWNYZKA/Db0t0JjBUhJHUxRNo/FrePtd6pvjWMp1J
 CFdIPxjQVSyaZ7Cah9QurjsRmWOSz3JmK3HQ1V7TFdfFo7g8gOOPR+7wcb9r3eoL6N4w
 bfw+4Gs0aBeUjLKYpuKiCOIcWJYIN3CmW7Kqk/Loc6AhfnVcTAJiOVxQ3uPJIcCQ1Hry
 2EDg==
X-Gm-Message-State: AOJu0YyoIaPi5adIGgddoR6IRg45tgvdCZkFI7dTCaOawkxsXMMgIva8
 pmSdru5Q0iqJaDScSVuejsRUA3w0wZmI+qjysioNIwPvUHeXogAw6J5DrlNLWHzgddIT2i0Sqwh
 rxBc=
X-Google-Smtp-Source: AGHT+IHICQDVWdFyQQO9mlKYr2Xm/EGR7r6OUAySK+IMYTtiPCiySlz858c0tE/JekCyMKt0p/YJWw==
X-Received: by 2002:a17:907:3f28:b0:a9a:4f6:756a with SMTP id
 a640c23a62f3a-a9de5a4e3a8mr576899466b.0.1730297894365; 
 Wed, 30 Oct 2024 07:18:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:61ce:9400:6b73:749e:6b4d:b3f6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b2fe2af87sm584535666b.143.2024.10.30.07.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 07:18:13 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
Date: Wed, 30 Oct 2024 15:18:11 +0100
Message-ID: <20241030141811.1372499-1-jean-christophe.bauduin@mind.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1730297894; x=1730902694; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PIVIor45gu+q32rvi6H+z+3MB2CPQz3xqPQrh0nWc2c=;
 b=SgUZd0FaeE4RtHUcsTkCedDufJnahSbfAvtE33Q0loV5ek3Qpgp+tWrhdaH31tirre
 +Ys1zqBHSpaC1z6ZUlE9NXgSZgEj/KIi8D6XJXngouu+wVjvufc2/HTtJOXP4X54RPg1
 40dth4LQCQT4z+vFR/A5Oq1K8W1pUGffPesY/a+iaxp4AF3UDTir0xQCVMULGz9XKho4
 7PoKrvVSKADSKpW24fLfsL4ILR8XRFTaInrem1K9SfTB9u8iaeAmTO2pdmOtLDTiMteY
 z0FZkqZwU/KWYoXG7LSwkkG1U1sJUwAlUp3ekkToCsaXID8WW/OEe3dNvX6eqiymIBRs
 6gNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SgUZd0Fa
Subject: [Buildroot] [PATCH 1/1] board/imx7d-sdb: bump linux to 6.6.58 and
 uboot to 2024.10
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
From: Jean-Christophe Bauduin via buildroot <buildroot@buildroot.org>
Reply-To: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump the linux version from 6.6.21 to 6.6.58 and uboot from 2021.07 to 2024.10
Signed-off-by: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
---
 configs/imx7d-sdb_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index 541a689ddc..62f825bcbe 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -7,7 +7,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx7dsdb/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
@@ -18,8 +18,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
\ No newline at end of file
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
