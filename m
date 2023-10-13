Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B65CDB482
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5161482883;
	Fri, 13 Oct 2023 06:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5161482883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rbul9fCVOVSu; Fri, 13 Oct 2023 06:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 996D482211;
	Fri, 13 Oct 2023 06:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 996D482211
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 632401BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB8941C3C
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB8941C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yUyljUtkHCrj for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A59441C3B
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A59441C3B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A80F8468E; Fri, 13 Oct 2023 06:22:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 08:20:31 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 7f420077e0d4664feb7fc5fdc6fcba29b48b27c3
X-Git-Newrev: fb3aef53d22aed75f31d1c8327cad8150a8b34fa
X-Patchwork-Hint: ignore
Message-Id: <20231013062253.1A80F8468E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/gnu-efi: disable
 on mips64el
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb3aef53d22aed75f31d1c8327cad8150a8b34fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit 13b0e6bbf3b1473993972fff8e4590a28749d823)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
