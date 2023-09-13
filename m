Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30768CA5501
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2D4041D9B;
	Wed, 13 Sep 2023 07:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2D4041D9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6K2Iy6RrdW5; Wed, 13 Sep 2023 07:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B48941DA5;
	Wed, 13 Sep 2023 07:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B48941DA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3821BF3B9
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92A9382094
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:44:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A9382094
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLmtb6GCvV_a for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FBF181FCB
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FBF181FCB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FBC486DB6; Wed, 13 Sep 2023 07:44:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 08:34:30 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7e7397baf1fe4c6d6b3169afc900f7b2789f649b
X-Git-Newrev: 1cec87d9057154f1829770a5bf69e497c138b8ad
X-Patchwork-Hint: ignore
Message-Id: <20230913074434.6FBC486DB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] configs/pc_x86_64_{bios,
 efi}_defconfig: add missing libelf kernel dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=1cec87d9057154f1829770a5bf69e497c138b8ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
(cherry picked from commit b661f635b5cc08ded6ab14c19f2370c9f478e52e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
