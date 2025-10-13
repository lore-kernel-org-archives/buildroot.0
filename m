Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C9CCCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 14:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48F81612B4;
	Mon, 13 Oct 2025 14:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8k93fQvjCslj; Mon, 13 Oct 2025 14:57:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC4D260E2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC4D260E2F;
	Mon, 13 Oct 2025 14:57:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA73BBC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BCA7411E4
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8y34oTWB4oGQ for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 14:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A618411E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A618411E3
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A618411E3
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 14:57:43 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-77fac63ba26so40118927b3.3
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 07:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760367462; x=1760972262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JzRvpgEwL9CEQR04XMavOfTLHdfdXxWUKOSZt9YxNAE=;
 b=jy7z7mx/mdjX0jzrzWp4lYzX99rZonK5YCPIozAcX76vYtC8jJ4d5+XvSL43PdY2Ny
 YAD1HhR1v09TW85RNCei/JJl6WjSi+vs9svSv0WOk0al8SNB9k3kHmWFtkotewEjyGYS
 XQbtUO+XdhSyxHMllJktwqp7CTGviloHWq/+RmUbDehrhHqkj51oCkz9dgEbgsMpd0YA
 P52G3Qoyoxasf3RDzDdbPhzBJE35wuMhtzThHxTDoJalssTHbdPVJGwq7mCKwqb4ZBZQ
 5Qb8WTTuA6r/prq/jVpg/tIJCZCqc5sdka39+7zaI3rXQQmfhk5B4VNEgOdrDexl5y+N
 fqng==
X-Gm-Message-State: AOJu0YxYrnQaFLSlyN1+I7cs3GyNRdiQOq66rqPTRIpVo73B2uyXidqD
 fJLYN4T74bUf68E+0E4slQun4WjDSvc1Sus6MLUTQWg98psK2a+GwXmlH3DGRQ==
X-Gm-Gg: ASbGncsheujZihjOQs4tkMTtBeJlV0IHLWqs65krUD4e611/SDtnwMPPLFuRDG5Cb9A
 1Wt+X7Uvmm+En0Pz3XgHK6bojhJ26TtPlo5d9oh1uxEd2R2V+oppqVUzueKptcZfbpslWNXt0vf
 9CG/G8pd3t9z4yUkQLE3A/SztIuaxu7K5t3aIVfhQ6tKyi3JTVEDc9wlfEql80RgEPaAZF1TmV5
 zoZIy7JGMg33cF6EtSlALjydXA28IeUAgBRRU/BamvVi+qCfnEvkRgNC2s7Zbp4yRLjZlhmK/VN
 DsSHTkAUTU7N+15BLOJ3UN5H+WWgFVB8gF4fWeLcCZ8N8EBnwH4SoQeVH3uaSv7fV1svHQPhl2b
 MXoiJsPWXY/siHY+3LYVXR366bT7sFykLqPFForAHJGKqRT415fyhUjsrg4A=
X-Google-Smtp-Source: AGHT+IFy/a/r0I71TJxHSn4z5BxDp1RPmwcE1SpaLCf/h+ZQeWECF6CLlv7R703ohsfL6mglyncB8A==
X-Received: by 2002:a05:690e:4295:10b0:63c:f01e:f8a with SMTP id
 956f58d0204a3-63cf01e100amr9064644d50.46.1760367461851; 
 Mon, 13 Oct 2025 07:57:41 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-781071f8fe3sm27077267b3.35.2025.10.13.07.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:57:41 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon, 13 Oct 2025 22:57:20 +0800
Message-ID: <20251013145721.1236674-2-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013145721.1236674-1-fancp2007@gmail.com>
References: <20251013145721.1236674-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760367462; x=1760972262; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JzRvpgEwL9CEQR04XMavOfTLHdfdXxWUKOSZt9YxNAE=;
 b=fR3aX4wCGUBI0VampkXDEwWp0SYjg2uPeHziIqZUwG+jRd4ZgCeWcAWhJeECP0XSvo
 c42WgTjNjiL05Dy8tnuuP8cEq1FnzPT2F/01Ht7wIZ5IMtvMIWsJX/m8/pnzq2SQcq99
 6G8T7EJtQYe8PDtbHawZjD447w1jZz2guuDMMnoyeiLKYGvqkcKnh7Wqb5KlPGY1L+zy
 oxy9N3RuF3HKV9BkhEcNQQtZT/b3BNF6tlWG3C1oY/rj2a3tDeaviKL+tz4FfbutcTK1
 cMtjAhOjDcTsRcnzhaJmD6Mo681gFKmMCbNyGP6YgCXS6JMQ5bK01rKKJ6n8RJEluEVS
 S28w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fR3aX4wC
Subject: [Buildroot] [PATCH 2/2] configs/cubieboard2: bump Linux to 6.12.52
 and U-Boot to 2025.10
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard2/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard2/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard2_defconfig                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
index 823f6a55a3..9ef8b4af9c 100644
--- a/board/cubietech/cubieboard2/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4804528a29cd20309a0b41c30e5aeffc35fa21ee3358f4a706d4586d003bc1fb  linux-6.12.42.tar.xz
+sha256  b4850cf670a032c70f38b713a27d62046c5f747caf028c5f50b18f98606a9eb1  linux-6.12.52.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
index 440526977b..98a5c53aaf 100644
--- a/board/cubietech/cubieboard2/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index de8af36eb3..43ef33e329 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.42"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.52"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
