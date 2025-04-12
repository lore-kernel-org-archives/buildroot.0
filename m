Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2718CC369B4
	for <buildroot@archiver.kernel.org>; Sat, 12 Apr 2025 14:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B292B6074D;
	Sat, 12 Apr 2025 14:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vYJm4T7jel6W; Sat, 12 Apr 2025 14:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7533607EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7533607EE;
	Sat, 12 Apr 2025 14:19:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95698193
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86AF68131D
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOru_f4DaS2p for <buildroot@buildroot.org>;
 Sat, 12 Apr 2025 14:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B30E081045
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B30E081045
 for <buildroot@buildroot.org>; Sat, 12 Apr 2025 14:19:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2F6884495; Sat, 12 Apr 2025 14:19:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Apr 2025 14:14:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac87a435765c13d65a700b97eabd8bdba25cfc15
X-Git-Newrev: a35529c0afe6f307c79ee0c069668653ab9c9c17
X-Patchwork-Hint: ignore
Message-Id: <20250412141937.A2F6884495@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ls1046a-rdb: enable the fmc package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a35529c0afe6f307c79ee0c069668653ab9c9c17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since LS1046A-RDB uses the Linux Factory-supplied lsdk.config, it
disables the upstream DPAA1 kernel networking drivers and enables their
SDK counterparts. These SDK kernel drivers are configured using the fmc
tool to do basic things such as apply a default PCD, so it seems a
reasonable idea to enable this package by default.

Since fmc uses C++, we need to add the standard library for that, which
also seems to increase the rootfs size.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
[Julien: regenerate with "make savedefconfig"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/ls1046a-rdb_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configs/ls1046a-rdb_defconfig b/configs/ls1046a-rdb_defconfig
index bd20baeea9..92045487f9 100644
--- a/configs/ls1046a-rdb_defconfig
+++ b/configs/ls1046a-rdb_defconfig
@@ -1,6 +1,7 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_GLOBAL_PATCH_DIR="board/freescale/ls1046a-rdb/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="ls1046ardb"
@@ -20,9 +21,10 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1046a-rdb freescale/fsl-ls1046
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_QORIQ_FM_UCODE=y
+BR2_PACKAGE_FMC=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
-BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
