Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FE3C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 04:57:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E20D2610FC
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 04:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E20D2610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 735874012B;
	Wed,  3 Nov 2021 04:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_-QYNMj5V4U; Wed,  3 Nov 2021 04:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F31C640164;
	Wed,  3 Nov 2021 04:57:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78B7D1BF3F6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 04:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73B9A4031E
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 04:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9y8Rl57UXUav for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 04:56:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C2E14012B
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 04:56:46 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id n8so1696130plf.4
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 21:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H++fqdzFL5hIv9+WW1GXgAdUgdBrl0o0JWnSyMaA4Vc=;
 b=W4U/LCi+xb+Xh2vPZr74xrKpzWT7E8BAcwssq9UNEUxuxz/x+Nx2g2S6MpYSbgpUz3
 GpOIw+dSRVg6pDPV/cS9OSIyK9tZk/L/JPphXXHmiKPOSnE9lEgjaXQQ8sglcKhEEq45
 0dmQhGjsBRUQtRpKR4KLr6eLDm3XQfPdHeozVVXoPoUhI03JIGU1D6bBjEuXInvL9U+I
 4SqCJJYenLojvjKYyl0fCj9bF+l9f2T9ypqkQv/i00tN+k2kKwxa744TK8LToruHJFK7
 /Zgl9whBIJ82RiQotPuKM50zPasUL9OdIQZ92ZNhCrFOEH0LWaFwtEQg50b+DiE6n0ay
 1nZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H++fqdzFL5hIv9+WW1GXgAdUgdBrl0o0JWnSyMaA4Vc=;
 b=owYXhk6IvwWJNpgb3/85Aglj4efSxMNQnf9yhPkDV97irAL2k9x/aP6SsaPZ20PZoQ
 07XQaDcK9i+UPpXhGz0P/c66b/Y8H0y5W4MDhqrRrRXthC5/PTWsdHKFjDmZfHwdKlTN
 pbKfx2bH5pdAArgaFRocLshFMnZxMxRYlU39ZZDiyPonYq8UHWQf7BbPnMu5w0SshvPe
 bHLFVpBZBqDMfLI7L4AKBx5xGtqjEHChr0yJEdWS5x0N4m3q3t8yu4ut5oFhzS+M/9Vc
 xV0TxEACThbbIJbw/jttec0F6sAP/JS+xDHQITsl0Bsp/ycKEJiL0un7Cd4+DKGlMrMz
 dAog==
X-Gm-Message-State: AOAM533lUbdZ3u7M4pg7kgylqwigwGm/G5HjP4ApFz5I1SNvx12LCBY9
 P78/CqilSw6XPpCx9g+5KbpbBo1vS5U=
X-Google-Smtp-Source: ABdhPJzAtW4h+z/y63Mvs5XTdTxFd6Tcw35OLyR77rdOLBdVB9QH+eWV05606p7pKx97EWYJYwGpMA==
X-Received: by 2002:a17:90b:4ad0:: with SMTP id
 mh16mr12068118pjb.176.1635915405324; 
 Tue, 02 Nov 2021 21:56:45 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id b18sm605897pjo.31.2021.11.02.21.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:56:44 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 15:26:27 +1030
Message-Id: <20211103045627.1281356-3-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211103045627.1281356-1-joel@jms.id.au>
References: <20211103045627.1281356-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/ppc: Move all powerpc machines to
 5.15
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the comment so it doesn't need to be updated when changing the
version.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 configs/qemu_ppc64_e5500_defconfig     | 4 ++--
 configs/qemu_ppc64_pseries_defconfig   | 6 +++---
 configs/qemu_ppc64le_pseries_defconfig | 6 +++---
 configs/qemu_ppc_e500mc_defconfig      | 4 ++--
 configs/qemu_ppc_mac99_defconfig       | 6 +++---
 configs/qemu_ppc_mpc8544ds_defconfig   | 6 +++---
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e5500_defconfig
index dace0af8eeb0..286d79a26b6d 100644
--- a/configs/qemu_ppc64_e5500_defconfig
+++ b/configs/qemu_ppc64_e5500_defconfig
@@ -10,12 +10,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
 # Linux headers same as the kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet64_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc64-e5500/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64_pseries_defconfig
index 4ce116e26af3..1a20e2ee0e97 100644
--- a/configs/qemu_ppc64_pseries_defconfig
+++ b/configs/qemu_ppc64_pseries_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc64le_pseries_defconfig
index 3be9de74a63b..46f62b83130a 100644
--- a/configs/qemu_ppc64le_pseries_defconfig
+++ b/configs/qemu_ppc64le_pseries_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="pseries_le"
 BR2_LINUX_KERNEL_VMLINUX=y
 
diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500mc_defconfig
index 69fc8dbc06ba..1a5b1e3c2c83 100644
--- a/configs/qemu_ppc_e500mc_defconfig
+++ b/configs/qemu_ppc_e500mc_defconfig
@@ -10,12 +10,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
 # Linux headers same as the kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="corenet32_smp"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-e500mc/linux.fragment"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99_defconfig
index a1e9c1a5a635..ddeb99465abb 100644
--- a/configs/qemu_ppc_mac99_defconfig
+++ b/configs/qemu_ppc_mac99_defconfig
@@ -5,13 +5,13 @@ BR2_powerpc_7400=y
 # System
 BR2_SYSTEM_DHCP="eth0"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_DEFCONFIG="pmac32"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/ppc-mac99/linux.fragment"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index 55e6db5a0d17..1a72d81ed592 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -14,13 +14,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.7"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/ppc-mpc8544ds/linux.config"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
