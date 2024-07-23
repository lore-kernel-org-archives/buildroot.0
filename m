Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2218C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8472960669;
	Tue, 23 Jul 2024 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGSq8GFBnZ0f; Tue, 23 Jul 2024 16:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D9F66069C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D9F66069C;
	Tue, 23 Jul 2024 16:30:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 208681BF2FD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E3386069C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOg4dYNIcLMs for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 16:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=91.207.212.93;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=79348e9772=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B83C60669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B83C60669
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B83C60669
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 16:30:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NBpKmp026006;
 Tue, 23 Jul 2024 18:30:41 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40g2c4u5bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jul 2024 18:30:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 722B540048;
 Tue, 23 Jul 2024 18:30:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D68F724855D;
 Tue, 23 Jul 2024 18:30:27 +0200 (CEST)
Received: from localhost (10.48.86.128) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 23 Jul
 2024 18:30:27 +0200
From: Etienne Carriere <etienne.carriere@foss.st.com>
To: <buildroot@buildroot.org>
Date: Tue, 23 Jul 2024 18:30:24 +0200
Message-ID: <20240723163025.2733492-1-etienne.carriere@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.86.128]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_05,2024-07-23_02,2024-05-17_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=LOknpTtKSJ/yhjagCqq8is
 irnkk63fP1t3LJqsFtiSw=; b=4d5uv0Kp6YZkFd4mwo8f6fWQHndFkKyzQ+Oz8m
 rTBMCI+d9DCJ/Ys98JFagdKJZpJNyAt3y7s1V74pf9QbvcVFM5FzFZoaxgGaQHLr
 KACUR0AFPOe1jBkIzpDYHLVwF1s03P+xSt+tPyRCjM88QcWGvluxwslTXUvIIdRD
 eUb/GSgiRZS5sC4z1+jmcNkQyXNi4h9Z0ESprI2/zVk3KVLLDm4iP+UqbY9Ljp7q
 22lNrnoX9NSbgttxECVpg5WzJhC9bg2dljnJ6pUA/vBOG+IeOm5sbMwnbB3rTsHd
 zGwTzcGwMO75b+kJ/rBtTFyZd8ekPo80BlFt4AGvUUTBKJcA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.a=rsa-sha256 header.s=selector1 header.b=4d5uv0Kp
Subject: [Buildroot] [PATCH v2 1/2] configs/qemu_arm_vexpress_tz: bump tf-a
 and u-boot versions
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump TF-A to version v2.10 and U-Boot to version v2024.07 for
Qemu arm-vexpress/trustzone board config.

Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
---
 configs/qemu_arm_vexpress_tz_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index 900bd17fc2..52b5e62e6a 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -33,7 +33,7 @@ BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragmen
 # TF-A for booting OP-TEE secure and uboot/linux non secure
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
@@ -59,7 +59,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/u-boot.config"
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
