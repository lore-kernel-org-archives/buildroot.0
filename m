Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D162D1D88B
	for <buildroot@archiver.kernel.org>; Tue, 15 Oct 2024 17:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC48D80D0C;
	Tue, 15 Oct 2024 17:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNcQJoYE5UXP; Tue, 15 Oct 2024 17:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD21680FF9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD21680FF9;
	Tue, 15 Oct 2024 17:26:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDD271BF35B
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 17:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D580D40A1D
 for <buildroot@lists.busybox.net>; Tue, 15 Oct 2024 17:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRby4H4H4LA1 for <buildroot@lists.busybox.net>;
 Tue, 15 Oct 2024 17:26:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68AD840917
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68AD840917
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68AD840917
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 17:26:15 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a994ecf79e7so850907466b.0
 for <buildroot@buildroot.org>; Tue, 15 Oct 2024 10:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729013173; x=1729617973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kuMo7meTcfO/v36GSWXvXwdJIb8qE3l91M9JQ9HdPOQ=;
 b=XYaN49g4K9N2vRFeuatGDVCEzjsWrSyueM2ipvslivlPsv5e2+Zk/hXoKNvoQdrqkq
 Rs4wQfqDnrVRkZKJRDMJoYUmR3uptmtqWZY9/N3lB6CdL90PxRnUP3PNW4o6lkAmfr00
 EiEv0R9pbacQeC8Iqvkb8UVrUJ+W0sIjUrL6dc64uMWxfq/JL590Nkxe0SFLZR7H/vBy
 K0sGJMu6478vZOvLdZPUb8sD++6mOm7kCbNeSi8O4qTDClEH7K9T2bsIl7cJ7da3wyOO
 xOjRveSsGmdHvsPRAvwswujbusFDyQYWJNaULGQhvdrVwiDe9RaMTXYLmHXiKhqb2gMH
 Smcw==
X-Gm-Message-State: AOJu0YwtQ0UphGVjnCpe47dpRpUjfZlQkkaG7OAO5rNG0TvkxccOwFkS
 ggxRCJS1E8RcdG951qchNIvuRFHSVS3CYG1HShCvzdGT/1J2X1lFBfOrOb7H
X-Google-Smtp-Source: AGHT+IGFo3btlsEZC5qPwf7/KnaF8DFy041Y0FEdgHqkEU8PU9DWyEclNrQMky2xZYpZw8gNTHre1g==
X-Received: by 2002:a17:907:e25c:b0:a99:46aa:69d3 with SMTP id
 a640c23a62f3a-a9a34f0dd07mr92550266b.53.1729013172519; 
 Tue, 15 Oct 2024 10:26:12 -0700 (PDT)
Received: from Suzaku.home ([2001:bb6:11e3:a300:da4d:c63d:b184:11d6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a2971715fsm93431366b.26.2024.10.15.10.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 10:26:12 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Oct 2024 18:26:07 +0100
Message-ID: <20241015172607.635267-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729013173; x=1729617973; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kuMo7meTcfO/v36GSWXvXwdJIb8qE3l91M9JQ9HdPOQ=;
 b=l8iZTUdmxCbTW4zkCFo1HNJo5hzsIdNz6kUyFVTTmzJswS1GNAaQMqj2JOln2E+lNV
 6hJ9MVpu2HGBonLHuMHErs71N5EfqEG6KjQR2Rz2ZhXcIbjxCHkNomN19GblymqI55V0
 7/Od5Pcl7+ri5lc0alkeSOA0IoO2Q5WE9XbmC7PWwKFxkHGXhOCo/OVK6kJ8VG9OPNI0
 GcpG2jdo21y0Aium1GeS56106akvl0e2S1A321vWrw2b6qqCRTGhpJB0ZtCwpg3Fn63K
 RTicQaRH/H2AkWJTzsU82eZR/oQJjwPaNdkXDsZIHSL8fQjn6CxGI4tv22wGR7fjWXnA
 UGww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l8iZTUdm
Subject: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bump Linux, U-Boot,
 TF-A
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
Cc: Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Bump Linux to 6.6.56 (LTS).
- Bump U-Boot to 2024.07, so it contains commit ebb0ad4eef0a ("arch: arm:
mach-rockchip: Kconfig: Enable BOOTSTD_FULL for RK3399 and RK3588").
- Bump TF-A to 2.11.

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
---
 configs/roc_pc_rk3399_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 1323752683..c2028151e3 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
 BR2_TARGET_GENERIC_ISSUE="Welcome to ROC-RK3399-PC!"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/firefly/roc-rk3399-pc/post-build.sh"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.61"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
@@ -21,14 +21,14 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.11"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
