Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0D4CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F108408A;
	Sun, 24 Aug 2025 09:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ml_-SHjb43qS; Sun, 24 Aug 2025 09:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC3584075
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC3584075;
	Sun, 24 Aug 2025 09:29:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B12419C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2193F4041A
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSQKKQkVpjtQ for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:29:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A31E4005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A31E4005C
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A31E4005C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:29:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8D3F24E40C24
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:29:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5777B605F1
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:29:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B105A1C22C992; 
 Sun, 24 Aug 2025 11:29:53 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Aug 2025 11:29:51 +0200
Message-ID: <20250824092952.289402-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756027793; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=BwEcdn2JfDYGUKc5B06iqchSLCXok/gHHKeuytqwnv4=;
 b=gtBZ4qT8Z9itN6uHElJkP8XsUsQkBl/gRZTH5wGkdfdRWCn7xu9RrCJt663POAYQUbUiZu
 WqbwtJjI6wgyZrZr0qiLpeZVl1gjsoE5f8jTSQ3468SbwCd41zUlplS9UKDtDArakLSzDx
 lm1SvBZJmd9/Pjr311NtOZblHYU4aYi7nnV3IFWUDpEbtY6fZv3AvLYc2MFg9LoJ3T2XQz
 e7DoA+lig5DzHyNpGF185rBarv0kxGURIjE7wYUwYjZIFiGPVz4UMSbq+EaHO9IDaWC9vv
 qmbewxbAQT8YaNNKvxvxxFDhvCrqDIbiHrcrCYueSlXyJcTsredhEwyoeuJ/sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=gtBZ4qT8
Subject: [Buildroot] [PATCH] linux: select host-openssl for all
 architectures when building latest version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since at least Linux 6.16, but possibly earlier, host-openssl is now
needed on the vast majority (if not all?) CPU architectures.

Indeed, in order to fix build issues, we would have to add: armeb,
microblaze, loongarch, m68k, mips, mipsel, mips64, mips64el, powerpc,
powerpc64, powerpc64el, riscv, s390, and possibly others.

So intead, when "latest kernel" is used with the default architecture
configuration, always select host-openssl independently of the
selected architectures.

Fixes:

  https://autobuild.buildroot.net/results/9a314e759f7640d760003e46f86153300478ec60/ (mipsel)
  https://autobuild.buildroot.net/results/3bcc674ea5a7cdf031200b0cd2f9f71400ba391c/ (mips64el)
  https://autobuild.buildroot.net/results/b24983fd91f408de56479b7d7d57fc9fd3333d7d/ (s390)
  https://autobuild.buildroot.net/results/b262fc6f67a9fed55faffcdd580d89f4664e1e16/ (powerpc64)
  https://autobuild.buildroot.net/results/45da1538457b18671fa18efe3e1aa57a15561370/ (m68k)
  https://autobuild.buildroot.net/results/0a457375d2509f1b29a449dfa50f29fc7e56e568/ (armeb)
  https://autobuild.buildroot.net/results/814ca5f048827a635dea0199878fa82d5012b649/ (loongarch64)
  https://autobuild.buildroot.net/results/b684d0b37e5187aa9b31693356f8515857d19f7a/ (microblaze)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b4b0295dfe..56473d1b03 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -175,12 +175,11 @@ config BR2_LINUX_KERNEL_USE_DEFCONFIG
 
 config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	bool "Use the architecture default configuration"
-	# We know that the default configuration on some architectures
+	# We know that the default configuration on many architectures
 	# requires host-openssl, so select it for the latest kernel
 	# version. This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION && \
-	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
+	       BR2_LINUX_KERNEL_LATEST_VERSION
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
