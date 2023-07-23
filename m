Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B2DC001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 13:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E810060B1D;
	Sun, 23 Jul 2023 13:54:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E810060B1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pTry2iMPnv-P; Sun, 23 Jul 2023 13:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352F960AEE;
	Sun, 23 Jul 2023 13:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 352F960AEE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B89BE1BF575
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 13:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BDB560AEE
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 13:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BDB560AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKoAuRfev-Ty for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 13:54:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8C5E60AE6
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 13:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8C5E60AE6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95620826B9; Sun, 23 Jul 2023 13:54:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 15:48:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da0f92fdfcea025c608c279ea29c5eab8bdb1566
X-Git-Newrev: 09d1bbde47ecfe6512ebec05d170097f894d4bb5
X-Patchwork-Hint: ignore
Message-Id: <20230723135411.95620826B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.x86: add MMX instruction
 set capability for Geode CPU
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

commit: https://git.buildroot.net/buildroot/commit/?id=09d1bbde47ecfe6512ebec05d170097f894d4bb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, there is no MMX support for modern GEODE processors in Buildroot.
Yet, some packages like ffmpeg can leverage it when the package is built.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.x86 | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index c770ae3ffe..38e486eafd 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -521,11 +521,22 @@ config BR2_x86_steamroller
 	select BR2_X86_CPU_HAS_SSE4
 	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_geode
-	bool "geode"
-	# Don't include MMX support because there several variant of geode
-	# processor, some with MMX support, some without.
-	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
+	bool "geode (no mmx)"
 	depends on !BR2_x86_64
+	help
+	  For several variant of geode which have not MMX support.
+	  See https://en.wikipedia.org/wiki/Geode_%28processor%29 to
+	  determine if your particular Geode processor supports MMX or
+	  not.
+config BR2_x86_geode_mmx
+	bool "geode (with mmx)"
+	depends on !BR2_x86_64
+	select BR2_X86_CPU_HAS_MMX
+	help
+	  For several variant of geode which have MMX support.
+	  See https://en.wikipedia.org/wiki/Geode_%28processor%29 to
+	  determine if your particular Geode processor supports MMX or
+	  not.
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	depends on !BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
