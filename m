Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1C9CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 11:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EA3B85346;
	Sat, 30 May 2026 11:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITENocXPEAg0; Sat, 30 May 2026 11:57:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07791852D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780142251;
	bh=gjGm7UESw4V/gfm+mBKJJrs+EMRubPJWxh4gBfjjQjU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RJSgijM7soDWDPaAiyDE/7RQGXFl3dt3wJ2IJ1/wMPnkDs0w3ENG5bMG6pYCtFRqA
	 /i6WH1ToVNla20BwwsLtx/4USJbtOZGa6ikG45lw0muhM1aI6ngHcTmsj7O/msfvMT
	 WwASmH7QRvHnIAw84bVRDLSW0n6/EY9XxtA8VA+Vvu8w/KM4k8K8HoiF7nWd64U3cM
	 oMrx42IdVaL28UDQ6e22mmPYOC4NL9LOGkKNzxeV2y/Vf/KO5TaNJUeyoJ0Ye3KTip
	 QGpA+FzUTzjh/mIzjJNhHDwmuRnSy3bg/CcW7jN3jqBCoUWbXHNCX4E34C2EV4in01
	 dFqU4h2Jc8RTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07791852D5;
	Sat, 30 May 2026 11:57:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DD82D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F5774081F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBGg0t0AntC8 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 11:57:29 +0000 (UTC)
X-Greylist: delayed 1209 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 30 May 2026 11:57:28 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF4DD407A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF4DD407A3
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:598:128:8a00::1000:a07; helo=mxd-1-a07.seznam.cz;
 envelope-from=havran.jan@email.cz; receiver=<UNKNOWN> 
Received: from mxd-1-a07.seznam.cz (mxd-1-a07.seznam.cz
 [IPv6:2a02:598:128:8a00::1000:a07])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF4DD407A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 11:57:28 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-5757bcb9c-s9zn4
 (smtpc-mxd-5757bcb9c-s9zn4 [2a02:598:128:8a00::1000:a07])
 id 4c4424d6cca34e4b4e301ab8; Sat, 30 May 2026 13:57:27 +0200 (CEST)
Received: from arch-zen ([2a02:8308:b086:3c00:3636:4bcf:b8c2:e5cf])
 by smtpd-relay-5698866cf-d84zp (szn-email-smtpd/2.0.73) with ESMTPA
 id 6ec6d70c-08d5-408f-9dc7-6faa9084339c;
 Sat, 30 May 2026 13:36:40 +0200
From: Jan Havran <havran.jan@email.cz>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>, Jan Havran <havran.jan@email.cz>
Date: Sat, 30 May 2026 13:35:39 +0200
Message-ID: <20260530113540.26204-2-havran.jan@email.cz>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=szn1; 
 t=1780142247; bh=RXyT8aeRBPdZDkkGUpZhhG6mJr2mkC5IdVd8A6tap74=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding;
 b=ZFVTdH7F5yiqymMOeh1UJmq+r15B8S8JUmYuOplMS6X5eQKFs2bMC2Ye2QvLEomAJ
 LPCZkABlYPnvf+HeQ/VXpwDqI/oIsoXJK5tRrlnL8IAOWaIgjsu3r50wW+P5vD1iAn
 1AgRvES6Qq+KiljJFQZp/2X6TsIkMl35R5bmY3IlYPirQ0dSdlPVCtMenLhTt93QIk
 lmLdx0xpLBnys6GHBdF1va/3BBuiI4CySAhuxfQ0ES8mktamuw0qOW098HobBwVLjG
 6PcWMbrUY1J1uzF/S7Aw63IY30713gqp0+kAgKEbsD93lJhnG3wCjvHwUrNTiQfCPS
 qzwJZtejMYsHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=email.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256
 header.s=szn1 header.b=ZFVTdH7F
Subject: [Buildroot] [PATCH 1/3] configs/pine64_pinecube: bump to Linux
 6.18.33 and U-Boot 2026.04
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

-kernel dts moved to vendor sub-directory
-U-Boot needs GnuTLS for the mkeficapsule tool

Signed-off-by: Jan Havran <havran.jan@email.cz>
---
 configs/pine64_pinecube_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/pine64_pinecube_defconfig b/configs/pine64_pinecube_defconfig
index 3f88ca0822..8fc55d80a5 100644
--- a/configs/pine64_pinecube_defconfig
+++ b/configs/pine64_pinecube_defconfig
@@ -1,7 +1,7 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TARGET_GENERIC_HOSTNAME="pinecube"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Pine64 Pinecube"
 BR2_SYSTEM_DHCP="eth0"
@@ -10,21 +10,22 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pinecube/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.60"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.33"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-s3-pinecube"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun8i-s3-pinecube"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pinecube"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
