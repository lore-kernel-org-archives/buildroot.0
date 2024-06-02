Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E99C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 13:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B99560716;
	Sun,  2 Jun 2024 13:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-JEWWm4HZMb; Sun,  2 Jun 2024 13:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0121560760
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0121560760;
	Sun,  2 Jun 2024 13:21:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94C841BF83B
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 13:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C13082038
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 13:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jod1-bUhchZS for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 13:21:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 73A5A82037
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A5A82037
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73A5A82037
 for <buildroot@busybox.net>; Sun,  2 Jun 2024 13:21:16 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52b938587a4so854940e87.1
 for <buildroot@busybox.net>; Sun, 02 Jun 2024 06:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717334474; x=1717939274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=czmtP8F7XOjYWObQ6XWP2EQ6BN/fH6V+BXH3OldlFPo=;
 b=CDZJ0wgIUB/5t97+2RQDGsKzOQSPsXUVr1b0JblIRwm+wNSR5skgavxpQHFvJeP/GQ
 zE4oyzSTMVERjtQ3e35yKXTvh0uoJ58prw9izCUQKWXraHOfQykycOMIxLJfhRk8o80T
 3vcIvTo6WTKbFhmVTZfZVJkeTYpuDt+7hFJUvJPLWEyetaZ64Ma2mJswEm8jmbuBuRjO
 b2hyCXCslDOW+KrhBJdKO9a14HGObNHjqi6jXmtpfF8RaeNRiIYtLrOHMH4c9p/0QO5x
 eUmk6YHuOwMZusPrj/ouyXV8T8GxrKDuiHZ4qoIYrK5Hcxi5Nt5uoZz4vYsbsILC2YxM
 lwzg==
X-Gm-Message-State: AOJu0YyErFMgKZ9bH3TvIOynwSEKWy1FJveIrRkUtHcF3tSlplsMuwPT
 Z6FeY9hDU1yMAgmdZvwNNc/PELQPLqb8EosyZZM35tJ021fxhKTTwDsGDsu1CunFttwd6uY719q
 FAg==
X-Google-Smtp-Source: AGHT+IHcbMybmxNhR4ZasKsgGCSr8T1sla2Hz2nhf5kAm5OsGz6I0CByeAU9gqbFIK1VvqOurjyJVQ==
X-Received: by 2002:a05:6512:289:b0:52b:8909:58b0 with SMTP id
 2adb3069b0e04-52b896c4af4mr4151951e87.52.1717334473860; 
 Sun, 02 Jun 2024 06:21:13 -0700 (PDT)
Received: from vm-2404.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212e96c634sm75241225e9.21.2024.06.02.06.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 06:21:13 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  2 Jun 2024 15:21:08 +0200
Message-ID: <20240602132109.937712-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717334474; x=1717939274; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=czmtP8F7XOjYWObQ6XWP2EQ6BN/fH6V+BXH3OldlFPo=;
 b=m88Hr3FanrsgjdcZt+2NStOu88A4AxrJ+0svi+fadY5rfIYoTAbQHnY8IwjBPYeKWK
 uX19fUBFxUxf2meXvgGz1pr2bSKDs6+riUrDnIWsvWwZp5ofELw7EkD9jNnSgy5T6wi8
 1lE1ejxqGnCE47ndFlH6xs47AdTUVD8QbDp9jpL8S4f4hgMRZD1aUuYDywNpk902S72N
 bOCY+bMFjbs+Df2dqKxbccrtbfW+l5tIWNwCAeczYRDy9xiBRK5/RyXBwTM57cNt8A6J
 rYUu85MQiIxiaLBAWNNxHsnD2sKl0xAOVT6+Pyluqg09Fbbes02RWyGRWo0TPBI697IQ
 77Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=m88Hr3Fa
Subject: [Buildroot] [PATCH] configs/mx6cubox: add hashes
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

and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .checkpackageignore                                         | 1 -
 .../mx6cubox/patches/linux-headers/linux-headers.hash       | 1 +
 board/solidrun/mx6cubox/patches/linux/linux.hash            | 2 ++
 board/solidrun/mx6cubox/patches/uboot/uboot.hash            | 2 ++
 configs/mx6cubox_defconfig                                  | 6 +++++-
 5 files changed, 10 insertions(+), 2 deletions(-)
 create mode 120000 board/solidrun/mx6cubox/patches/linux-headers/linux-headers.hash
 create mode 100644 board/solidrun/mx6cubox/patches/linux/linux.hash
 create mode 100644 board/solidrun/mx6cubox/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index bee31d240..f432efcc9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -230,7 +230,6 @@ configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
 configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
-configs/mx6cubox_defconfig lib_defconfig.ForceCheckHash
 configs/mx6sx_udoo_neo_defconfig lib_defconfig.ForceCheckHash
 configs/mx6udoo_defconfig lib_defconfig.ForceCheckHash
 configs/nexbox_a95x_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/solidrun/mx6cubox/patches/linux-headers/linux-headers.hash b/board/solidrun/mx6cubox/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000..5808d92af
--- /dev/null
+++ b/board/solidrun/mx6cubox/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/solidrun/mx6cubox/patches/linux/linux.hash b/board/solidrun/mx6cubox/patches/linux/linux.hash
new file mode 100644
index 000000000..8b8381e61
--- /dev/null
+++ b/board/solidrun/mx6cubox/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  639e50060e3c8f23ed017cb10cfeacc6ba88ff5583812bb76859b4cc6a128291  linux-6.6.27.tar.xz
diff --git a/board/solidrun/mx6cubox/patches/uboot/uboot.hash b/board/solidrun/mx6cubox/patches/uboot/uboot.hash
new file mode 100644
index 000000000..c1aeddf06
--- /dev/null
+++ b/board/solidrun/mx6cubox/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index 46a1400d9..bd94f3fc8 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -9,6 +9,10 @@ BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 6.6 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
+# Build
+BR2_GLOBAL_PATCH_DIR="board/solidrun/mx6cubox/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
 # System configuration
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_OVERLAY="board/solidrun/mx6cubox/rootfs_overlay"
@@ -36,10 +40,10 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 
 # required tools to create the SD card image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
