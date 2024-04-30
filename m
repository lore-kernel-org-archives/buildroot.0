Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73CBC4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FCC341581;
	Tue, 30 Apr 2024 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjUVSrJntXj1; Tue, 30 Apr 2024 21:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFAA24158A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BFAA24158A;
	Tue, 30 Apr 2024 21:37:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D34B21BF2CF
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEB9140748
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nv_rup1xm14C for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF91B4071B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF91B4071B
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38CDD8634D; Tue, 30 Apr 2024 21:37:06 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 23:35:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 612a349c0658695685f6aae483e1b4371308fd3f
X-Git-Newrev: 5ae2b84042bee3ad678bb931e79e3316b1782148
X-Patchwork-Hint: ignore
Message-Id: <20240430213706.38CDD8634D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/armadeus_apf28: bump Linux version
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ae2b84042bee3ad678bb931e79e3316b1782148
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

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119386

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
[Romain:
  - improve commit log
  - Select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/armadeus_apf28_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/armadeus_apf28_defconfig b/configs/armadeus_apf28_defconfig
index 01e14e6618..5207cf674c 100644
--- a/configs/armadeus_apf28_defconfig
+++ b/configs/armadeus_apf28_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf28"
@@ -13,12 +13,13 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.289"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.215"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx28-apf28dev"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_UBIFS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
