Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4599C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 19:46:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AD626103B
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 19:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AD626103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1DA482893;
	Fri,  5 Nov 2021 19:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80ePvTbYIWgD; Fri,  5 Nov 2021 19:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C1A78254D;
	Fri,  5 Nov 2021 19:46:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3781BF580
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 19:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 442F06079F
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 19:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_qwp1VG6JQS for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 19:45:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 425056069E
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 19:45:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d3so15362098wrh.8
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7nMnSR2np6vAiVT1dADp7jEsq+ryhz9pdws8BiFr84=;
 b=Iwz7Oso7M0LG4RxehpfI/cpJEWWczAHjuStD8gZJFr+S2r2lYpRMQYhMGLpGnm7zWo
 9T1Lf2yDIhk2Z1xTD507CZdKlF6LAZDaYNm1u1CgHnN3faR81jycW32zjoanqN/rWMER
 wveGYaq5kwa68WaQMAUPHXno4yeSU9TkdVvN8rGk/0BXkW6+FmejXJRgjZN51SidQsXB
 BpPdHSgR7JyK6NRXHSdufpMV1Qhm6foVPhDOAwZdvqWiYPJQyUY8TkzV8BU9k9qAxjqa
 B6EOFeBBciw6UxronHLxMFTU0ScKvCSTsDjqXwj+0fo38BpfCwNwlZ5Hi3ZEVAhvRijU
 gAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7nMnSR2np6vAiVT1dADp7jEsq+ryhz9pdws8BiFr84=;
 b=E8uhwB8eqKSuBWm9K0DhI9gDbmHw09+qMKQYrxQCJNinJBQS4VixLsaeUtU+xBLTSI
 zWtyVPm5HnCzSOXdF5dDegNWVvcdkt2O0wAkPpGGoIf3z0Ol3L1VDveNFRlAukT1ARwr
 0UMplxcWnXJrso0lufDnSFktgqJhUE7u1VbuEFshPBKtnBgY6EU1cUM+2HBqj8sm3B2e
 e6QGss36ViPqHs2weUV2vrpkSeKPWIUI4jj8T7lupDjbTrENYRLBnAsSQm0cjFqWpJeg
 6MDjWU2rfR8uEX4nH9hHe/syIPAVudYE/3azA1hYGkkwAGZQaN0HzTycslECUIdv+pHI
 LMMg==
X-Gm-Message-State: AOAM533Injk50uqUVBOdAZU7B8Tnv0sSCAqrlNpUvUu4XrJjqFk5z8R4
 76CZBPVBoIVFkzEaT9il8iQuixRftsk=
X-Google-Smtp-Source: ABdhPJymqnQUUt1lMfmb2ck/gxNwlUeuXFARHWnRFENq+6HYNbOhwI+zWpPMEDrvlXd6HR1XaGsPCQ==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr35843250wrt.375.1636141545580; 
 Fri, 05 Nov 2021 12:45:45 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id t8sm6526140wmq.32.2021.11.05.12.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 12:45:45 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 20:45:34 +0100
Message-Id: <20211105194536.940253-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105194536.940253-1-romain.naour@gmail.com>
References: <20211105194536.940253-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] configs/qemu_aarch64_sbsa_defconfig: update
 to Linux 5.15
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Increase vfat partition size for qemu-aarch64-sbsa since it now
requires more than 32M. See "Disk full" [1].

[1] https://gitlab.com/kubu93/buildroot/-/jobs/1745752049

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 board/qemu/aarch64-sbsa/genimage.cfg | 2 +-
 configs/qemu_aarch64_sbsa_defconfig  | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/qemu/aarch64-sbsa/genimage.cfg b/board/qemu/aarch64-sbsa/genimage.cfg
index c75d9fcca1..de585b3b91 100644
--- a/board/qemu/aarch64-sbsa/genimage.cfg
+++ b/board/qemu/aarch64-sbsa/genimage.cfg
@@ -7,7 +7,7 @@ image efi-part.vfat {
       image = "Image"
     }
   }
-  size = 32M
+  size = 64M
 }
 
 image disk.img {
diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
index d014140bf5..0e1c799b4d 100644
--- a/configs/qemu_aarch64_sbsa_defconfig
+++ b/configs/qemu_aarch64_sbsa_defconfig
@@ -13,18 +13,19 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
 
 # Image
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/assemble-flash-images support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.34"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
