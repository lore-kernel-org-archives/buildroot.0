Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8805D39015
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C20740B02;
	Wed, 14 Jan 2026 19:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsyC9Mn7QkYT; Wed, 14 Jan 2026 19:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E50D140AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420503;
	bh=YXe9VuQXtC/KwZDMRggriwQ2RHYmQI0Jb0sbftsI89c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=skCDzX3aWbEKT096coh3c4gK0YguPV5IQAvrX/UqllYvgX3o5NHHaFu5JpuV0iU8m
	 UGMVEJrH71ymT0hztYF1z+yh3q5cod4TMZRpnPcMZJ9MwcvdblzbbouxGXlCqAAL1Z
	 Y2TWadbxofAT21b8k+8LtVq02IYmb5ktHI1cd5nGwRAOCOX16DTjiTAzHbSwIas/Kv
	 /CYYZtVMyGtx2HSBLEnCjO3dXAm2mJxDtRgKMhspGtBgLIIBfoBObbYYDeHdsYO4Va
	 CRKszIEywK/FCdwsiNhRviXUTmrL858Qijp2bawrXmWcZ2vCJmUeEODEfzlL/Hh8sU
	 h+j6GB13i030A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E50D140AE9;
	Wed, 14 Jan 2026 19:55:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 747002F2
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53A38406FE
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9Ksn7mftBk7 for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E51D8406F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E51D8406F9
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E51D8406F9
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:56 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xCvzgc4; Wed, 14 Jan 2026 20:54:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:40 +0100
Message-ID: <20260114195451.3978704-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPAbAqtF48MySqi5n2QEtKiZOfdDNaQ5g6jwTJE/tUu4+rn7SYvPaRNfgU20jx2lI1U8eiOHdbZKpXYhRDLGnHQREdUKQk5Ai99R+OdHqZgmO9MKGKRg
 ogPDJNLXMyrhwZhNeGk2INZeQoWn3TdwkQ06KwQY5h7Uu1tJw/HPBHZ+Y5Ybwg0o9ZLzjq219dISiPMUMvUA8B42/+hTw70fOJ/nEjjd/zcVGFp9yLK6cwWL
 8F1w3K3Iv1ndZZHUpCMxkgdi/rKMm5fer8eV2zY9iH5hQh04QDPgGQ2mJK89G8uvO81RLWQbg7EfFQmTeaLTvBxqk1JA5o4OC/U3r8nhmft5RsEdKQ/7zEsr
 vIVftwXbdMCus1bZieJKzq6/CJxCYqKThzh91ODxcxawsLtTu/PaMgrcuacQIIBpt4YzpjQ6+RP8ki2Dder3l9WsZ0J1u4CXEyo4qXvsjYPW7AyTd35BjX+R
 DXQBHIGvWfncIkx0QjgsC53d6I87sWlC/rLdUgpumGZmir3s2wAqUqgllUNYALtaoxwk3JAqwDfwXorE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420495; bh=B6g9OCcPsuemu26O2l2DqvQ1sMmcJbKDkGymdhkZjLg=;
 h=From:To:Subject:Date:MIME-Version;
 b=PWjjkTXC3ezCKezrHX34XBI+IEnHjqSuCftHif4/g/paU6QpHknAmZ9KdeneN0xCj
 PebzjSWmR495qc8/ycERD0Iap142Lg0Yj9ZcDMCOYHo09yGFha3ZGbVGMgAZFyYR2w
 9vnxqKmSm1POGYP64p8m0ajpch1ye7JHMAg44tjKS8oVAoRvPfpxjUCO84BtW/JtAO
 V7gkDsrgbXoo+FT1r3zBfb5I84uL9VN+h1zDzcIncLp6A2oybJiDsPwRLlMJXl4gdX
 I4XDb85joQ0eWhdPeWb73DOoLZVUvem4D/3IIU2oY1uqSQHpLYEkug+4svKLSUbjc+
 b+LZAAaHTSlqQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PWjjkTXC
Subject: [Buildroot] [PATCH 07/17] configs/imx6ullevk: bump Linux to 6.18.5
 and U-Boot to 2026.01
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
 board/freescale/imx6ullevk/patches/linux/linux.hash | 1 +
 board/freescale/imx6ullevk/patches/uboot/uboot.hash | 1 +
 configs/imx6ullevk_defconfig                        | 9 ++++++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/board/freescale/imx6ullevk/patches/linux/linux.hash b/board/freescale/imx6ullevk/patches/linux/linux.hash
index b138642633..2e9a100ebc 100644
--- a/board/freescale/imx6ullevk/patches/linux/linux.hash
+++ b/board/freescale/imx6ullevk/patches/linux/linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  2166d92e5631ee11bd249d492a1f4009c7635ee36b835fa55384b4ce41e8a63f  linux-imx-lf-6.12.49-2.2.0.tar.gz
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/freescale/imx6ullevk/patches/uboot/uboot.hash b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
index 5d57adfa22..c8c173d501 100644
--- a/board/freescale/imx6ullevk/patches/uboot/uboot.hash
+++ b/board/freescale/imx6ullevk/patches/uboot/uboot.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  212ea4d8d442153ab732ab724282fef64450e9dab5cfe9565eec4f618e305a80  uboot-imx-lf-6.12.49-2.2.0.tar.gz
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
index 38ea8f6940..c8970c1d20 100644
--- a/configs/imx6ullevk_defconfig
+++ b/configs/imx6ullevk_defconfig
@@ -1,13 +1,15 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx6ullevk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ull-14x14-evk"
@@ -20,9 +22,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
