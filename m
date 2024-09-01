Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1408DC54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 16:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE5DF80CA3;
	Sun,  1 Sep 2024 16:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tquEQFeBInP4; Sun,  1 Sep 2024 16:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1C9E80CA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C9E80CA4;
	Sun,  1 Sep 2024 16:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 900D01BF30C
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BC4C402C3
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:49:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V_maBPuTuZXk for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 16:49:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C1A640022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C1A640022
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C1A640022
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 16:49:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42bbc70caa4so18798485e9.0
 for <buildroot@buildroot.org>; Sun, 01 Sep 2024 09:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725209382; x=1725814182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4DouR323h+85SDpO58ICGlnCmhGr8Q99PFyl4pMGdkg=;
 b=KcmeR5TFGYv8EIeQrlCGlXq/tgsYxY8jtMEwMFU2Uwrw+gNqoxXOiIKDzcyZibz432
 Z7lP8R3vg5NG0nvCQie6QRFnNj96oLXVwZL2LmNVRJOa/XCl4/EvQT7JZGjRnPx84iQp
 yKfTfQ6mG/5WVDxou2MLJL38ulzQOEnkvnmUjIrkkeKxQL67mbX6j+ZxzJCTJLfrPNMV
 D0kf3q45H/Pg9Os1UnHt9zCRQiZXozoyrhvx0aCj7rjOVcZSvzSU2FC/5yq4Hb46vpqb
 +4i65l85kLPgWGrqhDpU8SnIErKf5brlQkv6HfigccXWDPzK6PYU/NqZu6g3+F0JifbO
 /nnA==
X-Gm-Message-State: AOJu0YwfyD5hz7g4dUasYBDHmttAgNTaJ6bvnm7MOJdQ+Xnq/DZJ/b5B
 5Dv3FwTTL1kfSPjDPdqbuaBi1Hf2vVle+5mQ9BqSuTRyJT/mEHXKQ8f/Cw==
X-Google-Smtp-Source: AGHT+IFpFtlBxKMo3JlEa+T9BpACtI+mqtY+NbtUlqMYkeri0sRazDwdovbONDNIxFyvNGWYQT40Mg==
X-Received: by 2002:a05:600c:5252:b0:429:a3e:c785 with SMTP id
 5b1f17b1804b1-42bb01c228cmr96641415e9.21.1725209381736; 
 Sun, 01 Sep 2024 09:49:41 -0700 (PDT)
Received: from localhost ([212.38.43.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c11eeea6sm3971362f8f.52.2024.09.01.09.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2024 09:49:41 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 01 Sep 2024 18:46:23 +0200
Message-ID: <3324667.aeNJFYEL58@localhost>
In-Reply-To: <1913421.tdWV9SEqCh@localhost>
References: <1913421.tdWV9SEqCh@localhost>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725209382; x=1725814182; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DouR323h+85SDpO58ICGlnCmhGr8Q99PFyl4pMGdkg=;
 b=b8JejeMJ7b193+AyyjrsqJF42nnIOkuhdrQqk6Ve51nnZK56758FnGdbuyXg7TS32S
 Q2PVhkvTyZAuJ8fEdch32WpxHuAPtMzGdW2mjoC8Xyz35VQk4+BTkuY6mnUZm+uPViEE
 Z7wPFVllVAk6ItigwzZj1fdHdHSzk7fekv/q1DTRLl7ZKYNgX3whCsSaYuJHGOPMYNDF
 rG2PAHZtMMmZ59/cNsPvjW9HPHI3Oci463FvpnMdLzame5FKiMW/kpjZDtEe8etLyZ5L
 WzTDrZReuoZEy6jzD922b0LHlOutJLKsNywDQYgnUj671XvxxVPqAFKEH7/K3iYq+2bF
 5MHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b8JejeMJ
Subject: [Buildroot] [PATCH 3/3] configs/pine64: bump Linux to version 6.6.48
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump Linux to the latest LTS version 6.6.48 and increase rootfs size to
fit kernel modules.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 configs/pine64_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index fb3a468f2d..1a3d1ab6fe 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -2,8 +2,8 @@ BR2_aarch64=y
 BR2_cortex_a53=y
 BR2_ARM_FPU_VFPV4=y
 
-# Linux headers same as kernel, a 5.0 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
@@ -31,7 +31,7 @@ BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64"
@@ -41,6 +41,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.45.2




_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
