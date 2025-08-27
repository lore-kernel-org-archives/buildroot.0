Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5679FCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 01:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 118A980EB5;
	Wed, 27 Aug 2025 01:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImcV9SRHN8xx; Wed, 27 Aug 2025 01:07:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A8880EB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A8880EB1;
	Wed, 27 Aug 2025 01:07:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BF61114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 01:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10E1E80EB1
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 01:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_MeSqhglbVq for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 01:07:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBDC180EAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBDC180EAF
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBDC180EAF
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 01:07:56 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4b2979628f9so69327601cf.2
 for <buildroot@buildroot.org>; Tue, 26 Aug 2025 18:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256875; x=1756861675;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JtEnXfqjFd/kx5z2xxJe9RaE5pOal4l3Xmqq6VHlHPs=;
 b=PRSWNzQSV1pFG3SrrCMZVgDWM2j6ZYM1EpjdMGSZtcdscgL+nApPppoBMUhDCfhKir
 oFGeceBc2cmUTh4bmWajFQCgjrZOR6d8IETEyR8gb7edymuwfrIeQ8fUa88vG2SKauSz
 1/71fjXwI32zVxGGoqUN/muTj7rofAGBf9YtDGcfDBuvrTfWlrfy79Pi5ljtc3qmFMrE
 ZdBRVPQHQAILqYDOnQUla8Jj6N+MNNV2j8KcOckL0bLEyTfySoIwReC4AYztq2hYnE7c
 kVYbIWTQUNtPQsivyPoNkvV4gOxYUaJmLWB8maG7HnG7Lumw/PP1JjWVJ9lWBR1OoKPe
 SjQw==
X-Gm-Message-State: AOJu0YzjYtyhwhRcpXN4vk8UFIWLCAeSSJwFl2Oqadf/ozmjsZCqCpx9
 VzWC5vt/f0gTspI+YWUyRYzA9NovkyvDlmeF3VbqS75e5GUhdg+JeDqwJupCZg==
X-Gm-Gg: ASbGncsp+GgGGq1LMOcQkt0oHiScUUiuN3bJNP37B8QOQc1unXKj6WTGdYK7m0RKLqM
 URs+0bMXm0iC0U39+tskLqQUOBjyLBJoiTDA+xnilC2lFNyo3zvwXeUyHRRaYl3YZ+vXd8gDLC6
 y0WeDB5Lnypzrc+KnuALZXn2zxNHdES6TfJ4ewLPJt33M/qAx95htfP8f939xy8GhuWQjMPgvGI
 xkP6iFlYXmb1wrUKR2YaW2s2sMzNfSMVSueAHYPMfOS2CJlN589f1cqljtA6FSJWeTtpzZn+m1C
 +Wl5p3d4hdztWnB1HHEO9XVyAiPjrObObN/Yhz7UgpFyWOJo5KcKJ19bERIqcKOb5biLNiKSvYO
 dR/GHDoNHRII0YHGKvGw7hSXhDQp8MV97VnOrhSwtSa8ffKc67xG5gHJ9CK73j0wFS+LRaohC2M
 WIcnWYsg==
X-Google-Smtp-Source: AGHT+IF/CYQ4QG7MWICk++VW3iQ+rT10FyXp3Lb02oRn6xPKsYHzsDW+UsF9qlWLCZjQwUvvf0lxXA==
X-Received: by 2002:a05:620a:372b:b0:7ee:84f4:8134 with SMTP id
 af79cd13be357-7ee84f49bfbmr1816997785a.73.1756256875358; 
 Tue, 26 Aug 2025 18:07:55 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-215-125.bstnma.fios.verizon.net.
 [108.26.215.125]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ebf473a6d5sm773087985a.74.2025.08.26.18.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:07:55 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>, stephane.viau@oss.nxp.com,
 festevam@gmail.com, maeva.manuel@oss.nxp.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Aug 2025 21:07:54 -0400
Message-ID: <20250827010754.1861172-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756256875; x=1756861675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JtEnXfqjFd/kx5z2xxJe9RaE5pOal4l3Xmqq6VHlHPs=;
 b=K4g22sGN10f51ceeFGXtPEOOIMYH+8WhQdyTJhSr6UWmw5igfA6pCyMFSAYOmT/SXC
 zhsGGkPC9oQkorIP0LhJmLXXCv4rJ2UNJ0+uMZ9QccbOc6lEP4YC21hAufwBn9TXUcy7
 oWEqDHptPUAEzCAnTNMy67ELUyIY0hdjo3hdZIiIKayKohrLV4Bflz4GuDQMu9FJ0UHR
 yBoSbBIGNvtzSUlTrLRJ1rNyJbXIs318YT1Wtrofgg4WMbHpQusZoOTdP+83KOSOH1Uq
 kWkWGfzcqBfqxnHDNhKxYJ1thwXrxiAuWPF8Jbx8cNsr59G8FAaRmBNutGl2hvfcdDsL
 CVrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=K4g22sGN
Subject: [Buildroot] [PATCH] configs/imxrt1050-evk: Check hashes,
 use bootlin toolchain
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

This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y in the
defconfig, bumps kernel to 6.12.43, and adds custom hash files.
The exception entry in .checkpackageignore is also removed.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 .checkpackageignore                                       | 1 -
 .../imxrt1050evk/patches/linux-headers/linux-headers.hash | 1 +
 board/freescale/imxrt1050evk/patches/linux/linux.hash     | 2 ++
 board/freescale/imxrt1050evk/patches/uboot/uboot.hash     | 2 ++
 configs/imxrt1050-evk_defconfig                           | 8 ++++++--
 5 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 board/freescale/imxrt1050evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imxrt1050evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imxrt1050evk/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 4591ff173a..b9270da630 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -156,7 +156,6 @@ configs/imx6ullevk_defconfig lib_defconfig.ForceCheckHash
 configs/imx6ulpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx7dpico_defconfig lib_defconfig.ForceCheckHash
 configs/imx8mqevk_defconfig lib_defconfig.ForceCheckHash
-configs/imxrt1050-evk_defconfig lib_defconfig.ForceCheckHash
 configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imxrt1050evk/patches/linux-headers/linux-headers.hash b/board/freescale/imxrt1050evk/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..0cbef7998e
--- /dev/null
+++ b/board/freescale/imxrt1050evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
diff --git a/board/freescale/imxrt1050evk/patches/linux/linux.hash b/board/freescale/imxrt1050evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..216d9b9d39
--- /dev/null
+++ b/board/freescale/imxrt1050evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
diff --git a/board/freescale/imxrt1050evk/patches/uboot/uboot.hash b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/freescale/imxrt1050evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
index fce2b831f3..0574eae981 100644
--- a/configs/imxrt1050-evk_defconfig
+++ b/configs/imxrt1050-evk_defconfig
@@ -1,12 +1,16 @@
 BR2_arm=y
 BR2_cortex_m7=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imxrt1050evk/patches"
 BR2_ROOTFS_OVERLAY="board/freescale/imxrt1050evk/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.43"
 BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imxrt1050-evk"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
