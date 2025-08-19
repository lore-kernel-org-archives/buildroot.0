Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2041CA0EE6
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A13860BBE;
	Tue, 19 Aug 2025 18:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIsqBx2vFGDJ; Tue, 19 Aug 2025 18:15:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C07A660872
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C07A660872;
	Tue, 19 Aug 2025 18:15:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 908F7E0A
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E11880BDA
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Skc0tkrhpLb for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 18:15:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB72480B21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB72480B21
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB72480B21
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 18:15:02 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61a1c6a5338so3574987a12.1
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 11:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755627300; x=1756232100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ofuxmlPJyECp/QbikCX2UPvwKgPCgucz4XjJeMg4F9Y=;
 b=wrreqJ0svOEDIG2UXqPoKvV3d6Fc6gM4WA+KlqKtPSvUE9d4js+u9BFFROGW51JEsP
 4MMF3qxvCVwDaPgc0GvFGVCOpX1pc/ZIEid5BTkN8cSiMajnFdImp1iH7m48a/LbaT04
 McOQkcyVo2/rMUaippC0hPoVIns1hk/axgQQwFAtRF7NRUUV7gst4X3DuC6IijVEUZ+4
 zCF5U5G4gUL/s2nBS+bC1g3rX54bWQFZzqsET2Vu2Mtw9GkHqqB1tsYetKu5gQLDES5I
 KAJduZFsbOuYTSfFcEoSvDwe+9K4nEoJDYvjkmkSbEJQ53dEarHwruXHKmS3kIau1665
 JigQ==
X-Gm-Message-State: AOJu0YzIvFlskmgcKzSoQ97kEGMBRuAqysuOkyrPXSAUf/TamjO16z8v
 tKG1nguAcAClomQBi4SNwZpmYPoZHMuCqfDwO5afbtS20y18O2/SWXkPnCEpZlinxxkMwz6990V
 9hz2C
X-Gm-Gg: ASbGncsDC9t3T2r0z3nEyi6OhS70kOOmqhBEeGURor7npq5YhwLfv0cpWqE3qh6EHsx
 0lECrTiTYo27EyxTam1slycsFF9r1JtPMol753g+0OYFWfN0Q1G1xRfdpQ+Fgckk2MXDvdA0zk+
 xacRvm1DfzTZREw4c4xlAa3R/pPV/zilLuhYIbj6XT2opP4LX9nEaI7jZhL9IZSTHbZIQVq/+oA
 rdaEsht+GqyxcNSaMAMbABAr8f5A9ZUnT9gHCjfzhOWIoaCETTUWx2bKf6JB7MPNBYEw18rhLQ7
 XfF1b00+ScSeG0B/RNDA8nP74xKMEmI+fQvAfiq8jBEoRN4jFMKvGfIv3CkOF4pdP5f53az0HPG
 LB2uTotE5Mmxa7hlXWEGY8PejA2lUd8C08WY7Ot8KbMzYmDRfUYnK3tJ2RVgLBKv6PkIv1YfKqa
 /jS/AFRZn6msvKwoC60Yvk
X-Google-Smtp-Source: AGHT+IEolfcyhJPr7H1BfETSe6WVvcyqOaN36VWo92PcNRLwbPzKswSXqGDVv6lR2x2w2zkzUftGFA==
X-Received: by 2002:a05:6402:320d:b0:618:2011:cad4 with SMTP id
 4fb4d7f45d1cf-61a9759a196mr237110a12.15.1755627299971; 
 Tue, 19 Aug 2025 11:14:59 -0700 (PDT)
Received: from panicking.amarulasolutions.com
 (mob-31-158-159-104.net.vodafone.it. [31.158.159.104])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a755f876bsm2112245a12.13.2025.08.19.11.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 11:14:59 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Date: Tue, 19 Aug 2025 20:14:47 +0200
Message-ID: <20250819181451.3012126-3-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250819181451.3012126-1-michael@amarulasolutions.com>
References: <20250819181451.3012126-1-michael@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755627300; x=1756232100;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ofuxmlPJyECp/QbikCX2UPvwKgPCgucz4XjJeMg4F9Y=;
 b=E+BrR9yMmV3pefekZ/P7yMVVlvGACG4bnq9qUI8ZxPcZTI9xaZ6QInSfeax4lM3eDn
 l780H3ixQPxsUyQiHHeWA2Dl5WV4BGp4FYmDrO3hRAf9Zrlzmz9fHjTOG3RB2pTPpStH
 rZcil1zyuUPvaSOZ3yO9VFxuRVunhtHXeGx7w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=E+BrR9yM
Subject: [Buildroot] [PATCH 2/6] configs/engicam_imx6qdl_icore_defconfig:
 bump Linux to 6.12.36 and U-Boot to 2025.07
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

The patch bumps the Linux kernel to version 6.12.36 and U-Boot to
version 2025.07.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 configs/engicam_imx6qdl_icore_defconfig | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
index 2ac415e335..30e397c0af 100644
--- a/configs/engicam_imx6qdl_icore_defconfig
+++ b/configs/engicam_imx6qdl_icore_defconfig
@@ -3,31 +3,37 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore imx6q-icore-ofcap10 imx6q-icore-ofcap12"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6dl-icore nxp/imx/imx6q-icore nxp/imx/imx6q-icore-ofcap10 nxp/imx/imx6q-icore-ofcap12"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_E2FSPROGS=y
+BR2_PACKAGE_HOST_ENVIRONMENT_SETUP=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
