Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC2AC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 14:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A01A60A98;
	Tue,  9 Jan 2024 14:11:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A01A60A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H0U1caSHZosx; Tue,  9 Jan 2024 14:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2FAF60AC4;
	Tue,  9 Jan 2024 14:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2FAF60AC4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E18D1BF2EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 14:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E6B830A7
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 14:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E6B830A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SiKgjJGJNmln for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 14:11:36 +0000 (UTC)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0602383077
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 14:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0602383077
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7831be84f4eso208281985a.0
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 06:11:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704809494; x=1705414294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IDAD/BF8QEtLtNaoUv53qsYNZcTF5rn0iVYuh1SemZI=;
 b=XL41EYC/eaHhhjG2Gxum50sEbtkEagDGSHC1YhO8NsIlwlezekprhAi2au3nm48zyM
 gOD5ZQotzXv+ZSE3b+SdOQzTXwX6XbDg2ZRypemRE5HbSe47PduusE2NgQOvkzolTcVy
 MHQoc43akvIt3K4R9FhEQ3rKtik1N7KCGbWD6WnMdvV611x1pzUa1exXfp3MoFpTAbl/
 usayfDfi9tN2BR3GK+AeJc0juEelBLa948SoawR3lj3jgDdjekSS8TaGE8rQ9ZJ8nKHe
 vS409Cj111McGa+8bMbZ5WvPu/IGmMp3qyUz0U4NbO74rZTOeZtyXoT1JzfhOSWgUghI
 JQAA==
X-Gm-Message-State: AOJu0YwN8j/LpvWGBAW4t4bmdAwWRAFeTPyv0Ap64faRhc+cHB8eu6Rh
 TTngR9SorxztTyO/UGeo6BAfjlhwonw=
X-Google-Smtp-Source: AGHT+IGHXGGr8drbThediJyUaDza+it2ClsKgbhfR7oiYcLZ0hzZyPjlagpM9y8teRqjLZ3AcyM2jw==
X-Received: by 2002:a05:6214:300f:b0:680:f9ca:fa4c with SMTP id
 ke15-20020a056214300f00b00680f9cafa4cmr6071984qvb.75.1704809494384; 
 Tue, 09 Jan 2024 06:11:34 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab ([72.85.200.158])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05621421ef00b0067f80dbd535sm905939qvj.8.2024.01.09.06.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 06:11:32 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 09:11:31 -0500
Message-ID: <20240109141132.654749-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704809494; x=1705414294; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IDAD/BF8QEtLtNaoUv53qsYNZcTF5rn0iVYuh1SemZI=;
 b=VyW9sx8GAAVQ6anLBwJxIW0H5ksHenn71nG/kdAZOBv4PUxwwYbp0+FbsDnF/WIzmh
 gnZaHjN6kLsI8oZAH+uiWPg9yOeOSBlVR5PTqeMEjTH1TC87dnymiGvrRiY3e5nhw9j5
 2r8ukN8pAeqlcxvLyuQt3OkMh1JXIPuyc++7UdVSoZeYwRUcmyIjB0uxJlnYEqE3leKO
 bVSGzXBUmC5wf1gbKrTdl3L1tILdEunVo+Hmsoy/To7qmwvp8il4WP5YhCBkhTK0/Wy9
 qoCBoahXnhoMzq1dJs2+OmNB17W51cU67wr03wC5F7IBNJD7+/ss29ZLE1V3hAVIEJ2q
 q1/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VyW9sx8G
Subject: [Buildroot] [PATCH v2] configs/imxrt1050-evk: Bump Kernel and U-boot
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

Bump Linux to 6.7 and U-Boot to 2024.01

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 configs/imxrt1050-evk_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index af060fb9f4..3eb556df06 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -7,16 +7,16 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
@@ -30,7 +30,7 @@ BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
