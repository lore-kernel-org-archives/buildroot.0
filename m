Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF71ECD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 10:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C7B94175C;
	Sun,  7 Apr 2024 10:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvCR38bsscTW; Sun,  7 Apr 2024 10:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D06E74179D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D06E74179D;
	Sun,  7 Apr 2024 10:35:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1887E1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12D4840AE6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 10:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sz-K6S8-Z1vJ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 10:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA402403E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA402403E9
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA402403E9
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 10:35:18 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d717603aa5so43095991fa.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 03:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712486116; x=1713090916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3pj0TS3tsISaeTe0sEYU+cSRM8GHhE4IMrZv4c0ot4=;
 b=ODfP/cjP7ycTnacAm0wP40JSge5FiXdw0yGsRNvB+UPk4S6Hd53K2w8csuMCKn+RNU
 Wd4kW4YD9l6MJDSV/6LF2vAkHpv8s93onurIHQk3uoRySiMx2Cm2zEbeOyIpIe7xE8yJ
 Gic17p5u5fE1eee2OTWeKE1bIk7wc+QiboF+/7iADUjzyzEj+EiMmRUhTrFHbS9LJ+b3
 P4Bk6AIVFzgfu6Stv+8g6aacAhtvVBVJ3uwSB/2LZfBOWRT+c4j3YtQMmf7l23XMlJYY
 BGsZfNKRjF9JIWixBtMTTMemzOL9rnQvvXB6Ushro7wWJu+yEtJB2h94Vd1eE9Hi3prP
 93bg==
X-Gm-Message-State: AOJu0YxTiRjvIX/VV4jodHn2VqFuNkcvttDjpPkbgDJ9zmHRtXtyh+5L
 MndwdG4oyn8YM0eVSRbIdjTXkl94ZOY9R/jD3EFFBdiXeVrkuVCidmqlShTf1/GEBEFpWNnvY8Q
 l
X-Google-Smtp-Source: AGHT+IG72McZNsnykW2TNvGQXvHnTyh7WJZeLOGIv1E306YHs/amnc1l25XPN1WmhDJox08E67yt4g==
X-Received: by 2002:a2e:864e:0:b0:2d5:122a:4b1f with SMTP id
 i14-20020a2e864e000000b002d5122a4b1fmr4858597ljj.43.1712486116300; 
 Sun, 07 Apr 2024 03:35:16 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 je4-20020a05600c1f8400b004149536479esm9486542wmb.12.2024.04.07.03.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 03:35:16 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 12:34:54 +0200
Message-ID: <20240407103512.1112712-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240407103512.1112712-1-romain.naour@smile.fr>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712486116; x=1713090916;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3pj0TS3tsISaeTe0sEYU+cSRM8GHhE4IMrZv4c0ot4=;
 b=sqsLfaHp8PExe5AGe7CDoQ4SeyncnCs5EpaWvU3LicimR5h2edDXyXg0x3+KM+em37
 8A6+OLZmamqzLVvTylVAjgB1KEbHEQL2li0E4JCgZyISyAZlSts43G24O8l5zgvfPsMq
 wz9+wjeMd+pZ7bwoPPPyfrNp5g8+ozgS2fyuKSCTNS4UcpeKM1rKxHjo9kWwHSwxDv4p
 1wzhic/jUmXL7nNXaNE5J2M7J//KGwrXqQxBlVRj9n4jm/iOrwvBxuvbEJPDIvtfgL9Y
 p4qIaXoPwaRy/wPsCH+TFwDg/mHg31ySpv46QKCjezLk9pLqjPDZTDXJCSzh9XnoqbbW
 Bjhg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=sqsLfaHp
Subject: [Buildroot] [PATCH v12 01/16] boot/ti-k3-r5-loader: drop hash for
 version 2022.10
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The patch removes the hash for version 2022.10 of ti-k3-r5-loader
(i. e. U-Boot), still allowing the ti_am6{2,4]x_sk_defconfig configurations
to properly validate the downloaded package with the appropriate hash.

Link: https://patchwork.ozlabs.org/project/buildroot/patch/20240304153253.732708-6-dario.binacchi@amarulasolutions.com
Suggested-by: Yann E. Morin <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Added in v10
---
 board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 ++
 board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash | 2 ++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash                      | 1 -
 configs/ti_am62x_sk_defconfig                                  | 1 +
 configs/ti_am64x_sk_defconfig                                  | 1 +
 5 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash

diff --git a/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..2a5c99c459
--- /dev/null
+++ b/board/ti/am62x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
diff --git a/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..2a5c99c459
--- /dev/null
+++ b/board/ti/am64x-sk/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
index 279cb7763a..fbe5d21540 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -1,4 +1,3 @@
 # Locally computed:
-sha256  50b4482a505bc281ba8470c399a3c26e145e29b23500bc35c50debd7fa46bdf8  u-boot-2022.10.tar.bz2
 sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index a129e216d2..37df7a93f7 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am62x-sk/patches"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 26195194c7..1ebdec68ac 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_GLOBAL_PATCH_DIR="board/ti/am64x-sk/patches"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am64x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
