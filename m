Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D961D609D2
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 17:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72AA608D2;
	Tue, 16 Dec 2025 17:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ad1iW_JG2B-M; Tue, 16 Dec 2025 17:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0309660A89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765907048;
	bh=t7m1e2B9inK0DHEqQnwRBP3eMxjaUFs9woVp1RE6YgQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D3SlFss51WCSo1vZnbjQ0K0niowwFHf531BqbgpO+HXh6wX8OZoHuDvhNxvHdmrXk
	 5+F/9RQCoXnVwGVoHQqDW9eWup5q2nfHRwfCcTGPV4og5Ka4kQBGhTM6oBpNNlikHQ
	 VPC6XXaqKAdmD7UVcRSQiHBxc7OZx2DiJ79Dq7w7mZ0YbdpLcp+R+aCF06+UyPPZWD
	 YvK8LaKkntncKMHSTOZ797V+QDYRNPDehnFwy11L+DIYtxnRTdJDRsrcIvQLbgGowx
	 YVJqXKm1L+JYXXL2W332eoPxZABxuAhOWTSrKODL0Gzncy/X4TPg8M9wXZy7YLK21M
	 ODary6y8uvsMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0309660A89;
	Tue, 16 Dec 2025 17:44:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC65E372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED6F40585
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LFpeVyuDpN0 for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 17:44:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 67F4E40057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67F4E40057
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67F4E40057
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 17:44:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4E8F160137;
 Tue, 16 Dec 2025 18:44:01 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Tue, 16 Dec 2025 18:43:52 +0100
Message-ID: <20251216174352.11588-3-vjardin@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216174352.11588-1-vjardin@free.fr>
References: <20251216174352.11588-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765907043;
 bh=ZdHzpQPBH5JwXMSdNzXrsdJcfm5B8LLs5b1ouzYY5fo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YgEnM5FP1/ySJek8Hkv56vgKu/YrUQJ3soFe738wun0nDV2PEIpWzZZ5SNAxGJ+cK
 0Qsvm/lDp4xoedHPrleqAG8R3TAS0IglaLpshJ/piHSggMSMnq3TaUNKXK5EDWSeZ4
 DBbmc88An3wBj9UA5YhXDIUzhsPvipAL2II3t0C4WN0Pr42lifLMXYIu8BwZadp/8E
 kDPPWEossBLFq3zH6mdTLj1BXEzsUNIOxeJbWKvgpyeOiDfOwvMx9dcS7xfg9SBs4G
 gFFrDJ1UHZ+8cF/ReogejgvTqKDxKorORz9YziH4Nyc3QHmEvZtEOHl1EhwK5oi18D
 MeZUV0RH4kuag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=YgEnM5FP
Subject: [Buildroot] [PATCH v1 2/2] configs: add
 marvell_armada8040_db_defconfig
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a new defconfig for the Marvell Armada 8040 DB (Development Board)
using recent mainline software versions:

- Linux 6.12.8 (LTS kernel)
- U-Boot 2024.10
- ARM Trusted Firmware v2.12

Key configuration choices:
- TF-A platform "a80x0" with mrvl_flash target
- U-Boot defconfig "mvebu_db_armada8k"
- Device tree "marvell/armada-8040-db"
- Initramfs embedded into kernel image

Output files in output/images/:
- flash-image.bin: ATF + U-Boot for SPI NOR
- Image: Linux kernel with embedded initramfs
- armada-8040-db.dtb: Device tree

Boot method: SPI NOR boot, kernel loaded via TFTP or eMMC.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 configs/marvell_armada8040_db_defconfig | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 configs/marvell_armada8040_db_defconfig

diff --git a/configs/marvell_armada8040_db_defconfig b/configs/marvell_armada8040_db_defconfig
new file mode 100644
index 0000000000..3db4f032b7
--- /dev/null
+++ b/configs/marvell_armada8040_db_defconfig
@@ -0,0 +1,33 @@
+BR2_aarch64=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_TARGET_GENERIC_HOSTNAME="armada8040-db"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell Armada 8040 DB"
+BR2_INIT_BUSYBOX=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.8"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/marvell/armada-8040-db/linux-extras.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-db"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_TARGETS="mrvl_flash"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="flash-image.bin"
+BR2_TARGET_BINARIES_MARVELL=y
+BR2_TARGET_MV_DDR_MARVELL=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mvebu_db_armada8k"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
