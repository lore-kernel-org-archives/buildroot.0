Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CE0C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 21:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1676741675;
	Thu, 28 Dec 2023 21:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1676741675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3e4gu9-37IgL; Thu, 28 Dec 2023 21:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F421410C6;
	Thu, 28 Dec 2023 21:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F421410C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 194C11BF966
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 21:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C29402C3
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 21:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C29402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLN9bx1aJktM for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 21:03:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4E7B40120
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 21:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E7B40120
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCB43836E4; Thu, 28 Dec 2023 21:03:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Dec 2023 21:57:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b678091a1c68327d086b6534a27224763db23006
X-Git-Newrev: eab17d763c6ca1bf74749e3a793fd044b5e6d457
X-Patchwork-Hint: ignore
Message-Id: <20231228210312.CCB43836E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: introduce
 BR2_ARCH_NEEDS_GCC_AT_LEAST_14
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

commit: https://git.buildroot.net/buildroot/commit/?id=eab17d763c6ca1bf74749e3a793fd044b5e6d457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit
a0d2a5cfec0ade7cb577cbff25aac289e746e61b ("support/scripts/gen-bootlin-toolchains:
generate BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard"), the
gen-bootlin-toolchains script will generate references to
BR2_ARCH_NEEDS_GCC_AT_LEAST_X including potentially against the "next"
version of gcc.

Indeed, a toolchain using gcc 13.x should have a "depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_14" so that once some architectures that
require gcc 14.x are added, such toolchains are not made visible.

In order for this to work, we must have the
BR2_ARCH_NEEDS_GCC_AT_LEAST_x symbol ready for the N+1 version of gcc
compared to the latest one we support.

As we're supporting up to gcc 13.x right now, let's introduce the
symbol BR2_ARCH_NEEDS_GCC_AT_LEAST_14 so that gcc 13.x toolchains can
be marked depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14.

The other alternative would be to make the gen-bootlin-toolchains a
bit smarter, and not emit this depends on
!BR2_ARCH_NEEDS_GCC_AT_LEAST_14 if BR2_ARCH_NEEDS_GCC_AT_LEAST_14 does
not exist. But this would require re-running the script when
BR2_ARCH_NEEDS_GCC_AT_LEAST_14 which we are unlikely to do. While
today, when the script is invoked, the usual check-symbols complains
and reminds us that BR2_ARCH_NEEDS_GCC_AT_LEAST_14 should be added, so
we remember to do it right away.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index e37f4dab1d..9912f9fce6 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -313,6 +313,10 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_13
 	bool
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
 
+config BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	bool
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+
 # The following string values are defined by the individual
 # Config.in.$ARCH files
 config BR2_ARCH
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
