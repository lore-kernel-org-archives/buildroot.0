Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6CDD39015
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2156E81182;
	Wed, 14 Jan 2026 19:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kXIdLg64AOe; Wed, 14 Jan 2026 19:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48D02811A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420512;
	bh=rqDusLcmCOp0C/HRbCY3x5Ci82d0cJ3WaGpmay47YAA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ahBhLvGYdNmUrLE4R/e3xwf5rJA6lYR2Vb6HkAI6hVnCfRY+VseybhQLM1vnXNpoV
	 pUG2/1cN7iA+ALk+OIGAUnuSmNqTnPku7L3P2u1QpdpWduFNIRkkkUmwINgNwsqqzh
	 PvQ8o/5WFpQfNsFT3ZVPEotCJNmBmYCj63CdHiYfRihJp6rW1RO9Twa8vkktQCijBy
	 oM6lqv1KxuoD2vSo6fx2o4TVc8iSkORA/Bdt0iMFA4IG51sH9X2dtwpzTg9/gRvTV0
	 Cg81NEnoqPlUyEoGbPaQxbWATNE157w1gOYu/vtsD5a7zNcBJTOHqmQ+/6kjV0xYIZ
	 ag/5yVqIs5dNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48D02811A1;
	Wed, 14 Jan 2026 19:55:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6711C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA202406F9
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNf77XBOoDuS for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D20FB406FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D20FB406FA
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D20FB406FA
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:54:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6xAvBAQ9wf0Dg6xDvzgcl; Wed, 14 Jan 2026 20:54:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:54:43 +0100
Message-ID: <20260114195451.3978704-11-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKHoUCp6ZZkzBKekZGK2lkPGSGcioO4V0UiGu4yVa0wOHbq0PdcDkErjZDGGRq1WdnPvDR7JS8tPDEEusMK0/Q0Bn25UA8TJnOk7+A8n2AaLjSvtnmj6
 ABfujzgaWvFjllI90f+l1NeQfjtk49N06SP7lv6evISi3pig8SpwaeewMxBjEv/VNuszO3yijhstNQnJdJdED6GQYa7P3f30ED+nSCiVVP0uJoO33f6Cw8l/
 YtT2/wv9Fb0+TQxD9fRp8G39ZVDijjMDmKk9hn2ubxrLzr9ZMfnrK/pTueKoEGSLVpQ2B7juQ/vNNZGpMlntz0eZMUW9vip67sVh0Xgbtw3ftuiHy4URvNKs
 5weEy08UWZAsFMLCP3xbFKE7JAmeQalrAV2WulNAE1t6h0/e0C/fP9cfTjZL1Jvke5WZSQnvRg60ztuEuL+vE1NOfq3aL/9SczB8pp1oR1sV+BIFH/skbBx9
 ZYlG3jODxzO7htXAEfBfCb+0O+UWW465Fngj08V+U5FS1JkFPP5Pwfuyzs/ChtmWLL+yBBocGlAVOHUi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420496; bh=mvQKnU1mprSopohxdJn3wymBmgWmGlbt+fjjuTmAYXI=;
 h=From:To:Subject:Date:MIME-Version;
 b=ioKoP+d8lYGP7/GzMvVrTuwbpZcRSObXsv+Q6yPQkMg6dsEdVxFQgokXhJcgKDSQe
 8qSYeyIioh7w+bDK+rfWIp/Eik6lJ6zFQbESslI2aReBsqpwB1KpMOxDip53XigSVV
 IwSSLSohYA+8xaXRzu8RvIwD9Ko0d0Y15h84Eu0VOMKM75j3+7yRg+IfjilfaYwWrZ
 B8agHCx9Z3Msrmd/FHwT/ddpEkJFdmSyq1XlihdRnKOM2tnkAu1otIDpopTXFpmm4V
 F6Scc2DAp7kWIw1V4CkED/dEPlcrf3D1LvmfBJF2OU2pohfxj8CpZaNdskFU1Du3HF
 My0UlfumveTnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ioKoP+d8
Subject: [Buildroot] [PATCH 10/17] configs/olimex_a10_olinuxino: bump Linux
 to 6.18.5 and U-Boot to 2026.01
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
 board/olimex/a10_olinuxino/boot.cmd         |  1 -
 board/olimex/a10_olinuxino/genimage.cfg     |  1 -
 board/olimex/a10_olinuxino/post-build.sh    |  1 -
 configs/olimex_a10_olinuxino_lime_defconfig | 18 +++++++++---------
 4 files changed, 9 insertions(+), 12 deletions(-)
 delete mode 120000 board/olimex/a10_olinuxino/boot.cmd
 delete mode 120000 board/olimex/a10_olinuxino/genimage.cfg
 delete mode 120000 board/olimex/a10_olinuxino/post-build.sh

diff --git a/board/olimex/a10_olinuxino/boot.cmd b/board/olimex/a10_olinuxino/boot.cmd
deleted file mode 120000
index 612c745500..0000000000
--- a/board/olimex/a10_olinuxino/boot.cmd
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/boot.cmd
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/genimage.cfg b/board/olimex/a10_olinuxino/genimage.cfg
deleted file mode 120000
index c21932feec..0000000000
--- a/board/olimex/a10_olinuxino/genimage.cfg
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/genimage.cfg
\ No newline at end of file
diff --git a/board/olimex/a10_olinuxino/post-build.sh b/board/olimex/a10_olinuxino/post-build.sh
deleted file mode 120000
index b346896024..0000000000
--- a/board/olimex/a10_olinuxino/post-build.sh
+++ /dev/null
@@ -1 +0,0 @@
-../a20_olinuxino/post-build.sh
\ No newline at end of file
diff --git a/configs/olimex_a10_olinuxino_lime_defconfig b/configs/olimex_a10_olinuxino_lime_defconfig
index 101796cc12..9f82b6c385 100644
--- a/configs/olimex_a10_olinuxino_lime_defconfig
+++ b/configs/olimex_a10_olinuxino_lime_defconfig
@@ -1,18 +1,20 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/olimex/axx-common/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="a10-olinuxino"
 BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/olimex/a10_olinuxino/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/olimex/axx-common/rootfs_overlay"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a10_olinuxino/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/axx-common/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-olinuxino-lime"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-olinuxino-lime"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
@@ -20,14 +22,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A10-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/olimex/a10_olinuxino/boot.cmd"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
