Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D91CD3B7FF
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 10:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CD4842CCB;
	Mon, 25 Nov 2024 10:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XilYLqBMSBIA; Mon, 25 Nov 2024 10:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4E4742CA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E4742CA1;
	Mon, 25 Nov 2024 10:33:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D7EC4961
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 10:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D90660890
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 10:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esaIKS863TSU for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 10:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=jean-christophe.bauduin@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D6FE16071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6FE16071D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6FE16071D
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 10:33:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3822e64b2d8so133873f8f.2
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 02:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732530804; x=1733135604;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfrZuAB6vviRmKiTfyjLF8zCLcEVG9YeIIsIdbojAPA=;
 b=AQgDyb3pPBAz3B4qmbBJMRh2so1BrtbFuSKiII0faePmgIBa7EotIt/2jMtvt4rr26
 of+rzQ0vKvRnyIY2YcMHzptaI652Dbtk70v8F9rx96NGCK67d/J/D96/c7aB5/1H9Cji
 AwEdm94Hogfslj87ERFeeHSbQyvSxL7I2p09rodhSpukbtVjFDivPI6BKJDONgKXiatj
 w8DZFyZyL/O/3RY98Zi0DBxUjhB9RHPaY7fRd8vOS4ftthJf/BKj5TcN1QcPacpkmL/E
 Uw2MrCVW/Ecu6OuH8d2RA8dPwv2opLlxNFDvhaPpzLsgPzMY9LZEGMiAAepNYBjcr3Jf
 wrlA==
X-Gm-Message-State: AOJu0YxwMwtV1oVI0lx7mBY5BgGf9L3jz0hTY/ojLB3XZehbrbUTlqsj
 quU5NxBceRD5dVWt9bngI/yGjkCBA4pZQac4mMxwbRuD1KlWXemnSo262goCu3n2U2+w6lbiEMA
 r9OQ=
X-Gm-Gg: ASbGncsDFdTJzbtSmxNqmhVcjZ/hD82LuTdW9cU8jW/7otXsKTujn3qRem7NB/3RLqG
 oXuKtQ7xOXd8jRLY0dASvJNSQKBbolgI/asD7yE55OyCcfb6RPVnYK1n0znLKUdHkH5CGP78SUM
 bqPKX7uhfJNATrWpffv+3jYKexukN7zzqwq1xFVNBxluzDoXb6ooZbvg8MRvgfOX4oqQ9Z8TvpL
 LCgUZFDNGgOWowjHWwYxHYoS7JxEM062RFVsdmpzvHLkXt77IJFHoEFYnxLQRJ3H5NU8JX+3V81
 QtcXtcHM1NHj8IwiV0bLMN4mazNvNmqohx6Wxzs6heuA
X-Google-Smtp-Source: AGHT+IHvqkEw/U0lvoDHHRTH/TptB5AQt3njVuOt6czBjon76TgZvxMFwn62r+6/VifTOWUnE+9zNA==
X-Received: by 2002:a05:6000:18ae:b0:382:412e:41b7 with SMTP id
 ffacd0b85a97d-38260b5a432mr4112436f8f.4.1732530804076; 
 Mon, 25 Nov 2024 02:33:24 -0800 (PST)
Received: from jc.local.essensium.com (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb2683bsm10109852f8f.48.2024.11.25.02.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2024 02:33:23 -0800 (PST)
To: buildroot@buildroot.org
Cc: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>,
 Fabio Estevam <festevam@gmail.com>
Date: Mon, 25 Nov 2024 11:32:45 +0100
Message-ID: <20241125103246.756587-1-jean-christophe.bauduin@mind.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030141811.1372499-1-jean-christophe.bauduin@mind.be>
References: <20241030141811.1372499-1-jean-christophe.bauduin@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1732530804; x=1733135604; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfrZuAB6vviRmKiTfyjLF8zCLcEVG9YeIIsIdbojAPA=;
 b=gZ/XyjGkMItwFX5TV4EnumLRW+St/bIiXKOsUyIkLzUB3AK1eYAHapaxXzurzhCfe7
 ZE8GAkxiuyg02A1cd1a0/Ir/0Q1Nzu3D49rHP8kmtnymq3lrFk8IfLjlXve96liLxw6a
 PxBwf9KgvhVwDgBIfwoJ0g0FImjQATMck2RGsvwDu8HxGAc3zTH1XQ6K4uAkgyjV9pbJ
 +3noH8Kf3ZLPzA2gAAS/PNtoBYHnn1cBaVfpHpPl6ruZmBoIUfzoYK/HQjo04JSMExlg
 ieVc8Bq55jTZbJxRM9DCVkZJxA+sr6UI6sakQ6QfbzIWtfkq43EmYe9qFFM64VFt6l1o
 DPLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gZ/XyjGk
Subject: [Buildroot] [PATCH] board/imx7d-sdb: bump linux to 6.6.58 and uboot
 to 2024.10
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
From: Jean-Christophe Bauduin via buildroot <buildroot@buildroot.org>
Reply-To: Jean-Christophe Bauduin <jean-christophe.bauduin@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 .checkpackageignore                                      | 1 -
 board/imx7d-sdb/patches/linux-headers/linux-headers.hash | 1 +
 board/imx7d-sdb/patches/linux/linux.hash                 | 2 ++
 board/imx7d-sdb/patches/uboot/uboot.hash                 | 2 ++
 configs/imx7d-sdb_defconfig                              | 6 ++++--
 5 files changed, 9 insertions(+), 3 deletions(-)
 create mode 120000 board/imx7d-sdb/patches/linux-headers/linux-headers.hash
 create mode 100644 board/imx7d-sdb/patches/linux/linux.hash
 create mode 100644 board/imx7d-sdb/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index b793026881..d60d487e04 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -162,7 +162,6 @@ configs/imx6sx-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
-configs/imx7d-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/imx7d-sdb/patches/linux-headers/linux-headers.hash b/board/imx7d-sdb/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/imx7d-sdb/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/imx7d-sdb/patches/linux/linux.hash b/board/imx7d-sdb/patches/linux/linux.hash
new file mode 100644
index 0000000000..dafd9cff69
--- /dev/null
+++ b/board/imx7d-sdb/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e7df81e588d70fab5ec3ec3bb04ac53d51f0860fc3b1ec45e0a4167a026899db  linux-6.6.58.tar.xz
diff --git a/board/imx7d-sdb/patches/uboot/uboot.hash b/board/imx7d-sdb/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/imx7d-sdb/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
index 541a689ddc..5c3decff70 100644
--- a/configs/imx7d-sdb_defconfig
+++ b/configs/imx7d-sdb_defconfig
@@ -2,12 +2,14 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/imx7d-sdb/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/freescale/imx7dsdb/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.58"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx7d-sdb"
@@ -18,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
