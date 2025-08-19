Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1928CCA0EEB
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 21:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C417540A0D;
	Tue, 19 Aug 2025 21:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gvOWQrxa8NL; Tue, 19 Aug 2025 21:26:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D08F14076B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D08F14076B;
	Tue, 19 Aug 2025 21:26:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A30BDE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8974A4076B
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqS6oFxT8T2X for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 21:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 979004073C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 979004073C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 979004073C
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:26:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0A0AF1A0D18
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:26:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C4BAF60697
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 21:26:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3E611C228BA3; 
 Tue, 19 Aug 2025 23:26:34 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Aug 2025 23:26:30 +0200
Message-ID: <20250819212631.3570549-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755638796; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=jSlk/Lh7eB+nNvC/HGT0g6K4uE1IGZlkzkc1evfJIr8=;
 b=BstK5opsjYwZIT8o/njijjOx8/GvgApORE22SHL4jVHCsXeCrOjqDc4vCzdAyeLgp62+4j
 y75XwCf4OHSa4Guf+a3zffm2Lgsp86tb8ZHPpmsdqWA7P2PDxKEExUywaKZm1IGvRM0P13
 DAPrtMuJqwoolCsXudxtdoXnGLzVV7UF5JujyTKV+xu9cXlCqNoB3u8yetjef0Akv7/AI6
 5w0BeRRzeGJw2U2c8gY/s3GuDRpbpYKHigNrQ3/Z7NvMGW3eyQlqIrlEI3ELrn8sAfZCRh
 8u9obQlBHA1ybL7RI19mgwcBlNjqobLeY7m+BTDb7k+xI0bLsNZA/3H7ylNiIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BstK5ops
Subject: [Buildroot] [PATCH] linux: enable
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL on a few more architectures
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

This commit is an extension of
5dae966a30c5485e45b94f750a739d36810cba4c ("linux: select
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed"), which solves
autobuilder issues by making sure that
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL is automatically enabled on some
architecture if the default architecture defconfig is used and the
latest kernel is built (which is what happens in the autobuilders).

This new commit adds BR2_or1k and BR2_riscv to the list to fix
autobuilder issues.

Fixes:

  https://autobuild.buildroot.org/results/1a739eee39bdef8986279a9e21f8637fbe263353/ (or1k)
  https://autobuild.buildroot.org/results/acb62b7a486f3f8e99c6cc2b52b0c259bfa18a0e/ (riscv)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7f90c566b0..27321eee50 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -176,7 +176,8 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	# version. This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
 	       BR2_LINUX_KERNEL_LATEST_VERSION && \
-	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
+	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || \
+	        BR2_or1k || BR2_riscv || BR2_sparc || BR2_x86_64)
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
