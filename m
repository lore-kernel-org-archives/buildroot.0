Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D715C3DA41
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 10:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBBFE60885;
	Thu, 11 Jul 2024 10:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgYeMvWes1Wq; Thu, 11 Jul 2024 10:14:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 576CF61068
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 576CF61068;
	Thu, 11 Jul 2024 10:14:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7CB7C1BF98E
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7126A406BC
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 10:13:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8tNx3pizaZu for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 10:13:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CD5F40677
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CD5F40677
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 10:13:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59A0184C28; Thu, 11 Jul 2024 10:13:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 10:16:55 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: df75cdfe4c372a018f7c2b5d507a7a00cb0d7941
X-Git-Newrev: d19fb80b36b4accd1f1d998e1f4b8742d3e2189e
X-Patchwork-Hint: ignore
Message-Id: <20240711101358.59A0184C28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] configs/visionfive2: fix
 build by adding kernel header version
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

commit: https://git.buildroot.net/buildroot/commit/?id=d19fb80b36b4accd1f1d998e1f4b8742d3e2189e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
(cherry picked from commit 1da5466bab46b20a4ebbc28cfdbba9135775ae6d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
