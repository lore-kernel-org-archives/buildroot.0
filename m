Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE131CD4F56
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 21:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FCFF607E4;
	Mon, 18 May 2026 21:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KlRZ__gORkZs; Mon, 18 May 2026 21:44:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B5B8607E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779140679;
	bh=1rFVI2C64+ee3vZEuhkS78k0IySMuG29GpsnQgNS4Qg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RRoqy69JYFJz7Du43gy74VVFfe/dlFHmKuhrSiVA8R41VwVLLsEKQEIOjDS5MO4BM
	 81phx/vq9RIe83gxuXq36766hdlaGRJNVec0FKXaZdqYa42Cmz1gOLb7tr7Sbmpelu
	 zWuAnmdZ+fWp45F9f0F18taB8cVR8u8DNttBYcK54qxTRoyzCQnUWz6yQL5f5ZM5Sl
	 kht0wg4TsjHhhPYTuZWtp2HlMGMH/NbCNUtbSx6HvPxXGEJBNbfK3sPEx+2dNu4nJP
	 8Jwma+Ux+jYMl5gQ4YVldSYZTxE3lnQJGkTvU2sxi35Zdqw6gRjq3uP+hY6eCBSBH6
	 T8EHAR8PctK/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B5B8607E5;
	Mon, 18 May 2026 21:44:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFDCD282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1D6E406D7
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-Ry6d6XA5dH for <buildroot@buildroot.org>;
 Mon, 18 May 2026 21:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B72B040650
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B72B040650
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B72B040650
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso1560371f8f.0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779140675; x=1779745475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XkhMYXt6hP9VqszYpXsMWE6YKKjxok+jOx70WGOZd4=;
 b=dvPf2gUp6b2hobCYXyowOcquWDGgzBraLhw+/nfxR1FAjGfeKtBAcqzUVM5O08eb8V
 pHGoeS1unsdnXfIuHfoRoLj7NlrbeIUdSKY5U0z6T8cHe/sGwL+XppCfDuPgY4/DB34G
 mP7OZKrY3GRP937pV+YD/DenUgVdQC4UNhtbd8c0ewIVeRSDChjSZd4mA0CFBDFXS6DV
 djd58lCGaP7Xz5piHFyeazcv8KZFqQQtZ/j1U+Q5qwAfBSIPOo90kYmVoNa6Ziask3Ui
 xNOERZFm9r6jlEEJnHXP1RezZjiOcYld4Hqn+1fctvpir9hUfbEGP7sRBu0mGpYVXPRW
 3j1w==
X-Gm-Message-State: AOJu0YyKWOxPWIIbT6BMx4SWYW+/HJSUNepxoDNhpQpKPUpCJBFqHPtU
 pvvIxxp/7f7lk+i+j7GPaEosWQEjASnbje3WvedWOgcpCsTjIExsgeRB7Vv1ww==
X-Gm-Gg: Acq92OFd/9u6FvmPPjgXmsgx2eaoFOh29bVH36/T04jPjZCRgcUb6kUuOlLHVv0wWss
 apq1bGWCwPavLffuHt9l3m4BGQYwFJnp1lCYoNr1wHsfG3o2MqV4gy8lVPMY+xcuCCkGFmrTdID
 dSxu8Zp/r+vz3lOBDaLk1iwKy+Vf+uf7nLDjyUhEXHnBHqKdCaJ3ZhGhCCMUCrlpfjX5Ed8d8oh
 Q7hg7hwlupfZB9FZDcM5qwKBjrO3feuEkcUPdRdBIgfGqMecmjl8R+UnkoMOoq3DTAYlqhqxCN3
 keOVZOWLcd09UdMYeAdFSKMnUQJWIZQXDaMvBNykrlZe1hlASnCl9SXgTiwqEr8XiGBE5ZlsX5Y
 NNleWQvc4IGtHEtjfryN3M0B0yIk5IJNnMugw8liw0yfS4bcUKVfYBc1S2g9AM3QbAcU7A5Vcxz
 izARVeCJ11sc8usowL2PBBaXJIK70=
X-Received: by 2002:a05:6000:290e:b0:43d:7b90:fa23 with SMTP id
 ffacd0b85a97d-45e5c6019bdmr26332811f8f.29.1779140675073; 
 Mon, 18 May 2026 14:44:35 -0700 (PDT)
Received: from localhost ([78.208.112.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm39862853f8f.12.2026.05.18.14.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 14:44:34 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 18 May 2026 23:43:58 +0200
Message-ID: <20260518214400.1320545-1-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779140675; x=1779745475; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=7XkhMYXt6hP9VqszYpXsMWE6YKKjxok+jOx70WGOZd4=;
 b=j4pS0pAKH1cYFDaxweUl25aHBSwv5Ex1SOxxpfWs222x9Xx4ybxzT2z4Czlv5m4DbB
 T19UGnl7O6lBuskRyigNu4TkbzAOgVoUkGkcLxv0e5jE/4heSzmzjQ7KmArPgb9zwzbS
 En2ZkLGQWQpInFtN5z2ft5hks9mZ9pbYKzu7JvPorPCt7/F0uyVHdZBUmJr8Eu5q8o4k
 /dnZin7x7Ithi6jtMjm+zwiwpfryG71cS/Yii5QOLFQOYOSz0QlIr+0Cpsdtm88Xo54A
 e1liR02ZuIc/Ipe/6rihTZHCyMpYdazW+dLGD0szfKOyJzUYjBv+nxGb7Sj3RqFD6AoL
 fOZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=j4pS0pAK
Subject: [Buildroot] [PATCH 1/3] configs/pine64: bump Linux, TF-A and U-Boot
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

- bump linux from 6.6.48 to 6.18.32
- bump arm-trusted-firmware from 2.10.5 to 2.12.1
- bump U-Boot from 2024.07 to 2026.04

U-Boot now needs GnuTLS for the mkeficapsule tool.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 configs/pine64_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index 8975f3b1a2..e19b7b5012 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.32"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64"
@@ -16,16 +16,17 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.10.5"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.12.1"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
