Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A02C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB37261291;
	Sun,  5 Jun 2022 19:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAdxQE-CQw4g; Sun,  5 Jun 2022 19:44:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F1961283;
	Sun,  5 Jun 2022 19:44:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8558D1BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82D1B8407F
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TO1hJ56Tlmz6 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:43:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6F428406A
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:43:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B2E94240008;
 Sun,  5 Jun 2022 19:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654458198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3TuSzpkjo6UCdBeSPIGz6fOYExEMsp1qLkvu6zMOX4=;
 b=VPgL4nmgt2++1DMdbZYy5G/6exaLox0XgjJyCf4smhnRLT2QzFzOA/9HzBBkTs5dOLLVBA
 urkE6gTZQMb2YyZ/cRsToc+wuZi8h1tKEkQydnIjLZ3mi+3YJ7R5yDxlW7sOj9f6tJotdv
 AQ57FcmmPLxHdTi5d0eM8lwzsFJ3nqrN6vJ8fyj/ZhUNAZJdfEjDNufi/OZBfZCR2EglF0
 z6SU4sbbLbAR7EOkIDbHB4p5c1Jy5VT2kS1trN5f61V1z5fXQjHE5342pOIWwhBKRq0wSL
 Lc0bO9fdzZ3UBff+yV3ThEHLpyHTVRTmKyK9lulspn3aMSobMDgOEpam9xuczA==
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  5 Jun 2022 21:42:58 +0200
Message-Id: <20220605194259.2928568-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/7] support/scripts/gen-bootlin-toolchains:
 properly take into account !BR2_STATIC_LIBS for glibc toolchains
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

The Config.in options created for each toolchain were properly taking
into account the !BR2_STATIC_LIBS dependency of glibc
toolchains. However, this dependency was not taken into account into
the main BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
option. Consequently, if an architecture is only supported by glibc,
but BR2_STATIC_LIBS is enabled, the main "Bootlin toolchain" option
was visible... but with no selectable toolchain.

We fix this by making sure that
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS is only true for all
architectures supported, taking into account the fact that some
architectures can only be supported if !BR2_STATIC_LIBS, when the only
available C library is glibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index f9dd9da9a8..97a744340a 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -482,7 +482,10 @@ def gen_config_in_options(toolchains, fpath):
         f.write("config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS\n")
         f.write("\tbool\n")
         for arch, details in arches.items():
-            f.write("\tdefault y if %s\n" % " && ".join(details['conditions']))
+            conditions = details['conditions'].copy()
+            if set([t.libc for t in toolchains if t.arch == arch]) == set(['glibc']):
+                conditions.append("!BR2_STATIC_LIBS")
+            f.write("\tdefault y if %s\n" % " && ".join(conditions))
         f.write("\n")
 
         f.write("if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN\n\n")
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
