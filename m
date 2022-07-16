Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EF4C43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 21:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE0560F31;
	Sat, 16 Jul 2022 21:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE0560F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7CsOKHXiqTo; Sat, 16 Jul 2022 21:30:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE0D60A97;
	Sat, 16 Jul 2022 21:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE0D60A97
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 502DA1BF487
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 21:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 382EB60A97
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 21:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 382EB60A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cQyDJ0Cymu_k for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 21:30:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8301860681
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8301860681
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 21:30:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id z12so11649600wrq.7
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 14:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jc4QBCZ3UfpoE2JHmavTXYnv8OJpWbCFDYnIOdeCwRU=;
 b=zS3AT8S4OBDArUyPZ5p9fHssTNDYTXs11EI3pK6qW+dsRwL221e1t1XncJ0+B1sUbe
 v+t9bzcEg+EqSUAPRwEm1+RKiXMtcaWQY7+JjP4h2dNG0etbK0/nLjQaNN4uCyMu/wGg
 1DO9DsH1Ex0RX9fyz8BewPanFR2i2lqr8TF01mCgC5qpxs6UnCf5nKtVYGkTE640NkP0
 HVGtvlQi9hH1qNE0l+kf1uu2blfs8vEl5HEN9zKUhWjiON5M0KMVS7MvNk6yWQhiudBo
 ZTiRM03jeFSVF0OA5cknBNA57DwN0KwkTKzdEq90Xhlo5RAEhhFopMvOQ89QS11EQkIe
 w7xQ==
X-Gm-Message-State: AJIora/KGxRfpkWRHCQ5ZLoz8CcWx1fPEbCmOjyAVEod4VhyBZ6skWmx
 5gbxduvx4hkadlUNk6cG+LX7Jw0mJHc=
X-Google-Smtp-Source: AGRyM1uGFJvYN/W+84WBli08rOBoIIVkdrLI8EJji2EIofCgUGLgqfJU7yxYVIeKoAytg6FWPBdvQQ==
X-Received: by 2002:a5d:648b:0:b0:21d:a61c:a9c9 with SMTP id
 o11-20020a5d648b000000b0021da61ca9c9mr17676240wri.268.1658007005539; 
 Sat, 16 Jul 2022 14:30:05 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adfe84d000000b0020fcaba73bcsm6860385wrn.104.2022.07.16.14.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 14:30:05 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 23:30:03 +0200
Message-Id: <e2f23070c85c1d2fcf5ad74c88eae23723d18916.1658007000.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658007000.git.yann.morin.1998@free.fr>
References: <cover.1658007000.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc4QBCZ3UfpoE2JHmavTXYnv8OJpWbCFDYnIOdeCwRU=;
 b=UpGWclgqJlZ9FaOB1EePGyB4hcpNYzxRhcs8BjA19PxN/16ei4xgbdaMwdJlZtY1dd
 YU6bU8p9WmAsTaINGAorCzXa55exeolJq9okmYnUs7M0ZG/XQ7iaPHxDEnGi7WKjiXU3
 RfaO0bcZI3f3vNhnBBrgOVLlLOFG0dMyzPQfExSxLzYTH+VExLSqwCPWek3jE5Vcm2HR
 ky4dOlG4rqpw32e6pGf27mkHd8SupfxnJ+SklIwbdSBbY6whH7goUp3aeTXAWVCNsabF
 y6giPsR7/RVDVItOp9zFVUUsgZv3AO2uEjndD0L1mXSil10mv70LkStZ2qTBNSKTnPhP
 81fA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UpGWclgq
Subject: [Buildroot] [PATCH 1/2] package/rustc: fix target names for i586
 and i686
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d69d40c029dc (package/rustc: add support for Tier 1 and Tier 2
platforms) misspelled the config options for i586 and i686.

They are BR2_i386_i586 and BR2_i386_i686, not BR2_i586 or BR2_i686.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rustc/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 27c3a3cdeb..fec8726aee 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -25,7 +25,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER1_PLATFORMS
 	# aarch64-unknown-linux-gnu
 	default y if BR2_aarch64 && BR2_TOOLCHAIN_USES_GLIBC
 	# i686-unknown-linux-gnu
-	default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_GLIBC
+	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_GLIBC
 	# x86_64-unknown-linux-gnu
 	default y if BR2_x86_64 && BR2_TOOLCHAIN_USES_GLIBC
 
@@ -93,11 +93,11 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	# userspace
 	default y if BR2_arm && BR2_ARM_CPU_ARMV8A && BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_MUSL
 	# i586-unknown-linux-gnu
-	default y if BR2_i586 && BR2_TOOLCHAIN_USES_GLIBC
+	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_GLIBC
 	# i586-unknown-linux-musl
-	default y if BR2_i586 && BR2_TOOLCHAIN_USES_MUSL
+	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_MUSL
 	# i686-unknown-linux-musl
-	default y if (BR2_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
+	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
 	# mips-unknown-linux-musl
 	default y if BR2_mips && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
 	# mips64-unknown-linux-muslabi64
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
