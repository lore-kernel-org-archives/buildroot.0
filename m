Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D394BD5C0F0
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 15:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EFE184588;
	Fri,  8 Nov 2024 15:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWmgjSbtgih1; Fri,  8 Nov 2024 15:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A504E84591
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A504E84591;
	Fri,  8 Nov 2024 15:46:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 944AFD8F
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81CEE84591
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ymRWmSprdYuu for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 15:46:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA35B84588
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA35B84588
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA35B84588
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 15:46:37 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7e6cbf6cd1dso1581765a12.3
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 07:46:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080794; x=1731685594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrV3VPH45WCrLXiEFtHIf+P7fU8ifoDKmNkHyP+JkCg=;
 b=M4B+EBXZZ7js40fmdVPTXgEyezBvxITZAfdMQGNb1JtITYDmoHiTGIgT6ihGJ7igAV
 R8i7AbNYuNlaOSe6l4VWIbU2tREgQowJY+fYniX327/qCFOcSpp/KSH7exsv8gzWQMpf
 SEqVE+UHViNq3uxDlQdx+8W1S6LpxiLjy3p+ZJyvOM1dzSPro4LBBD9sM8tlCmndQquF
 LN9semxjp3j/SsOTgMpOJIlX9Jn4m8+S2wSYsHK3rnHP1KZUiM47qdm8STEVVL6dk9fR
 Dcoq052jNCNFdGJQche/FikC1Dc9BtS0w593s+4quZLUpwfA+R/R/Eele7LWdk/S1g20
 giuQ==
X-Gm-Message-State: AOJu0YzEG2jK+vgvglu6bNSEY3I20qcTd57Phce0nU6M8w7CdfpvGQPK
 pwiczbvvrPPX64Cj+y83XZGZxYmrfNdCjvmnwsBkBAfppYYWl4thamgcXg==
X-Google-Smtp-Source: AGHT+IGZSdy1SD19xbx0O6vhWcF5oLoB/NrUrtoJyU8noVakguM0QqjW3dvsQD4QlvEOcEH+KhupdA==
X-Received: by 2002:a17:90b:5447:b0:2d8:a672:1869 with SMTP id
 98e67ed59e1d1-2e9b174807emr4377486a91.32.1731080794197; 
 Fri, 08 Nov 2024 07:46:34 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9b4a9b958sm1554539a91.32.2024.11.08.07.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 07:46:33 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Fri,  8 Nov 2024 23:46:25 +0800
Message-ID: <20241108154627.1922163-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108133641.1216345-1-fancp2007@gmail.com>
References: <20241108133641.1216345-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731080794; x=1731685594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrV3VPH45WCrLXiEFtHIf+P7fU8ifoDKmNkHyP+JkCg=;
 b=cyt7Fc0dLDN9Xywh2w9YIl230lVRxS8RN5NuD2Z+uusqpE6RTDw5CWDpuIWMZ4QO2Y
 gHWTwmz8+zNwKrT7dXOfQoc0KQlq95K6ZWdTrxPANVL/YTCQXBZvMrXNxp5lrmST3bZo
 rbKxvelFX7DpWYW0Jax6mjy8nTx+ZJgfe67bypAU4XGijBwnJDBg21L8W9hkw1kRtFLV
 alXmVHSpbOzwN8XyYNj/ruS6VDCps0o25uUQwt5PjLmyrbJDEyxjABMDkFQrCPgbqWtk
 kDF6qhL4ZjaaUMGz5Gn+66+sQht9gMKo4XEJReCn6P/rLBojonuA5+05O/PDtGjMzhEH
 2tyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cyt7Fc0d
Subject: [Buildroot] [PATCH v3] configs/cubieboard1: bump Linux to 6.11.6
 and U-Boot to 2024.10
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - update the linux.hash and uboot.hash file

Changes v2 -> v3:
  - U-Boot needs host-dtc, add the BR2_TARGET_UBOOT_NEEDS_DTC option
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 7 ++++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 5e9df51ecd..42d02c9f78 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
+sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index 97a2b4eaf9..904fa56c02 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index c2ced443ef..c3dede47b8 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard1/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard1/rootfs_overlay"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,8 +18,9 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
