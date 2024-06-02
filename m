Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06049C25B7E
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 07:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79DBA405F6;
	Sun,  2 Jun 2024 07:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-5QLFE-bqQr; Sun,  2 Jun 2024 07:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F0E41D7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F0E41D7E;
	Sun,  2 Jun 2024 07:06:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE0201BF3DB
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 07:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D59BA84509
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 07:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQUESlQ0I-MA for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 07:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DEA183B68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DEA183B68
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DEA183B68
 for <buildroot@busybox.net>; Sun,  2 Jun 2024 07:06:38 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e73359b979so28971911fa.1
 for <buildroot@busybox.net>; Sun, 02 Jun 2024 00:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717311996; x=1717916796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=waKU8vTcQH1m/B7/KEMjcXbuZx8lu354CvnTHsgEPlg=;
 b=DQl3Dx5ra//wUshXRa3ym5KwnzIvaGpFkz7OXPIZ3++8pEeMjnlOPBN34MyBvb13qF
 STFbKoqqSq1gd38QAniTrBuAQWebCPUL/v8dXNVDvEJrBCQakbQpTzUTWlMpG41G3gLq
 U1rmkBBxB1+A3Q5xIydEONw0+5ilrgX+kE/rufBQnaBuTQG/sb1Ouvtml+t4J7iPM1cO
 Rzvzaq8lqXgtqJ/S2n4ZvadmsXRpTMrBmHc3yD0dGo4wfrEBGa73aAuBovYtNXUkUxew
 YW0AWHrlfCKhKCz04dPKL+vPi0wmkzRrjiePlDU+kY3ibeIUdL16eaj7hXBwP5js4UQU
 Ip5A==
X-Gm-Message-State: AOJu0YxiFA51FGRXqcROko/g0bg91aW0O/Hrpwfci9ICDOO2aBD4gFS3
 YnNpNSLRbujmdiZ0QO0IU0Iu/G8q2JNoS5zZJ1sQefDaFnsr3J9nVYyyTy1+Q8FXRQRFm0MoHrM
 mDw==
X-Google-Smtp-Source: AGHT+IF+cTgfdQk5Aw3lrlGD3zkbE1qBvfy+bfrPW0yhb/3/mjOlPo2pOxtmFYWQgLgULRivpR5yQg==
X-Received: by 2002:a2e:b615:0:b0:2d4:3e82:117e with SMTP id
 38308e7fff4ca-2ea951acc2amr36575861fa.32.1717311996307; 
 Sun, 02 Jun 2024 00:06:36 -0700 (PDT)
Received: from vm-2404.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c0f7esm5454215f8f.22.2024.06.02.00.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 00:06:35 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  2 Jun 2024 09:06:33 +0200
Message-ID: <20240602070634.597337-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717311996; x=1717916796; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=waKU8vTcQH1m/B7/KEMjcXbuZx8lu354CvnTHsgEPlg=;
 b=b4O6p/fceS5X3STIvOrsjfHsyCruaBdvM6kL9Svk2dO1y7utK8ST+aOTOaAoQwzGZX
 LFCPcj6mo3mfQtvabEPrs8PU926uvGiq/VsnnfRs2IRPajVylZRYcmQkPmGbh4r7u7Zz
 4BghYik6Z5PDYZL8GuZ3dOEGQxxrhuoHX/erI4eWKWxTpYqJNL2igJP2WPJFbAsaVKsn
 Po251w/Tf8J+qdQlOvYbBnVdvocTHilc3lUQ32wFTYBETlch8BgE+MQprwg45TMPT0R0
 Vs47egVDpUA3BKMR3UYO0wcGWjWqJSeZy4rOfzOpEeW27Qx+5DFhywtO/+oIdY2hRanI
 jFTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=b4O6p/fc
Subject: [Buildroot] [PATCH] configs/olimex_stmp157_olinuxino_lime: add
 hashes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .checkpackageignore                                           | 1 -
 .../stmp1_olinuxino/patches/linux-headers/linux-headers.hash  | 1 +
 board/olimex/stmp1_olinuxino/patches/linux/linux.hash         | 2 ++
 board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash         | 2 ++
 configs/olimex_stmp157_olinuxino_lime_defconfig               | 4 ++++
 5 files changed, 9 insertions(+), 1 deletion(-)
 create mode 120000 board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
 create mode 100644 board/olimex/stmp1_olinuxino/patches/linux/linux.hash
 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f5fc0a47..201ec2a85 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -253,7 +253,6 @@ configs/olimex_a20_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
-configs/olimex_stmp157_olinuxino_lime_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000..5808d92af
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
new file mode 100644
index 000000000..8691d5ffd
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93  linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
new file mode 100644
index 000000000..a991a1922
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  6aaa18a9023db29ceaad5bca240605990b68a6bf348aaefad0bee8be8d37648e  uboot-efadf793a0a5924e2c96362dc1df3e56622ebb97-git4.tar.gz
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index 8bd8e10ca..ecfa78135 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -5,6 +5,10 @@ BR2_cortex_a7=y
 # Linux headers same as kernel, a 5.10 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/olimex/stmp1_olinuxino/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System configuration
 BR2_TARGET_GENERIC_HOSTNAME="stmp1-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
