Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1F6CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39EFE41A2A;
	Sun,  7 Apr 2024 10:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BY_oVPecgRT; Sun,  7 Apr 2024 10:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB2941E69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB2941E69;
	Sun,  7 Apr 2024 10:36:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 316D91BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B4B0822AF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwSjv1w2gzud for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 03A05822A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A05822A9
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03A05822A9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:25 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4166ccac761so170175e9.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486124; x=1713090924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MUbKXNEbnHvi4KZWhbaZeZ1lmko+lLC7O0bhdngjzHI=;
 b=DpXyFH2IX8CbFPYQKiU9laGbleDojEQN0Cn6uyol6iomZbzSVyiG2QKplx6/BKwaJs
 FcWCnVMzhOExTiy8VAVDP2kzhtSngdETaKmESC029sRSXoUSQ+u4Xr5Wzl5fZa4Srvjy
 XYOxHyUZww6y/eJCrIuW9SYwzaXnkM4ZYJRkpg/SrKY6MLS/Plzo/DvVzs9CxDrhVzW0
 qDzVHqLYDournbYw5rz2yeBg1zI/uzMxpQxu3SWLta2ooOTS1lwqcyvjq2djvnasAE7j
 5iaGqF1vsNcRGKi/vh7yLR7315qdfD1d7Voz9vJlXBTSSJCiyCnc6m1f8ClOtt/Wy/YZ
 CeYQ==
X-Gm-Message-State: AOJu0Yw0l0Mq7FKNbPKR0YhKuJikjCFkp8NzqdRQGU+BcKo2j9EjTLz2
 DYzbaHgfoU78t8RwLxYRrDwFjGRlGD2KKrBSyGmW8E+k+nZ6bCJCDkwWx7+Flg/1pKDAr6stTWG
 f
X-Google-Smtp-Source: AGHT+IFA1UKA46Np1Ryp5pQLvlobusICV0MT6+ShvpwPRjBVBL/xdDbQ4IjQUltPcw8EReeX2DXE5A==
X-Received: by 2002:a05:600c:4f8f:b0:416:605b:584d with SMTP id
 n15-20020a05600c4f8f00b00416605b584dmr830575wmq.3.1712486124180; 
 Sun, 07 Apr 2024 03:35:24 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:24 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:35:09 +0200
Message-ID: <20240407103512.1112712-17-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486124; x=1713090924;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MUbKXNEbnHvi4KZWhbaZeZ1lmko+lLC7O0bhdngjzHI=;
 b=WWGNyNEsNIFG9uxpjBaduo+lGfekBt3QfspnawdwGxxSXtYLLIbzLVmn0o3w6SE1/F
 C2ZlLYZvjnknMxV0gjNa2jK3shzFKUz+obNslXkt74HZ/wYZs1sOpfvS9CyKjY3lshW9
 X42+ED6S0+ltvLujrJYAG7KWpJnF7iqf0xG1Wn3kCw+SxdM8BDbISC3yAlrjMBYdlNlF
 awurM/DAB7muuykVhBJMdqKd4wMziXbCenBAIcMvHmhB+vRuXQNgT1jOdbv+d3Eda60d
 Fw4DOcuvSzlrQc6UL1A4VUQ48UcLs9NJnmHUIiPGgnFUCMltWGqRnSaEKcC10Z4ae5iH
 g+Jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=WWGNyNEs
Subject: [Buildroot] [PATCH v12 16/16] package/ti-k3: switch ti_am6{2,
 4}x_sk_defconfig to HS-FS by default
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

From Andreas Dannenberg (TI K3 architect) [1]:

  "HS-FS should be the default for all TI AM6x devices. This is our
  "production silicon" and what's used for (almost) all projects,
  especially new projects. This being said having support for GP device
  variants still is desirable for existing boards/projects, such as the
  current BeaglePlay boards (amongst earlier version of TI starter kit
  EVMs for AM6x)."

See further details on e2e Forum [2]:

  "Unfortunately with this transition any existing GP device based AM62x
  (and AM64x) boards will no longer boot with MMC/SD card images generated"

For such existing GP device based AM62x (and AM64x) boards, users have
to provide the tiboot3.bin name using BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN.

[1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1210443/faq-am625-generating-sitara-am62x-am62ax-am64x-gp-device-bootable-mmc-sd-card-images-using-sdk-v8-6-and-yocto
[2] http://lists.busybox.net/pipermail/buildroot/2024-February/685821.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/ti_am62x_sk_defconfig | 1 -
 configs/ti_am64x_sk_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index fa2c008d4c..5c7b97b3b0 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -29,7 +29,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
-BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am62x-gp-evm.bin"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index f7c6d16b35..28e97f94e2 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -29,7 +29,6 @@ BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am64x_evm_r5"
-BR2_TARGET_TI_K3_R5_LOADER_TIBOOT3_BIN="tiboot3-am64x-gp-evm.bin"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
