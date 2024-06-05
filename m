Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74321C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 09:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD0B408B0;
	Wed,  5 Jun 2024 09:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BioRcWbyfuzO; Wed,  5 Jun 2024 09:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDE43408D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDE43408D5;
	Wed,  5 Jun 2024 09:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17A911BF41D
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 09:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0502860ECC
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 09:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOJwNkKxhpkO for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 09:55:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 485FE60ED4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485FE60ED4
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 485FE60ED4
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 09:55:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-354b722fe81so4401343f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 02:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717581307; x=1718186107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KP4P2fnVbA5UUier/ivASETMUrL85wpCvKQ1Hg/fGWA=;
 b=XlhIZFcErNv053wsFMdXNJCfkhYqEN1QIIMwNZM4lWqV4hyqZs02xWSMjve7fdWADO
 s0o4h/pfj4kOabuHqiNJhNTGL42m5dKr6xXEP+51kwFb1M6rmyaTVsiewRb9ZsXZ09e4
 9+dTKyPpcz7Nfw0rzLEo4tTCuEqW3I+a9qIIIGlKakjb8WTNly5zyqeOAC5hpeyaLGlQ
 uPOnbCRpTq27t2quYH0cxBgS0b933tdfz9EEUWljzMX5MXTXKbGv0CVGvLfiTDfh/qKi
 GMCJMdZ9pF49ISCpCZifhokzLEhyT21tMCtpAMgc0XQuGjrqET+6W0j8WRNEUOCyJ26F
 JjyA==
X-Gm-Message-State: AOJu0YwUJI1VQtiY8bTSpCCsASpqvZyXAOLUXZEEIPda5YU1wnonW6dK
 TTQ1e3rH0CrFA7W86bfmoRcEtM6FIZG3Z5DrTW/ygQS+VgGG9z9e5PptTKiZt/kvDWN+0RvRwKk
 S
X-Google-Smtp-Source: AGHT+IHPQGmbvgs2JUGiRzB8PfMKTx1ViMn3d3DZrr7QbwLQa3qWmzvilboLWUgZgqH45aTsl7y9kQ==
X-Received: by 2002:a05:6000:2aa:b0:355:161:b7e3 with SMTP id
 ffacd0b85a97d-35e8ef7ea4dmr1813433f8f.48.1717581307016; 
 Wed, 05 Jun 2024 02:55:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c0e84sm14010719f8f.13.2024.06.05.02.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 02:55:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 11:54:56 +0200
Message-ID: <20240605095456.2994962-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717581307; x=1718186107;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KP4P2fnVbA5UUier/ivASETMUrL85wpCvKQ1Hg/fGWA=;
 b=fdRJfilFvlPjofh1DWswD+0ILhGObVqebLNUKa9ZsbYRqIGOQ9HjcuU1PN6an1CW7g
 wAjBPogF5JxY0+wrK0RbOIh61beCCLPAOQZBZUjX4QX1Ync56n+DS1/rUVF9/Fbam5qI
 P6n3tfcnKq1kUHgh7OJ8eE/QHpk5SYRwe7Yak=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fdRJfilF
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: add hashes
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds .hash files for Arm trusted firmware, Linux, Linux headers
and U-Boot and then enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we
can now drop the defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                             | 2 --
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash      | 2 ++
 .../imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash  | 1 +
 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash     | 2 ++
 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash     | 2 ++
 configs/imx8mn_bsh_smm_s2_defconfig                             | 2 ++
 configs/imx8mn_bsh_smm_s2_pro_defconfig                         | 2 ++
 7 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash
 create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
 create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 8825d644ab5f..6a0276759e10 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -196,8 +196,6 @@ configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7d-sdb_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
-configs/imx8mn_bsh_smm_s2_defconfig lib_defconfig.ForceCheckHash
-configs/imx8mn_bsh_smm_s2_pro_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
 configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..80e592dab606
--- /dev/null
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  fc4cdac7c08fc398b6d4b705285dc13ac2d2b30a7449c6f07e9ccd81207241df  arm-trusted-firmware-v2.5.tar.gz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
new file mode 100644
index 000000000000..b017ef2a893e
--- /dev/null
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3e4d8e561da5703a205ae8d7b2bed6c5c64fc4299eebcbfd20481e63b57d5ee3  linux-6.1.6.tar.xz
diff --git a/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..7cef5b688ec3
--- /dev/null
+++ b/board/bsh/common/imx8mn-bsh-smm-s2/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 8b2b74395efc..841512ed1a16 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index e9ff244a3555..b4553ceb5214 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_GLOBAL_PATCH_DIR="board/bsh/common/imx8mn-bsh-smm-s2/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
