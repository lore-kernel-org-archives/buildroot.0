Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD196C3ABBE
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 19:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96388812C8;
	Tue,  6 May 2025 19:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ky7n5U8hxBRQ; Tue,  6 May 2025 19:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6CA98125B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6CA98125B;
	Tue,  6 May 2025 19:45:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F8171D72
 for <buildroot@buildroot.org>; Tue,  6 May 2025 19:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 409568125B
 for <buildroot@buildroot.org>; Tue,  6 May 2025 19:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EyVK8l6sBd1A for <buildroot@buildroot.org>;
 Tue,  6 May 2025 19:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33C8E8123E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33C8E8123E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33C8E8123E
 for <buildroot@buildroot.org>; Tue,  6 May 2025 19:45:12 +0000 (UTC)
Received: from home.juju.sh (unknown [86.210.113.106])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D2E5CB0055E;
 Tue,  6 May 2025 21:45:07 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Fabio Estevam <festevam@gmail.com>
Date: Tue,  6 May 2025 21:45:01 +0200
Message-ID: <20250506194502.2960556-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746560710;
 bh=wWn+zMwgLIMI9YkHuBCym3yfIsIH6jA831AKTC3DtYQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ZaZZqrhSNk2mNjF7sXhy1qpkxVBdx/YUfu/JpWj8JBNiLs6XNAFrG15jAhkk6gKGL
 FNtPE24O8zkkpgtUm9pIMF2368cYoRA5Wg+I6eAOHXzheEoh4Q+94bQrIKu5MPBfU6
 pYDiwwLWi3NAGbUAAQyZlIEIuizBIj83/TqtQ7dbTPu1N7UWZhqHY1uQquESxuHIvb
 bu7ylkgBQerhPSriJXvk7RanDDkwQP0PfhcCt2ueJ4dQoetgCb5BG7ZkWydh/w+Crn
 8xs1cX06icQo5IpQKxaSywdak+r8lKwyKLgiVRqJ39ZQaO49C+xXRYyKUX7baY5j7i
 y5p4ZEO9tp6ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZaZZqrhS
Subject: [Buildroot] [PATCH 1/1] configs/imx28evk: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig
and adds custom hash files. The exception entry in .checkpackageignore
is also removed.

Cc: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9947424115
---
 .checkpackageignore                                             | 1 -
 .../freescale/imx28evk/patches/linux-headers/linux-headers.hash | 1 +
 board/freescale/imx28evk/patches/linux/linux.hash               | 2 ++
 board/freescale/imx28evk/patches/uboot/uboot.hash               | 2 ++
 configs/imx28evk_defconfig                                      | 2 ++
 5 files changed, 7 insertions(+), 1 deletion(-)
 create mode 120000 board/freescale/imx28evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx28evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx28evk/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 7bfc457c90..038e3d6dc6 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -139,7 +139,6 @@ configs/engicam_imx6qdl_icore_qt5_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_rqs_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_geam_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6ul_isiot_defconfig lib_defconfig.ForceCheckHash
-configs/imx28evk_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_p1025twr_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t1040d4rdb_defconfig lib_defconfig.ForceCheckHash
 configs/freescale_t2080_qds_rdb_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx28evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx28evk/patches/linux/linux.hash b/board/freescale/imx28evk/patches/linux/linux.hash
new file mode 100644
index 0000000000..8aeb3785b4
--- /dev/null
+++ b/board/freescale/imx28evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  af54b449f4fb93b8e8daa346144a7309e8e95174bd962c4b5917cf56120456d9  linux-6.6.26.tar.xz
diff --git a/board/freescale/imx28evk/patches/uboot/uboot.hash b/board/freescale/imx28evk/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/freescale/imx28evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/configs/imx28evk_defconfig b/configs/imx28evk_defconfig
index 8c428e3fec..d34f413440 100644
--- a/configs/imx28evk_defconfig
+++ b/configs/imx28evk_defconfig
@@ -1,5 +1,7 @@
 BR2_arm=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx28evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/mxs/post-image.sh"
 BR2_LINUX_KERNEL=y
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
