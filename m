Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5E8C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 06:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE5AF408A6;
	Tue, 22 Nov 2022 06:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE5AF408A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qgHKp-7eHZnR; Tue, 22 Nov 2022 06:44:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4EAC4168A;
	Tue, 22 Nov 2022 06:44:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4EAC4168A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5791BF333
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2374E80C46
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 06:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2374E80C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2RDVDyEBB7ic for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 06:43:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F199D80C98
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F199D80C98
 for <buildroot@busybox.net>; Tue, 22 Nov 2022 06:43:42 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x5so19146962wrt.7
 for <buildroot@busybox.net>; Mon, 21 Nov 2022 22:43:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Slz3ovETvRJ6t5bnuergkl15A99wgyUNMiI8NDWyqN0=;
 b=q6PmpUv2Bxr6kPJS1QbCvEH3rSpIXOUktoKBqhW45075K/+Hmqdk4xj8VwTrIiqgyo
 0q5fB+onDMExyA+shsfAS+KmRwvD3us/Zx35sTq0Cgf6T7CZW27f9XEynmDn/WIjdAmy
 DvDSn2hEgxF/97t5xQ84htIAJiTA8QQ+1CaoXtNE4LUX6wppOoTK6jmIylcVUnEmydUb
 4ELpMgEeI0FZDQ/hEkXvLpgR7efheAmEn7PCxcLCEgpI3sWUgyhpqO3uDM/6oykZO1D5
 Q60aljO5QpAXO/Z3fmJDvlgBHC0ypR+3QVTO3qrZ8JMC9ZJyEtOAn8+ZnFGL0of0++o4
 WpFA==
X-Gm-Message-State: ANoB5pnzu53cIL3ZD28Wx+c908x3ads5BDrbPbuBgE7OTVk/5pSNt1OV
 J2BDwOdFy77Qa9LntV7MeJsEq9gpzpQ=
X-Google-Smtp-Source: AA0mqf7g3PWycV2eNJfRkB7m1bUWNhuge7k3BeG3MxtNdhYwKHOjOiQYj9P8xizuTdnlvjtkxA98sQ==
X-Received: by 2002:a5d:4523:0:b0:236:e271:c64e with SMTP id
 j3-20020a5d4523000000b00236e271c64emr5613465wra.490.1669099421060; 
 Mon, 21 Nov 2022 22:43:41 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d48c6000000b00241a8a5bc11sm12833981wrs.80.2022.11.21.22.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 22:43:40 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Nov 2022 07:43:24 +0100
Message-Id: <20221122064325.30941-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221122064325.30941-1-francois.perrad@gadz.org>
References: <20221122064325.30941-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Slz3ovETvRJ6t5bnuergkl15A99wgyUNMiI8NDWyqN0=;
 b=VRYdRj6SBAg08z23bkF03zRU7fDnSP0q11CoAkfpSKsYhmkZiL7epXZxryghwYzkxZ
 g4rnsS5GAZ18zddAKwnk5sG/CF+t0xwIssToGxhuuBh7HaMGwBuqJWoYnxvkOMkNPTd0
 S6WbTrwcfK0j/gPNMCAV/p4laBoAp+mg+/h3Ic/MiKo4WZLXWMKKo8TBRdeQni4sQyBI
 Jm4YVYCz/z3MrfuJDFHwHYI4NihBUHyAM8byvXVtor8eCImIbExxt3wh1VnzV9bcN9Dv
 phRrtjU2Rlah9efvTxPal6IxrtshWClOpCeNp7JoA0tdoIWp7ZYpEJjQqDzQBfBQ1APq
 WQ4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VRYdRj6S
Subject: [Buildroot] [PATCH v2 2/3] configs/ls1028ardb: add video with
 Cadence DP firmware
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
