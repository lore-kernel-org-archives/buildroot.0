Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A0AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 07:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CA3E400FB;
	Tue, 25 Jan 2022 07:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_uA01HevbCq; Tue, 25 Jan 2022 07:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59453404AB;
	Tue, 25 Jan 2022 07:56:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B61A1BF2CC
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE1A860BB5
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqFjzIsgbmKZ for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E5A860B2F
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 07:56:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4C91E8233A; Tue, 25 Jan 2022 07:49:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 08:41:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7df632905fdd7d9334b71f08d8b324841912144f
X-Git-Newrev: 73d135a695cf59eb8ab6aafb59bfd281a7400203
X-Patchwork-Hint: ignore
Message-Id: <20220125074920.4C91E8233A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: drastically simplify
 the BR2_ARCH definition
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

commit: https://git.buildroot.net/buildroot/commit/?id=73d135a695cf59eb8ab6aafb59bfd281a7400203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_ARCH definition is like this:

 * i486 for the i486 platform
 * i586 for a small number of platforms
 * i686 for all other x86 platforms when used in 32-bit, but we
   enumerate their entire list
 * x86_64 for all x86 64-bit platforms

The list for i686 is long and needs to be extended everytime a new
platform is added, with no added value.

So this commit simplifies that by replacing this long list with just:

   default "i686"	  if BR2_i386

This works because Kconfig guarantees us that if an i386 platform
matches an earlier case (i486 or one of the i586 platforms), the i486
and i586 earlier in the list will match.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 0ba9ecbcea..a330d72f1d 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -311,30 +311,12 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_c32
 	default "i586"		if BR2_x86_winchip_c6
 	default "i586"		if BR2_x86_winchip2
-	default "i686"		if BR2_x86_i686
-	default "i686"		if BR2_x86_pentium2
-	default "i686"		if BR2_x86_pentium3
-	default "i686"		if BR2_x86_pentium4
-	default "i686"		if BR2_x86_pentium_m
-	default "i686"		if BR2_x86_pentiumpro
-	default "i686"		if BR2_x86_prescott
-	default "i686"		if BR2_x86_nocona && BR2_i386
-	default "i686"		if BR2_x86_core2 && BR2_i386
-	default "i686"		if BR2_x86_corei7 && BR2_i386
-	default "i686"		if BR2_x86_westmere && BR2_i386
-	default "i686"		if BR2_x86_corei7_avx && BR2_i386
-	default "i686"		if BR2_x86_core_avx2 && BR2_i386
-	default "i686"		if BR2_x86_atom && BR2_i386
-	default "i686"		if BR2_x86_silvermont && BR2_i386
-	default "i686"		if BR2_x86_opteron && BR2_i386
-	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
-	default "i686"		if BR2_x86_barcelona && BR2_i386
-	default "i686"		if BR2_x86_jaguar && BR2_i386
-	default "i686"		if BR2_x86_steamroller && BR2_i386
-	default "i686"		if BR2_x86_k6
-	default "i686"		if BR2_x86_k6_2
-	default "i686"		if BR2_x86_athlon
-	default "i686"		if BR2_x86_athlon_4
+	# We use the property of Kconfig that the first match of a
+	# list of default will be chosen. So the following entry will
+	# not match for all BR2_i386=y configurations, but only the
+	# ones that didn't match any of the previous cases (i486,
+	# i586).
+	default "i686"		if BR2_i386
 	default "x86_64"	if BR2_x86_64
 
 config BR2_ENDIAN
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
