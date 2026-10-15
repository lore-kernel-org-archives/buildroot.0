Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48618CC6B2F
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 07:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE955605E7;
	Thu, 15 Oct 2026 07:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6OIjYbDCAukn; Thu, 15 Oct 2026 07:19:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC9206082A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792048784;
	b=jK/8OSpiNdbwC2po7ytZjcfgEX5RkCT2ipIsgYaOmDhanSmg5ue127mkwfYPN0O9Hw2B
	 xS5XDx6VwOc+efCZ/LbtoVJeRO/GgG8eQcNZADinaQ0BmbkbmszuHfKgyKuiIN4yJrh59
	 bwXCWrVUe5Eyb6JlpeRgPfgNJReWS5ZpJCKJ8704ArBItGne/bEMY0naA9z8olLOZCNJm
	 9NVPmTpKQw3g1yVv9p7wC7sBOwuO3S7vFlN91Vn0Bl7v2g+f2ADwWAE9BbyzONl3lNwkC
	 yh8gGlwTutGoCYmtz4Xup8miZypNBjDvvPT1h7ixTfx5r1jUNt8O6yJLwH0BMBJfwUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792048784;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=54NR8s0RVahmCX/a3nmStK0k+k82z1hD1q+owKIqLzo=;
	b=FqtIMrdnEjMbUzgYEAP2sxfvZOK6gDdCeWUuDUNS8uTtzYEA6xfJ5ojsxVlht5ImW4KF
	 4/XqGs/tM6kfpHt4HbNKkqn4r5utYMDGEv3yzPAJaRtUeL09GF2JbP1hzJB6Qke+QEseY
	 bLCLbNbGFTdG3sExKRVKd1Z9PHVBMP28seQtq8q5n1m9x2ToXMuBseu3mkiPzIpIia9lJ
	 vk77ZN00vQvec/CmRPovc27kxUuQ8X0Ke6EO2u82K3GCOVXkVTSAsehl8rt5q4zswcACS
	 ddJAZLPrz+D60/wXP0tkfrINUXPa+GpYaL7yHSJMY2/i9C0ylICT7k9AhMjzlUVB5Cg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=aQQoCB5D;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792048784;
	bh=54NR8s0RVahmCX/a3nmStK0k+k82z1hD1q+owKIqLzo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FN1XRbsE/HCbUMj24bAlqHSDZBNw41WXQbncORvcxFk7hK2fxn65isqgRPbslgifV
	 wG2VyHSUcqKs29ovbBM6OwW0ILYZdIV0FtsiaeLHsPSTdFFVT24MCQIQfp3tQz/SMG
	 wQLE922WokNzg5Rf4Dx35AjAQFcvQQa9pSSDXpucqrMKXVrgISggKX2OaU5M84pde4
	 HBg2WrXt+jDVSu/PY7KyUySavamibkbRNZLVIS5uknCDBrPlKDf8aGdWal5tpuhsum
	 7RCvKLZx1gEwd55XXn0gIA/1XYKDNsAtl+7H7FqWfex7luSUChw0wmom3WFQ4a91Vk
	 A8ROWG09zls9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC9206082A;
	Thu, 15 Oct 2026 07:19:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFC5F1DE
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E17386082A
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3XyGTUSRc2j for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 07:19:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C2014605E7
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792048782;
 b=UvQGjv4gQS/t7YVBsbJ4qk6555Rdykh3VcgIOoyA8el4abkjNTk2WXZPYnvjAgAuW8yT
 SfoycTMqVN61mku6/iOQCECJGZMF1DjjNvoUj9/bNTiODbE88/FT4t1XR5GSbF9ViOXvq
 ipcTt9lx/yiVwOaEQDELFKotkEZ2LApFE8xq7ufOsOIBgYnjow6sy9Tiwk5H74D7/TJYw
 Xk4aFEmtqyLzJbSlQE0y/m4dOfjHWgATdoaXg2+qS9uU1TrMQL9LAFJ0tPZL5Ho7CuJKd
 mTZ8vepzEFZ+I1rFULZihcJXLzKJKyMja3Q/o9V0g2wx9O/pJp5rRmP1ML/HQW2597g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792048782;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=t3b4OsTtiWf8V/TmTLHW8ujK+L9FHLP2Xpq99/70lLk=;
 b=G7ZPWd8hdBOst9/aLDUAitDRLnoqZ35bBw2HZa+zITP1v7LLf4CK3BpIRj88G+NhFGK/
 eDwyt8Fi44w6smVDaOfwp0ERN2toC2tKKvYGkEHkB9BFvjifCQNgJ+MXjHFW659kxdY9u
 8bb0Cn+iuxejHTj6xonZCjLIdT5NipptjiVT6/mQeKE+Hfrsk4aauXx8tUKZXPcipsNDG
 xcyPZ5qcboU5ngrN1X87T2geyx34ZeWfwCHKs/YGN9WTKH6462t25jyzTD5i4lNmgfVo4
 oXQgb9NUexBDIq/RTZ+c+v+VG1FLggYCAX3os+NW8RTIFGIeWwW5VdzQcDrAcBMjfoQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aQQoCB5D; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aQQoCB5D
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2014605E7
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 07:19:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a161d9b8c7so34462715e9.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 00:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792048779; x=1792653579;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=t3b4OsTtiWf8V/TmTLHW8ujK+L9FHLP2Xpq99/70lLk=;
 b=aQQoCB5DOsFLAfa06I96pSFXEa7nwf+tngmKGYA3+hLho9gP3KKgQvfnibNR8Iz7qP
 wwCwm6ZccgUL/v2m+d2hq0JvxnBxTUvj3JPH9au1rVgzpO9cu5YMXRCcfuVdBKVjcWMc
 VjtKLXAdACcjejDsJNpIcdvDYWzyuXsBd1Y7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792048779; x=1792653579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=t3b4OsTtiWf8V/TmTLHW8ujK+L9FHLP2Xpq99/70lLk=;
 b=IBIqUK5VB5/PXsBpICOHItZi4nL+XQ5kqIIjPuS29lVxrclu4oy96ORUZk9jlg0qm3
 KScMNtttg7ZhDX9yMMwvCo2hcxBORnCzacacIpg/7FmiwNo43ze1KGGWxrp5v7RI/zrU
 RKYk46XfBVP51UF38DSvAy4xep55ZwKeCUuEMHTHYRuDIt/hPnHn1OEWJLLmgj9shBi6
 CAcZ9Suuu8tv83++ext+VX4R/gBQw3JevDPgylRvYZJXX2E8HjnqyHfhMJPjlmJha7Zf
 zHqh4lsT1k1jhY7RK2qc3V4yBG0AQHh/DfjShnn1j8/SBC2megVv2MUOO4WGIpHSGhLw
 1YUA==
X-Gm-Message-State: AFq9FYIcru96CKILlyBqA6OzOve0Vj+T8AoxqhdNhq+yDeT7Xyt8qGjn
 GBBm3paD1FRZb4Wr4KEAruXgyDH0Z1IlC5dI+h5iOFBgo8inz5ca7l2QkXakveWQteECrTYGv+D
 r66EH
X-Gm-Gg: AYBFou1F0bw/1JU0W4rJfWRWEw9CYweRrcMV37uk/JtKAS3HPwLbzWX9R9b6ZvWN7r5
 DWBLzjV/rJvhvXrPGvQY7+hb0BBwaSSmnTiSpBZw+9b8YPbgmeFyu9GHbIkawdflbuXPHN85xTA
 nR8YzvLNmcJ681Ev2jqz/gr8w9nst14ztqbx7+Iw1PGrlDPEk2CetuRR71niGJRKiYBxZjxB0S8
 ivAF7wkEE/NCqFYb1k2Y/bm4wOe+cb1N5SK5cuvMquFXCcaEyUpa9EdkHV8IIWXu3V8ieCuMjIC
 cyfV6AKQo//tHu+Ly9Iv9Urf8RXZbgjVKWeIj1A+v8rSXTZWOYpjoKxBWVIVKOruivCVNuoEY+C
 whM3njYeXhZG5geTaEcXBYXkeOyiI9EXXFYE+ISvHL2J1rAU6S8Abw7J9KAJWhW2I60QKV936q1
 UEeXZKoLSrEZDQKCJ2w5en7TlLuTdqSrrHE/5Rbc9psVEkRPN7aM9ac16Rgc7N+YOPgSOPJBMHo
 1suCfeIgbxf4ted1EpUEZu745m4W922GzmUHH89M4S71iXp4W+O8wqNA2ZlA/6V5Cs=
X-Received: by 2002:a05:600c:4e12:b0:4a1:7f8e:6e5d with SMTP id
 5b1f17b1804b1-4a18e4a393amr393143135e9.6.1792048779230; 
 Thu, 15 Oct 2026 00:19:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c903:d469:8f3f:2c53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd98690asm51061095e9.9.2026.10.15.00.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 00:19:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 15 Oct 2026 09:19:35 +0200
Message-ID: <20261015071935.1063187-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd: bump Linux to
 5.15.222 and U-Boot to 2026.10
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

The patch bumps the Linux kernel to version 5.15.222 and U-Boot to
version 2026.10.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32f769-disco/patches/linux/linux.hash                  | 2 +-
 .../stm32f769-disco/patches/uboot/uboot.hash                  | 2 +-
 configs/stm32f769_disco_sd_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
index b4a6bbd3f783..20f03bc1d4df 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
+sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
diff --git a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32f769-disco/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
index a025bd780270..6732314c2857 100644
--- a/configs/stm32f769_disco_sd_defconfig
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.211"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.222"
 BR2_LINUX_KERNEL_DEFCONFIG="stm32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
