Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F49C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 03:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B0BF6121A;
	Thu,  9 Nov 2023 03:59:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B0BF6121A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rs20VuBLLWIF; Thu,  9 Nov 2023 03:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7F1360BAE;
	Thu,  9 Nov 2023 03:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F1360BAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5330F1BF215
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 03:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 352F040338
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 03:59:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 352F040338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zYES8O5mO_wH for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 03:59:50 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDAAF4011D
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 03:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDAAF4011D
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-41cda69486eso2903941cf.3
 for <buildroot@buildroot.org>; Wed, 08 Nov 2023 19:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699502388; x=1700107188;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qVJ1E3/scPXF+HzGKW82fYzg18c3w3x78FIpObW7w+U=;
 b=fLqKMMpR8XXXqFblCCHsqyjO4MU4KZzjNwJvPF1YTs3a6fnRQCKZ8IuV34PJ7iCmjW
 ViYBF5sbcSZTugWU99YGsJpY+htTFJ2dtGIZl/9iwAhO6sBmXa6F8mQqeCCOJqiGFXmx
 HaJ9APYqJZKzM46RzPqJ98F90Jtjg+aKM5xXMz9Aaly4MjVtlW1dxX8yW5ojbsKwRwcq
 jtX4fbvQqYNP+1KLEtCsgKP4qeRPDYOeHEnz9KLcefKeJzF1cLc6/Thaf2SHdy0Sfhg4
 Yk8uhSEhpZOLI7Ng7JsWFHydKZEz3D/pN67kekE5t8lpEMmQqGVyNIwd/MKTFqDXRGOx
 WoeQ==
X-Gm-Message-State: AOJu0Yx42tbARUkrrY45Tu0zO0WouVRqcwlPHr5EBTrkdA4pDwH5f6JC
 yZaCfhy+TO3GqypP8o7T6bkrl/9xzaY=
X-Google-Smtp-Source: AGHT+IGayRoCMbOZoxRrl8R4gtRuuQyl9wFrb/eiR8CNXkdRFfSgYg+WaMn3alIZNGLNKIwaJjFVBg==
X-Received: by 2002:ac8:7e91:0:b0:41e:204b:f953 with SMTP id
 w17-20020ac87e91000000b0041e204bf953mr3833847qtj.64.1699502388240; 
 Wed, 08 Nov 2023 19:59:48 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 ([2600:4040:57a5:1e00:2ef0:5dff:fe59:88ba])
 by smtp.gmail.com with ESMTPSA id
 j2-20020ac84c82000000b00419b67d2823sm1586636qtv.34.2023.11.08.19.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 19:59:47 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Nov 2023 22:59:46 -0500
Message-ID: <20231109035947.1852675-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699502388; x=1700107188; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qVJ1E3/scPXF+HzGKW82fYzg18c3w3x78FIpObW7w+U=;
 b=iFQUwokkbNxoJ3YidNd3jvF7BxBe6/a2lwuGwr0jvEq1eH7om3Tb1AiZwFGp8b6i6f
 dYFl+Tvgt8WzElRBEVmxCM4H8z3vquPGrEBw5lkzhgO39UTf3q4YOOr2Xodu8oCicFLp
 JY8qlOovqIyzghaOBKw2/qEk2IGFyfGIeLXel56fBzUHn7ZAiYMYbT0keR7JrjS9qf7r
 Naxhi8pJZHCFpIdFC3aKXUpFAy5dddQTS7sYd2YIcZ1yzKXJD1wlG1i4piJjGwIbrAD1
 QqxHyS0jQ3O2e+xrC2JyibiDFFuFu8kf8+95fQ3BU+/YtPII5M121oTnTDgCFYYDZ3Yo
 MFhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iFQUwokk
Subject: [Buildroot] [PATCH v1] configs/imxrt1050-evk: Bump Kernel and U-boot
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump Linux to 6.6 and U-Boot to 2024.01-rc2

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 configs/imxrt1050-evk_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index af060fb9f4..0eb6f626c9 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -7,12 +7,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -30,7 +30,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01-rc2"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
