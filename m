Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65268F53D9B
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 21:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24AE480E62;
	Mon, 16 Mar 2026 21:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fR8bUSHbUHvJ; Mon, 16 Mar 2026 21:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B42280E63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773697022;
	bh=RoTMfvb+EzMRkk0LgVvAfj9ftwZNXXS1DX7RsMYcH8U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=faM7SKM30XQt7NjQQRA3XWs0d2OWiicJfZcTO/xHjsiiIAiUK289gpUfvDGM0+bm9
	 6E18VkGG/K7WtvbP2N53Mgrc2cNoJGaUg83sJhw3dTHd+QYRpJH5PybsWkjxQcTL80
	 X4TOMVesczfJ6mwcSEC0465oR8GTGDhrz4JWt85Or0OkC87X4DZwmUQi+c0fWqCK5J
	 y2+8WF7Y8LryFtBoqXi5MVRgARAn1BMbXm8Mr4epkyBhrkglXW/8HXFNsEb2mpEpQ7
	 PAMP/dwTaqFEICmE1Fi/ejKbu+oVudNP1CZY4Trm3wYEI2NCvHIDgP4kcA9zvz1jS9
	 fOIY253EoA9Lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B42280E63;
	Mon, 16 Mar 2026 21:37:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C34DF3C6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A951380E62
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:37:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3I6ZzAq7oVnC for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 21:36:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=robertoxmed@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E3D480E54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E3D480E54
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E3D480E54
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 21:36:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43b45bb7548so951955f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 14:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773697017; x=1774301817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=euVPHRalbZmrF7cnefjGKCR7ybXIwqtqFzzqt8MBWbw=;
 b=sE8eqVKqY5MTKfXiFzM/oEETP96YATshbRmk23yqfp8w2fEE3G5cL1gn+pmRf7/UCX
 xS0Y9335ZRZgfuHB0MhdeOey/6N9MTphrkMoM6vBSrqL/eRtAittDcXd4nzE+jUVfJXT
 qSnZydyvq2mV73tjnka1sT7gOBPqPT6UrRQW4GO2sJA+aS+IVxtJ8GLBfS0By4dW9PDL
 P36u0LsaTj2EuRSHIKA919knwD0SVPDgteiW7hxdktRwujiB8qjiIwbrvVNe4jSvQd17
 Kp9Xm8auLYOd2pOMWK3AmDU+1mTf38imNY+E89vKcySebkSS1PEjhNgxO7gbCDJyWVYf
 YfAQ==
X-Gm-Message-State: AOJu0Ywfvf4ugR84cCBSUhLlwqFmkWO1Gd4KsRRpdjaHDeaNJFeb4exG
 z7i6CyNR7M6nILE2goKhdxQ2/kNx9KFR5ZCMqtMqCUCKc3zAlmmU/JRCVuQcbfko
X-Gm-Gg: ATEYQzzXbDoiDNCc//rJgOzH7OUqRufnhuHAu97waDSYtNLeXb3rhBLEkH83Oi4AlZA
 fxl1+lcaGYFn3vTERb403QNGbONz6dSvwsYKqe1XDZVHfh29PDPtm/8lxCGjmF/72BU4KVlj4i0
 wQlS0lN9ZlQSvLmPZgl3z2BvvyaJ0gdqzPH3JPgSdyBRCBCkew3MpMgmY7/9obLe0OgtoXjGYJE
 AyUhRprx9MIjSzV2nCj7eRba49uLhpqVJQ6vdfTbfSZYUWS3XsZCUkfS1TmQvZCyAGWJYBJQPdm
 Y0X5fAEIctdNg+fuAVCkusf9L3yYCKaZd0gkJHDdWfJ3XDD1d1AvacDapX6WalQ3DfEQtgsJHHu
 D5mIj4ScmQtZnfTKCu4PjQOWRU20b3IB2xD+j+zqdLwC4D8y72nFNqkdeSAmWJqZ0NJw54t6Tn9
 JdNMkCD1omAgujgAHhif7dtn3ZAzazQGq7Dc/i1sbWN91v2+hM7Q==
X-Received: by 2002:a05:6000:22c3:b0:439:bcb8:54b7 with SMTP id
 ffacd0b85a97d-43a04d81618mr26699272f8f.15.1773697017172; 
 Mon, 16 Mar 2026 14:36:57 -0700 (PDT)
Received: from Suzaku ([2a01:e0a:f60:4120:df77:201:2ea:5bbf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe20b899sm44041087f8f.23.2026.03.16.14.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 14:36:56 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Cc: Roberto Medina <robertoxmed@gmail.com>
Date: Mon, 16 Mar 2026 22:36:47 +0100
Message-ID: <20260316213647.6721-2-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316213647.6721-1-robertoxmed@gmail.com>
References: <20260316213647.6721-1-robertoxmed@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773697017; x=1774301817; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euVPHRalbZmrF7cnefjGKCR7ybXIwqtqFzzqt8MBWbw=;
 b=gW4n8telhepSzwYJBEliye+7zIuMrffTFU8SNiIy4tAvdE1ZdXRvnMvlUwDcNvM92o
 RA6FTKYtRlyup/hlpIWSxPmGIlKB0rMsuNOm1TOD0+L4aGNaEPwwKoRivYs9GCErKhbh
 NUG8QgtR5NIeSlMQ9a9fujkglmHsal6y1uvZlEalzjci2tBAUMMdNPG9Rn57457bJ9Yi
 dRI1tCwmjTvXZHaoOxFL6/CCQE3vnO9KQyTYUyygozgNamzsDzJP4wA8mCWQJlB2eBnl
 QA3XENqJ8+iYIxvc8S4XgmbSlxXHnQUKCkxxg8apNsZuzlEU5iFdX7ytEsNJWQC+ZDf+
 oSEQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gW4n8tel
Subject: [Buildroot] [PATCH 1/1] configs/roc_pc_rk3399: Bump Linux, TF-A,
 U-Boot
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

- Bump Linux: 6.18.18
- Bump TF-A: v2.14
- Bump U-Boot: 2026.01
- Update hashes for relevant components

Signed-off-by: Roberto Medina <robertoxmed@gmail.com>
---
 .../arm-trusted-firmware/arm-trusted-firmware.hash       | 2 +-
 board/firefly/roc-rk3399-pc/patches/linux/linux.hash     | 2 +-
 board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash     | 2 +-
 configs/roc_pc_rk3399_defconfig                          | 9 +++++----
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 8b77e1f165..0bf70b5542 100644
--- a/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/firefly/roc-rk3399-pc/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c0f23ccc71c49989e9ad238acf334473c17b7c88f79a20c829c3d443e3794a22  arm-trusted-firmware-v2.11-git4.tar.gz
+sha256  6fd749e53c455aec3418288630544e7552bbffab4442ddc48b20ebef9aee87ff  arm-trusted-firmware-v2.14-git4.tar.gz
diff --git a/board/firefly/roc-rk3399-pc/patches/linux/linux.hash b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
index 98edd13a58..be62c29501 100644
--- a/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
+++ b/board/firefly/roc-rk3399-pc/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
diff --git a/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
index fe9b4f53dc..b6a925ea4e 100644
--- a/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
+++ b/board/firefly/roc-rk3399-pc/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/roc_pc_rk3399_defconfig b/configs/roc_pc_rk3399_defconfig
index 145e155fac..c5c6771bdf 100644
--- a/configs/roc_pc_rk3399_defconfig
+++ b/configs/roc_pc_rk3399_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72_a53=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_GLOBAL_PATCH_DIR="board/firefly/roc-rk3399-pc/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="roc-rk3399-pc"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/firefly/roc-rk3399-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.56"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-roc-pc"
@@ -23,19 +23,20 @@ BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS="-O 64bit"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.11"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.14"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="roc-pc-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
