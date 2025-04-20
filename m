Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6320C369C2
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 13:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE861811AA;
	Sun, 20 Apr 2025 13:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKpP4RngkGr4; Sun, 20 Apr 2025 13:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5B028119B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B028119B;
	Sun, 20 Apr 2025 13:19:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3FE31C0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 13:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A3DB81199
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 13:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_c3erVF4ist for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 13:19:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9768581195
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9768581195
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9768581195
 for <buildroot@busybox.net>; Sun, 20 Apr 2025 13:19:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso21676675e9.1
 for <buildroot@busybox.net>; Sun, 20 Apr 2025 06:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745155161; x=1745759961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/CyxBdGid+Uj6i26+UpPPYcc/HE41InCnlkPvq2feBI=;
 b=IRitWVWE3NYxU8aURhgFuKZhO2/kTw7K/S5jreHuxLic374Ctkeu3fWfwJNwdGscPt
 bcgPd2yrwBGYfTajnlcQ2KcA/MDzbYaM8TWI3KP5cYVEOH4lssHuFUAaYRBhpiXDVV3r
 aI7hmlTC/6OCTUtEQzUlFYI+yssn2qM4+jtNjMcR7A5HH9G26IoTE+02rIFArCVkRZDh
 GSaSAQFqAH8DIFe+AIi4Bv0in1GvYc3iyQlZyeFdfQ2oE6k6gnJOJ09k+X2BIslXHzvs
 2ZJtMAdW62AZXjOnYltYsfhWKlmHbmyZs30mSifzU+0hEE12cIeoEmRUKSdBaq9QH2xh
 Hc4A==
X-Gm-Message-State: AOJu0YyuFEd5nZrZiOeckkrcpFF/994/0uHT5da4CGgF9hhPZACKmI/c
 PI+kodLLMRViSPaDJ/SEFauvsZKQk5KaOi9z2mx9opIlXXXDxWxMGA+vw0Y3IvK/+Hs8YAMbQAH
 E3A==
X-Gm-Gg: ASbGncv9lafM8dtBOkNueoJkxfwFRcSzlX4CpAoryK1zp6s7yEEEAcoGWrfRuZXFLnH
 gkowz0lD/A/swcu5LWLa2IZUzA3mzYxr8nQpW5amG89aDiR8O6/EUwnGboCnwEuglZJgBaokNk7
 0Xnjy8+AWfN4HC1LL7yNM+sWMdO67fKQ9RfQb7xOovoE8IPSBZ+z26ckkpma+794aJUjR4AFOmi
 2Qbqtwvli7uco2Cdo5ZIkXnV0qpErTcFQhx0x8d+Ap5YuWtIc/WB8idgV3SmhW4z1AWhCr7Gr2e
 12jtJsh7dMLzWu3fsFUse5YLmJr9XmiuYGnxtZC8S+pAfGbWuwNch5IPfcYSZa/kgb1Zg8VCE7I
 0CQ==
X-Google-Smtp-Source: AGHT+IEC5cTcAD8oomLs2greXieED2pPtRMO4EZGYuzYQjfmCjzQyt/oKseL/h23LX2+uFFt6bTtzQ==
X-Received: by 2002:a05:600c:a405:b0:439:91dd:cf9c with SMTP id
 5b1f17b1804b1-4407163e193mr66069955e9.10.1745155161312; 
 Sun, 20 Apr 2025 06:19:21 -0700 (PDT)
Received: from vm-2404.. (151.187.66.37.rev.sfr.net. [37.66.187.151])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acca9sm98055025e9.12.2025.04.20.06.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Apr 2025 06:19:20 -0700 (PDT)
To: buildroot@busybox.net
Date: Sun, 20 Apr 2025 15:19:13 +0200
Message-ID: <20250420131914.912196-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1745155161; x=1745759961; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/CyxBdGid+Uj6i26+UpPPYcc/HE41InCnlkPvq2feBI=;
 b=p7WqpYSiXGUFUgpEQfeIK/6+IIpvy0aOYKqPaSkypyptnmfeUP9QzqSO6czFGGmQqV
 moM5qCkS77u0hBFk9PCR221uWXhANI0lVvBymIKYIPbzf5ye4X1NkPUV2Q2sPVxBwX8i
 SmzR/HdxglhYXXcyHPBygCqU+uGDzFMzkg3nlcih1tTqlDk6Zf02e8Ujp4kWdCCYkWng
 0KXiJSJP0i43uC/ZHNutyYR7lP/l6Pw5rd0olLpo6gxDjMJLG1z9paQ6O5m5/SKCT5ZH
 drWIUG8ZerIGogO4OYu5KrgnTnwCWPXPvHWqLFgnR4buQq36620LvsOfC2SuyLVWBu0K
 dGqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=p7WqpYSi
Subject: [Buildroot] [PATCH] configs/olimex_stmp157: bump Linux and U-Boot
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
