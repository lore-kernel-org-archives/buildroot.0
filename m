Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BB5C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 06:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A371160BDF;
	Mon, 27 Nov 2023 06:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A371160BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAvUt7BassfR; Mon, 27 Nov 2023 06:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F21A260AF4;
	Mon, 27 Nov 2023 06:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F21A260AF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 06DBA1BF41B
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 06:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC99340343
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 06:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC99340343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItE6kfen0IPO for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 06:43:38 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B02BA40342
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 06:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B02BA40342
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1cfc9c4acb6so4053725ad.0
 for <buildroot@buildroot.org>; Sun, 26 Nov 2023 22:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701067417; x=1701672217;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=467AGrUrf+CPYqLcmiwzdRx3x/WA88WnGj3EAakxq+k=;
 b=FlZaVBWz7p65n/Zzt8uj4mk3p8Xfn+GtyFEiKoAzADr8avB4nUzKnJ/igup/5kRIHT
 x9kmRCSLeqTvejLLL96vmqIPWJu71Ig79d9fTFeDI+WUQLfh0yIByfx0XZLoquqJMFgf
 +fN/B5hW1YbDhmYUjbYKnnHp8yoX7uMsX1cxwbf271S2tA+Pnuw8QbsHD8QS76zVJ6R8
 Yeosiwlwuabyw0gASdYs9yx3gq9MtoWWC3pN7jBXpTidVYed9WPhyG9ItGDQBVlYEWPV
 OcyDiJV6Uhoxrx4aHJe4eAsrJjDYzRum5a0QrBiWeuKMLsDupMM+gS2nEsImd46Vl4ho
 nbqg==
X-Gm-Message-State: AOJu0Yx7zNhJJuBArB6cP4llo9BxNzfZ0wCSzKYY1obGwknEuygjsR4s
 KnwycgecGXXNJtvIYfG6FBe9jTTih8vmqQ==
X-Google-Smtp-Source: AGHT+IF0DNmB45e84ePQ3lkSmViQwIDvqBm88KuVD6CZfCP/LQyXZRHClQluI2a//ILKV2GjsDN+2A==
X-Received: by 2002:a17:90b:4b03:b0:285:93cf:38fe with SMTP id
 lx3-20020a17090b4b0300b0028593cf38femr7180974pjb.39.1701067417467; 
 Sun, 26 Nov 2023 22:43:37 -0800 (PST)
Received: from localhost.localdomain (211-72-129-103.hinet-ip.hinet.net.
 [211.72.129.103]) by smtp.gmail.com with ESMTPSA id
 jb6-20020a170903258600b001cfc19c2d01sm2476581plb.296.2023.11.26.22.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 22:43:37 -0800 (PST)
From: nigel_wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Nov 2023 14:43:48 +0800
Message-Id: <20231127064349.12099-1-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701067417; x=1701672217; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=467AGrUrf+CPYqLcmiwzdRx3x/WA88WnGj3EAakxq+k=;
 b=l4ibB8D+MA0e3wuc2cX1lfQeaAewL+XVI+xUX+b07QDfJuamU1K7PiWVwMo8/523MD
 J8HsOh1ZuJCuu91XY1i+UivkA95zKI7fWqgZXVveT6C9dZ70SlWoDGL1nNXWy7YNWjTR
 Bmefsqj/AA9Rs8Q59iVfi1ubj9bLFGtnEKYI5fvm4BRaKclhdmWBacnRk6CjQz8vLaAx
 5UCEWs7U29il5oNlKmJzL8eOlsv5Qd9CG5UMGblUGRnZrm1lufILnK3QzmTLPX6viDAf
 0EEWTJj+isikE2yzsMRx/LRFr592+U89gtwF/TdXw0zjC/MUBqZF5oIyKjd+wc8p5P2z
 MgPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l4ibB8D+
Subject: [Buildroot] [PATCH 1/2] board/cubietech/cubieboard4 : Add config
 file for cubieboard4.
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
Cc: thomas.petazzoni@free-electrons.com, nigel_wang <asd617140123@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: nigel_wang <asd617140123@gmail.com>
---
 board/cubietech/cubieboard4/boot.cmd      |  5 +++
 board/cubietech/cubieboard4/genimage.cfg  | 38 +++++++++++++++++++++++
 board/cubietech/cubieboard4/post-image.sh | 16 ++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 board/cubietech/cubieboard4/boot.cmd
 create mode 100644 board/cubietech/cubieboard4/genimage.cfg
 create mode 100755 board/cubietech/cubieboard4/post-image.sh

diff --git a/board/cubietech/cubieboard4/boot.cmd b/board/cubietech/cubieboard4/boot.cmd
new file mode 100644
index 0000000000..6521243696
--- /dev/null
+++ b/board/cubietech/cubieboard4/boot.cmd
@@ -0,0 +1,5 @@
+setenv fdt_high ffffffff
+setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+fatload mmc 0 $kernel_addr_r zImage
+fatload mmc 0 $fdt_addr_r sun9i-a80-cubieboard4.dtb
+bootz $kernel_addr_r - $fdt_addr_r
diff --git a/board/cubietech/cubieboard4/genimage.cfg b/board/cubietech/cubieboard4/genimage.cfg
new file mode 100644
index 0000000000..5d5488bcf9
--- /dev/null
+++ b/board/cubietech/cubieboard4/genimage.cfg
@@ -0,0 +1,38 @@
+# Minimal SD card image for the Cubieboard2
+# Based in the Orange Pi genimage.cfg
+
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"sun9i-a80-cubieboard4.dtb",
+			"boot.scr"
+		}
+	}
+
+	size = 10M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot-sunxi-with-spl.bin"
+		offset = 8K
+		size = 1016K # 1MB - 8KB
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/cubietech/cubieboard4/post-image.sh b/board/cubietech/cubieboard4/post-image.sh
new file mode 100755
index 0000000000..9cca1b1789
--- /dev/null
+++ b/board/cubietech/cubieboard4/post-image.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage                           \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
