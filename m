Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94281C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 602598381F;
	Fri,  1 Mar 2024 13:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pnHv9fOqhsyD; Fri,  1 Mar 2024 13:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D4A48382D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D4A48382D;
	Fri,  1 Mar 2024 13:37:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD2361BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3A9B4196B
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IfBTYhit-pMX for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D3DA4193C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D3DA4193C
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D3DA4193C
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:48 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-565d1656c12so3747272a12.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300207; x=1709905007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdedvwudBMy6PXkstKINBSTXNLsRNFw8wRdfGPR0l8E=;
 b=hAQK8y+gsLzprPwvwVrskhpxuDekj7dtm59sB46uemix7U/YsgGQZC07RpxlhbKv95
 Cv6qvXqN8m5kWa83qRJr9nVqY+J3DBLn16fuCnVB4jUsNUDXIkBXGUUCIM2IcnJyhWXq
 otBll1yEh7JiucMEG9T/1WEpiFptWtqmQMh1+FvCtd51Y8+nDv23lkbIqqwYFtQYcHv1
 qtltMDUo/q42w383vnwsILVkPQHypjZxUvr7spVkOMZcFJ3vxOafkJNF8vKHdHxXYDbD
 PTSEoEYiijy7NyzQh0xQGU/nx4me0drhzHxxDig3oIp53Liplraa/mJ+ObmnzrIItZzf
 hqKQ==
X-Gm-Message-State: AOJu0YxaEdBg9ZdKb5yJKhv1RxIaRQtdyz4L1g6KuLfJySGJadQ6pw9D
 tT5cuqfvB12sMly1YTxsOcFPoQ4u+gw5R86xGvQ25X12RBqOWR9CPLX3hRMAEuCzKIvUEx0Abtg
 Btvw=
X-Google-Smtp-Source: AGHT+IHl6COj7ANl/wh1IHdMWKhhpYQU/qP44GD94nqe/Yo9p1/ITsokLtVv1C0jkV9Z2fwXynwdXQ==
X-Received: by 2002:aa7:d517:0:b0:566:78ff:b24e with SMTP id
 y23-20020aa7d517000000b0056678ffb24emr1686980edq.17.1709300207019; 
 Fri, 01 Mar 2024 05:36:47 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:16 +0100
Message-ID: <20240301133620.3547430-20-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300207; x=1709905007;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdedvwudBMy6PXkstKINBSTXNLsRNFw8wRdfGPR0l8E=;
 b=Z6nU2F7G9CBfe56/EEz2Xj9iuf2hNjzMcY7zmGKkO1FGDJFwg4pQywd/frLqlg85hV
 uqRZOyciXhjbb8cEYVBttHE8Nr5Xk0JNHzXJLVvnvqYGA0cZOqe1KAFT8kCCrzDsLpIZ
 0ZJyFPk2+sDhve2jngKSOWekLX1+L6VaZM/eY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Z6nU2F7G
Subject: [Buildroot] [PATCH v8 19/23] board/ti/am62x-sk: move post-{build,
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
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
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
