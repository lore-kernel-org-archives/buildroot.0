Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87786D39014
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF06F8117A;
	Wed, 14 Jan 2026 19:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4q3IJndr_hm; Wed, 14 Jan 2026 19:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D24648112B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420501;
	bh=JQQQc14Z0rgLelCuSK7U/iX7UfEWvpyMs7qdzh1SNpU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RwyfLzBEyOG4nbbXpKNZZbdlXsT67bSvxgMJLCS/NKRSDpEUylMEEfarVhScciWPf
	 zzixiIWbUpKSiFdwRSgZejCdychdWUaJJQ3ZD3h+sIjY0C1krf6MUNkUlNDU9ZglDe
	 ij+Za0Q21XvM2gx9Hey1m93N0oSPyNTSy4FUjFsSDRFfxMpxJg/+YD+0ipdOgl0n42
	 ynjG8z2eFAIp6xVwPqr7gX+AJRPZrAJFyTPnsmuBWAzzb6VWMYhDFN+CiBhoj0D8Bq
	 kuuLyMPU6mUsxdsz8gpdsTiLCLFjrwYvgDyyxIhZIuWEEjFFDCMo7MNOZSK8NGZpSL
	 rRYUN7WqdhzHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D24648112B;
	Wed, 14 Jan 2026 19:55:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74B959E0
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5993560BC2
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdhzGamiWCaK for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EF4D60BBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EF4D60BBF
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EF4D60BBF
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xBvzgb1; Wed, 14 Jan 2026 20:54:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:35 +0100
Message-ID: <20260114195451.3978704-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCgihcE5ANmE4LoHgsJ0LdLfOfwXyZ3Wgr7NMVIpSAtKb/gCpuHhOcVSMxAytoPXiqI5fhxDf9hH/9Aico/jP0oh8SMLt12r69TB593xFV12CpUJiwmt
 iVoFKbMBHRwEdRtw+k8RrbLuuXxCxTGgp97TSaP+Qhkb0jMST2CRNv2ZCnezo+D9F+7AKHLxXoKvVVLYS5gdenKcmBwnsA8hDQJYZecQGdpuCEei1zyaoN5L
 WIRs6xIb/ac/arWlhDpTS5YrmAYQjBoM6d1LtjjkdNM/Fbg3i4NRilmcmnrNYL00QzjVKkuhRNkVzBhZrB6aR0IT5qbMcDNDDEnS8zhxKjlz9xPyW1OaWh5t
 pGQELGGZWehu8sRFmI4fLwfYBOMXSGTwEtVweX4OxWANLEdIGPuz4xzRyTtL2ssyOyCKLlXJmIg6Q8tfYxG0mG76UuwiiGOuV0jWRh7Tf7ryOGMsmufeC2Mx
 OCIWZvLYHeWBr+OIvgJDD22Sdok6qgXhQ1IV4NmFWRwf6XImidWQtDBXSkYfAt/CdEOt8TpX/93NQIGz
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420493; bh=DubdLoRjQFpKy6I16wYz5B7CvHhvgVvgpmUaSx6ev5o=;
 h=From:To:Subject:Date:MIME-Version;
 b=mDrtx4hWNUL6EMvDCdkX1MzisHSy9KUr3E2iuQuoy28mKY0UDUKxPwUrld0HbXTst
 MLw1xRTHctjwCrT3JPrIe7z08EcTFD6i8PIrWxo/WBmAb5GSD+hdBJZMMDqwL4lhvH
 frshGaco6XPFsGsHbRcAPsxhing27fOe1VXw0wWHExRlooKx1b92qsswkKPCG9b6ek
 2G+I7fOcVwFgKsOk6tu3iPQpCiC0TZ79NYWhbQgIXuT7VRIIzSyvdchVv5SJ/N7qbN
 Xcn417FKE+7nEesonE/LYlKlbbY0aiDglop7eY7i3vLo/dLrfNvWAh9eSyJOCe9pam
 0kZ6Yb+NXUWkA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=mDrtx4hW
Subject: [Buildroot] [PATCH 02/17] configs/asus_tinker_rk3288: bump Linux to
 6.18.5 and U-Boot to 2026.01
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
* bumps Linux kernel to version 6.18.5
* bumps U-Boot to version 2026.01
* forces check hashes
* switches to extlinux

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../tinker/patches/linux-headers/linux-headers.hash   |  1 +
 board/asus/tinker/patches/linux/linux.hash            |  2 ++
 board/asus/tinker/patches/uboot/uboot.hash            |  2 ++
 configs/asus_tinker_rk3288_defconfig                  | 11 +++++++----
 4 files changed, 12 insertions(+), 4 deletions(-)
 create mode 120000 board/asus/tinker/patches/linux-headers/linux-headers.hash
 create mode 100644 board/asus/tinker/patches/linux/linux.hash
 create mode 100644 board/asus/tinker/patches/uboot/uboot.hash

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
index 0000000000..16cc0b3e4a
--- /dev/null
+++ b/board/asus/tinker/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/asus/tinker/patches/uboot/uboot.hash b/board/asus/tinker/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..60971ee74f
--- /dev/null
+++ b/board/asus/tinker/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index f3a2c4d71d..3c3a362c56 100644
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
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
