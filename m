Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A31CC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2D360E3A;
	Sun, 18 Sep 2022 12:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA2D360E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bs-o9y7y3Is1; Sun, 18 Sep 2022 12:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B3460D4B;
	Sun, 18 Sep 2022 12:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B3460D4B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F6261BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB4B141B9E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB4B141B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vaR9dF-SuNPZ for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:42:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 726BA41B92
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 726BA41B92
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5219C8511E; Sun, 18 Sep 2022 12:42:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 14:42:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2dc971589ee63ca939aa31809a2a4e49ce11c16
X-Git-Newrev: 924310fb2d9210f3c335fac50b7806d1e73c28e3
X-Patchwork-Hint: ignore
Message-Id: <20220918124238.5219C8511E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.powerpc: change conditions
 to positive logic
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

commit: https://git.buildroot.net/buildroot/commit/?id=924310fb2d9210f3c335fac50b7806d1e73c28e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The conditions in the target CPU choice mostly use negative logic, i.e.
"depends on !<something>". This makes it more difficult to understand
exactly on which ARCH variants the CPU _is_ supported. Therefore, change
all of the conditions to positive logic.

Since there is no little-endian variant of the 32-bit PowerPC, the
conditions are:

!BR2_ARCH_IS_64 <==> BR2_powerpc
!BR2_powerpc64le <==> BR2_powerpc || BR2_powerpc64

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.powerpc | 70 +++++++++++++++++++++++++-------------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 765767eca2..d4e204a463 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -16,118 +16,118 @@ choice
 config BR2_generic_powerpc
 	bool "generic"
 	# No C library supports this variant on ppc64le
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_401
 	bool "401"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_403
 	bool "403"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_405
 	bool "405"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_405fp
 	bool "405 with FPU"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_440
 	bool "440"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_440fp
 	bool "440 with FPU"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_464
 	bool "464"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_464fp
 	bool "464 with FPU"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_476
 	bool "476"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_476fp
 	bool "476 with FPU"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_505
 	bool "505"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_602
 	bool "602"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_603
 	bool "603"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_603e
 	bool "603e"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_604
 	bool "604"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_604e
 	bool "604e"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_620
 	bool "620"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_630
 	bool "630"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_740
 	bool "740"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_7400
 	bool "7400"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_7450
 	bool "7450"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_750
 	bool "750"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_821
 	bool "821"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_823
 	bool "823"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_860
 	bool "860"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_970
 	bool "970"
 	depends on BR2_powerpc || BR2_powerpc64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_8548
 	bool "8548 / e500v2"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_e300c2
 	bool "e300c2"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_e300c3
 	bool "e300c3"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_e500mc
 	bool "e500mc"
-	depends on !BR2_ARCH_IS_64
+	depends on BR2_powerpc
 config BR2_powerpc_e5500
 	bool "e5500"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_e6500
 	bool "e6500"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_power5
 	bool "power5"
-	depends on !BR2_powerpc64le
+	depends on BR2_powerpc || BR2_powerpc64
 config BR2_powerpc_power6
 	bool "power6"
 	depends on BR2_powerpc || BR2_powerpc64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
