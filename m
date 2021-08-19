Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCBCC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:28:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A50C61106
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A50C61106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 167AA40151;
	Thu, 19 Aug 2021 16:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HiV7zb9v3aw7; Thu, 19 Aug 2021 16:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 620C840159;
	Thu, 19 Aug 2021 16:28:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4C61BF82D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A6C140159
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hetx9UmsfiMt for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 16:28:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36E6E40151
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 16:28:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5353A1C0008;
 Thu, 19 Aug 2021 16:28:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 18:28:20 +0200
Message-Id: <20210819162821.803728-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rustc: fix conditions related to MIPS
 support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

For MIPS64 architecture variants supported by Rust, we need to exclude
MIPS64R6, but due to a copy/paste mistake in commit
d69d40c029dc7d8199b745eaee759d92b66c5d17 ("package/rustc: add support
for Tier 1 and Tier 2 platform"), we used BR2_MIPS_CPU_MIPS32R6 for
both MIPS 32-bit and MIPS 64-bit configurations, while
BR2_MIPS_CPU_MIPS64R6 should be used on MIPS 64-bit.

Fixes:

  http://autobuild.buildroot.net/8bab232eb98b164df300581ae019254bde7c8ca3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rustc/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index c5f64fd3c6..90ea56f626 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -36,11 +36,11 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_HOST_TOOLS_PLATFORMS
 	# mips-unknown-linux-gnu
 	default y if BR2_mips && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
 	# mips64-unknown-linux-gnuabi64
-	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_GLIBC && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS32R6
+	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_GLIBC && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
 	# mipsel-unknown-linux-gnu
 	default y if BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC && !BR2_MIPS_CPU_MIPS32R6
 	# mips64el-unknown-linux-gnuabi64
-	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_GLIBC && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS32R6
+	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_GLIBC && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
 	# powerpc-unknown-linux-gnu
 	default y if BR2_powerpc && BR2_TOOLCHAIN_USES_GLIBC
 	# powerpc64-unknown-linux-gnu
@@ -84,9 +84,9 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	# mips-unknown-linux-musl
 	default y if BR2_mips && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
 	# mips64-unknown-linux-muslabi64
-	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS32R6
+	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
 	# mips64el-unknown-linux-muslabi64
-	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS32R6
+	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
 	# mipsel-unknown-linux-musl
 	default y if BR2_mipsel && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
 	# sparc64-unknown-linux-gnu
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
