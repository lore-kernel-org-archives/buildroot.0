Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8998C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72883413C3;
	Sat, 13 Jul 2024 14:01:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxoT5DLHouMC; Sat, 13 Jul 2024 14:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF449413CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF449413CB;
	Sat, 13 Jul 2024 14:01:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 398241BF861
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C0E606B9
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rajb1TmWXftU for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:01:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB60560637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB60560637
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB60560637
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:01:38 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52e94eaf5efso3516594e87.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720879297; x=1721484097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0UqpND8/va58BnUWwoV0ZebQtgcX7sV20mFXmiwUOJo=;
 b=GnwOIg+HUSiCsraESBuooOQX7eKOW5UYSuFS4vyDYkGfadAy5M8i2VdtI72ojblSqC
 5tWBls9G5VTpEzTUw4VgCehnNovPjOkE4AsmaxX2FNbN52KcquzZXpeSDnHZzDIdUKJR
 vCM+XXlGvQtlbB7dA4gYl00++Dmb8nVYciNM9fCW7a4lTBemx9m1Ux0Wolwk2H5tqbgB
 iyqPXWHfKvE2U8sUUC8dQVu7+hVlHZYgmDiUstu2McGBagdqTUfHldPSSdMiVMdtDfqg
 6/8xwTte68GsaBqdkL49haod8JytTWy7LtACmZ6/czPDXDQNe4O5NLINQbHJ7KYmG1KF
 iSiQ==
X-Gm-Message-State: AOJu0YxqBjHqBJ6/oGMuAO6SPH4bFabujxh4OaIEXX9/+zf3USesl2cB
 m9ckG3VBwZmZRnMEFEgC+tfdSnBGxuoTucPwR6zUAUt9vdwIlg9VJI9V87rdAjb/+HT+ql530Tx
 5OQ8=
X-Google-Smtp-Source: AGHT+IGSfDKqtKBVZIfOlAATZxzNTuMRMpZm+Qf6ZGhjaZbb7SU3vDjZwZLOUa/xqC5rGKNJynnYvQ==
X-Received: by 2002:a05:6512:23a6:b0:52c:a88b:9992 with SMTP id
 2adb3069b0e04-52eb99d201amr11567630e87.52.1720879296434; 
 Sat, 13 Jul 2024 07:01:36 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27877dsm55342055e9.26.2024.07.13.07.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 07:01:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:01:30 +0200
Message-ID: <20240713140133.2107977-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240713140133.2107977-1-romain.naour@smile.fr>
References: <20240713140133.2107977-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720879297; x=1721484097; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0UqpND8/va58BnUWwoV0ZebQtgcX7sV20mFXmiwUOJo=;
 b=I8oTN3sNQlU2GWrvP3fPwuhnNRO4+/57JX7BqHJwhnZqa0Isu9TMLfKDKePlXmR2rt
 ipfPcOMjBYmz9Ob7KYd/46il8DElkSPW+Q35rPWYA6JiaZNvJiCGyvqTmxBstu+CBRey
 oftP2O+gKaeLdEoN+6ilXfLCall1xRfNWtMn8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=I8oTN3sN
Subject: [Buildroot] [PATCH 2/5] configs/beaglebone{_qt5}_defconfig: move
 board files to board/beagleboard/beaglebone
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The beaglebone board files from beagleboard.org project should be
moved to board/beagleboard directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                    |  4 ++--
 DEVELOPERS                                             |  2 +-
 board/{ => beagleboard}/beaglebone/extlinux.conf       |  0
 board/{ => beagleboard}/beaglebone/genimage.cfg        |  0
 board/{ => beagleboard}/beaglebone/linux-sgx.fragment  |  0
 .../patches/linux-headers/linux-headers.hash           |  0
 .../0001-keep-jtag-clock-alive-for-debugger.patch      |  0
 ...3-1-replace-Sun-Solaris-style-flag-on-section.patch |  0
 ...ci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch |  0
 .../0004-ata-ahci-fix-enum-constants-for-gcc-13.patch  |  0
 .../beaglebone/patches/linux/linux.hash                |  0
 .../beaglebone/patches/uboot/uboot.hash                |  0
 board/{ => beagleboard}/beaglebone/post-build.sh       |  0
 board/{ => beagleboard}/beaglebone/readme.txt          |  0
 .../rootfs_overlay/etc/qt5/eglfs_kms_cfg.json          |  0
 board/{ => beagleboard}/beaglebone/uEnv.txt            |  0
 configs/beaglebone_defconfig                           |  4 ++--
 configs/beaglebone_qt5_defconfig                       | 10 +++++-----
 18 files changed, 10 insertions(+), 10 deletions(-)
 rename board/{ => beagleboard}/beaglebone/extlinux.conf (100%)
 rename board/{ => beagleboard}/beaglebone/genimage.cfg (100%)
 rename board/{ => beagleboard}/beaglebone/linux-sgx.fragment (100%)
 rename board/{ => beagleboard}/beaglebone/patches/linux-headers/linux-headers.hash (100%)
 rename board/{ => beagleboard}/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch (100%)
 rename board/{ => beagleboard}/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch (100%)
 rename board/{ => beagleboard}/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch (100%)
 rename board/{ => beagleboard}/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch (100%)
 rename board/{ => beagleboard}/beaglebone/patches/linux/linux.hash (100%)
 rename board/{ => beagleboard}/beaglebone/patches/uboot/uboot.hash (100%)
 rename board/{ => beagleboard}/beaglebone/post-build.sh (100%)
 rename board/{ => beagleboard}/beaglebone/readme.txt (100%)
 rename board/{ => beagleboard}/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json (100%)
 rename board/{ => beagleboard}/beaglebone/uEnv.txt (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index b29f290dd8..b49d8d92b4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -8,8 +8,8 @@ board/arcturus/aarch64-ucls1012a/post-image.sh Shellcheck
 board/aspeed/common/post-image.sh Shellcheck
 board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
-board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
-board/beaglebone/post-build.sh Shellcheck
+board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
+board/beagleboard/beaglebone/post-build.sh Shellcheck
 board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
 board/beagleboard/beagleboneai/post-build.sh Shellcheck
 board/beaglev/post-build.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index 4d13e90924..806c01e2a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2029,7 +2029,7 @@ F:	package/mongrel2/
 
 N:	Lothar Felten <lothar.felten@gmail.com>
 F:	board/bananapi/bananapi-m2-ultra/
-F:	board/beaglebone/
+F:	board/beagleboard/beaglebone/
 F:	configs/bananapi_m2_ultra_defconfig
 F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
diff --git a/board/beaglebone/extlinux.conf b/board/beagleboard/beaglebone/extlinux.conf
similarity index 100%
rename from board/beaglebone/extlinux.conf
rename to board/beagleboard/beaglebone/extlinux.conf
diff --git a/board/beaglebone/genimage.cfg b/board/beagleboard/beaglebone/genimage.cfg
similarity index 100%
rename from board/beaglebone/genimage.cfg
rename to board/beagleboard/beaglebone/genimage.cfg
diff --git a/board/beaglebone/linux-sgx.fragment b/board/beagleboard/beaglebone/linux-sgx.fragment
similarity index 100%
rename from board/beaglebone/linux-sgx.fragment
rename to board/beagleboard/beaglebone/linux-sgx.fragment
diff --git a/board/beaglebone/patches/linux-headers/linux-headers.hash b/board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/beaglebone/patches/linux-headers/linux-headers.hash
rename to board/beagleboard/beaglebone/patches/linux-headers/linux-headers.hash
diff --git a/board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch b/board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
similarity index 100%
rename from board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
rename to board/beagleboard/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
diff --git a/board/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch b/board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
similarity index 100%
rename from board/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
rename to board/beagleboard/beaglebone/patches/linux/0002-ARM-8933-1-replace-Sun-Solaris-style-flag-on-section.patch
diff --git a/board/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch b/board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
similarity index 100%
rename from board/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
rename to board/beagleboard/beaglebone/patches/linux/0003-ata-ahci-Match-EM_MAX_SLOTS-with-SATA_PMP_MAX_PORTS.patch
diff --git a/board/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch b/board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
similarity index 100%
rename from board/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
rename to board/beagleboard/beaglebone/patches/linux/0004-ata-ahci-fix-enum-constants-for-gcc-13.patch
diff --git a/board/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
similarity index 100%
rename from board/beaglebone/patches/linux/linux.hash
rename to board/beagleboard/beaglebone/patches/linux/linux.hash
diff --git a/board/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
similarity index 100%
rename from board/beaglebone/patches/uboot/uboot.hash
rename to board/beagleboard/beaglebone/patches/uboot/uboot.hash
diff --git a/board/beaglebone/post-build.sh b/board/beagleboard/beaglebone/post-build.sh
similarity index 100%
rename from board/beaglebone/post-build.sh
rename to board/beagleboard/beaglebone/post-build.sh
diff --git a/board/beaglebone/readme.txt b/board/beagleboard/beaglebone/readme.txt
similarity index 100%
rename from board/beaglebone/readme.txt
rename to board/beagleboard/beaglebone/readme.txt
diff --git a/board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json b/board/beagleboard/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
similarity index 100%
rename from board/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
rename to board/beagleboard/beaglebone/rootfs_overlay/etc/qt5/eglfs_kms_cfg.json
diff --git a/board/beaglebone/uEnv.txt b/board/beagleboard/beaglebone/uEnv.txt
similarity index 100%
rename from board/beaglebone/uEnv.txt
rename to board/beagleboard/beaglebone/uEnv.txt
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 064f283489..b1a0c7cda4 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,9 +10,9 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
 # Image
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 
 # Kernel
 BR2_LINUX_KERNEL=y
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index ae46fff228..e09a88e21b 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -1,20 +1,20 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
-BR2_ROOTFS_OVERLAY="board/beaglebone/rootfs_overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/beagleboard/beaglebone/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beaglebone/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.94-ti-r72)/linux-4.19.94-ti-r72.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beagleboard/beaglebone/linux-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
