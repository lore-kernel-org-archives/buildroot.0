Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96938CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 21:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4481F4061B;
	Mon, 18 May 2026 21:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EsH_en84XdTL; Mon, 18 May 2026 21:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 711C64066D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779140681;
	bh=wL2ru0M3P3vYNDUsWWq/1ZM0QTkA3tHE0fZOQAKUwMs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OHiY/Dc5OJYb4eU1nVk/5WMDcszDparRL/O6swQEddBAt+KdA1SR1VU3K3HLyy5nm
	 jFb0MuBJNomDiPCuhx/Vnt+VxCtmzHeL8U6T6nHcVteiXkww54gjuprOJ2IDne8xFx
	 b/rvYhHbfQLNXv1ohsa7H61dHcwVOjCClRUgfAGXGDVnXQlK0hpyjB2tz3BAoCnfiT
	 tdWAeBM2AOoRSZeT1zC92fGiWPpx97516NAgewd8z/iu+F+ByEpsJxLgINcD9JTTFH
	 Jgx3yWPx6/bYCeHSASwmmZ2hhfc97QwNuzg2km1xi2uOSF1/QYgLQ0KkSnhRSgminC
	 lbU72YyBDIa3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 711C64066D;
	Mon, 18 May 2026 21:44:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26249282
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CB5F4061B
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfrW2S-Tc-Vd for <buildroot@buildroot.org>;
 Mon, 18 May 2026 21:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DB5C4066C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB5C4066C
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DB5C4066C
 for <buildroot@buildroot.org>; Mon, 18 May 2026 21:44:38 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-444826c16ffso2452494f8f.1
 for <buildroot@buildroot.org>; Mon, 18 May 2026 14:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779140676; x=1779745476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h1ePuXRrTfDFlQBbkpCbePW87dOypHZ+5qcfbojBUCo=;
 b=AMco7+40R4nhcBUqCuRpcyptw6ft4cCekgbG3m1Mx/Q1N4qXL1A5qOf7aGbkkCBELa
 sLRXCB422YXYqHpEel0UHroikURFt4eAlOZ3G3yQ43iDa7VYq+sWX7MwdxZ/I4yHHypK
 CSbdGfBm44bSR2sbWR1v2po00oGLC4m4jx6ld9Byw2bxElb+en6payXsd0Byn6qo1Jdd
 0GsoMsupIu8PaV973ENKrSVuyofzS5zAehTf+F6zYdIxo8MzkCBnaY4lsAwMRq9llvK9
 IBo9b+Em1xZ3mgWgp7LRx/9tHG9/0Ftb2vdKwf32kqPWmOQzsaCBw4omzuIMMBmYUKIK
 dmFg==
X-Gm-Message-State: AOJu0YyYeFM3l+e5dYtN0s/I35TWVpeyKEmt1fM/nhMVFHgoPYNxh/aX
 j1zzK5nHmD9qOFCiEmv3mTQgbBiOwFvVJ52vUgqgUrYXZZJhGSnLwAdTbciutg==
X-Gm-Gg: Acq92OE/0vBnCVDGyCHIF7MekZuYUzRfw341CrYAtu+eKH2ousooVgQvab/S6budh9x
 uca37/HxmQK17mFdUfDZe/W769mx67vkXha+z7XVS93dECeVhXPT+WXlFWWE1YkGj9ETqac2w3G
 AULTW72FFerg7VQmvcNDo3i4cZaMlDPsZkL0JQ2hSZa/Ny+H7rVdNolsEyERYwAH4SyWIkg+QKg
 lJMGQJHoyvvTtUzGwV08yRjhKVnwxNpFeNjHtARMsHHkJQfgeEWW3vo2wJjQM4EhsHmXqPDjXlv
 b6fneAucvfoTpVFPtPhrUrJLLGzPkCQtUBXG3gPpsI/Buhf4NpSikEQNrL4JjzVNV1/BdtuxZx5
 UJmWs30cyOL3T5y1SrF99ChYXCsRcv+kdLl/XnyzrLNGsV9EVFvX9BNvFHrzYKPSLZO6RFi4xYp
 jcxsug4sf/4ndzu7OYuoJUONmAwjg=
X-Received: by 2002:a5d:6401:0:b0:45e:73a1:90b5 with SMTP id
 ffacd0b85a97d-45e73a190c0mr9903520f8f.1.1779140676483; 
 Mon, 18 May 2026 14:44:36 -0700 (PDT)
Received: from localhost ([78.208.112.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3acf7sm39862853f8f.12.2026.05.18.14.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 14:44:36 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 18 May 2026 23:44:00 +0200
Message-ID: <20260518214400.1320545-3-mattianarducci1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518214400.1320545-1-mattianarducci1@gmail.com>
References: <20260518214400.1320545-1-mattianarducci1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779140676; x=1779745476; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h1ePuXRrTfDFlQBbkpCbePW87dOypHZ+5qcfbojBUCo=;
 b=LkzF70xQhJYKHoBlOQfJQwKDD1A0hFSZVlrxLw/w7tpVwk2BvRBvrKSassNYXwliUE
 cbiIAdeVdVqFiGLnBQ7YKk0zl47/e4XC4lkCfYZJZ7BQ5yn6m+f4uDCPO7AjgZR5jpz7
 tafpAemwxvn40gY9wO8Y2TSErJBfvDtcr7HRXqHZVDbVIF/mij9VlWrx9emAb7tXKEMb
 9K6d7+rH5Hbggy3mg+as9ZSwr3CFRsDtG4Jl4iOHNxzARwCzs3sikNwH32zO6WhRrZ2t
 Xdv7as4JdOvxLHZ5uZtczdvSmNhVBIbPaM6d5TZCqwGMN5I2cV68u28umIy80eR5LBNV
 aBZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LkzF70xQ
Subject: [Buildroot] [PATCH 3/3] configs/pine64: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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

Enable BR2_DOWNLOAD_FORCE_CHECK_HASHES, add custom hashes in
board/pine64/pine64/patches directory and remove the exception from
.checkpackageignore.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 .checkpackageignore                                        | 1 -
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 3 +++
 board/pine64/pine64/patches/linux/linux.hash               | 7 +++++++
 board/pine64/pine64/patches/uboot/uboot.hash               | 3 +++
 configs/pine64_defconfig                                   | 2 ++
 5 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 board/pine64/pine64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/pine64/pine64/patches/linux/linux.hash
 create mode 100644 board/pine64/pine64/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 691e2b8138..d7b7008583 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -130,7 +130,6 @@ configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
-configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/pine64/pine64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/pine64/pine64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..649ae8df44
--- /dev/null
+++ b/board/pine64/pine64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3ab7e90d6fc3364815ad7770d7aa7af9cfd68edde43da7123f5f38f80e034c44  arm-trusted-firmware-lts-v2.12.1-git4.tar.gz
+sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst
diff --git a/board/pine64/pine64/patches/linux/linux.hash b/board/pine64/pine64/patches/linux/linux.hash
new file mode 100644
index 0000000000..e810c7aa76
--- /dev/null
+++ b/board/pine64/pine64/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  067dadd445578284ea6158f312f7970d8940fed3e094dbe49cff66d188d3bda4  linux-6.18.32.tar.xz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/pine64/pine64/patches/uboot/uboot.hash b/board/pine64/pine64/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..d20ea61576
--- /dev/null
+++ b/board/pine64/pine64/patches/uboot/uboot.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ac7c04b8b7004923b00a4e5d6699c5df4d21233bac9fda690d8cfbc209fff2fd  u-boot-2026.04.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index a2e19b1a4b..9a77452a51 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -3,6 +3,8 @@ BR2_ARM_FPU_VFPV4=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/pine64/pine64/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64/genimage.cfg"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
