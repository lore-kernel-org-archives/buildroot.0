Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96D7C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A64AA41586;
	Tue, 13 Feb 2024 17:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BaynU72kUdee; Tue, 13 Feb 2024 17:29:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E36F641754
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E36F641754;
	Tue, 13 Feb 2024 17:29:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 40E0A1BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3AAF84010F
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Od6lpsPaG6OZ for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DAB13400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB13400D8
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB13400D8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so3781597f8f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845310; x=1708450110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zUawM8w5Dr/t0Dxy5Oqf8PnKzSKBwWlFiAWj5LL+8ME=;
 b=d95XPpFMU8fo7Cw9zhfEvY3icekTewgq2KeRae+ZeLAGTYvLQ9Ir05hmsfcDIq/ma3
 ya4i8ZQ0jH03ArmC5g8kS+qg8Y6BSMJw4iZptSu14YXghUwd7MyG/PaIuo5ZjC+2DZ17
 AW4CtXSDUFSFFgnxnuQRI3B9uX2QXg27EzUusbZXmm4HWYa9FsLjn+ZtvcvOeDjctu6Y
 Pi8h0z3Toc2KM8yVX7+l2w4Bpus9LRxGZe3ux1azUiVMPLhv5iSux99NVGGUQFChM/oG
 4ECoEdVtH3da3I/gQtoygGv6MVHMsgN3PTtVxHfqyRQnednWZkKWfcvaOJt8Ss5rPpze
 jIgA==
X-Gm-Message-State: AOJu0YwB8Ll8Tq77F4SpMdxrv4mlNxIjRlG2UWVVBqE/g1iDBQ6O1fBi
 1wEpNs/UfXDAF7Aqpen1kLiy2I1mz3htz32ZuNwQJD44XvcfRNfkge+E70WJV11oU84bd0K40Aa
 P
X-Google-Smtp-Source: AGHT+IHsM4kJ+nwUR0oeCCxfVn0PWTcen9HavCzDlR7c9kpUcjBZh32tJSPezHGX/cE4wjTS82argw==
X-Received: by 2002:adf:fe0c:0:b0:33a:f90c:97b8 with SMTP id
 n12-20020adffe0c000000b0033af90c97b8mr6874396wrr.19.1707845310012; 
 Tue, 13 Feb 2024 09:28:30 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:29 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:15 +0100
Message-ID: <20240213172817.2872849-20-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845310; x=1708450110;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUawM8w5Dr/t0Dxy5Oqf8PnKzSKBwWlFiAWj5LL+8ME=;
 b=YyFMLycYd6JoyDnZLAGWdS55zs9nRU/dJwgdptLBEDNHoGB1JUhoOnZgTIfQwFHdjf
 Ku84sQofb7IroBYWt37vPx0rsGhoHsSwM+211VYe8QJuI01DVkK80p5LmR5bh5DN7GsI
 UCj0FxS7+fq5XZAzkNIphnSzMqeGuOr0v/REYLbWi58W1crvFU31xlxSePuRs+tfM3wP
 oAX6BfwNUzGeuLPSbrxvxxhwAAImbwHqWpxSxgK9hjy06tIld0rUHiuYGAL9aPLvmcWk
 gJZdlQdDTg5/tFkHej1hpjwOQ3cRwCWZFVf8EqN1GQQASyyoVbIXwqUncJIv5nKPUsb6
 +koQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YyFMLycY
Subject: [Buildroot] [PATCH 19/21] configs/ti_am62x_sk_defconfig: update to
 uboot 2024.01 to use binman tool
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update u-boot for a53 and r5 core to 2024.01 and enable binman support
in order to remove BR2_TARGET_TI_K3_IMAGE_GEN.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/ti_am62x_sk_defconfig | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index c3ad555a81..f725734551 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -16,25 +16,29 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
-BR2_TARGET_TI_K3_IMAGE_GEN=y
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
+BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
