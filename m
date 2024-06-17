Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B54C27C79
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 20:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23A6460AF0;
	Mon, 17 Jun 2024 20:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqBTPSjXLkTE; Mon, 17 Jun 2024 20:12:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B28B60A9D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B28B60A9D;
	Mon, 17 Jun 2024 20:12:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF3E1BF290
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 20:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 093BF414BE
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 20:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKfQY5nbIG9H for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 20:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=francois.dugast.foss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC341409D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC341409D8
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC341409D8
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 20:12:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3608545debbso2448089f8f.1
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 13:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718655166; x=1719259966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0iNx1dqPJa5/Q6ORCz71jp5DB2m7670RrzX2fH39cg=;
 b=UkNnpWGgL1pwEg6sJfoOOKEREEKRP/58dxSKyEF5MJXjzTWDMQsL1dJXIcpAM8kV/4
 ecMDl0ygGLAkJG32Sm+dEqO/Ht2s7wgRlbbDYTbIaM7dLIM47q7hCdZ7NqXh8jCdfGa/
 Uc5sI6hc3JPF+Z+E+vUMHpHLrCXsWrJPp97Di/X4H+ZzTq/3dW5PHZOJeocaTzoQjT18
 nto9NgG5MWOyMCyB9Drl7z0gahMOfiywD07h0i8MXJyJ4PzOsPXlNBx/GRWZfsOYtJ+T
 RtrasuT8t5dpmR7+47Q1hA80HGTbwBYyVs9CrRsRtU6w69srdhKOyQtXVynrajHzRwUb
 IUiw==
X-Gm-Message-State: AOJu0YyaR3eQ5jCr8s5ygUYcLzNeM+Xjt2UxHbaBvpMF7Yd4UNhcc31g
 7gjSDwFNUKMGOFKraGp7xS7X3eu0BIbClcTznVBNJ2pTnk6tFISS79fQyQ==
X-Google-Smtp-Source: AGHT+IEavoY67MTO7AceNrF1oISM5QO9OFyRRDEfPCXeqCC9CKlk3YRCe6rYsgb5WRWUO9MfXh9Wzw==
X-Received: by 2002:adf:f892:0:b0:360:71a5:da1e with SMTP id
 ffacd0b85a97d-3607a738fcamr7851747f8f.16.1718655165446; 
 Mon, 17 Jun 2024 13:12:45 -0700 (PDT)
Received: from comet.lan (lfbn-ren-1-1629-205.w86-253.abo.wanadoo.fr.
 [86.253.181.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750f23cdsm12636048f8f.77.2024.06.17.13.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 13:12:45 -0700 (PDT)
From: Francois Dugast <francois.dugast.foss@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 22:12:31 +0200
Message-Id: <20240617201232.1804524-2-francois.dugast.foss@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240617201232.1804524-1-francois.dugast.foss@gmail.com>
References: <20240617201232.1804524-1-francois.dugast.foss@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718655166; x=1719259966; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0iNx1dqPJa5/Q6ORCz71jp5DB2m7670RrzX2fH39cg=;
 b=Gi7h0DrTOOYeaeDeIcBOEP5lpFQpvYv6Ud+vTN4Cs2xTCn1UKWaJT8myPzGYPYCZ5y
 vDfPULwWkTFWpQ9ts3tJhvG/dNPJbOeSZvDVevvXpwIHRV3uMv3NBqcxYJwKA+sHK705
 BJzO2H+E1pM+yK/SHk7ld/PMUqyr5YHvYaTx9CGZ6XYQLm0fmjFESEmI3lvAwx0/NwK/
 uS9GTHmOeH1l3OD7CUzFhGhu01VFLUZZ7fxDxhXHXonmE92HVxowm3T7U6Yat+eZsvJk
 +XnyQ6dXEETn5nr9psH5+xWsO8tcNdGNFSmNGTJ0F2EnFO1RC9gAPtVnXIAB49lB/wxB
 EjdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gi7h0DrT
Subject: [Buildroot] [PATCH 2/3] configs/hifive_unleashed: add hashes
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Francois Dugast <francois.dugast.foss@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add the hashes required to build with BR2_DOWNLOAD_FORCE_CHECK_HASHES
and remove the defconfig from .checkpackageignore.

Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>
---
 .checkpackageignore                                             | 1 -
 .../hifive-unleashed/patches/linux-headers/linux-headers.hash   | 2 ++
 board/sifive/hifive-unleashed/patches/linux/linux.hash          | 2 ++
 board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash      | 2 ++
 board/sifive/hifive-unleashed/patches/uboot/uboot.hash          | 2 ++
 configs/hifive_unleashed_defconfig                              | 2 ++
 6 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100644 board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
 create mode 100644 board/sifive/hifive-unleashed/patches/linux/linux.hash
 create mode 100644 board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash
 create mode 100644 board/sifive/hifive-unleashed/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 9264f84a15..cf03c36b04 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -188,7 +188,6 @@ configs/galileo_defconfig lib_defconfig.ForceCheckHash
 configs/globalscale_espressobin_defconfig lib_defconfig.ForceCheckHash
 configs/grinn_chiliboard_defconfig lib_defconfig.ForceCheckHash
 configs/grinn_liteboard_defconfig lib_defconfig.ForceCheckHash
-configs/hifive_unleashed_defconfig lib_defconfig.ForceCheckHash
 configs/icnova-a20-adb4006_defconfig lib_defconfig.ForceCheckHash
 configs/imx23evk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6-sabreauto_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash b/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..d43806bd74
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	29723df01d40ff07ff6d254eaaf90c7b3ec3c70f4ebe089b80f785f46efaf597  linux-5.10.190.tar.xz
diff --git a/board/sifive/hifive-unleashed/patches/linux/linux.hash b/board/sifive/hifive-unleashed/patches/linux/linux.hash
new file mode 100644
index 0000000000..d43806bd74
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	29723df01d40ff07ff6d254eaaf90c7b3ec3c70f4ebe089b80f785f46efaf597  linux-5.10.190.tar.xz
diff --git a/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash b/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash
new file mode 100644
index 0000000000..c0fc3f683c
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/opensbi/opensbi.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
diff --git a/board/sifive/hifive-unleashed/patches/uboot/uboot.hash b/board/sifive/hifive-unleashed/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..57451c7afe
--- /dev/null
+++ b/board/sifive/hifive-unleashed/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index dabd1aefd4..50d56609dc 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -13,6 +13,8 @@ BR2_RISCV_ABI_LP64D=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttySIF0"
+BR2_GLOBAL_PATCH_DIR="board/sifive/hifive-unleashed/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/sifive/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/sifive/common/genimage_sdcard.cfg"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
