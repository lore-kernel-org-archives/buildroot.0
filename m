Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93199CDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C3A401B1;
	Tue, 22 Oct 2024 20:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqX0JJgwGP95; Tue, 22 Oct 2024 20:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E35ED401F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E35ED401F3;
	Tue, 22 Oct 2024 20:46:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9A922072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82EF8401F3
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dz9-tMJIBbG1 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73637401B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73637401B1
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:46:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59ECA86201; Tue, 22 Oct 2024 20:46:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 22:46:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f2eb4a4685da9dd63665dc5ad68c6dfd8919e3b
X-Git-Newrev: bbeca6d13f3a68da57c202b6f03faefe6ab135f6
X-Patchwork-Hint: ignore
Message-Id: <20241022204634.59ECA86201@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: update to linux 6.11.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bbeca6d13f3a68da57c202b6f03faefe6ab135f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A bunch of new hardware has been enabled for rock5b in linux 6.11,
most notably USB3 host controller support, GPU support, cpufreq
support, and PCIe endpoint mode support.

Add the dependency on host python3 that is new since linux 6.10.

Also add the missing dependency on openssl (which has been needed for
a long time, since we are using arm64 defconfig, but only shows up as
an error if the host system doesn't have extract-cert installed.)

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/radxa/rock5b/patches/linux/linux.hash | 4 ++--
 configs/rock5b_defconfig                    | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index ba90c84f54..005667b1f1 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256  f68d9f5ffc0a24f850699b86c8aea8b8687de7384158d5ed3bede37de098d60c  linux-6.7.4.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  linux-6.11.3.tar.xz
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 4d5e7ca583..bc7b73d652 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a76_a55=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/radxa/rock5b/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
@@ -12,13 +12,15 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock5b/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.7.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.3"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3=y
 BR2_PACKAGE_LINUX_FIRMWARE=y
 BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
 BR2_PACKAGE_ROCKCHIP_RKBIN=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
