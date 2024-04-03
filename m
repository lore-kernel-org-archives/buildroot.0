Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB58CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD39A4194F;
	Wed,  3 Apr 2024 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hQMXyHyRAJ7; Wed,  3 Apr 2024 19:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BEB4418F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BEB4418F0;
	Wed,  3 Apr 2024 19:55:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1581A1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8E39418BA
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flbKUKUTtTAo for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0FFE417FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0FFE417FF
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0FFE417FF
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:54:18 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d718ee7344so2587221fa.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 12:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174057; x=1712778857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=egKshs99vfZZv+3k7rCSHxAcdYUCTFc7eB2x+SqhUJU=;
 b=whMiAVKls91Fkd2NEf7oY5/xw1h4LCpHAwk8HTCnT55CdMef4B8yzywdmzEXxhb5B7
 qAp2X/8neO1G+MG6b/SzHDihpti3CGjU26MIekZcTxJzGt0thTl4Ixtq64beDyo7oNUp
 cZwqnr5DvhMaacJQga0KrqSwkzVTlC2ZnJlSfJ8fR4ZtpIOnfVJucs7+r3PJNDfTtRpg
 YBEcnmU7qVU0ji/goQlJDNkVh0O9+iNykujATY0jfzouY9ITVu28PkKOeevIlB7E/3hp
 6xhWKv0wLEFk9EmZNbitFyC//9h2EH0eKY4p+V5LrF6NQB3dSC88dh8yeSDfW98wuah7
 YcKA==
X-Gm-Message-State: AOJu0YxxDWTT1/Mt3sYuGF8flmV942y/nBDDGBA318zlWifwgj6ofEGG
 56eR2eNKzsCWyvxMgpIB5Yba9X9NKs405YlazsIxd6bEysmLa4mtM+aagdLvgkea4o+XcAAPDEK
 /
X-Google-Smtp-Source: AGHT+IHAImWQv5isWHEmd8UthNRROAPPGMOFNCl43liHn2eOOBcVFUFsQzNaUt2rDQzpFeD0oanGAw==
X-Received: by 2002:a05:651c:1050:b0:2d7:a1c8:71bd with SMTP id
 x16-20020a05651c105000b002d7a1c871bdmr552362ljm.0.1712174056678; 
 Wed, 03 Apr 2024 12:54:16 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm15595571wrb.87.2024.04.03.12.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 12:54:16 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 21:53:51 +0200
Message-ID: <20240403195403.1359007-18-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403195403.1359007-1-romain.naour@smile.fr>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712174057; x=1712778857;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=egKshs99vfZZv+3k7rCSHxAcdYUCTFc7eB2x+SqhUJU=;
 b=hFj5SkTi1o1dzUMT2QCzgO06/2ttJPHrUTW5k8JSs3WIDEVlNVOGmupyMG4VvukaqL
 1bkJ8mLV0WauVnfaGavS/UaFmGIhlMQtfurWrs6CHCHpGmNyq+wGUF6CMdEdc3RmPr5+
 OP/FfW+4rcfwfMvqgTZ/NfiRpyeCaCFje9WCxGoTjoFPB/uR1JwXiA2nn+HOGmeqtwRP
 o4dzk8VyBOfE7W2qDg50UN1WPL4QfyABGl5QNWhcr6jMnfs5OWWt8XhE2kDvC/deATeX
 jnDVhXQNP1blH7VfGvpkASPKYIg0KHkp6N+WBkW3KfyXdW6ZqniorDTLDuwlH3TveM3P
 l1bg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=hFj5SkTi
Subject: [Buildroot] [PATCH v11 17/17] package/ti-k3: switch
 AM62x/AM62Ax/AM64x to HS-FS by default
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

For such existing GP device based AM62x (and AM64x) boards we have
to switch back to BR2_PACKAGE_TI_K3_SECTYPE_GP.

[1] https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1210443/faq-am625-generating-sitara-am62x-am62ax-am64x-gp-device-bootable-mmc-sd-card-images-using-sdk-v8-6-and-yocto
[2] http://lists.busybox.net/pipermail/buildroot/2024-February/685821.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/ti_am62x_sk_defconfig | 1 +
 configs/ti_am64x_sk_defconfig | 1 +
 package/ti-k3/Config.in       | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index a31a712f32..b062947527 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -16,6 +16,7 @@ BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_PACKAGE_TI_K3=y
 BR2_PACKAGE_TI_K3_SOC_AM62X=y
+BR2_PACKAGE_TI_K3_SECTYPE_GP=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 0f13de302e..1024f3f7d7 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -16,6 +16,7 @@ BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=y
 BR2_PACKAGE_TI_K3=y
 BR2_PACKAGE_TI_K3_SOC_AM64X=y
+BR2_PACKAGE_TI_K3_SECTYPE_GP=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
index 1c48f1cb55..44f773eb8d 100644
--- a/package/ti-k3/Config.in
+++ b/package/ti-k3/Config.in
@@ -25,6 +25,10 @@ endchoice
 
 choice
 	prompt "Security type"
+	default BR2_PACKAGE_TI_K3_SECTYPE_HS_FS if BR2_PACKAGE_TI_K3_SOC_AM62AX
+	default BR2_PACKAGE_TI_K3_SECTYPE_HS_FS if BR2_PACKAGE_TI_K3_SOC_AM62X
+	default BR2_PACKAGE_TI_K3_SECTYPE_HS_FS if BR2_PACKAGE_TI_K3_SOC_AM64X
+	default BR2_PACKAGE_TI_K3_SECTYPE_GP
 	help
 	  The target SoC security type option.
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
