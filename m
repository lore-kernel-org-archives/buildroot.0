Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4150D10BF5
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D57640B40;
	Sat, 26 Oct 2024 11:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbT9YX5jl7j8; Sat, 26 Oct 2024 11:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19CC1408A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19CC1408A7;
	Sat, 26 Oct 2024 11:01:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CAB5E5C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E88C40768
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBSTuj6cwJoz for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5DDD04065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DDD04065C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DDD04065C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:01:06 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-431548bd1b4so27140825e9.3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729940464; x=1730545264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xxW7+3UTvPz27IX/rSzWInOpgiWd/zQJgcS9egAgLFg=;
 b=doaxZ0V1cg6eepRQa9RgCLGqHzWC2dP+IN4tYg0Bv8Zv+4o6ZH8opI8ixhceTl8bZg
 UGKNhZmiN55zbyrhXpeGQhzUTF8GNvlBmjW70DfF11/X/dWUGV9SeOexXVi00tJWZe4/
 0QgjigO6BPOWvrZ6QbeYfh9VoXSE5Q6G21NIuz9Gjfyfk3iDJYX6zMXR8S3udkczcdAx
 poAoSmKMG0I4GbN/VYEV0SYRe7Zk4EVxuPWBdQCgAO0OVYlQELfe6/+8LpbnZYIOVxmK
 pLbVa3NXv2359d0afIgsjsceZsa5AzJ85svsNxe0ILVpkPJoUhXypkelmbP4hsXyWtCn
 C0JQ==
X-Gm-Message-State: AOJu0YxBTmYNLu/b4ftbPKQeCY0RnKLdjvzVCdx0bFr9wivcxzDS1jKe
 Fqfn/d4IyNqQr6qIT0lpGx1ChAmo6WKWa3cn9BCuJxvBWNcM9slkbb89Kcd72ENN70gFt36PWCO
 N
X-Google-Smtp-Source: AGHT+IEbldNtDybiolP3b63n2E6c6yD0GBpGqZX63YTBf6RCRaCHQBjw0drJfCNqWtG6nQGwsop5Ug==
X-Received: by 2002:a05:600c:1d22:b0:42f:7ed4:4c25 with SMTP id
 5b1f17b1804b1-4319acb1739mr19782835e9.14.1729940464276; 
 Sat, 26 Oct 2024 04:01:04 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573cf8sm44846235e9.7.2024.10.26.04.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 04:01:04 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 13:00:56 +0200
Message-ID: <20241026110059.3204413-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241026110059.3204413-1-romain.naour@smile.fr>
References: <20241026110059.3204413-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729940464; x=1730545264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xxW7+3UTvPz27IX/rSzWInOpgiWd/zQJgcS9egAgLFg=;
 b=vvGKjO9Uc8ebtXLwWAcQ9Oy4Xse85VIoq2585KGTShtA/a+5y4BqKB0/GWPTnWcHW0
 6PLgt+gBIIVYUUtjnTCb4RBQ6/LILuOHeOx0bQbnUEdleLvFswyzmpityPjgyAImUGAt
 d9m+2psir03ExbhzRE9Ww031FICuTTKyju88o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=vvGKjO9U
Subject: [Buildroot] [PATCH v3 2/5] configs/qemu_nios2_10m50: delete config
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Waldemar Brodkorb <wbx@openadk.org>

Qemu 9.1.0 removed support for NIOS2 emulation, so we can't
no longer test it when updating Qemu zo 9.1.0.
Furthermore it seems that NIOS2 architecture will be soon
deprecated in the toolchain support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/nios2-10m50/linux.fragment |  3 ---
 board/qemu/nios2-10m50/readme.txt     |  5 -----
 configs/qemu_nios2_10m50_defconfig    | 15 ---------------
 3 files changed, 23 deletions(-)
 delete mode 100644 board/qemu/nios2-10m50/linux.fragment
 delete mode 100644 board/qemu/nios2-10m50/readme.txt
 delete mode 100644 configs/qemu_nios2_10m50_defconfig

diff --git a/board/qemu/nios2-10m50/linux.fragment b/board/qemu/nios2-10m50/linux.fragment
deleted file mode 100644
index c7647cee8a..0000000000
--- a/board/qemu/nios2-10m50/linux.fragment
+++ /dev/null
@@ -1,3 +0,0 @@
-# Embed the DTB in the kernel image
-CONFIG_NIOS2_DTB_SOURCE_BOOL=y
-CONFIG_NIOS2_DTB_SOURCE="10m50_devboard.dts"
diff --git a/board/qemu/nios2-10m50/readme.txt b/board/qemu/nios2-10m50/readme.txt
deleted file mode 100644
index f8f8f3b3a5..0000000000
--- a/board/qemu/nios2-10m50/readme.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-Run the emulation with:
-
-  qemu-system-nios2 -kernel output/images/vmlinux -nographic # qemu_nios2_10m50_defconfig
-
-The login prompt will appear in the terminal that started Qemu.
diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
deleted file mode 100644
index 8b8b4524bd..0000000000
--- a/configs/qemu_nios2_10m50_defconfig
+++ /dev/null
@@ -1,15 +0,0 @@
-BR2_nios2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
-BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
-BR2_LINUX_KERNEL_DEFCONFIG="10m50"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux.fragment"
-BR2_TARGET_ROOTFS_INITRAMFS=y
-BR2_PACKAGE_HOST_QEMU=y
-BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
