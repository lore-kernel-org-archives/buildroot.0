Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04970C25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 20:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0A234018A;
	Tue,  4 Jun 2024 20:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSIi-mUxQTcV; Tue,  4 Jun 2024 20:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59A05404AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59A05404AE;
	Tue,  4 Jun 2024 20:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 088C71BF48D
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 131B0409BA
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 20:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Er4cKVfB6nTY for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 20:25:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3B31409AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B31409AB
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3B31409AB
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 20:25:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42155143cb0so7700605e9.2
 for <buildroot@buildroot.org>; Tue, 04 Jun 2024 13:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717532732; x=1718137532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqUzw9XJvcqM8hjM9M3razBLJA0jo5QoBi/ce33g6Is=;
 b=e+XzqxD7l5Ff8W+fa+dXFSTkT+ogcMnbzAU8aUr1Y4qVgIdE4h/H8f+2a6SzWX4EmE
 Hynr7dIn3D02Qw5004J9AHUJVV9uBl4lk2o7qv5ctcExhKIWgb5GrLC95i/oBkumLdJy
 ZOUgwyLTuU9VtFR48dRNZKD+MLg5B6lzO/aoxpKe3/gyL4UI+QortTaOMz+8PcLLi1UI
 MMX3Dt6xQ0I4UsYU33NXUrAy8+CQcv1xIzvnmHjy4WjMPqicYwx0Hr9jCYP/QxMv78H+
 IdlWBZZ2m2pqh/SMOP20Jf9Gfu6MYsVgCAw0DdN3d685uwMRpnvfh1/SSN+ASeBduNfX
 h4YA==
X-Gm-Message-State: AOJu0YwusZbht+T6Idrxe1Pbe5mzu1T1akGBwLttg6qoCeNnHDuA5LbY
 +XvYZF6RuWPh53HKRILwLb3W/Jbc0Cbf6y26yhZB+PEDZek4KjJoAirMR13oub2fiYP3Fh7hpEa
 W
X-Google-Smtp-Source: AGHT+IHRv+4O0Yllj6Y7VG/tUNTX8liEmGikxZ57QhsJDOgvarAhm+chTFaBhj/absslq0DhX/3hXg==
X-Received: by 2002:a05:600c:3152:b0:421:3d5c:8cbf with SMTP id
 5b1f17b1804b1-4215633a282mr5757735e9.32.1717532731809; 
 Tue, 04 Jun 2024 13:25:31 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.240])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42129de0cf9sm182868945e9.13.2024.06.04.13.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 13:25:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jun 2024 22:25:18 +0200
Message-ID: <20240604202518.1839908-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240604202518.1839908-1-dario.binacchi@amarulasolutions.com>
References: <20240604202518.1839908-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1717532732; x=1718137532;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EqUzw9XJvcqM8hjM9M3razBLJA0jo5QoBi/ce33g6Is=;
 b=mr6TsdJhtGDGNNgydy1/nc2DoVdkXZ0WJTHkR8oM5bAZ1vIBKMokl9EN7iBhJyLRMe
 ZIY5V/q2xXxFGtWcXFfv55WjQ452hpsmTJwwgNug3iZwhVrCtpvz8x+eedbiIt4md2np
 vBZLJ+ORfTNOqk6yjJ9I/QnS2ULd6gzDy7owY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mr6TsdJh
Subject: [Buildroot] [PATCH 2/2] configs/beaglebone_qt5_defconfig: add
 hashes for Linux/headers/U-Boot
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
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds .hash files for Linux, Linux headers and U-Boot and then
enables BR2_DOWNLOAD_FORCE_CHECK_HASHES. With this, we can now drop the
defconfig from .checkpackageignore.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                                       | 1 -
 board/beaglebone/patches/linux-headers/linux-headers.hash | 1 +
 board/beaglebone/patches/linux/linux.hash                 | 2 ++
 board/beaglebone/patches/uboot/uboot.hash                 | 2 ++
 configs/beaglebone_qt5_defconfig                          | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)
 create mode 120000 board/beaglebone/patches/linux-headers/linux-headers.hash
 create mode 100644 board/beaglebone/patches/linux/linux.hash
 create mode 100644 board/beaglebone/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 8825d644ab5f..7de60f6946c1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -145,7 +145,6 @@ configs/bananapi_m2_zero_defconfig lib_defconfig.ForceCheckHash
 configs/bananapro_defconfig lib_defconfig.ForceCheckHash
 configs/beagleboardx15_defconfig lib_defconfig.ForceCheckHash
 configs/beaglebone_defconfig lib_defconfig.ForceCheckHash
-configs/beaglebone_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/beaglev_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/beaglebone/patches/linux-headers/linux-headers.hash b/board/beaglebone/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/beaglebone/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beaglebone/patches/linux/linux.hash b/board/beaglebone/patches/linux/linux.hash
new file mode 100644
index 000000000000..72d5bfff98d4
--- /dev/null
+++ b/board/beaglebone/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  394523e61eabf24bf920981ba967799ff90b6099a72dc1d1b92c918433439f61  linux-4.19.94-ti-r72.tar.gz
diff --git a/board/beaglebone/patches/uboot/uboot.hash b/board/beaglebone/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..4b82872f31e0
--- /dev/null
+++ b/board/beaglebone/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0d438b1bb5cceb57a18ea2de4a0d51f7be5b05b98717df05938636e0aadfe11a  u-boot-2021.04.tar.bz2
diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index b83ef54fa88c..ae46fff228e2 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -4,6 +4,7 @@ BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/beaglebone/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/beaglebone/post-build.sh"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
