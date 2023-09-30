Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B766E7737C
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 17:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CD3E40396;
	Sat, 30 Sep 2023 17:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CD3E40396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjzbUT7PeUJZ; Sat, 30 Sep 2023 17:18:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A177404FF;
	Sat, 30 Sep 2023 17:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A177404FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4C81BF36F
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76C5860F69
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 17:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76C5860F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HvVep22sAuYs for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 17:18:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67AFE60F1D
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 17:18:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67AFE60F1D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 529A883C55; Sat, 30 Sep 2023 17:18:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 19:18:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c32b3d9ff8727fd61dbf2d55105c2900f0d2dec
X-Git-Newrev: 13b0e6bbf3b1473993972fff8e4590a28749d823
X-Patchwork-Hint: ignore
Message-Id: <20230930171850.529A883C55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: disable on mips64el
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

commit: https://git.buildroot.net/buildroot/commit/?id=13b0e6bbf3b1473993972fff8e4590a28749d823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gnu-efi package was enabled on mips64el by commit
11b347c03ab0b38389ec11b48f63236a3b4d6547 ("package/gnu-efi: add
mips64el support"). However, it has been failing to build for a long
time, and nobody bothered fixing it:

gnu-efi-3.0.15//gnuefi/crt0-efi-mips64el.S:71: Error: cannot represent BFD_RELOC_16 relocation in this object file format

Even reverting back to gnu-efi 3.0.10, which was the version used at
the time of 11b347c03ab0b38389ec11b48f63236a3b4d6547, does not fix the
issue. We tested updating to the latest gnu-efi version, 3.0.17, and
the problem still exists.

Since EFI on MIPS is extremely niche, we don't really want to invest
the time to fix this issue, so let's disable it again. If someone
cares enough, it can be fixed and re-enabled.

Fixes:

  http://autobuild.buildroot.net/results/d5938edcf50ebb7fdcec148d73f402845079779d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnu-efi/Config.in  | 1 -
 package/gnu-efi/gnu-efi.mk | 2 --
 2 files changed, 3 deletions(-)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index 8e35fddbcb..d456a23837 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
-	default y if BR2_mips64el
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_GNU_EFI
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 93b5888370..686a14be01 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -24,8 +24,6 @@ else ifeq ($(BR2_arm)$(BR2_armeb),y)
 GNU_EFI_PLATFORM = arm
 else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 GNU_EFI_PLATFORM = aarch64
-else ifeq ($(BR2_mips64el),y)
-GNU_EFI_PLATFORM = mips64el
 endif
 
 GNU_EFI_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
