Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1D7D1AD53
	for <buildroot@archiver.kernel.org>; Wed, 16 Oct 2024 12:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5073E8087D;
	Wed, 16 Oct 2024 12:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGVMVTJ53QwA; Wed, 16 Oct 2024 12:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62E6280D52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62E6280D52;
	Wed, 16 Oct 2024 12:45:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 86A101BF2CF
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 12:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7481B40235
 for <buildroot@lists.busybox.net>; Wed, 16 Oct 2024 12:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Rf8zgcbuN7m for <buildroot@lists.busybox.net>;
 Wed, 16 Oct 2024 12:45:44 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=81.169.146.217; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=ludwig.kormann@ict42.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10C0640223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C0640223
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10C0640223
 for <buildroot@buildroot.org>; Wed, 16 Oct 2024 12:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729082741; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=fGX3ilgUvnzM6v+eaH/BbUVOdtA5gU4la/yLuwcBKELczLo0Ev/xMPmAdN4Dyxzt3G
 MFGfjlf1A6FDodz/wr94fS2dVNFSDiHPp3/2NQnxmH5NkyS5REH8cJhUD73A6nA3AGpn
 VPKMIS+os3e273hSQyG5/FYr/cloBE/T+VQuCopfvlESMR+LWL0C1PxtNHXpkpZ/TxiQ
 wBH7re5ZFormOkbjfv2cPe2QO7h2+r/gqbyi/3hL0KrQeaP0elfonE/V2B9GNlBLW9lU
 e6z+86yjmBoxKCqqwPqo0IRWSnYGrxmEoJ47+sWZhi6NcqUfo7k/+uqe2IazjvUFq4Eo
 qdfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1729082741;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=cJzeSa7Etny/qXNUopNchLszqbcq72qdjLuAqWDSsVY=;
 b=E79Gkv9tTsELp2C8p7PnQV8ewMqWtWD+hdP6GexzsnDRMhtKi7kaqdieqU5N+fWrrP
 Sr2eydDAYBCUU3ZCA9ARUWp3vSExduF1j1ABHENpaocOfEPRykKOwPNoJxlBfjBwoZjy
 5CFShIaXBjQoqu3Z0lIaCh8lr5rA7X8t8TC06qqfemCYjpRrcxtSZ+VZI/bPphgry2nc
 HsZUEmK0LznEHbCrjIRUsKpR5RhTP7t9ADYEwiDQxSlaBAMgtqxq7+BaWucavxmyQ15E
 O0hZYEJTu8Sr1na+EirC4S7CDasgqgNy5HsltjKxO2pfObCVlOrchGUMq9Yo5eY3U6S/
 wlKg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":IHkAYkmvNfSwjg/qSc4u8zZOVaURsoXe3UH2mQA0KgllCYtN8WqJZ5aMuoQuCdrfzui0vA=="
Received: from debian-test.local.in-circuit.de
 by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
 with ESMTPSA id ja045c09GCjf7fT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Wed, 16 Oct 2024 14:45:41 +0200 (CEST)
From: Ludwig Kormann <ludwig.kormann@ict42.de>
To: buildroot@buildroot.org
Date: Wed, 16 Oct 2024 14:45:35 +0200
Message-Id: <20241016124537.2645119-1-ludwig.kormann@ict42.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1729082741; 
 s=strato-dkim-0002; d=ict42.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=cJzeSa7Etny/qXNUopNchLszqbcq72qdjLuAqWDSsVY=;
 b=KH6wS2QgJN1q8MmBgwzZQeQYtW4y3w2eyxFdR5uoWmZ2699qnvbe5ucKRow8N7mIe3
 k9gCaW9++SxNF+RKyrnpqQXD9DGL9kZ0tYHxgjcj8zl+WtoKSy0Lvk1ETnFl8ltseoRP
 lb6Zzk8OrHuWr12It3wsPBwPykNi7IFjmg11Iio+qE0G7+PR77kgIa/D+S92OU99J1y9
 /HflJPFfyAmYYPje2BgpFRKNcQJSQEhXXU//Nk6huPx0MsthFnLaHxaTDvfbwp3DycHo
 P3wEsXmJ59PFvAkxUbU2UyuCChQ/xg11jSDL3hCUC2p1tkbYVt7UNQ6AtjDWJt6g0Kuz
 rGVQ==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1729082741; 
 s=strato-dkim-0003; d=ict42.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=cJzeSa7Etny/qXNUopNchLszqbcq72qdjLuAqWDSsVY=;
 b=C7p7QvPi4QEQRxZpTvfQgutVFLPxG4j2nxREb/8sY2yf5pxaEulIeSRGIsqRd7LROA
 z7xII1saEElFeaAsiwCA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ict42.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=ict42.de header.i=@ict42.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=KH6wS2Qg; 
 dkim=pass header.d=ict42.de header.i=@ict42.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=C7p7QvPi
Subject: [Buildroot] [PATCH v2 1/3] configs/icnova-a20-adb4006: Bump Linux
 to 6.6.56, U-Boot to 2024.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>
---
 configs/icnova-a20-adb4006_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configs/icnova-a20-adb4006_defconfig b/configs/icnova-a20-adb4006_defconfig
index ba529c8db5..7eac9b429d 100644
--- a/configs/icnova-a20-adb4006_defconfig
+++ b/configs/icnova-a20-adb4006_defconfig
@@ -20,7 +20,7 @@ BR2_PACKAGE_HOST_MTOOLS=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/in-circuit/icnova-a20-adb4006/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -36,11 +36,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="icnova-a20-adb4006"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
