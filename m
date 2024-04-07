Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA54CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 526FF41E3F;
	Sun,  7 Apr 2024 10:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9PukLyktGtHw; Sun,  7 Apr 2024 10:35:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CAAA418AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CAAA418AD;
	Sun,  7 Apr 2024 10:35:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7FEEB1BF575
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78174822AF
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feI9Z6tTcnXF for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02D40822A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D40822A9
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02D40822A9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:21 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d8863d8a6eso4961881fa.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486120; x=1713090920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Q2TUI1EDnTE2OuXHC8yATIvQYcs8fdX8Myo7ufKLuw=;
 b=ONkETC80j62ijreZVD5nz3Kn5VUvh5NNh1b2aRPfz6HmUmkfzy6no9zuSrQ3/mEw4O
 ePK2aiiiQmRJ9GsKHbLuwH2We7GWy4nN152n+a1MdB1cNMrZweziArC1REnI8ENsPiSm
 Hv7f47nknQV+5ogAqqje2IcTp44PrX90o8fSaBk5xrhXN9J8jQJbn1NoVNBuqpiKras8
 lAlzwjfqDoX8dwwoVTyDjPgAdEhSunG4a6khr42Xm/a/sKOt9ruSAhLUncqV0hZVsrSv
 P1E30iy3Uz9aJ5ZmXxryB2tJ5Vh72xnoxqVnQg6mwVPLqInb8TVEi/5Er2I1kfVIcYst
 0dtQ==
X-Gm-Message-State: AOJu0YwyFisZAIXlSOxXLPef7Y86FDwwn5a/d0kWbUX+AC2MjhCrQW0e
 N7GDFRyMOrwbK/oZhJh4NAhRagYyYWWcMLaiuvxI0mrGrlFZvbs5ky/hgi9CoXFz+d9biwoChiT
 a
X-Google-Smtp-Source: AGHT+IFBGtMczBKNRBcMnWvnyauXWx3ZjSuRnIraOeFLr2avDv1FvapDnPYdp+W6F8+CiXVcDy8MJA==
X-Received: by 2002:a2e:8816:0:b0:2d7:10a1:482a with SMTP id
 x22-20020a2e8816000000b002d710a1482amr4458105ljh.31.1712486119781; 
 Sun, 07 Apr 2024 03:35:19 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:19 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:35:01 +0200
Message-ID: <20240407103512.1112712-9-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486120; x=1713090920;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Q2TUI1EDnTE2OuXHC8yATIvQYcs8fdX8Myo7ufKLuw=;
 b=bFXIZB/M2Mib8AEeH1M/VqPAm46rvJuqK3kNbLGrUcvfmiKyeZt/wPXbtTnCNHn8cx
 bXbLBzY1ZzF8DXT7VibUA3YQLQvVgRf90ktmpdqcO2GsnJMmHkchGnqp8vY+1znVpZff
 32rJnNK4Tz6Hy546CJOgB1hF2AtJOmHO0Pe2LsYezK3bibF21Z609GJmHbEKCU82VsEG
 26PuMA3kl6L+EHT6RKyXovxrUoHx7BPTcIOLmZtx82iFQoSoM0F5dPvmg/1z3uOUo1Xg
 hRY9ZtKfoAAj2UOrFeBIObjulvchCVgvaHS0wQTWW8dgoVc7v3YyT8Z/fMhoYwNLE3mW
 ummg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=bFXIZB/M
Subject: [Buildroot] [PATCH v12 08/16] configs/ti_am62x_sk_defconfig: bump
 Linux version to 6.6.18
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Tested on SK-AM62B-P1.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v11:
- Add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y

Changes in v8
- Bump to 6.6.18 from 6.6.17
- Update commit message

Changes in v5
- Bump to 6.6.17 from 6.6.1
- Update commit message

Changes in v4
- Add BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6 to ti_am62x_sk_defconfig.

no changes since v1
---
 board/ti/am62x-sk/patches/linux-headers/linux-headers.hash | 1 +
 board/ti/am62x-sk/patches/linux/linux.hash                 | 2 ++
 configs/ti_am62x_sk_defconfig                              | 5 +++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 120000 board/ti/am62x-sk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/ti/am62x-sk/patches/linux/linux.hash

diff --git a/board/ti/am62x-sk/patches/linux-headers/linux-headers.hash b/board/ti/am62x-sk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/ti/am62x-sk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
new file mode 100644
index 0000000000..cedae67f33
--- /dev/null
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index 7a411ed423..d4b19e5039 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,13 +1,14 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
 BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
