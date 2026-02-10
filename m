Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1851FE94625
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 00:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB57683CB6;
	Tue, 10 Feb 2026 00:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmD0aF0Pb6FI; Tue, 10 Feb 2026 00:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2696B83CB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770682077;
	bh=MWK2vA8UY8SjRTq9P3m7JxW2ggBvSKv34LMA16t83GA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g996/eAuv7wpCOKhkI6wKksx4HTvlq8zzFmQRK5ZAWu1JJVAujTgtk3BzlH90t9cR
	 k33hVf/kpsO5WumOmbsy0xata6ZAhaUPrAkpagjVA8Y43Vnxkb0QWSwavxQfduf6RL
	 1EYjBONrDOSRQkE73TpDPIJzM9ht9giCucA5Omdeq8qE638TRRExuGqu/Hz8yIQIjD
	 Jhu0iHjPVNZ6NtL8pd0rq32PG0TStQnk2AHh7gjA2ihS+GOwWFx5DJ5cLpL3Om0gY3
	 GClZg2Kf64RZo/y2of900RHZVrrYSjWL0hY6WUD0HZk+xok/oiHG3oWWlML+3kGmz5
	 Z63+Rec08dKqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2696B83CB0;
	Tue, 10 Feb 2026 00:07:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABFD9219
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DBC640C59
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZyqXww64mJ8 for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 00:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA94140C30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA94140C30
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA94140C30
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 00:07:46 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id pbI7vTZGv5gYjpbI8vmsgE; Tue, 10 Feb 2026 01:07:44 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Feb 2026 01:07:28 +0100
Message-ID: <20260210000739.3810940-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ2IqfWDInyav9qhFZgZkjH5kRuBDtLtbGekXDHdoZ0+Iv8m6V3LqutOhQot5QsO6GruIOav2HxHYxcRVY/PpCYFvb/PvP93inmW5AbTx/VfD/RMnI9C
 aWr+Y4NpC8bKxvejzqsHQlb1b2wn4QNs8xv0dsnaWW8q6rqCkqez40y2Do5F4Ym2RYaRQmTIM5mkC/xFYxtrz4uItkPQBzYBSVTpGTF45fvrptgwgqp4h2WD
 0NJLRPacDqWu6zIgHY2akW4t0Fvr4rUrfBIG2+2UqXOwvLF4p1O41+9mD+2I9G6RqgV8DHvC2F4P+FeXHIodjoaNQAC47Qb+LvVZp/tGytDVyf0DjVJ6K9eb
 w+YW259OTogW1j5X2cz0lNwDv6/XRIsqc9ujEkc6uc4IpcT6PLa/5zmyBZ73DpiWB0UJD+JUkshYNJ8y3GtdyW3tiOOSmh1ppPODISNHGVZxKsOBzI+i/qTV
 P61mMkSv26jcuRwSfKsQV25u9fd+wK5RVRPlEvCz+9b3xMYAtLFvucUs8o7lWHYNfVzenhW8TDLdGa5TEayp4FMdNsFxI9+g3q2W6Tv2Oh0ToqojKyFkh/22
 vKQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770682064; bh=gJNIPJt9RIltWFxzyCGs+l8pFchUrnpCgU4J/D268JM=;
 h=From:To:Subject:Date:MIME-Version;
 b=TqIoUt5f5Gd3kKyG4mFAOArBNV3zoyDAbf9mpoYzQYNMPofwx4JxdQ9+8OQEljZal
 giarLPgzOTwkVGCmLYTwNFZ2MVqoHSX41/uU8PajXogOBXvWu1eUO8lMK+lYbuOiO5
 tPnN4MsBa6fEeG9J7SRBGJl52uzkJwWz2MxHfVcXw84CSpONoQTWrFUIc45+P9wYSs
 q+yC+vHj1iINStnB8QBRLCV+1e6uw0sK8cTcd/AxrNnk+BgvoOoosTB4+mr9akXW5+
 cYN3WZtShdD6N5XH78FA9BzrjGPYbbK57m/1QGYG0gdhKe7hyXm9jM6i8BhOc8Ax5G
 bA/jCsmaYFkIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=TqIoUt5f
Subject: [Buildroot] [PATCH v2 02/13] configs/asus_tinker_rk3288: bump Linux
 to 6.18.8 and U-Boot to 2026.01
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch:
* bumps Linux kernel to version 6.18.8
* bumps U-Boot to version 2026.01
* forces check hashes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .checkpackageignore                                   |  1 -
 .../tinker/patches/linux-headers/linux-headers.hash   |  1 +
 board/asus/tinker/patches/linux/linux.hash            |  2 ++
 board/asus/tinker/patches/uboot/uboot.hash            |  2 ++
 configs/asus_tinker_rk3288_defconfig                  | 11 +++++++----
 5 files changed, 12 insertions(+), 5 deletions(-)
 create mode 120000 board/asus/tinker/patches/linux-headers/linux-headers.hash
 create mode 100644 board/asus/tinker/patches/linux/linux.hash
 create mode 100644 board/asus/tinker/patches/uboot/uboot.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index c7a02caf06..62e3998a66 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -77,7 +77,6 @@ configs/am574x_idk_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucls1012a_defconfig lib_defconfig.ForceCheckHash
 configs/arcturus_ucp1020_defconfig lib_defconfig.ForceCheckHash
 configs/asus_tinker-s_rk3288_defconfig lib_defconfig.ForceCheckHash
-configs/asus_tinker_rk3288_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/asus/tinker/patches/linux-headers/linux-headers.hash b/board/asus/tinker/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/asus/tinker/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/asus/tinker/patches/linux/linux.hash b/board/asus/tinker/patches/linux/linux.hash
new file mode 100644
index 0000000000..f6d35a2db6
--- /dev/null
+++ b/board/asus/tinker/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
diff --git a/board/asus/tinker/patches/uboot/uboot.hash b/board/asus/tinker/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..60971ee74f
--- /dev/null
+++ b/board/asus/tinker/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index f3a2c4d71d..8326405536 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -1,7 +1,9 @@
 BR2_arm=y
 BR2_cortex_a17=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/asus/tinker/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="tinker-rk3288"
 BR2_TARGET_GENERIC_ISSUE="Welcome to TINKER RK3288!"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/asus/tinker/post-build.sh"
@@ -9,10 +11,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/asus/tinker/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.8"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-tinker"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3288-tinker"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -20,11 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
