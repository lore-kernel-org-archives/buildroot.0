Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EE8C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 582D660A68;
	Mon,  8 Jul 2024 20:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWMuzLBPm53U; Mon,  8 Jul 2024 20:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 529E760A70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 529E760A70;
	Mon,  8 Jul 2024 20:24:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CAA41BF409
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE90E40593
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUzUf6Fs6Hta for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:24:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 164314033A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 164314033A
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:24:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0319983D98; Mon,  8 Jul 2024 20:24:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:24:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbf2ca9b5b4ebd26c2d14889ca04f0cd01bb2454
X-Git-Newrev: 1da5466bab46b20a4ebbc28cfdbba9135775ae6d
X-Patchwork-Hint: ignore
Message-Id: <20240708202437.0319983D98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/visionfive2: fix build by adding
 kernel header version
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

commit: https://git.buildroot.net/buildroot/commit/?id=1da5466bab46b20a4ebbc28cfdbba9135775ae6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit d9e6d2d081 "configs/visionfive2: update kernel to upstream
6.8.2" removed the config directive:

    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y

but forgot to add:

    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y

It was most likely generated with a "make savedefconfig", while Linux
kernel v6.8 was the default at that time. After commit aa70c331a2
"linux: bump latest version to 6.9", the defconfig failed to build
with error:

    Incorrect selection of kernel headers: expected 6.9.x, got 6.8.x

This commit fixes the defconfig by adding back the kernel custom header
version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/7271150175

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/visionfive2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/visionfive2_defconfig b/configs/visionfive2_defconfig
index dae9608eeb..18e0997f19 100644
--- a/configs/visionfive2_defconfig
+++ b/configs/visionfive2_defconfig
@@ -1,4 +1,5 @@
 BR2_riscv=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
 BR2_GLOBAL_PATCH_DIR="board/visionfive2/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
