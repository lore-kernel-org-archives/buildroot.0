Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9ADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 23:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B622360B06;
	Mon, 24 Jan 2022 23:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBm4Tcae3J9c; Mon, 24 Jan 2022 23:02:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C451C60FB2;
	Mon, 24 Jan 2022 23:02:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 14B2B1BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 041A260B09
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 23:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDlyCVRVKD86 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 23:01:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E2DB60B06
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 23:01:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id AC4D840003;
 Mon, 24 Jan 2022 23:01:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Tue, 25 Jan 2022 00:01:02 +0100
Message-Id: <20220124230116.203218-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
References: <20220124230116.203218-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/16] arch/Config.in.x86: drastically simplify
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
