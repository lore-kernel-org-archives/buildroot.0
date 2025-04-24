Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE107C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 07:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 644BC40C61;
	Thu, 24 Apr 2025 07:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUhuYNDYkRm2; Thu, 24 Apr 2025 07:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E8640C64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90E8640C64;
	Thu, 24 Apr 2025 07:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D4E419F
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 07:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 123F581FB6
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 07:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xktc3PBPDKdY for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 07:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D96A38201B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D96A38201B
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D96A38201B
 for <buildroot@busybox.net>; Thu, 24 Apr 2025 07:38:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso4004745e9.0
 for <buildroot@busybox.net>; Thu, 24 Apr 2025 00:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745480298; x=1746085098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/CyxBdGid+Uj6i26+UpPPYcc/HE41InCnlkPvq2feBI=;
 b=AFHMpmblfmdgWj76r55BYSENfaN3BQH6sXu6xIKqrpkCVoZp1JoqzrUt3OvF2BiZEE
 +iJ8RTZ3YLhp44C+qB8sOg1yK7MSPcZsn3VNekjLgnod0P+/khhjKEF2MZq2TCQZvJAl
 pbUOu5rCOKDMamewYc3HNx5Qk6ERrVYIQ/IpcS+e2QhHo/3Qtng95uPEyEqgvh4mwdL7
 KETBwqKd8bhtip38dDsTBVPGQHn7ZoEhklE8fdJTE35CMqbA9LVCiW8/DOVWRuGa3bZH
 GspGSemNOL+8O8DyanYsT7XFcs4fCMZ1ZJoljxmjqt6ISQyeRPiZ/qHGamNq0KxgD+sf
 n25w==
X-Gm-Message-State: AOJu0YyyRnIteIy9YHJTwi6paozmFoWSagAfox3BWcHs+rk+GhhIwrdv
 dMxUbVY6EJzdGnMdkTry8VNvD4nnHENg2rR8Gqun9msaFk17KNloLwB8PoWHlQJLSslaGYFipxY
 rag==
X-Gm-Gg: ASbGncu1wbeStPr7T1S3hXS8l3poFgksHSLZeEesn0Qm1zuV5vLAdsK6/DOCaTJ4X/F
 HOlYfyMaAFlQ0xg8e8GAJvG5vQ1CDtHRlreXjRhQWRxl1aZaTN8j00GmJHLV7biWZSUQkNrtI58
 /YwHOhLvLvRKGGmUxIujmBJgvZarYrixVE0CEBVGlyhhLnN51q80rSRx/2ODC9lFPpQx8Cs6ncF
 osXF8uhPsQhUZb+aadUnUM0DMzqxyshlH9AyoHmG/1n/BUrP4pC5n/HutEKd631qa18F8hc2Re8
 IDU7Q0m41E8tVz0czUwddRdI8s8wtde3YLHnIvPv562ft606GG6OS5z/1PBdx/clmIVUp5JhD7v
 nKw==
X-Google-Smtp-Source: AGHT+IFOwyiyC/Jye4a9b9b1mQZG9V+ykvMoFScHSjS077lR7LTAWuL9DboST1VTr4LMKWR6D/luKw==
X-Received: by 2002:a05:600c:3d14:b0:43e:afca:808f with SMTP id
 5b1f17b1804b1-4409bd909famr15500845e9.31.1745480297603; 
 Thu, 24 Apr 2025 00:38:17 -0700 (PDT)
Received: from vm-2404.. (151.187.66.37.rev.sfr.net. [37.66.187.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a2e43sm9509335e9.10.2025.04.24.00.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 00:38:17 -0700 (PDT)
To: buildroot@busybox.net
Date: Thu, 24 Apr 2025 09:38:13 +0200
Message-ID: <20250424073814.1880903-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1745480298; x=1746085098; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/CyxBdGid+Uj6i26+UpPPYcc/HE41InCnlkPvq2feBI=;
 b=PF87khLAowYosDW2Lt56mCEubsmRm8/f9aANbHju07u/KU+5lz+ifBSTtOCi5o8C87
 fo4RlPOtUUT1HsqdhojOxz4XXWKugqzVf6QU1C+I/ROHpSSF1vnn+Ki7mXY37Vez7ZeC
 rWFOGcAmEaOAtmrKb2sPmpbgvaqOc32xtdkfvlm98p7Zfohu+2EOvxxhnsW6tEqPXzhG
 lPu8KSGhChbhtaZL2sTSMf2VeWZYVvdUHwjfKaLCOCti8vPdqqRcz57ERbzWm0lmvAH7
 sS+h2a6K8IupKoRIqFtfn2aGrgSsg3CCZnLmo4G8xLGkKSas6zillDJlrk3fYdwy5XIH
 rIhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=PF87khLA
Subject: [Buildroot] [PATCH 1/2] configs/olimex_stmp157: bump Linux and
 U-Boot
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/stmp1_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_stmp157_olinuxino_lime_defconfig       | 6 ++++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
index 8691d5ffd..48b74dae9 100644
--- a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93  linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz
+sha256  58c00229e95817918f9310f5c9adb0e3d1cfa7f28377aa7292431a110b6111a9  linux-e9b70672e21c96c02d9a731a9379baa897ea2ac7-git4.tar.gz
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
index a991a1922..153acf382 100644
--- a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  6aaa18a9023db29ceaad5bca240605990b68a6bf348aaefad0bee8be8d37648e  uboot-efadf793a0a5924e2c96362dc1df3e56622ebb97-git4.tar.gz
+sha256  1b99d3fd4fc778562c011de42193f9c29b3f2d0d7717ba22ac0c412446186382  uboot-23d8f769a94ae230b7a68fa812cc3c4dc0cbf1c9-git4.tar.gz
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
index b1f9b7645..efd267fcb 100644
--- a/configs/olimex_stmp157_olinuxino_lime_defconfig
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -12,7 +12,8 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/OLIMEX/linux-olimex.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="fc74113e14d76aea9482264ff42e07397b94553d"
+# branch release-20231222-v5.10.180
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="e9b70672e21c96c02d9a731a9379baa897ea2ac7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -25,7 +26,8 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/OLIMEX/u-boot-olinuxino.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="efadf793a0a5924e2c96362dc1df3e56622ebb97"
+# branch release-20250305, based on 2021.04
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="23d8f769a94ae230b7a68fa812cc3c4dc0cbf1c9"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="STM32-OLinuXino-LIME"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
