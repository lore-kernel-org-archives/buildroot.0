Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDADEE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A84B41548;
	Sun, 20 Aug 2023 21:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A84B41548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4wNOYLv8UBd; Sun, 20 Aug 2023 21:40:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 462D2415EF;
	Sun, 20 Aug 2023 21:40:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 462D2415EF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F39751BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3DC14032C
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3DC14032C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vm207xZyKAl9 for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1436840136
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1436840136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01C8B85EF4; Sun, 20 Aug 2023 21:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 23:38:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef4eea32261ed3f21af119936a080cb2fc8897fa
X-Git-Newrev: b661f635b5cc08ded6ab14c19f2370c9f478e52e
X-Patchwork-Hint: ignore
Message-Id: <20230820214028.01C8B85EF4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/pc_x86_64_{bios,
 efi}_defconfig: add midding libelf kernel dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b661f635b5cc08ded6ab14c19f2370c9f478e52e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

objtool built by the kernel requires libelf

ldd output/build/linux-6.1.24/tools/objtool/objtool
  linux-vdso.so.1
  libelf.so.1 => output/host/lib/libelf.so.1

While updating the kernel [1] we forgot to select
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to provide Buildroot's host-libelf.
Using host-libelf avoid linking with libelf installed on the host or
failing to build objtool if libelf is not installed.

[1] d45538f2e7acc1b330b191d559a81e8c1a961648

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436869
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436872

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pc_x86_64_bios_defconfig | 1 +
 configs/pc_x86_64_efi_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index a057ddd259..6032544d2d 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -32,6 +32,7 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # Firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index efa603f0c0..afb652f3fc 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -33,6 +33,7 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # Firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
