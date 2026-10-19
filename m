Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD23ACCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 07:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92672605E3;
	Mon, 19 Oct 2026 07:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxTUWp6S_x3T; Mon, 19 Oct 2026 07:24:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3E00460603
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792394655;
	b=GMGgaghXu2eRBQcYCNDq/s+asd2ZMJb/4EsPFwS34wB0TnidhMsFpYVg5yS0bQE3UTI0
	 MoYCPmp8QMb9Bs6KvzUfATsjxW8AKwMgu05UPQsUyOZ3eo5R9uJquGqOjkLvkgLPHKN/z
	 ss0vYZRpJu+cbYkCsW1BM/w2/wQrLzrufZTd2LnHXTU2cOkqC9rWeCsgObi+Tkp7VfT6n
	 GNuNjTYWG9ndIS86Ck6+r+whb9pIHaaIaerJBmsS7lQxQ5lWWIMr+1J2GBe27nAKNrxcn
	 4k1ue1gNojpdIUUt+j5RnnDB+XMuTBYwWQJ+4khjySDVi/Vrobw9NGAlbSCpnazB/Kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792394655;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gGEcKQhxnlADp/EV2wdyk/eIT6npFQG3A1YXRMIJ3ws=;
	b=Cb+qtv6fmOoabmlmylEzcIHDqePhciUW0c0K+WMPJhyPYm12q47gZkWZTkO+nqjpvQnd
	 GWzPKJDNhGxRPpjoFBxdcRgtRv5Ny2eUhq21OZoJtD7GZfwflYRr5binbQVSFHHm85Yj0
	 L97QlIztI2qVKg0+9DRbcYMYIoyb1H6FL5/+czQYo4y3tWx/rcyWSbJUlVisLNk7SqI5N
	 SVOA4HW4tf7FAIUhco75nH4iVN6KGvbeNnYKY+qKy1V0QSiTB/04acLWhC51q9Yulb+bk
	 ZhS1Vzg+SpWrx/sM6UmItqECsK1iRMy26JZOj0lVLTfN7LFPIsHxXXhk1qV0sOBArwQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792394655;
	bh=gGEcKQhxnlADp/EV2wdyk/eIT6npFQG3A1YXRMIJ3ws=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=iGsg9aT0TmZU5sFh5aLy/NqWr/lwzfkqVqUUwgt7iO9xqkyb42HwBNH1j8Vwopd/P
	 DcwEa3rOQTx61d+AFVQJ4TnM+pR4tkCAJDQsj0moXf54K1YLapZO1B/DCEx83v0hFd
	 kJQoH/1rPFDvYdzVcEJof1bISH/zpHEviUYclOZah/3OJfHx7QAm7YwpVdoCSwO/sO
	 +QFtgJTWHxdnFzFjW+fE0PB2Z0U0hJtZRHFcQvlA2nwlJOM7uFXF3blpGT4Ezp7rvR
	 7LbHz5nJ9nN+sWumPElUXM6PO8A3+EJdJVs/3I/QJtf49zxwDfvl4EONOcASyREG6t
	 kWb/KzVY2xmkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E00460603;
	Mon, 19 Oct 2026 07:24:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C91231AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB297400D5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpIgEQaPbktd for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 07:24:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CA73140062
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792394651;
 b=BvE4gVxlx2H+1pLWOl0L1pVP/F1YZD877g12LZpW9i+UFL93KxF+0gukrkZwTEpqkXbR
 JgRWuM/DnRXnSSFbU9gKM5t7JuT04e937goqF9YZmvAGj6ui2eq61MYWbNnurqzRT3J6L
 TpISEFAW3alJVLCcWTEidTzCnpsuHKY1HM4s1RBYzhgcY+SXJLRBX9f/9x5cfBqj/qNp+
 ZdnVIqROaOJ8KrkyDfhl1kAGk4HKqV4THo+0yFIrOocnR9f9N3WNVhR3lr19TSROmyu53
 5ywArVIKDqS/re9XPkqC9ZcEugbNSgbTD61jRHiqcrpPhfNs5uJ+nNM/lxxCDDBFaqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792394651;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=9G5rOdR/ywT42a/28VmHrT/sRPACd9VWryMPsZm/I/0=;
 b=iQEjTHpok5K2+Z9Ocy0QWHf+7mR/DdCjEvVly9k2kGzl+eHT/JaptIolNovxZA1wxcge
 4EUr1d2BpJUHUwU+q8QYUuLNVglVFpKRWhCaPHe6DwxsXMYta/p7b0bFon2Zfrurw4Ph9
 AjHzrrLd9isE1jEzrx+wZ+INFvnLrThjUOUOZQGxMGpWF7W++Lvq3De5EIMrTCyu9cHLc
 5BLIybxrY7CR/wKwqwOYoTTvs+IgRTX35pdZnRmWsqXjHzI4ARcC3sMfuPksbDOvCpt9U
 FJR6K9raj5TRg1764TzLj2tAGyShUaEIydsvogHOM3f5rn2qvdl1mfnB1EVJCYsKYig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=acaFwD3h; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=acaFwD3h
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA73140062
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 07:24:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=acaFwD3h8xhO7KAiHwPoNXgwtcsmNITFRncTAE0GoxYIrd6C1nMDdENgC9iJl2a3/zZNIauOXg8jAI9FCJgebZAnD+/WK2HSrJxer81vQVYxbW+wzgH1A5wTaJbBiylvBV68IvuLFXQjgMA1gl10scQK87Jh/MuNlJGxPqHiQ7wD4Q/B4qigLCgaxtduBsElTYjQ/BgCLv+rPeaspJbWOzbAR/iWOYSY11ohvyexOsqRrDR4EyWQlIjESorscfZoUqU75FKMdoIIxbX96GH+6hBlMSA6LukHEdqh4nVx96jScqMJACE0/77OqA3cf+QW+pyyTnH4Xnamm4coS5qGpw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=WCAg4X1DmylKrTCbL2GsVSyng2VfcLhYa3/DNNKKWOo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -480164010; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 19 Oct 2026 07:24:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xIhj2-00000002PdU-1yjL;
 Mon, 19 Oct 2026 09:24:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 09:23:32 +0200
Message-ID: <20261019072335.575107-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 1/2] configs/freescale_imx93frdm: bump U-Boot,
 TF-A and Linux to LF6.18.37-2.1.0
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
Cc: Fabio Estevam <festevam@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Which is based on U-boot 2026.04, TF-A 14.1, Linux 6.18.37.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 2 +-
 board/freescale/imx93frdm/patches/linux/linux.hash          | 2 +-
 board/freescale/imx93frdm/patches/uboot/uboot.hash          | 2 +-
 configs/freescale_imx93frdm_defconfig                       | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index bf39f1e9c7..54ee264ade 100644
--- a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  d7813f4ad5431edb162d6be2775bc021f9007b9c6934e977330291168523a507  imx-atf-lf-6.18.20-2.0.0.tar.gz
+sha256  c7b92f0da1a154ebabd4425a1627a726d8e0206e8b417d8c87b5a9636b52a3e5  imx-atf-lf-6.18.37-2.1.0.tar.gz
diff --git a/board/freescale/imx93frdm/patches/linux/linux.hash b/board/freescale/imx93frdm/patches/linux/linux.hash
index 222ec55328..df7905fa4e 100644
--- a/board/freescale/imx93frdm/patches/linux/linux.hash
+++ b/board/freescale/imx93frdm/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a8f55764fd1418db8adfd2711c0abb7d5464a8ee1cbfd0f6878f1059ecfa1316  linux-imx-lf-6.18.20-2.0.0.tar.gz
+sha256  352273c5098d73762074997a89537f06994d6a1c2e9d291dd8431dfe4fa0be27  linux-imx-lf-6.18.37-2.1.0.tar.gz
diff --git a/board/freescale/imx93frdm/patches/uboot/uboot.hash b/board/freescale/imx93frdm/patches/uboot/uboot.hash
index 01e860b59e..1baa3185cf 100644
--- a/board/freescale/imx93frdm/patches/uboot/uboot.hash
+++ b/board/freescale/imx93frdm/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  96942f8c49736b7d40277891bf0a34cfdd0afb59390f79b65b2b33b3bbd19f61  uboot-imx-lf-6.18.20-2.0.0.tar.gz
+sha256  b9aa6a73f670f02a0903e3298923c3aa802ba3ffb7a53f6c397d28998c3ee8d8  uboot-imx-lf-6.18.37-2.1.0.tar.gz
diff --git a/configs/freescale_imx93frdm_defconfig b/configs/freescale_imx93frdm_defconfig
index 53875cc020..788af67e37 100644
--- a/configs/freescale_imx93frdm_defconfig
+++ b/configs/freescale_imx93frdm_defconfig
@@ -10,7 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.20-2.0.0)/linux-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.37-2.1.0)/linux-imx-lf-6.18.37-2.1.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-frdm"
@@ -24,13 +24,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.20-2.0.0)/imx-atf-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.37-2.1.0)/imx-atf-lf-6.18.37-2.1.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.20-2.0.0)/uboot-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.18.37-2.1.0)/uboot-imx-lf-6.18.37-2.1.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_frdm"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx93frdm/uboot.fragment"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
