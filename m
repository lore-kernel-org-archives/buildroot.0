Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3ECC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44BB441A66;
	Sun,  5 Jun 2022 19:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FqkVwh5r1Aa; Sun,  5 Jun 2022 19:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC67F41A04;
	Sun,  5 Jun 2022 19:43:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDD7A1BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACF5A61283
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 110LzKcaW-Hj for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:43:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97F6F60BB8
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:43:15 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 2BFB3240006;
 Sun,  5 Jun 2022 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654458193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtgMNboWEW3TaTQ8FKklY2p9tTwgIjMMbwAqOr2lWq4=;
 b=B7JEhEe8bONkwt5tGmU8MkJ2fePS+lAUDy8beuRKjy/M+/fqyvmCflgTunBvGuHVtfq/75
 H6diRiiyruVC20pxnWFVDdvz9DvY4nMd0e46V+qXIgX2/hw6k+gnBChXNjKvvKTywTA4rZ
 jVAWpLsWKrvC5EePt6Y+fYO43nIotFl8cGAQBSkokkUr8qimdKOUnmyRVeBjvo+IpUDfJM
 lbkcmG/W6i2jtsQZmFJNwR5RmXg5P3TuwgeunXDfpPjgd0xuHNKNmr/cHuUuc4wTPoXdg9
 rUz9lsTkf40Bc8wjdnWj382J3GtxnD1/drLGzmP6s2KfbH+IhqW4wFoAS9YHPg==
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  5 Jun 2022 21:42:55 +0200
Message-Id: <20220605194259.2928568-4-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/7] package/musl: introduce and use
 BR2_PACKAGE_MUSL_ARCH_SUPPORTS and BR2_PACKAGE_MUSL_SUPPORTS
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl/Config.in                  | 28 +++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in | 10 +--------
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 69da615b63..c1a10bdd58 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,3 +1,31 @@
+config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_i386
+	default y if BR2_microblaze
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_sh
+	default y if BR2_x86_64
+	depends on !BR2_powerpc_SPE # not supported, build breaks
+	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
+	# sh2 nommu is supported by musl, but we don't have support
+	# for it in Buildroot.
+	depends on BR2_USE_MMU
+
+config BR2_PACKAGE_MUSL_SUPPORTS
+	bool
+	default y if BR2_PACKAGE_MUSL_ARCH_SUPPORTS
+
 config BR2_PACKAGE_MUSL
 	bool
 	default y
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 7ce2998cf7..0dac816a4d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -61,15 +61,7 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
-	depends on BR2_aarch64	   || BR2_arm   || BR2_armeb   || BR2_i386 || \
-		   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
-		   BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
-		   BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
-	depends on !BR2_powerpc_SPE # not supported, build breaks
-	depends on !(BR2_powerpc64 || BR2_powerpc64le) || BR2_POWERPC_CPU_HAS_ALTIVEC
-	# sh2 nommu is supported by musl, but we don't have support
-	# for it in Buildroot.
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_MUSL_SUPPORTS
 	select BR2_TOOLCHAIN_USES_MUSL
 	help
 	  This option selects musl as the C library for the
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
