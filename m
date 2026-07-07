Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074DCC43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C623C80CA6;
	Tue,  7 Jul 2026 04:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmzrQZdOBr3A; Tue,  7 Jul 2026 04:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3F7880CBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397340;
	bh=p3CZrPwWp4SeqgSI9ahl5xu5mYvGd2cv/F1aiHEkqyo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ewLCI3k05HuszaXrXZjG1kNUEi4YFFuB1CUI2/igqlhfLOb80gur0qSlmLk1RzjUr
	 JNVfTeisQ126nxyCbvuTXrMXDfTzRYf7I/JXNPA62xWWHJ23iYCNrvW3z9b8RQ94RU
	 fu7UG4Ow4JJ6EDQFjKAWDnKIQe0JuwfcZn8inUQZvl8Z7KRW3wcDyEwszKayYzbpFY
	 i+oOTWVhFz+nwWIcDs23IgHY/ZXuvtva8MlHMVozY5iYdUgW44J0CGYXTeXgBfgvw6
	 CIUSbiuU97Qvg8pzHy6s8Cda4YdoS48HWSyGhtxHmy4Mc/pOCuV5oMtnyIr9/TuD70
	 +phz1rbDMjAYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F7880CBF;
	Tue,  7 Jul 2026 04:09:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16A4733A
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0E7E40735
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5ckVMZ6saFU for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5197D406FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5197D406FC
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5197D406FC
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:57 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-37df72c9984so3623786a91.3
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397337; x=1784002137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4fX+iYqqRispVLVV37XIkyeWWqg4//zs3ODT7xapHsU=;
 b=E4IH8Iz8CkB73GXuNr0VJ639NzTL2uTV9TZzZKgoHZc/Nw3ClC2vfzwujoA+GADh5V
 ajPwQC6rLCCc0FxeokJrbVxsW37O6YGqITYdyTvkZVtVcA92ORcUNdHQJSEGYDvifU4+
 lAYWLu46ITgXwDTFKffjrWzJ7U6LIgcZ2784L3KaQIml00RtyqDjha3ubAPJk5k/+sQH
 RjjCVApxPBueqNK77/eNdu+VMHofD+U0r7xpGuWGWLRVlfpZ4GoxM+7I10g+4yIDQnbW
 rX3tz4jpsjZW0PsgrRXfoGfqj79Wx2ctq9Cvjqv+iRIMQ7jwh/VvgLAlSBPT+yWdLZbD
 1n4A==
X-Gm-Message-State: AOJu0YxbDMipCp4ZX5Mwchchh6dNcyrWXnjJKBx2cw98vZcGWVepN3aw
 XIh8fAme2Sd6IzTzC/5JkHGzuKMsvm3ePvCYpT+CgfZcvsBltuT5TuSyDIu0ghAU
X-Gm-Gg: AfdE7ck8/0WXHpqM54di1po778wO+/LL62dW/lsgmygnI2J4zFx8rdX+fQ+iZHgPokB
 QL8O+KV2WRSqwvvadjJwnIuB/vDmMubQWO33rThef2aTy5ZX5KOTVADIp++NvKuBmlOM5evfHO/
 Vlhty/O2xLxcqkp+4WJoswlx/XCEyBiLIq2X2I/+W7r/cOfYuT9aX4m+0BRmyoxOhH2NVWCqUTr
 B7gep2M/2QRc48PJ8a4j3HfhL4gbIgfF9wW1RBntJg9AgWNCitxkTj2YTo6IxZd+W65ux76nqIk
 kVMqzqgBoMI6usfvAUdHle6R+8TrbBtig1JZTjbZcieBEoo1MTXuRwekjelqr9C1frc6fKEhvEh
 7aWbLLcGCn4BMIQRvbzS1KYyjX0zsOSm9U/4GemEgfMyM+NWv8YsmM2dd2KGdpXJ6s1HKmUxb3h
 Tn7MHSmEOh1hjCgCIIQCVEbPZTv602Q/1Xx9Lc1DQu6SWatYkcLlBYSBmkyvlaFN/dtokkMuhzC
 A==
X-Received: by 2002:a17:90b:584d:b0:37d:f72c:9636 with SMTP id
 98e67ed59e1d1-38755d3f0fcmr4105345a91.11.1783397336741; 
 Mon, 06 Jul 2026 21:08:56 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:08:56 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:42 -0700
Message-Id: <20260707040544.108052-7-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397337; x=1784002137; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fX+iYqqRispVLVV37XIkyeWWqg4//zs3ODT7xapHsU=;
 b=ojG4JUpREGnY+3QSSZXUBpa7YV+n5ItTdwTP3id6G844mo9GiCOQ1KCzMhDGCTJqIz
 7P+ErfxCCOrKI8PwojDWTEIEobwAddqsuXBJRLbReeU2DtGMVejBe3BifSw+ZNgeXMYQ
 wuKOTxhtKHg6lH0UV4SWu+Xh997A4oQvbijCoNaSEzsOc82s/n4WrPp3zj1B3o4bO/C3
 KsSbqvQg5VGoi6lGSArCDmjGSi0YQmf0DOal7RYDc4AX4bUDp5+8ZiMDV9fCepR5xtL9
 UAZSmnMDoRcDbMU9nWumZ3hI/rbqNfSbm5HWWGQ2kfax2OG5QVPZEGhN7CEB/arKGT8J
 kkxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ojG4JUpR
Subject: [Buildroot] [PATCH 7/9] configs/ls1043a-rdb: bump BSP tag to
 lf-6.18.20-2.0.0
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

Update the kernel, U-Boot, ATF tags and readme.txt.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../arm-trusted-firmware.hash                    |  2 +-
 .../ls1043a-rdb/patches/linux/linux.hash         |  2 +-
 .../ls1043a-rdb/patches/uboot/uboot.hash         |  2 +-
 board/freescale/ls1043a-rdb/readme.txt           | 16 ++++++++--------
 configs/ls1043a-rdb_defconfig                    |  8 ++++----
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
index 7981c74137..4a62068d29 100644
--- a/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/board/freescale/ls1043a-rdb/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2d3f9c52e16766c290bdc0bc130d634e4c326a5b236dfb2f2ca3f0fa457e82d4  atf-lf-6.12.34-2.1.0.tar.gz
+sha256  658af40a90fd8e2460d364775a0c37e0507201e49de7f69c8a22d61e179f81e1  atf-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/linux/linux.hash b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
index f30030c86a..85d5173aa7 100644
--- a/board/freescale/ls1043a-rdb/patches/linux/linux.hash
+++ b/board/freescale/ls1043a-rdb/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  27a1987ca0a5802d3ebb296b8134ec66d813ad86cf2a60779b45092735bbb23b  linux-lf-6.12.34-2.1.0.tar.gz
+sha256  206f997d41bb958099bf7a89a02a6889942b118984f81f9a45bec9907f60708f  linux-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
index 38d54d9922..80bbe7d219 100644
--- a/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
+++ b/board/freescale/ls1043a-rdb/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2f25cde388b2f83ff7a8e3afe25aafb1db48dafb0fa3bf1e4f9fef603f3b4785  u-boot-lf-6.12.34-2.1.0.tar.gz
+sha256  04aed627132db7b656117c7a35fb29d314172319fa3a297ea6748eebac2b5ce3  u-boot-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/ls1043a-rdb/readme.txt b/board/freescale/ls1043a-rdb/readme.txt
index 4461b18e73..df067aa1e8 100644
--- a/board/freescale/ls1043a-rdb/readme.txt
+++ b/board/freescale/ls1043a-rdb/readme.txt
@@ -11,7 +11,7 @@ for more details about the board and the QorIQ Layerscape SoC, see the following
 Layerscape platforms are officially supported by NXP under the Layerscape
 Debian Linux SDK (LDLSDK). This uses components from Linux Factory (project
 common with i.MX), but has a slower release cadence than LF. The currently used
-tag is lf-6.12.34-2.1.0, which is in line with the latest LF tag. Generally, in
+tag is lf-6.18.20-2.0.0, which is in line with the latest LF tag. Generally, in
 Buildroot, the latest Linux Factory release tag is always used, which may be
 considered pre-release software, as it may contain features which are not yet
 documented, and it generally undergoes less testing.
@@ -21,13 +21,13 @@ For the software Layerscape Debian Linux SDK User Guide, see:
   - https://www.nxp.com/docs/en/user-guide/UG10143.pdf
 
 The components from NXP are:
-  - rcw, lf-6.12.34-2.1.0
-  - atf (fork), lf-6.12.34-2.1.0
-  - uboot (fork), lf-6.12.34-2.1.0
-  - qoriq-fm-ucode (blob), lf-6.12.34-2.1.0
-  - linux (fork), lf-6.12.34-2.1.0
-  - fmlib, lf-6.12.34-2.1.0
-  - fmc, lf-6.12.34-2.1.0
+  - rcw, lf-6.18.20-2.0.0
+  - atf (fork), lf-6.18.20-2.0.0
+  - uboot (fork), lf-6.18.20-2.0.0
+  - qoriq-fm-ucode (blob), lf-6.18.20-2.0.0
+  - linux (fork), lf-6.18.20-2.0.0
+  - fmlib, lf-6.18.20-2.0.0
+  - fmc, lf-6.18.20-2.0.0
 
 Build
 =====
diff --git a/configs/ls1043a-rdb_defconfig b/configs/ls1043a-rdb_defconfig
index 94b8a91416..e40fade23b 100644
--- a/configs/ls1043a-rdb_defconfig
+++ b/configs/ls1043a-rdb_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1043a-rdb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1043a-rdb/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.12.34-2.1.0)/linux-lf-6.12.34-2.1.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,linux,lf-6.18.20-2.0.0)/linux-lf-6.18.20-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.12.34-2.1.0)/atf-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,atf,lf-6.18.20-2.0.0)/atf-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1043ardb"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
@@ -38,7 +38,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.12.34-2.1.0)/u-boot-lf-6.12.34-2.1.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-qoriq,u-boot,lf-6.18.20-2.0.0)/u-boot-lf-6.18.20-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1043ardb_tfa"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
