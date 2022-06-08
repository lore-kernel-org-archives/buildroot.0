Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BE0C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 07:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A82B83F67;
	Wed,  8 Jun 2022 07:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sxd3SOnPuX7T; Wed,  8 Jun 2022 07:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B2683F88;
	Wed,  8 Jun 2022 07:11:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C9251BF3D2
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B57260FD8
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 07:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9z752Z9IS5b for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 07:10:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FC5C60A9D
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 07:10:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0C5A9FF809;
 Wed,  8 Jun 2022 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654672237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHWxOJyqs17t643SDjh2yqdtBsaPpPSmLLqp68a6Mlc=;
 b=oITvbB87kDCpr741q2a4djNNaAEsA+/3jTLLm+ujhChoksen34Bzf2OkKZckYLYplPmIr1
 TdJbqQ7gLxSFEVZvf0yVUO6Vk6y80/z0XCl/7iHr1tuGg1UsczDKQQJi1f+b/HruPXz/ip
 Jwo3OEpb2ecPjvzys3BT/HVDbRByPi4Ch30Fmt4h98lhZAL5pVBj+sr9YAqVS3MJ2tSf26
 O0y8/YYUeFKY4boaSAbr7Eajhka+Yi7HnE/qOwpzxnUOvm4pzgEB7i3aOqWY435vt4TG5L
 FQ28uCRb+i13R/Hzi+W8V+GKZs88KhUKAPGXk8/1W3WYG1G8afA69rCU93JJ5g==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Wed,  8 Jun 2022 09:10:17 +0200
Message-Id: <20220608071027.3384469-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
References: <20220608071027.3384469-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 05/14]
 support/scripts/gen-bootlin-toolchains: adjust dependencies of i686
 toolchains
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Bootlin i686 toolchain was already made available only on BR2_i386
with !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_1000. However, this
was not sufficient as a few other architecture variants of BR2_i386
are "lower" than i686, and they need to be excluded as well.

Allows to fix:

  http://autobuild.buildroot.net/results/56ac1a8fa5b34a9ca10eef98ae9fb090b8c762c4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index df1c000f9b..c96a388f84 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -257,7 +257,12 @@ arches = {
         'conditions': ['BR2_i386',
                        '!BR2_x86_i486',
                        '!BR2_x86_i586',
-                       '!BR2_x86_x1000'],
+                       '!BR2_x86_x1000',
+                       '!BR2_x86_pentium_mmx',
+                       '!BR2_x86_geode',
+                       '!BR2_x86_c3',
+                       '!BR2_x86_winchip_c6',
+                       '!BR2_x86_winchip2'],
         'test_options': ['BR2_i386',
                          'BR2_x86_i686'],
         'prefix': 'i686',
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
