Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57DBC43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E91341A07;
	Sun,  5 Jun 2022 19:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZ4YMwbR8bIL; Sun,  5 Jun 2022 19:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C568419DD;
	Sun,  5 Jun 2022 19:43:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BD7D1BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2972D419DD
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXlGb1-uACn8 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:43:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C52D441996
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:43:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id D38DD240004;
 Sun,  5 Jun 2022 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654458190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IydchqRQBUkbKIZ//96zWFKVFhiIa25/jisPWQR8Hog=;
 b=ZZjQk20FxqsVakFgK0Q4xK9Q/DV041o1LNCn6qWj6V7RZaXp0RkFDxNzf5Q89o0XKw2yzV
 S/HWv6ACg3LAEtNGt3adkiaLw12QFL/r1FyrKS/7yAyhExyGzFBlwrRycty8/FnTPeOz18
 jHJdunxxu14Higb5pvb76z2ttLlSGxBbdb66bZM9MLy6XpQJUy0nw8NzkIsardDMRLAz7K
 WqtKY2s4BO5KTR7VDfuDfkLjJGeN//TnLew1UCnUZKnOMPAkYdm8+qzBa6mv4xWMbb3Pt3
 egUpg7GDIs08U07wNwq9W2vPdDJlQ6Qffa0iE2GWLi3XGm/TQz+GzIWnlrhh1w==
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  5 Jun 2022 21:42:53 +0200
Message-Id: <20220605194259.2928568-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/7] package/uclibc: introduce and use
 BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS and BR2_PACKAGE_UCLIBC_SUPPORTS
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Hilliard <james.hilliard1@gmail.com>

In this commit BR2_PACKAGE_UCLIBC_SUPPORTS looks redundant with
BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS, but for other C libraries, they will
be different. To be consistent, we use the same pattern for uClibc as
well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in                | 28 +++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in |  8 +------
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 310414bebc..754c3ea014 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,3 +1,31 @@
+config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_arcle
+	default y if BR2_arceb
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	default y if BR2_microblaze
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_RISCV_64
+	default y if BR2_sh4
+	default y if BR2_sh4eb
+	default y if BR2_sparc
+	default y if BR2_xtensa
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_UCLIBC_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
+
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 comment "uClibc Options"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 559c254622..31f2be8b25 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -27,13 +27,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
-	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
-		   BR2_arm     || BR2_armeb    || \
-		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
-		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_RISCV_64 || \
-		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
-		   BR2_x86_64
+	depends on BR2_PACKAGE_UCLIBC_SUPPORTS
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  This option selects uClibc-ng as the C library for the
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
