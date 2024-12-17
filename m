Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724F0E7717F
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 13:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1843860680;
	Tue, 17 Dec 2024 13:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2ilvmmgq0E1; Tue, 17 Dec 2024 13:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3333F6079B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3333F6079B;
	Tue, 17 Dec 2024 13:00:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6EE7E3
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 13:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 886C180EF4
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 13:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRY78-FAPxj4 for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 13:00:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFB5880EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFB5880EC4
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFB5880EC4
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 13:00:36 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2166022c5caso41246935ad.2
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 05:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734440436; x=1735045236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NwwdIqAAGvN3dFxTgFgMok9ncGgVpQxOqzENMfV0HBk=;
 b=m5Tby1T3LrI7XsR4A7XT6Xd6S5ntbYZFDSImN798xwhr41GVVPZVE2Pt2NejWa7iGv
 mm7v8/2eLBdn0vj+RCnB6bV1qu0Pq4xRW6jbwiwt11St3MzQOk1MOEJ3IjI7w+QpAU8o
 YqHAbeJwyFtsT2WghDvaCPtAky9wVMTU9Sn5LXfxfGPqP/+nk917zlEjSI4ZvPwO3Prc
 F4Y5YjKA6lYulf4bgX4tGHVMf1QZxSW5OBZPY4bPrZsO7A1AAAWeksfmmOPaigADTryw
 rvalmDHpeJlMIiRFq2JpRx/Uq620ASKyEHj2FX12VV8g2T7xtf+TK7Gc6JaoYIvGDLYy
 5y2w==
X-Gm-Message-State: AOJu0YzXQdHnyBgLnYZLdQF1xKX5Krs8jvMf40gtc1eYxe7+IWzbhNgi
 Sod2f/OWM4E2wpsUxkMZ0/LaD5T62d9TZ/OxLw9HN4k5O30eUhVqiPxJWw==
X-Gm-Gg: ASbGncsC5iChox5worCNghmyBZA4HKGW0TbwcSlwf37ghIIm/xa1c66/1gQVwRMI6rA
 t6c/UtVtr2TUe1JpL6c0jhKUSQ1CGtudCWFep7o1Kt/OvvRr96Rbe5OGn6x2USosTrPv7x6iRjj
 gpSqfr/585y8+IwHc7n+9MYb+7Rq9fPESd2Kj1rmPa8jzAGnopTGleAnMSEJaqpD/DPandw3IwZ
 4ud7IOYkcEFRpxHLBf9TjPwMLFHC33NeSTRrAQmEzAJ56O0ycazRw==
X-Google-Smtp-Source: AGHT+IHRB3Q4Rx9HG7hE5wH5vk5DXr6nsCTVuPGxDLkmQijz2ahYQbZCs+1YRjmrtb7vpJX5XjvWAg==
X-Received: by 2002:a17:902:ecc4:b0:216:728b:15d8 with SMTP id
 d9443c01a7336-21892a0db18mr200210515ad.30.1734440435463; 
 Tue, 17 Dec 2024 05:00:35 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1e64085sm58905385ad.233.2024.12.17.05.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 05:00:34 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Tue, 17 Dec 2024 21:00:26 +0800
Message-ID: <20241217130027.1120436-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734440436; x=1735045236; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NwwdIqAAGvN3dFxTgFgMok9ncGgVpQxOqzENMfV0HBk=;
 b=MRewhkzYEWdChX5xxfzA4cYwobp1E4u2S/SsMyKqQoBXNbO6J0pOmNMBkqmv7wzLrZ
 ss2YETx48lHlYC1A/vg3m9YEQaisQ0CBYZKUdtlGxTfjoSQwYxjXSsF3fbjJcxkvwpg9
 VhPTME7+jYXkiIgEMR69O1aDghcChaBeG4l8jIlStg6mB8D/5FDE/UHvlMYkSX+UDVj7
 pTfGKByu8HWfWbTsPN2/8h+ILR0s/xl9oVZbni3QKY4RJjPeMfyV8mPzOXZ08k2BRd8i
 PJhhlU7aNjlZjosMxZzNbHoRC57RoQuTpkGsCXYIsq3p7umuEYID+vKyw8n13Hqlenda
 IJJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MRewhkzY
Subject: [Buildroot] [PATCH] configs/cubieboard1_defconfig: bump Linux to
 6.12.5
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

Bump Linux kernel version to 6.12.5 and update the hash accordingly.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 configs/cubieboard1_defconfig                        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 4759f8354e..450cb12423 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
+sha256  39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  linux-6.12.5.tar.xz
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index 6d189bcf95..400b009546 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard1/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard1/rootfs_overlay"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
