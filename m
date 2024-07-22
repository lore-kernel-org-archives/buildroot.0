Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737EEC3DA64
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CEE4408F1;
	Mon, 22 Jul 2024 12:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBPC12GUM7nC; Mon, 22 Jul 2024 12:09:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 057F04094F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 057F04094F;
	Mon, 22 Jul 2024 12:09:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0A61BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B76E6408CA
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEAhXY142mNJ for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0799C408D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0799C408D1
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:09:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00A3486FFB; Mon, 22 Jul 2024 12:09:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 14:08:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 701cf686bdfd6c579c4d90768a6a3dab6858d942
X-Git-Newrev: 1c955f89ab2d0ff9df1d1ae638685f2c0383c81a
X-Patchwork-Hint: ignore
Message-Id: <20240722120924.00A3486FFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/qemu_arm_ebbr: linux needs
 host-openssl
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
Content-Type: multipart/mixed; boundary="===============7913301656384822265=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7913301656384822265==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1c955f89ab2d0ff9df1d1ae638685f2c0383c81a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel build needs host-openssl; add it to the configuration.

In practice the documented build recipe works fine and the build failures
can only be seen with highly parallel builds using per-package directories.

This fixes the following compilation error:

  certs/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory

Fixes: 7115ab39189a6c660745267d8bf0bf41cf8b3db7
Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_arm_ebbr_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_defconfig
index 7c436449d7..bdcd41bbde 100644
--- a/configs/qemu_arm_ebbr_defconfig
+++ b/configs/qemu_arm_ebbr_defconfig
@@ -19,6 +19,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-ebbr/linux.fragment"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Packages
 BR2_PACKAGE_OPTEE_CLIENT=y

--===============7913301656384822265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7913301656384822265==--
