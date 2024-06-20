Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB83C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 18:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44BD440584;
	Thu, 20 Jun 2024 18:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEsTBCzxXWKA; Thu, 20 Jun 2024 18:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFFEA405FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFFEA405FA;
	Thu, 20 Jun 2024 18:33:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3FAC1BF3DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD90F42F52
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4KD4nJ1UMYN for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 18:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5BE8042F4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BE8042F4D
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BE8042F4D
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 18:33:13 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so1282450f8f.2
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718908391; x=1719513191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9xvLP9g1JA4qq+W4hzAyWGcz7a3Gpdt7WITk93eYas=;
 b=sARzAiJHag8aLGXctMtRE5xhQ22nKOYP5kJoimdIty0BnjkdXK70JfQ6/zI6XXlyMW
 8NLGmBoBPRFZJLz22U91FVehfrB+xEfe2U1HItnzG/RC84mEdqFmd4LVSIlg5yLI8P5k
 YLG+Eb6VghQLgaFX71FADzkKjsBe8qiufdK48dk9HUV2s6drM2QAeCPx5XcpLZB4vEL1
 nMxcwwetU68usFgGWQslbsyWr39Khjz4ZRD5QS9QZLGb/SGoL7IBsdnqgdJv4PmtDdPe
 EvnZlktihm3k1WB6GJjoc+xP57jsW/vDtcSNrMr+nonhdlxIgdpatDB+PIYxTbNHRpoJ
 2SaQ==
X-Gm-Message-State: AOJu0YwVyUz79CQa/jKjA3wQu6d6uSxokKvSa7QGBjGUIfL09YRuk6JF
 Gp1m6FtXy48C5AFs5iG8f7dQPUocrEn123f6UkJqxMIMt08uoMtKOE8CWPQaL9QNLOgXCKVO5gv
 V
X-Google-Smtp-Source: AGHT+IG5/F6dLy8Q6kfsOcwgaEUUc6TNj/2HNN2+JFVNrjMZrHQWztnZj2+Jc/GU7p4eqW+c1XUZ7w==
X-Received: by 2002:adf:e9c8:0:b0:35f:3189:ddd2 with SMTP id
 ffacd0b85a97d-36317c79ba6mr5195651f8f.35.1718908391008; 
 Thu, 20 Jun 2024 11:33:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.38])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3646b7ed012sm3053122f8f.49.2024.06.20.11.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 11:33:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 20:33:04 +0200
Message-ID: <20240620183304.1835189-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620183304.1835189-1-dario.binacchi@amarulasolutions.com>
References: <20240620183304.1835189-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1718908391; x=1719513191;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9xvLP9g1JA4qq+W4hzAyWGcz7a3Gpdt7WITk93eYas=;
 b=bnSab3xv3K+hOgqTLu9m+d3cH5XNloiYIsQBp7t7bSnP7ZOmNKwdVsgOPB5vTwl107
 98vqZREnOlqMRGQTqamFH6hhFSQOfUlpSOR0XBjHYFsX0yDhK4L0o2U85cULwsyE3N9E
 gD6+W/26hDfCEW0Ielpl7lO+01tczW/OVj9Bo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=bnSab3xv
Subject: [Buildroot] [PATCH 2/2] configs/stm32f469_disco_{sd,
 xip}: add hashes
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds .hash files for Linux, Linux headers and U-Boot and then
enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 2 --
 .../stm32f469-disco/patches/linux-headers/linux-headers.hash    | 1 +
 .../stmicroelectronics/stm32f469-disco/patches/linux/linux.hash | 2 ++
 .../stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash | 2 ++
 configs/stm32f469_disco_sd_defconfig                            | 1 +
 configs/stm32f469_disco_xip_defconfig                           | 1 +
 6 files changed, 7 insertions(+), 2 deletions(-)
 create mode 120000 board/stmicroelectronics/stm32f469-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 3f184fded529..1c537f8b13aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -330,8 +330,6 @@ configs/solidrun_clearfog_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_clearfog_gt_8k_defconfig lib_defconfig.ForceCheckHash
 configs/solidrun_macchiatobin_defconfig lib_defconfig.ForceCheckHash
 configs/spike_riscv64_defconfig lib_defconfig.ForceCheckHash
-configs/stm32f469_disco_sd_defconfig lib_defconfig.ForceCheckHash
-configs/stm32f469_disco_xip_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157a_dk1_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_dk2_defconfig lib_defconfig.ForceCheckHash
 configs/stm32mp157c_odyssey_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
new file mode 100644
index 000000000000..5da44436797a
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d629f78680dc4b65e3d78b61406fb7757b960c83c206e63ad8c2606b3e3c474c  linux-5.15.161.tar.xz
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..97a2b4eaf95b
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/stm32f469_disco_sd_defconfig b/configs/stm32f469_disco_sd_defconfig
index b5358deb5271..0bd598a1a66d 100644
--- a/configs/stm32f469_disco_sd_defconfig
+++ b/configs/stm32f469_disco_sd_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
diff --git a/configs/stm32f469_disco_xip_defconfig b/configs/stm32f469_disco_xip_defconfig
index 0afcec8ef043..b2e952ab41d9 100644
--- a/configs/stm32f469_disco_xip_defconfig
+++ b/configs/stm32f469_disco_xip_defconfig
@@ -4,6 +4,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 # BR2_UCLIBC_INSTALL_UTILS is not set
 BR2_ENABLE_LTO=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
