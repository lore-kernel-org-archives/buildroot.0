Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47966C10F16
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED3D64157A;
	Tue, 30 Apr 2024 21:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmJOZ6WIjQMI; Tue, 30 Apr 2024 21:37:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BD584156D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BD584156D;
	Tue, 30 Apr 2024 21:37:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 553711BF976
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E8D582028
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYbNuapq7Zqi for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A06B80C18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A06B80C18
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B0BA8634C; Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 23:34:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbd579315aa17b11caf0ea69693403b90f928324
X-Git-Newrev: 612a349c0658695685f6aae483e1b4371308fd3f
X-Patchwork-Hint: ignore
Message-Id: <20240430213706.2B0BA8634C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/armadeus_apf51: bump Linux version
 to 5.10.215
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=612a349c0658695685f6aae483e1b4371308fd3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the switch to binutils 2.41 as default version [1], the arm Linux
kernel build is broken with:

  arch/arm/mm/proc-v7.S: Assembler messages:
  arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is `#'

A similar issue has already be fixed for qemu m68k [2].

Bump to the latest kernel 5.10 that already include the backport
of 790756c7e022 ("ARM: 8933/1: replace Sun/Solaris style flag on section directive")

Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y to fix the following
build error:

  scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
  #include <openssl/bio.h>

[1] e88225ed8820881970ec33de7a15a1e0d50443da
[2] a1ce9474e40f731f327035d8c0962abb16f00ff7

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119389

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
[Romain:
  - improve commit log
  - Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/armadeus/apf51/{linux-4.4.config => linux-5.10.config} | 0
 configs/armadeus_apf51_defconfig                             | 9 +++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/board/armadeus/apf51/linux-4.4.config b/board/armadeus/apf51/linux-5.10.config
similarity index 100%
rename from board/armadeus/apf51/linux-4.4.config
rename to board/armadeus/apf51/linux-5.10.config
diff --git a/configs/armadeus_apf51_defconfig b/configs/armadeus_apf51_defconfig
index aa7c2f84ae..af4562ce0f 100644
--- a/configs/armadeus_apf51_defconfig
+++ b/configs/armadeus_apf51_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf51"
@@ -13,13 +13,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc2"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.291"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-4.4.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/armadeus/apf51/linux-5.10.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x90008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx51-apf51dev"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_UBIFS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
