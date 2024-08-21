Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B20C52D6F
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B23324026E;
	Wed, 21 Aug 2024 14:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VsX4YcjlV7XF; Wed, 21 Aug 2024 14:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8188B4031E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8188B4031E;
	Wed, 21 Aug 2024 14:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA1F1BF3D0
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 14:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8539E404F7
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 14:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bz7REPSeBs1k for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 14:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A03AA403D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A03AA403D5
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A03AA403D5
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 14:49:46 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2701824beeeso3558673fac.1
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 07:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724251785; x=1724856585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DltoA7i0KHSn6GrKUYY7QBcXvRxlkXDvqNkjOGZa3Sk=;
 b=kmg42rOndevWVuSSmwUpQ04FdSuml8YbQJhGZ22b/1BgqZRllWreJPSHACLGF48IfZ
 LeE1LyxGplXzmOzUuwI1X6Qa43c9uf6cFm7oG9UALYljHNvh/TRzSC3xeIhAn8jyOlNx
 A6rXMegBJtj+9GIA1cywGNxIxvGgrJpG3awFxWrh1meoZjyrj9eYCwhUfkDgo2d2YXaq
 Vf7Tzrs9R+joL1MxRYdb/K+rmrsv8Z2KYPtN7Cf+ooYsRYdZnEslfFv0Rc0LYzKuHJGJ
 YuwYLZ2+DiX/p3uMoTjXvV8HB8nXzKBC1wl3cjCvBBSLxa12g6mAjlYAWIVkUcO5/ANU
 sYOg==
X-Gm-Message-State: AOJu0YzL9EKYSFn31nm2SvHqZcZT/w6g3XxGkA8wk6OE8hHKmfdBlhXk
 ognrzhKQTUYXPs1NqquEo9LYuwCx/ljd7ENrhWBikQmksXnaxMxkrHTgYw==
X-Google-Smtp-Source: AGHT+IHoCzgIyQESlPRvy10taIH2DSY8PXVhpjuOvKRnbP9gSiWVgeSg9bDsUD8HFHrB/9XOQtTZqg==
X-Received: by 2002:a05:6870:414a:b0:270:4dbb:195a with SMTP id
 586e51a60fabf-2737eef2ba8mr2926747fac.15.1724251784919; 
 Wed, 21 Aug 2024 07:49:44 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:2803:be04:d9cf:894f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71430c322dcsm65103b3a.199.2024.08.21.07.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 07:49:43 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Aug 2024 11:49:28 -0300
Message-Id: <20240821144928.2598045-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724251785; x=1724856585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DltoA7i0KHSn6GrKUYY7QBcXvRxlkXDvqNkjOGZa3Sk=;
 b=fDq6XwEE9u2uf0v7yHO+YRpTJNe2rmupoPCAFq7QVvYw8ywe1+sfpaTjpPlrHcRJfj
 4sr9kbPiDxSJvR012ETC+RN5WuEDAHh9865olNXOCK7xcxp27MpT958IqXvzO+BJgu0d
 CHm6Sn1OQAlOGa+5ykR0Ttn9uhmFtG7VnpfkCw+DcR4zyIL8NmyIkbRUClR3iTSOmafn
 Ibje8sqmulX1NuTuMG+UiMQ6IRHPiBFHY80Jqud5YQtchTnSit+oYBiI+PXrsWpT7plQ
 bc/m2z+RqmjDm8EVOgAk9tyn3/wlGoRJPzqsWaojpy1tnt/2KtTT5snlFRfo+9hVPE9U
 yzoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fDq6XwEE
Subject: [Buildroot] [PATCH] configs/wandboard: update U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to U-Boot 2024.07 and kernel 6.6.47 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/wandboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 22eb52994511..39b9e96fdc3d 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.47"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-wandboard nxp/imx/imx6dl-wandboard nxp/imx/imx6q-wandboard-revb1 nxp/imx/imx6dl-wandboard-revb1 nxp/imx/imx6q-wandboard-revd1 nxp/imx/imx6dl-wandboard-revd1 nxp/imx/imx6qp-wandboard-revd1"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
