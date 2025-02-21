Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE507C021B3
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 22:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FB6881492;
	Fri, 21 Feb 2025 22:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j889pdwUj2ML; Fri, 21 Feb 2025 22:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8719881E2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8719881E2B;
	Fri, 21 Feb 2025 22:55:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A108194
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F02EB40BEF
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOYt6c0Bq6zD for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 22:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68C1D40BD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68C1D40BD0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68C1D40BD0
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4398738217aso22821365e9.3
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740178535; x=1740783335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uEdYgDHDidPm5veTgIBHGpjH98MO/6e0zPIEaTjbJdw=;
 b=FaMt3Lk2ttUtcVrJ64psAex7264CgDCk4KNFVo7yd20YavQJJwRWSSkW0+CuzOpSsZ
 96j+Fnf8ewqKHN35K/IQvP1sYzk3bwqfYT4XdFzqVjc67EOVwqcd/egnPewCwWNZ2zfd
 Vbj0tl2iMw9Ci6QQMTwhPtmMOGbYToCPzP/7LjCrY4SUS2f+8ydyIQvhn632VpLTBhWK
 edMJQ1ThJUKb/AQmlZbQBtlCME58Kbfg+pB3Y6joAoYVa/mvD6D6fUnEqduSE5t3Of0S
 B5TuYXb5PBX2yVHInlmLSeRX2HYsU5onXehoNDESzavptRKshbtdAzie9H3IRWbsvmWr
 0K9g==
X-Gm-Message-State: AOJu0YwjNVad0x2iCvFxbrFSCxoWBycjjrJnHyHbpubRkbBjcG6h1W35
 FgsIYPmSfoJT7K/urQKloKLj/NpZcOCliMa81wI4g6LvcNId6O5CjZYiqj3zcisg4XafTJfOSgn
 C
X-Gm-Gg: ASbGnctMUhhFOJX0aQ7ojV4CJ7qLXRLoF8ox6sWSn9LQr6OgQ4RHfmDUNSunzLeZ/0J
 s76/ca0cKHO2rZKT/aTTeTsqZOccKa5CMco24nqLO3F7J8rUXBgz+oly52B1SAyEEkeaB/1NRZp
 DI56v4rkpdOwVIU/PUQL9zvkFpyjbaP1uVBl/l+dMNDPzRspE6ERmKTgQMx07ujn4lE2vIa3IGF
 vlHL3EkH/lW9ltetv0Z2vfcD/xFDwFIDtaTry2YCBkCmuXZ8RXtv/I2qzyHTJoW3QudDT79ALEq
 r3CiuXUPi0B6dfYNkjNpb40fOGqUIVIdTQ95+V4ea5N6dRVkxvhZdgFuK688jBWvbYhOLgHAi7n
 hI+u8CkNnd7fWIbttz3BTVmQ=
X-Google-Smtp-Source: AGHT+IFsC+u2DyJti9XD4DYvwUba9blVMaxplBiAmCTgqiKFpU6nGKqimlmVvNsWbOjn+Jx5wnot8w==
X-Received: by 2002:a05:600c:3ba8:b0:439:60bc:71e5 with SMTP id
 5b1f17b1804b1-439ae220e15mr40229055e9.26.1740178534763; 
 Fri, 21 Feb 2025 14:55:34 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8602sm25218585f8f.94.2025.02.21.14.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 14:55:34 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Niklas Cassel <niklas.cassel@wdc.com>
Date: Fri, 21 Feb 2025 23:55:28 +0100
Message-ID: <20250221225529.441084-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221225529.441084-1-romain.naour@smile.fr>
References: <20250221225529.441084-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740178535; x=1740783335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uEdYgDHDidPm5veTgIBHGpjH98MO/6e0zPIEaTjbJdw=;
 b=Y5NbpXKXqqNoMEJyeB74rDjaP9em7Z254iUJaTyalvyRsqXESJzOSS7qGZ/ct4ZPFZ
 pYXpRaSvF+WEMSShdUOlB2jxrR7WjHnRInJ3AtufrGNZn3wa9asffJ0eIxKSFmuOAwOQ
 4LheQdYJz9sjhC3zgEgYKtjSiqtIgZFVBvLug=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Y5NbpXKX
Subject: [Buildroot] [PATCH v6 4/5] configs/acmesystems_acqua_a5_*: switch
 to BR2_LINUX_KERNEL_CUSTOM_DTS_DIR
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

Before updating the kernel to 6.12 version, use the newly introduced
BR2_LINUX_KERNEL_CUSTOM_DTS_DIR option to provide the Out-of-tree
Device Tree Source file with its vendor subdirectory that is needed
since kernel 6.12 [1].

Revert the sama5d31.dtsi include path update added by the previous
kernel version bump 6.6.12 [2].

As noticed by Michael Walle, newer OOT device trees should use the
same #include directives as the in-tree device trees to ease
sharing the files between u-boot, linux and OOT external trees [3].

[1] https://lists.buildroot.org/pipermail/buildroot/2024-October/765463.html
[2] 8fb5209885 ("configs/acmesystems_acqua_a5_*: bump to Linux 6.6.12")
[3] https://lore.kernel.org/buildroot/D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org/

Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v6: switch to BR2_LINUX_KERNEL_CUSTOM_DTS_DIR in a separate patch (Niklas Cassel)
---
 .../acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts         | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig                    | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig                    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename board/acmesystems/acqua-a5/{ => dts/microchip}/at91-sama5d3_acqua.dts (99%)

diff --git a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
similarity index 99%
rename from board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
rename to board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
index 411d1942f5..60be8a67cd 100644
--- a/board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts
+++ b/board/acmesystems/acqua-a5/dts/microchip/at91-sama5d3_acqua.dts
@@ -9,7 +9,7 @@
  * Licensed under GPLv2 or later.
  */
 /dts-v1/;
-#include "microchip/sama5d31.dtsi"
+#include "sama5d31.dtsi"
 
 / {
 	model = "Acme Systems Acqua SOM";
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index b102dde0ba..d21ff97216 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index da54eaf620..d83a058537 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -13,7 +13,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts"
+BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
