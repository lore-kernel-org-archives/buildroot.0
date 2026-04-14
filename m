Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB94CF9D0CA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 13:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E31B42A32;
	Tue, 14 Apr 2026 13:27:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKLPnl809WP6; Tue, 14 Apr 2026 13:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22702405A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776173260;
	bh=sEEAstMbGQUZHj1s5ADFQ4w/Vh+WXUeieqNpTwgeUEI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cssntbrf1AYcdYWMeSyoqZJ7Iv671LpxTzs20ARV1iA9WKjHjvi1YZdNYJGsVLbXf
	 1Q/IeX/xTUwBcONkhpECt8CzZYDFK94VOBYe2Xdns8mPsIARAvzXvXKMLO32ojXDG8
	 4/0iXPzc9/oRZSHz2ie+Qvq68OV60ZiuIqeg4/oTl4viD7RsYy/Ai2NViTrnlmfI4i
	 cNn19Pcv2M7x5rJv3cjReoTW7vGuLXi1LSZRwBFW0l6m6wJEW9m0f2zP84//lDrc9A
	 Q9HdrJLH9IBNuUn7D+v+WZLgimJJUJNUWORTUDUyVnbD74ek7HpuuG6MHi4pnNwC4t
	 G3T+fWnZPzirQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22702405A9;
	Tue, 14 Apr 2026 13:27:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3463237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC60060D9B
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qS0G94OgxFep for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 13:27:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=mwalle@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6199A60BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6199A60BAE
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6199A60BAE
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:27:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EEE98407B9;
 Tue, 14 Apr 2026 13:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1D7C19425;
 Tue, 14 Apr 2026 13:27:35 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
	Michael Walle <mwalle@kernel.org>
Date: Tue, 14 Apr 2026 15:27:29 +0200
Message-ID: <20260414132732.2866884-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1776173256;
 bh=8EQoBlWnJIeaHUKpLwIuTojz6/j3GQFWe2scRnrVPS0=;
 h=From:To:Cc:Subject:Date:From;
 b=rlP8W8s9ylZVuRCIQjh2+XQ4Ka6oHNyy7J2nsdZmjWQ13MJY7iOSzo2sEYbOrkW5x
 qji+Mr4z9/GQcHuaDCnbR2RgrBAOlDzwasOheAkwxdb940lhASJfOaCEm5FPqvVsw1
 3uO+SnCCwSIelQ+1o0mHA3ym8NXYJiqelr+5TLBHAYmSX0UkhCLAW/pKK0uefFoX9T
 p2adGZeSLrojnNZtK4n+VKsa46OupbtI2fKGytru2NJUIINFraQDlujmYhVXfnxA1N
 SbxvKBsBjKcJtbdQlsEH9PUwF26iTUimjZ5EieGm1X/74pmGeWLCAYIc0vnHKAo9+t
 xsg4dICMublLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rlP8W8s9
Subject: [Buildroot] [PATCH] configs/kontron_smarc_sal28: bump u-boot and
 linux
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The old u-boot version doesn't build anymore because of the following
error:

  ModuleNotFoundError: No module named 'pkg_resources'

Bump it to the latest version 2026.04. While at it, also bump linux to
the latest LTS kernel (6.18). The new kernel grew in size, thus we also
have to enlarge the rootfs image.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13858936681
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 configs/kontron_smarc_sal28_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index efd4bd41e6..181a92daab 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
@@ -18,11 +18,11 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_RCW_SMARC_SAL28=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="160M"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
