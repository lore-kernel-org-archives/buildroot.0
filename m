Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E2BC433FE
	for <buildroot@archiver.kernel.org>; Sat, 19 Nov 2022 17:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1565060DF9;
	Sat, 19 Nov 2022 17:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1565060DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQT5-roLz9H0; Sat, 19 Nov 2022 17:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57B9460DF4;
	Sat, 19 Nov 2022 17:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57B9460DF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E56B1BF292
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 17:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 155718137E
 for <buildroot@lists.busybox.net>; Sat, 19 Nov 2022 17:16:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 155718137E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01KRG3cE8FA3 for <buildroot@lists.busybox.net>;
 Sat, 19 Nov 2022 17:16:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C420981383
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C420981383
 for <buildroot@busybox.net>; Sat, 19 Nov 2022 17:16:14 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id cl5so13923640wrb.9
 for <buildroot@busybox.net>; Sat, 19 Nov 2022 09:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Slz3ovETvRJ6t5bnuergkl15A99wgyUNMiI8NDWyqN0=;
 b=mOiAoutZdodnbh9QDq936Bb/e/mWcDPqFYI5QfBzqV0yiH+5TTsHdNAMB/GmP70D/9
 wBSgzSKezE6ccbtrkb6vwCz/Bsz7GclR5tnGnyRx4WNwG29+OyOM1WgLJls2SQ/wK9Z3
 Q9/Cz37rz54yZcjXA4IFNeeaYdGEWLci+LnyoQpCSaBnohGFCXuNj38N+H9NelNZBsz+
 jiCp3ORcvjMen/hjgz2g2ATAwBvSUw/Iv/fFt2k4/r6ctyiu6oL889f0NGs/0fe2eK8z
 B+iyS3wi2X395dUBjlDoj77ripoDTsP5cLVMx8gsHFUfLbQTasLk6elcChwb6ro4ZZk2
 tcIg==
X-Gm-Message-State: ANoB5pnQJTZkco+V4P/n1+SBtNqYkHJaOTsdu9KV/KTiq45GGxKuF21u
 kBIlf5fiDAs1jiPdFKFXA/0uqSMDeZk=
X-Google-Smtp-Source: AA0mqf6G+5dCrt1DV7pJHaIHjibRAKvnrp056zjOa3b3PqVaNTJyGwcVBbq24VcXo3nKjGK01vr3tQ==
X-Received: by 2002:a5d:4106:0:b0:236:6fd6:1af3 with SMTP id
 l6-20020a5d4106000000b002366fd61af3mr7215651wrp.306.1668878173046; 
 Sat, 19 Nov 2022 09:16:13 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c311100b003cf4ec90938sm8854383wmo.21.2022.11.19.09.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Nov 2022 09:16:12 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 19 Nov 2022 18:15:48 +0100
Message-Id: <20221119171549.26487-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221119171549.26487-1-francois.perrad@gadz.org>
References: <20221119171549.26487-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Slz3ovETvRJ6t5bnuergkl15A99wgyUNMiI8NDWyqN0=;
 b=i/zJ5thIchgwg1J1rjNKWRh8KUOZZdO4O3YApGm9hNgKG8HJ3SiTsFUuCFbeSxjhJH
 pqsWRuuX1AIdgaa4qhIKVOfnpU5WX0Qiz+GDD20JW3/f9RiUo9g7o9CMb/PEiMS4NzZX
 mlcxSHuPEf18cjXXGGltJN8llGL3gwmdlCZVauSMGusYz7b1skIKu/gak8iw30VyEYw5
 /drg9m12RB1+0Kbko6RpBIfaWgDmqu6y7qb139ZwuNRh8FmFPWpRRLqAwZ55+gTufZQY
 OL/l4Db+txtsUUDrG8MIySoMRsc1Ov7dZIbJGFzRhNnTI/3/tGdQFU1tq0AfNbraVBxz
 AFKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i/zJ5thI
Subject: [Buildroot] [PATCH 2/3] configs/ls1028ardb: add video with Cadence
 DP firmware
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/freescale/ls1028ardb/readme.txt                    | 9 +++++++++
 .../rootfs_overlay/boot/extlinux/extlinux.conf           | 2 +-
 configs/ls1028ardb_defconfig                             | 3 +++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
index 93396a419..2dd2e2d84 100644
--- a/board/freescale/ls1028ardb/readme.txt
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -58,3 +58,12 @@ To boot your newly created system:
 - put a DB9F cable into the UART1 Port and connect using a terminal
   emulator at 115200 bps, 8n1;
 - power on the board.
+
+The Cadence DP (Display Port) firmware must loaded from uboot with the following commands:
+
+  => ext2load mmc 0 0x80000000 /boot/ls1028a-dp-fw.bin
+  102464 bytes read in 24 ms (4.1 MiB/s)
+  => hdp load 0x80000000 0x2000
+  Loading hdp firmware from 0x0000000080000000 offset 0x0000000000002000
+  Loading hdp firmware Complete
+  => boot
diff --git a/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
index c08ddde10..bd6c7c95c 100644
--- a/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label ls1028ardb-buildroot
   kernel /boot/Image
   devicetree /boot/fsl-ls1028a-rdb.dtb
-  append root=/dev/mmcblk0p1 rootwait
+  append root=/dev/mmcblk0p1 rootwait video=1920x1080-32@60 cma=256M
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
index 22b9eb426..1bc84f7b8 100644
--- a/configs/ls1028ardb_defconfig
+++ b/configs/ls1028ardb_defconfig
@@ -26,6 +26,9 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
+# Target package
+BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
