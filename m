Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA88F01818
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 09:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCC7D83B63;
	Fri,  6 Mar 2026 09:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mv800NYjwMK9; Fri,  6 Mar 2026 09:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEEB183B6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772789722;
	bh=TB2LxzQraysMBPd73lQGm67OLDvmDGyoGCmSwUujCjg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=diOtZl6lXzSLF1wp/ssKyhBP8n8lgwgFCKjVhebmwmqL8UdWkI7yS4V1KJy4QhFor
	 5W/vRC0XWsCSB+s/4W77Ao/fH1+V0WxV5FXAkdJ7f5S6oEZsOAM/XoNA6mGdC8Dzkh
	 g6k2ebTHuhg1r/xI894XNZtR6lUjvpZJg+r6exARW23VpE3vS7urslJCFvHRuuZSgd
	 t3aL+w9M+quG4uvH5RFLbcdON6DIc3jWbteDFFuyo1sDdDpH58HtbW0el5MXXTYbn8
	 1GWwPMH1qUybjCqhHuVzsSvvCf++cNrrXVek2ZhtLgSAuI15KEOU4s9qaqaRfGigUj
	 Rb8NR8VSCLoyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEEB183B6D;
	Fri,  6 Mar 2026 09:35:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 64D11223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C45360FE2
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzg4Gqy_GK1h for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 09:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31FB360B1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31FB360B1A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31FB360B1A
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 09:35:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso68019865e9.0
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 01:35:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772789718; x=1773394518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PLewXBZUYTb+j1xfYyxVQCbmjYMxRL/D8Rl+8EH9B78=;
 b=G5J4a8jnfDTFOF18FKlFC8nFYKAl8iU9NnzS8neO4ELRpH/SvHxIH3dAxKSAL1RkDu
 TPGyNmeSxXex/hLobHRSCwnFExWTdTVka2rCDXI1DmUSxJEXRYr1CRhVwA49YPbboK28
 3RUR/Fj88uidsy/GC9X2/xYSKbk5iWpptOZFGFgUAnQ4JpFDMiReBDIyWaE+SIknNSTk
 5t0Ld5squaX1gcWQrKQiPFABhavDmkt1PgIL8Hh8r+HDCcetwrrweoFZch9FzwlIm3I/
 NHPP9TU5PxDBYZyz0e8mTf0qPlSzheqiPjdm8h3fiL3uihp7ixYL+mS4vRjOXd+XSJyD
 uSmA==
X-Gm-Message-State: AOJu0YwtzA0nzhFevq2J4AYvvb+saqlZbTKCoSH9+3NTpGuPrjjCaSjd
 guABxehOaZsZ/E3aExRLZkAJu1A1lmJEDObxR8b7vUEMx+MMSBN9ggzHf8swVlhDILJBlvgFdRl
 o4Y9At5I=
X-Gm-Gg: ATEYQzybPaG380H1q5hEFEJt1h8wVgBJ1NIxQ1Nq6puw1w8ZLcrx5q9rO2Q93RvqmjB
 i7Q2KM4O8Eob2q3TfU+j15ZGeDErSNSv3VbJXmsOiJH/0ZYc9OEAUzjWPd5VuXbRiBGTyDt+J6H
 BowMf7S8Vtdd8IzrgRDVXF02BgV4cRqncHH4udiQKC1cP1X+RXFBqcmbfCRk1zIrQTeY97gp6nJ
 pUml7K/XCctcVb2o7bcJDD6VJOYCN8tZK5G3VbjC6rTHVn3uEWjp8PhhSQ1TDGQ5+VNe5dkVPqZ
 4fW9uDm4bW5XYu1Gw8lvKB1dqH4ULP5gHWPwf4E3PB7jcZQgAeExseL2i0Ddxu0XoSmlMI3k9P8
 Jrz9TApRsdt0v00V3SW31a3BamROU0QCat+VtubeORh0c5mtpQEcP8SnJbbZl2admaVja9MQJGD
 Hv+IKPnuNmk9hdSY9tp2CagNrBa1lDWryl3DRBbT9zVoxtbNMbJeQrwr74l1xtJqINP/PhYSRKO
 g/CRXOafIz5v+vEFfpnCmb+hhmmfAc=
X-Received: by 2002:a05:600c:8b83:b0:477:fcb:2256 with SMTP id
 5b1f17b1804b1-48526957be7mr24554345e9.17.1772789717873; 
 Fri, 06 Mar 2026 01:35:17 -0800 (PST)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276bc6bbsm21227385e9.15.2026.03.06.01.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 01:35:17 -0800 (PST)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Fri,  6 Mar 2026 10:34:48 +0100
Message-ID: <20260306093448.707547-4-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306093448.707547-1-dowan.gullient@smile.fr>
References: <20260306093448.707547-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1772789718; x=1773394518; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PLewXBZUYTb+j1xfYyxVQCbmjYMxRL/D8Rl+8EH9B78=;
 b=2iIOpoELqZwCIxjCAMOXX/hNOgrrEuqwgX8QRVDtaZhc5CBVCDT/zFNMYsYlt1m+Mh
 89F2lUH+50K/eoyWdBzTx9el0C5mHCAYeq9iUXi0TPAJcWUZ7vakgyuQi/NOoetmelaL
 OUo5weM6NZNSlO181By4zXWH1f7oNcb4r5eK0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=2iIOpoEL
Subject: [Buildroot] [PATCH v1 3/3] configs/khadas_vim3_defconfig: u-boot
 version bump 2026.01
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With U-Boot 2022.04 gnutls is required for building the hostool
mkeficapsule.

mkeficapsule tool is built by default if EFI_LOADER is set since u-boot
2024.10 [1].

Thus the BR2_TARGET_UBOOT_NEEDS_GNUTLS config is needed.

This commit also updates the defconfig to the new convention:
- It adds custom hashes, enable BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and
BR2_GLOBAL_PATCH_DIR="board/khadas/vim3/patches" to store the files.

[1] https://source.denx.de/u-boot/u-boot/-/commit/b7a625b1ce49ac4e45dbacf476c31d8e312350fb

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 board/khadas/vim3/patches/linux/linux.hash | 2 ++
 board/khadas/vim3/patches/uboot/uboot.hash | 2 ++
 configs/khadas_vim3_defconfig              | 5 ++++-
 3 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 board/khadas/vim3/patches/linux/linux.hash
 create mode 100644 board/khadas/vim3/patches/uboot/uboot.hash

diff --git a/board/khadas/vim3/patches/linux/linux.hash b/board/khadas/vim3/patches/linux/linux.hash
new file mode 100644
index 0000000000..94fffd392d
--- /dev/null
+++ b/board/khadas/vim3/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
diff --git a/board/khadas/vim3/patches/uboot/uboot.hash b/board/khadas/vim3/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..b6a925ea4e
--- /dev/null
+++ b/board/khadas/vim3/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/khadas_vim3_defconfig b/configs/khadas_vim3_defconfig
index de737478bd..b45c70f260 100644
--- a/configs/khadas_vim3_defconfig
+++ b/configs/khadas_vim3_defconfig
@@ -4,6 +4,8 @@ BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/khadas/vim3/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/khadas/vim3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/khadas/vim3/post-image.sh"
 BR2_LINUX_KERNEL=y
@@ -20,9 +22,10 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="khadas-vim3"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
