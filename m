Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF566CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A485815CF;
	Sat, 30 Mar 2024 16:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0FMtCLhTd4q; Sat, 30 Mar 2024 16:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 900C581E41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900C581E41;
	Sat, 30 Mar 2024 16:03:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 312C01BF909
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C4E0406CC
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:03:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id to6ZyuO8fFVN for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DDD2B406CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDD2B406CB
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDD2B406CB
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:03:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-515c3eeea5dso3082406e87.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814581; x=1712419381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdedvwudBMy6PXkstKINBSTXNLsRNFw8wRdfGPR0l8E=;
 b=ZfKj4ep5M5w04sgBeTzSzZQ4R51Z9vauqZwGKOQ2LKwmhHLKLXdpx0FlAzBWA5yLkq
 ASCG6eVatPtIRRjOl1vf5a/BlAzVYXCgU3doODolN2N2jCR9jWlNStoCnIYvaRlTyvwq
 8YUNm6WRaZkxMrJLIR+j12jBnENSk0zzEYUfyBYQUhXiH45u+VYvEudZ9NRiqhHI1dEg
 QWvvI20ITTcS1Y00DEgd67XRQavUQmndfekrX96HEAZrVP6c8KJAZT/iWEVC23zTsztz
 2QLKL6eKBv/SgGoxXbGs6/+aeYHwGV7SeySTNuwdk0bHUuMqiaFJfBg/uxcLu26a0b8g
 APgw==
X-Gm-Message-State: AOJu0YzT0DwHdK8iApCJWgy3/FWUfHFuz7WnllGxnlT3ScNthBbikrDc
 Ph+NjrRJ5FDZ+Ejh73uD4HjFbjQWPwAu2pP1nk+5Qp4ai/zMT4u1ctI0PH5hjwrtZ1UgYh3iCU3
 gVSw=
X-Google-Smtp-Source: AGHT+IG/7yYg2ymsG+b1lArvyb0hsWkIcEn228UZ4F3k2Yr6hnU/St+R3UPY9nLAmDRevefArWWnqQ==
X-Received: by 2002:ac2:420a:0:b0:514:cbee:a261 with SMTP id
 y10-20020ac2420a000000b00514cbeea261mr3341365lfh.27.1711814581547; 
 Sat, 30 Mar 2024 09:03:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:03:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:42 +0100
Message-ID: <20240330160244.3214733-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814581; x=1712419381;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdedvwudBMy6PXkstKINBSTXNLsRNFw8wRdfGPR0l8E=;
 b=rGIJXYaTbkEnAQQK4Vna88HqzBeE/DX11xhAQYM7x8KRoTVNH18rLM1BHrjzTP5nMA
 v0lQ9a+FnBLGqkf0g2KM08ZYmsXy+GqJEda6FDYiTxgH/aykCsg+XAuaLMsecVwxRjqX
 Eo1nlwAeCORE9smaj7oInErm+qTRAV9lo5WKo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rGIJXYaT
Subject: [Buildroot] [PATCH v10 10/12] board/ti/am62x-sk: move post-{build,
 image}.sh to board/ti/common/am6xx
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
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch makes it clear that the moved scripts can be used by the
am6{2,4}x platforms.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/post-image.sh                   |  5 -----
 board/ti/{am62x-sk => common/am6xx}/post-build.sh |  0
 board/ti/common/am6xx/post-image.sh               | 11 +++++++++++
 configs/ti_am62x_sk_defconfig                     |  4 ++--
 4 files changed, 13 insertions(+), 7 deletions(-)
 delete mode 100755 board/ti/am62x-sk/post-image.sh
 rename board/ti/{am62x-sk => common/am6xx}/post-build.sh (100%)
 create mode 100755 board/ti/common/am6xx/post-image.sh

diff --git a/board/ti/am62x-sk/post-image.sh b/board/ti/am62x-sk/post-image.sh
deleted file mode 100755
index 34f732c091ad..000000000000
--- a/board/ti/am62x-sk/post-image.sh
+++ /dev/null
@@ -1,5 +0,0 @@
-#!/bin/sh -x
-
-BOARD_DIR="$(dirname "$0")"
-
-support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
diff --git a/board/ti/am62x-sk/post-build.sh b/board/ti/common/am6xx/post-build.sh
similarity index 100%
rename from board/ti/am62x-sk/post-build.sh
rename to board/ti/common/am6xx/post-build.sh
diff --git a/board/ti/common/am6xx/post-image.sh b/board/ti/common/am6xx/post-image.sh
new file mode 100755
index 000000000000..917ca238aa78
--- /dev/null
+++ b/board/ti/common/am6xx/post-image.sh
@@ -0,0 +1,11 @@
+#!/bin/sh -x
+
+board_dir() {
+    if grep -Eq "^BR2_DEFCONFIG=.*/ti_am64x_sk_defconfig\"$" "${BR2_CONFIG}"; then
+        echo "am64x-sk"
+    else
+        echo "am62x-sk"
+    fi
+}
+
+support/scripts/genimage.sh -c "board/ti/$(board_dir)/genimage.cfg"
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index bd294bb712ee..310ba6fb6453 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,7 +1,7 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am62x-sk/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/am62x-sk/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/common/am6xx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
