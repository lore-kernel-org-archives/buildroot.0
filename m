Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60190CAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 15:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3DC660B2B;
	Sun, 21 Sep 2025 15:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hugTrGx_taBG; Sun, 21 Sep 2025 15:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0983060B1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0983060B1E;
	Sun, 21 Sep 2025 15:51:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 866C0D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 693B840140
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qN-Ueqy1M7lS for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 15:51:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB81A40071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB81A40071
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB81A40071
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 15:51:07 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-26d0fbe238bso15607135ad.3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 08:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758469867; x=1759074667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KYPKqGhSYejMmTw/4fqLgCLG/XoGYv3Vb5kdkfDIQMs=;
 b=IWU+5fwMs7gycwNjYpE8FEAWp3GCu7NRycYeKBOekdoERjExAeNgLOgZu2mNqm9DBe
 Ve3Q9MaOqacLi2hNP98XL/qlrl30Xd1f61hrIFM2So5D9hB/aXyWD05k7tszOyNkobaO
 GRPplqehUeDkyuavWrJug/bBMWXDuY/TmMtZOPysyUMvsDjHaiO3PORgGmLAgLltFteR
 6TJ5IB6coszIw6sP+lHA5RpXRcDSIqXJ/gXRnDkMElLYYUkUDg4zcgvxBiPZKF3hf45o
 A7KkS8G7AzaeumEpfxfj2s7qyxfrEYgnr+sKiokmFc+KPqx6uqMIlHG05o15uYiK4zs+
 HSdw==
X-Gm-Message-State: AOJu0YxTJhIburjaVA3GYbTrnsqcqzW1VDST9t/4uqFFEoiwHB+K3rll
 bBMrTzfRPNrS1k00RrHzieSC0sp9BY10TN6t0DciVZ5HkGmmkeHoPUXV5OUK8g==
X-Gm-Gg: ASbGnctrVEqEawYpuoATV705fT0veQmFa0Id2UevWHSv+14yXa0BDrppo+cVrLv426C
 0GXCsoA4dK52FY7gpzx6jf1JIDPr1ifrC0d74PphF0cpY/4RvzqVKHxPvmjph03vEce05RJJNtz
 04ISF22Gy1OnT8G9L8Bkjv1oKGLJ6zpRQ/3kOk833d2D9ppLXUDEtQNA3ba9+lJEJMtTIdLQJFZ
 5MkpbzW+w8Rmi1gKgkZhlWSSc0O9gNVyqGFi1rCge3hVTb7fi1NigKQamHdKlo55GAZq/fls/ge
 HFpd9yFSLMIhwQEOwXA7rw9RlPqIT4/7gXZtvBE//48zJAuB3kze/wqHFWzm4HdTsu0aEmVA24T
 aBYLRSo0Jq2d6zoX4Evw=
X-Google-Smtp-Source: AGHT+IESC1aO7lduQQduKtEBY3H/EguZRpCWT+XY+TEfxGRGzLTyzaVLKhlMaAtM0zxvcMYJeJrqUg==
X-Received: by 2002:a17:902:e5c8:b0:273:3f62:6eca with SMTP id
 d9443c01a7336-2733f903b0dmr57217965ad.18.1758469866674; 
 Sun, 21 Sep 2025 08:51:06 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269803661cesm108294765ad.147.2025.09.21.08.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 08:51:06 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Dick Olsson <hi@senzilla.io>
Date: Sun, 21 Sep 2025 23:50:59 +0800
Message-ID: <20250921155100.7033-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758469867; x=1759074667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KYPKqGhSYejMmTw/4fqLgCLG/XoGYv3Vb5kdkfDIQMs=;
 b=MzbJUCXih4wyIUhdOj6UBF1QaRxdvlhQUaJPGk34GCSy6vbBYXirUnv1/KDqPNKwc4
 vMseH1b6/YjNLIB7ASdF/fQJJlNssHqeofqOnrxzlviqlMVXiG5eBDbxNMg+iQgr16Nu
 M8wPoHj6pH9ZJeXnh2/aBdDcAesaKCy55W+IGz5iyBVHrbYrGV7q6AflWKWLuXGAYeWK
 8mP9l+vf2tfnuzsMXEtk6tBK8zQ76xVZJmJSstKDVpMQU/uTa0bqbwSUNyJYc2+fHLmS
 1KhefJWbuX/QdPAHEfl3p3hy1Oppq61GZ8Q4PZb0AsSqBbO1sgeZ1ONsqZMNd3dRvIZ6
 LUIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MzbJUCXi
Subject: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
 efi}_defconfig: switch to kernel 6.12.47 LTS
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

This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig
and adds custom hash files. The exception entry in .checkpackageignore
is also removed.

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .checkpackageignore                               | 2 --
 board/pc/patches/linux-headers/linux-headers.hash | 1 +
 board/pc/patches/linux/linux.hash                 | 2 ++
 configs/pc_x86_64_bios_defconfig                  | 6 ++++--
 configs/pc_x86_64_efi_defconfig                   | 6 ++++--
 5 files changed, 11 insertions(+), 6 deletions(-)
 create mode 120000 board/pc/patches/linux-headers/linux-headers.hash
 create mode 100644 board/pc/patches/linux/linux.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index f5e550736c..0a1bcd75f0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -162,8 +162,6 @@ configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
-configs/pc_x86_64_bios_defconfig lib_defconfig.ForceCheckHash
-configs/pc_x86_64_efi_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/pc/patches/linux-headers/linux-headers.hash b/board/pc/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/pc/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/pc/patches/linux/linux.hash b/board/pc/patches/linux/linux.hash
new file mode 100644
index 0000000000..564c711730
--- /dev/null
+++ b/board/pc/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256  e82fe40871743048226987bd349ef107168b15aab90140e872ca4ed470922e25  linux-6.12.47.tar.xz
diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 3617d3a85f..3b3e4cc561 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -1,5 +1,7 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/pc/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
@@ -7,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 45d895889b..a126eb8338 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -1,12 +1,14 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/pc/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.47"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
