Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E268AD32D9F
	for <buildroot@archiver.kernel.org>; Tue, 12 Nov 2024 12:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BE3760766;
	Tue, 12 Nov 2024 12:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swzjLUOj-fJS; Tue, 12 Nov 2024 12:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8995C6074E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8995C6074E;
	Tue, 12 Nov 2024 12:32:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00DF0DB1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D453540212
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyCNRKF0SgcH for <buildroot@buildroot.org>;
 Tue, 12 Nov 2024 12:32:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B180940213
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B180940213
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B180940213
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 12:32:22 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-20c9978a221so61956465ad.1
 for <buildroot@buildroot.org>; Tue, 12 Nov 2024 04:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731414741; x=1732019541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azqVMWiMpaGELi6zi9O8V0Vodj2dG4yhfQFpfuBGRZ4=;
 b=krB97dhl1m17AWzmVHDBPR5ls8mWWB7lzqYgzjMd91s4BxPA9jC41776pGxjL/EOIQ
 Hr5Ehr1XxGrQEmXtjdobcNQLU+gx/Ka1rcVSsbJa9eO37uj2a0fkg3p26f/+tKWC2qdz
 dl1wgF2oqjxmQFxCnsZxUror9x7106ZYrRmeaYrmzH4cW+caBZqe/2h1D/0dIs8G/E0a
 H+CtevbVk9gDvILxQXmwj4Twb9Wla6ksd7Hr/0zFFdEBw2KSmR4pa6iv4apNOjxZA1MJ
 2VwpFR0sZsH6nTJmTwPlx/ZR9SWK+35Q7cFiGDmmqcGprcbNaMcb93JIybrQzNRqNapM
 XlHQ==
X-Gm-Message-State: AOJu0YxuycyLR4eqSVihAByxbZRhp3o+nJW86EWTjNknst0KE88GVBhi
 of6S3oxXndGk8usart72YMFrF3oW4Tuomfk0dv/THhTYu+6jK7RVmp91kw==
X-Google-Smtp-Source: AGHT+IFe6KtNKdvzJwoC7DSz7chAQcjJul4ckPk462Xu15qdcAQThLMCHNeKM/UzD5Ol+gvt6il2HQ==
X-Received: by 2002:a17:902:d508:b0:210:f6ba:a8c9 with SMTP id
 d9443c01a7336-21183c8cc59mr236804305ad.17.1731414741495; 
 Tue, 12 Nov 2024 04:32:21 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177dde30dsm92513255ad.78.2024.11.12.04.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 04:32:20 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Tue, 12 Nov 2024 20:32:14 +0800
Message-ID: <20241112123216.6497-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108155434.1924823-1-fancp2007@gmail.com>
References: <20241108155434.1924823-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731414741; x=1732019541; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azqVMWiMpaGELi6zi9O8V0Vodj2dG4yhfQFpfuBGRZ4=;
 b=YKK5dg9duOBv8ogqKIMGF6j1ROHYyuQivTtN7a4qISXoJxuVxafDO7L+SzDv2VUsjp
 nvjhKVqLVCIeFvSLRAKSb0r0qo4ZJX7gT9jqeAw4Fpf2X4yrxAGQKshMAnZhdcoGSo9c
 zRcu8vHBcLWzC4NuCSPcuYLTKl7VEYJDcmITn4jkcb08G+3N8s25v9V3IkwbpN3cTL+i
 eCAPHjrUNM+4kv9y0L0iQN819lrElbUep0xPKxLUqHNJWMubcr3hqUHabrqjgRxETjaY
 r3Hj1eqAwi5i07TKfW+jcMulkc0Rd6WBXs/jk8ezmRxtAvRcGKdqhcKITN/NGCvzyKmJ
 D1Pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YKK5dg9d
Subject: [Buildroot] [PATCH v2 1/2] configs/cubieboard2: bump Linux to
 6.11.7 and U-Boot to 2024.10
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

The boot.vfat image size is not enough now. The new zImage file
is over 10M, so it is expanded to 16M.

This commit also adds the custom version package hashes, and
the corresponding ".checkpackageignore" entry is also removed.

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - bump linux to 6.11.7
  - add the linux.hash and uboot.hash file
  - remove obsolete entry from the .checkpackageignore file
---
 .checkpackageignore                                    |  1 -
 board/cubietech/cubieboard2/genimage.cfg               |  2 +-
 .../patches/linux-headers/linux-headers.hash           |  1 +
 board/cubietech/cubieboard2/patches/linux/linux.hash   |  2 ++
 board/cubietech/cubieboard2/patches/uboot/uboot.hash   |  2 ++
 configs/cubieboard2_defconfig                          | 10 ++++++----
 6 files changed, 12 insertions(+), 6 deletions(-)
 create mode 120000 board/cubietech/cubieboard2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/cubietech/cubieboard2/patches/linux/linux.hash
 create mode 100644 board/cubietech/cubieboard2/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index b793026881..526572e6d1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -137,7 +137,6 @@ configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
 configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
 configs/ci20_defconfig lib_defconfig.ForceCheckHash
-configs/cubieboard2_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
index 0ba74d6be3..f8a8ec05c8 100644
--- a/board/cubietech/cubieboard2/genimage.cfg
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -10,7 +10,7 @@ image boot.vfat {
 		}
 	}
 
-	size = 10M
+	size = 16M
 }
 
 image sdcard.img {
diff --git a/board/cubietech/cubieboard2/patches/linux-headers/linux-headers.hash b/board/cubietech/cubieboard2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/cubietech/cubieboard2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
new file mode 100644
index 0000000000..f97a04ac84
--- /dev/null
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0bf5ec644817d7928920f763581311f5bf258a92759cf2f30985da743af3ebb2  linux-6.11.7.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 14d080d2d4..287f67596b 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -1,23 +1,25 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
+BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="Cubieboard2"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard2!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.7"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-cubieboard2"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
