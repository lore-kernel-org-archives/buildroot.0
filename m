Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449D3CC6B27
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 07:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6837D80DA5;
	Wed, 14 Oct 2026 07:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GgPunQKYtFt; Wed, 14 Oct 2026 07:37:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4FFDD80D84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791963476;
	b=dJvP01U4TrJRceOgeAp53jYHSEj/91HNfvMf4Hro2c2pHBsj+zOgTgIG8u687J0NsRx2
	 a3MoNPODIZhN3G7GrjOUZCxQuMiSwZlSzh15ZuHi+Gx+3OL79WI7tcQrMCRsw1cnKedmC
	 lJVB1yNIQ09JNEqsQXLK1nJuxAZaTlp1VypVKSScLWXMX8GA8p78BAIIDuvbZZ5XCxZ4t
	 5LfFwx0QQinDnHDJlSMCY8C39KaUx7J1uQ6esTsQBNJfbhjYdp44vnJZoed6iPGPLtlzG
	 j9XkiVFZ03ASoGLTbJdzHDKEMNUybG3Hrc8I3pCzJnHj3GnjdiEM6ahQLS2MLqbzdGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791963476;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Sgqvi/xfoXK8YWKXZVCmX3FRo6I8h9IxkdPVM8TZHfM=;
	b=DRY2leHJKAsSwJpKMStVfOVNIb9GYuZEON2yIx2FThDtwZr8Co98uBHC/WbugaEEo8He
	 eOqk47fG9jayXI0QOeej0fdhFU0RgY/+6p09Zgd5NWeQ68aJ0dkgIo+rTL2OIbRnqhFWH
	 xLe9fPfaeVXnGjBGTnKgD4XuJapQ80Q576C71P0eAb+l0GwRsgx4MZe0bWSzD7dXn4Flw
	 qDnvhB7Ujm1sVJ5sYL9HckhfEjRonUNgaB9TGUKygMKz0ZJWlp/HF+Pk3xQnDZOoRsrc2
	 TNuav/me1ZYx+HnR58GwyeVRWE1dnfvBWBVkRavnlpASInVM84A7CkMMyV0bboBEm0A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791963476;
	bh=Sgqvi/xfoXK8YWKXZVCmX3FRo6I8h9IxkdPVM8TZHfM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dSI3x7isuLeh96I+7QJQSRnHYfrqhgaboU8bm9/2hTsmWquf9dpKA/Ro9+xxLGsXk
	 lGN5hx8oQy8kfBeJ0rWsViFqRoKu/UA0BzWjXFVttm2hSLrNTN7zM/MAd0AmbVG7Mw
	 2Ax/kWCT7gNaoKCbVbBQTap6RB9NLiShh+AFazOI1L7q1YrelbxI5Mswkc9Rh7AR98
	 3dLOOpT6NveX4xqlubtMp/87qBrSd9h09DaSspK17ag3LTGWR99hUnlamFTSMIOEU2
	 TUoyt/83t1fRv4RDt0oMtOMlWJjTFVHq/LtXNUU6rwWM3YOVC/gO/2/ZwS9lkK61Wu
	 dZSDV+9hiU67A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FFDD80D84;
	Wed, 14 Oct 2026 07:37:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39EE71BF9
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF7B405B4
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDFhTYYkP7i1 for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 07:37:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A4847405B0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791963472;
 b=XqAWxkl0lfrm2Eu0u0zIS1eRZPeOxcccpBL8TP7O9/l5kEOagxqa4Zd2q9npiFpsizyd
 6Ag20pjK5yrS8Wa8J7tv5NbVvlqEFFjEN6r7ZvqDhmjKJFTLoOygH71f3GLuguhyeGQZW
 /d7ScXyu4v8yd0BbGLmXLYDGaPUJdGX5Bvy/IHqkob8m2U2kVmXD3aPsijARmMxcQ3oXw
 M3rPAeP3U0/JjlBOHEjIIJ4Za50GPbAqAkWJ1cfJA2Y7eca9r8oS74+gUMZ1LKwAwvebH
 n/DaUzY6zmCPKmO7sqkIimG/4hkPFqpLrfSsdSNsMNJUMNsjw4Xa7qzOrZ3sbL/nxYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791963472;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=aM2Xs3a4o7gHrLpa+f5jxvPLJxjs8U2GBZwVzvrEhCc=;
 b=ZNb/2nUkDZbVR8QOsHBvvk8z1J+yldHU0jbLH9UAjV0J1ms0y+7CvMRvWUWazQk5/MTx
 4axt6+o5cHUXfZcYslCOT4OzXTUJmuv3dGwdgX8s8jB7jXcudfkYjrl/L0NveDl5LNKcx
 MGElcnR+mXnHT0+9/HRtu2WDuiM3kdrCiEETk6/IjQoXk6IhBW8PF+n6Js4Qj59p74CCe
 E72uazGXS1fL5cMy2EAZ9cFFnvdtw5FCLVN+XHiPdlRrONMRR3VZ7sgwb4GnOn0L/ttVt
 k/yRf5hb05c2M7OoCqyyk8URGqmSCliXaI3o3CNeROXXJHR1AL4Gm2XBISvvWkDZB/Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QsYUC25Z; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QsYUC25Z
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4847405B0
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:37:50 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-48b060ec084so2429144f8f.0
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1791963468; x=1792568268;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aM2Xs3a4o7gHrLpa+f5jxvPLJxjs8U2GBZwVzvrEhCc=;
 b=QsYUC25ZKfVoSpAv950y9Sqv7LDkixvtTgNOkWF2BwhKAHzhbHGdTwecDjbMsd3kcN
 MeYGFD4gmBExr6oJcDZLWRcSz4qwzEBt79rO4Mzj1AJiZ6QuDw3/NQ8QK7CPJu7kqCMI
 U+Y3entdxd0H1cvD2mqlqoXWzBrn4FNhZpYpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791963468; x=1792568268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aM2Xs3a4o7gHrLpa+f5jxvPLJxjs8U2GBZwVzvrEhCc=;
 b=USy6eytUSRbvUGXnR+NAVtjShkOgetIUCg7PfrvBkPts9F28HDeU9/Q3ti4vZtHOOG
 r631NRgO3jEKn4Yl3d+o/vyutCs+a41UteAQ7pOfgk6EwAVfOKj1s+i+3FEyBISbhHBN
 /hy55zgePIze2FHirzlgP0ntZ5v+UYX6maC69kyqjUow246xdRaQgDKkCvvdOjtKy8Y6
 HEuRXaARwvv8Sl6mCVsr8FmUvVsOzokw5K2uJcjxQzDH5iUGtgfR6GXIf6ez4xHTolTW
 ihFLe0gku9RoUub43rmrkkZ2OlGWRMwji/xmbo7VphCdqTpmzjmhvM3kddt1Wd7oXcMF
 pEbg==
X-Gm-Message-State: AFq9FYL0G2kR0SgmG+jYLA2TFRtCv1kw/s5s9Z0X6TVn7whhGIFdy4J8
 Epc3A1019x99x4k9Q1Fk6thOqrxbQPhK0HtEcQ/fm+pKIcjW4rbedzWAgHknjoVD/ULdnC7W8xJ
 iuhcs
X-Gm-Gg: AYBFou2NYGnuK25HFyLrB8G1PrR45opqdOu7riDuCHpUkRNuDmq80hfVkPg//ELag5F
 TDUNrDbCE/ovaarDXmyckEf9GUAES7YtxY5Fire/5o/fjkZM2V28xreuz2DCfDTmmKV1xAVfDGN
 mC11s0E1XbwCAYMltK1XxO3kwRAyVzsRSlboN/+Jok+3MChsfc7gil8OIZwxxqAuOl7ggpfZqnG
 7n8LzahutTkKBrUxKyK5A2soLlJ9fA7HJ81OhUCt22vbYyvOVC7A9eGbNPZE5+c4VBzbCnWIVHd
 qWt+o4bGldE3toZRDzOQl8ASEhnqKLNWZOsJxi0Vr5vFVFWYdrF5uO4qOL7RjlrpbRKHmnazECw
 iOtn9SUp4ae6AsKnTbo1lCqfvshFkY2JTzUuXEzKe+7Vb4AbA43i9pQia5Aklcu8Jcnk25Y+meW
 qaT9B2QhKL31PhrpG9ujhoQgZuuw5F6IJ5nU2jx3oxtCbTkz77dPIqpIpEmMH6arkkRwjZa9UhC
 wb71g95BuRFqf7Z7Z1SWTP37XSlq+UhgD/smVyGPb3TVExvGmZNfrVSi56qkJeX5vY=
X-Received: by 2002:a5d:6543:0:b0:48c:490a:3361 with SMTP id
 ffacd0b85a97d-48dbaae8c67mr20376762f8f.24.1791963468527; 
 Wed, 14 Oct 2026 00:37:48 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:ad64:a410:4d28:fa10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de70079e7sm4993401f8f.11.2026.10.14.00.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 00:37:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 09:37:43 +0200
Message-ID: <20261014073743.3673307-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014073743.3673307-1-dario.binacchi@amarulasolutions.com>
References: <20261014073743.3673307-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/beaglebone: bump Linux to 6.18.56
 and U-Boot to 2026.10
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.18.56 and U-Boot to
version 2026.10.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index 00eecaae3b46..248ebc09ad22 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ac26e508abd56e9f8b89872b6e10c49fc823bcc70d8068a5d8504c1a7c4ff045  linux-6.18.38.tar.xz
+sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 1bae3e3bf8df..134ec3fe0c8e 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.38"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.56"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless ti/omap/am335x-bonegreen-eco"
@@ -27,7 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
