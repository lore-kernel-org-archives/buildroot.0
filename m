Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95190C25B78
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 08:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F211405E1;
	Tue, 28 May 2024 08:10:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4r_yY0CaBIg; Tue, 28 May 2024 08:10:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E0D405EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E0D405EE;
	Tue, 28 May 2024 08:10:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE70F1D2566
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 08:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4D0681975
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 08:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZO3x8NIvgwo for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 08:10:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BEF0081AC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEF0081AC4
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BEF0081AC4
 for <buildroot@buildroot.org>; Tue, 28 May 2024 08:10:40 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4202ca70270so5882965e9.3
 for <buildroot@buildroot.org>; Tue, 28 May 2024 01:10:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716883838; x=1717488638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EVGGfRote5pVXFsa0Klv8C+X1vKB3YNeVDPZecwO/SM=;
 b=DOen0yv6KmqBENBkKX+Jds1Zm7SSGBjGWHq07k9HXID/i4kCwbfJRF1x4dp7QtNsdC
 vOt9nD1KEWLqGfV9BRS+bAUFBFvn8530H7W/GzANjD5r+TSxb/5oOJ6GHrMc87ZQg9RC
 fF9Z4EN8hfX/1eumTkLIbqjLmo2cr6tHVX+1zR1WM6iNNw7p8ru04j/j+LxZS2p9NrJA
 ps+wjSNEuHU0h1VOneovM9to3BP3dq5MjoHxohveYaVDlPG0F38m7pEg3ks0a5p5UeTs
 cgrHUzwXahHUwHAeUmS9EGDyZzTtyZJg5pBJcbS92chqq7VmvVTqb3ElsA1y74xQ4eAq
 zdPA==
X-Gm-Message-State: AOJu0Yygh+Z7CR4kKoFgmT00rKcm2A2QlY0rcHRtub5fcN7mr0z0n4Vh
 XoXSgCJqPOSE9nFMm8cdueSdN9nRgGU4b+834al9wm5AULT2SvQOloCA+pIPFhnC6IHu1hdm1Oe
 8AnU=
X-Google-Smtp-Source: AGHT+IEaSkrI+g7sXC0egGlUHAJE6fQepEPSq4LuuZHzfpQHoNL6o2m3vZxOpQIanlH3RJhRBYwnDw==
X-Received: by 2002:a05:600c:19d0:b0:421:20ac:1244 with SMTP id
 5b1f17b1804b1-42120ac12d2mr3742835e9.22.1716883838604; 
 Tue, 28 May 2024 01:10:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.42.226])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4210897bbd2sm134854995e9.21.2024.05.28.01.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 01:10:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 10:10:26 +0200
Message-ID: <20240528081026.175912-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528081026.175912-1-dario.binacchi@amarulasolutions.com>
References: <20240528081026.175912-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716883838; x=1717488638;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVGGfRote5pVXFsa0Klv8C+X1vKB3YNeVDPZecwO/SM=;
 b=TE/m1c40IL8TOkaP0NuYZm0Dy3ZRlqQuQC96x9nZ/3bSXE0d33sklIGINcZH3dauMD
 ZbdpGQ7haf/yKLtJEn+K2CfaKi/g5GK1/IItU6ouxTHkKo1mBBKvNb7+vPiNfPNG0YdF
 T4V9U1e6vgA0wjK9yVxKKWMzTWVPqLtUEVUxA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=TE/m1c40
Subject: [Buildroot] [PATCH 2/2] configs/lego_ev3_defconfig: add hashes for
 Linux/headers/u-boot
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
 linux-amarula@amarulasolutions.com, David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                     | 1 -
 board/lego/ev3/patches/linux-headers/linux-headers.hash | 1 +
 board/lego/ev3/patches/linux/linux.hash                 | 2 ++
 board/lego/ev3/patches/uboot/uboot.hash                 | 2 ++
 configs/lego_ev3_defconfig                              | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)
 create mode 120000 board/lego/ev3/patches/linux-headers/linux-headers.hash
 create mode 100644 board/lego/ev3/patches/linux/linux.hash
 create mode 100644 board/lego/ev3/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 1070281f98f7..b779e5972ed2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -218,7 +218,6 @@ configs/khadas_vim3_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_bl_imx8mm_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_pitx_imx8m_defconfig lib_defconfig.ForceCheckHash
 configs/kontron_smarc_sal28_defconfig lib_defconfig.ForceCheckHash
-configs/lego_ev3_defconfig lib_defconfig.ForceCheckHash
 configs/linksprite_pcduino_defconfig lib_defconfig.ForceCheckHash
 configs/ls1028ardb_defconfig lib_defconfig.ForceCheckHash
 configs/ls1046a-frwy_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/lego/ev3/patches/linux-headers/linux-headers.hash b/board/lego/ev3/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/lego/ev3/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/lego/ev3/patches/linux/linux.hash b/board/lego/ev3/patches/linux/linux.hash
new file mode 100644
index 000000000000..1e3c6eef40a8
--- /dev/null
+++ b/board/lego/ev3/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0c68f5655528aed4f99dae71a5b259edc93239fa899e2df79c055275c21749a1  linux-4.19.tar.xz
diff --git a/board/lego/ev3/patches/uboot/uboot.hash b/board/lego/ev3/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..c53d9ecc5cec
--- /dev/null
+++ b/board/lego/ev3/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  312b7eeae44581d1362c3a3f02c28d806647756c82ba8c72241c7cdbe68ba77e  u-boot-2021.07.tar.bz2
diff --git a/configs/lego_ev3_defconfig b/configs/lego_ev3_defconfig
index 656222c69f6f..4c1a8dc5b0a0 100644
--- a/configs/lego_ev3_defconfig
+++ b/configs/lego_ev3_defconfig
@@ -6,6 +6,7 @@ BR2_arm926t=y
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS1"
 BR2_GLOBAL_PATCH_DIR="board/lego/ev3/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/lego/ev3/post-image.sh"
 # Linux headers same as kernel, a 4.19 series
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
