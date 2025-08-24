Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818B1CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 13:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52B8984494;
	Sun, 24 Aug 2025 13:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fE8eUvcN5FPw; Sun, 24 Aug 2025 13:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7248C843CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7248C843CB;
	Sun, 24 Aug 2025 13:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC295CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A588A41B52
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:56:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDmdOQVkdCiS for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 13:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0958B4174B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0958B4174B
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 13:56:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 038B587A1D; Sun, 24 Aug 2025 13:56:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 15:50:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfd75a5bd2ff2ba5b13515d5dc0bf3bab3b7b5b8
X-Git-Newrev: ddbad663e005cc19020b074fd9adc2859304afdf
X-Patchwork-Hint: ignore
Message-Id: <20250824135635.038B587A1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: add patches to fix
 gprofng build with GCC 15.x
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ddbad663e005cc19020b074fd9adc2859304afdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_BINUTILS_GPROFNG=y, the build currently fails with GCC 15.x,
of course on architectures for which gprofng is actually
available. This issue only exists in binutils 2.42 and 2.43.1, as
binutils 2.44 has the necessary fixes.

Therefore, this commit backports the relevant commits from binutils
2.44 to 2.43.1 and 2.42.

Fixes:

  https://autobuild.buildroot.net/results/7cf52019f87625c73ef3c4ca0b6270e20a4ab768/ (binutils 2.42)
  https://autobuild.buildroot.net/results/478e24af1a03dea5ec64b77ca611b4f7225c9d39/ (binutils 2.43.1)

The following defconfig, built under a Fedora 42 Docker container
allows to reproduce the issue:

 BR2_x86_nehalem=y
 BR2_BINUTILS_VERSION_2_42_X=y
 BR2_BINUTILS_GPROFNG=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...Warnings-when-building-gprofng-with-Clang.patch | 770 ++++++++++++++++++++
 ...-std-gnu23-compatibility-wrt-unprototyped.patch | 619 ++++++++++++++++
 .../0007-gprofng-fix-build-with-std-gnu23.patch    | 199 +++++
 ...Warnings-when-building-gprofng-with-Clang.patch | 801 +++++++++++++++++++++
 ...-std-gnu23-compatibility-wrt-unprototyped.patch | 619 ++++++++++++++++
 .../0007-gprofng-fix-build-with-std-gnu23.patch    | 199 +++++
 6 files changed, 3207 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
